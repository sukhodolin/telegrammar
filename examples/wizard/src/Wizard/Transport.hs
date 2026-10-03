{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE OverloadedStrings #-}

-- | The HTTP half telegrammar does not ship: it puts a planned 'Telegram.Bot.Support.Request'
-- on the wire against the Bot API, unwraps the envelope, and appends every exchange to the wire log. Every
-- failure is a value, never an exception.
module Wizard.Transport (Client, newClient, CallError (..), describeCallError, failureDescription,
                         transportKind, sendRequest, bodyPreview) where

import Control.Exception (try)
import Data.Aeson (Value (..), object, (.=))
import Data.Aeson qualified as Aeson
import Data.Aeson.Encoding qualified as Encoding
import Data.Aeson.Key qualified as Key
import Data.Aeson.KeyMap qualified as KeyMap
import Data.Aeson.Types qualified as Aeson
import Data.ByteString (ByteString)
import Data.ByteString.Lazy qualified as Lazy
import Data.Maybe (fromMaybe)
import Data.Text (Text)
import Data.Text qualified as Text
import Data.Text.Encoding qualified as Text.Encoding
import Data.Text.Encoding.Error qualified as Error
import Data.Time.Clock (getCurrentTime)
import Data.Time.Format (defaultTimeLocale, formatTime)
import Network.HTTP.Client qualified as HTTP
import Network.HTTP.Client.MultipartFormData qualified as Multipart
import Network.HTTP.Client.TLS qualified as TLS
import Network.HTTP.Types.Header (hContentType)
import Network.HTTP.Types.Status (statusCode)
import System.IO (BufferMode (BlockBuffering), Handle, IOMode (AppendMode), hFlush, hSetBuffering, openFile)
import Telegram.Bot.Support (Body (..), EncodeError (..), FormField (..), PlannedUpload (..),
                                 Request (..), UploadSource (..), compactJson, renderPath)

-- | One bot's transport: the token, a connection manager, the base URL the token is baked into, and the wire
-- log. There is deliberately no 'Show' instance: the token is a credential, and a derived 'Show' would leak
-- it into every log line that echoes a client.
data Client = Client
  { token :: Text
  , manager :: HTTP.Manager
  , baseUrl :: Text
  , wire :: Handle
  }

-- | Build a client for one bot token, logging every exchange to one path, with one shared connection manager.
newClient :: Text -> FilePath -> IO Client
newClient botToken logPath = do
  connections <- TLS.newTlsManager
  logHandle <- openFile logPath AppendMode
  hSetBuffering logHandle (BlockBuffering Nothing)
  pure
    Client
      { token = botToken
      , manager = connections
      , baseUrl = "https://api.telegram.org/bot" <> botToken <> "/"
      , wire = logHandle
      }

-- | Why a call did not produce a decoded result.
data CallError
  = -- | The request never completed, or its response was not JSON; the text never contains the bot token.
    TransportError Text
  | -- | The Bot API answered @ok: false@.
    ApiError
      { errorCode :: Maybe Int
      , description :: Text
      }
  | -- | The checked planner refused the request before any transport ran.
    PlanFailed EncodeError
  | -- | The call succeeded and the generated codec could not read the result; the raw value is the evidence.
    ResultDecodeFailed
      { message :: Text
      , raw :: Value
      }
  deriving stock (Show)

-- | A one-line rendering for a terminal echo or a chat notice.
describeCallError :: CallError -> Text
describeCallError = \case
  TransportError detail -> "transport: " <> detail
  ApiError {errorCode = code, description = detail} ->
    maybe "API error" (Text.pack . show) code <> ": " <> detail
  PlanFailed problem -> "plan: " <> problem.code <> " at " <> renderPath problem.path <> ": " <> problem.message
  ResultDecodeFailed {message = detail} -> "result decode: " <> detail

-- | The API's own @description@ for a refusal, and a rendering of every other failure.
failureDescription :: CallError -> Text
failureDescription = \case
  ApiError {description = detail} -> detail
  other -> describeCallError other

-- | The kind word a 'TransportError' text starts with, which the refusal relay quotes instead of the detail.
transportKind :: Text -> Text
transportKind = Text.takeWhile (/= ':')

-- | Send one planned request, log the exchange, and return the raw @result@ value the envelope carried.
sendRequest :: Client -> Request -> IO (Either CallError Value)
sendRequest client request = do
  attempt <- try (buildAndSend client request)
  case attempt of
    Left problem -> do
      let detail = redact client.token (renderHttpException problem)
      record client request (object ["transport_error" .= detail])
      pure (Left (TransportError detail))
    Right response -> do
      let payload = HTTP.responseBody response
      record client request (envelopeJson response payload)
      pure (readEnvelope client.token payload)

buildAndSend :: Client -> Request -> IO (HTTP.Response Lazy.ByteString)
buildAndSend client request = do
  initial <- HTTP.parseRequest (Text.unpack (client.baseUrl <> request.method))
  outgoing <- case request.body of
    JsonBody payload ->
      pure
        initial
          { HTTP.method = "POST"
          , HTTP.requestHeaders = [(hContentType, "application/json")]
          , HTTP.requestBody = HTTP.RequestBodyBS (compactJson (Object payload))
          }
    MultipartBody fields uploads ->
      Multipart.formDataBody (map plainPart fields <> map filePart uploads) initial
  -- The long poll asks Telegram for at most 50 seconds, so 60 leaves the socket margin to deliver it.
  HTTP.httpLbs outgoing {HTTP.responseTimeout = HTTP.responseTimeoutMicro (60 * 1000000)} client.manager

plainPart :: FormField -> Multipart.Part
plainPart field = Multipart.partBS field.name field.value

filePart :: PlannedUpload -> Multipart.Part
filePart upload = case upload.source of
  UploadPath path -> Multipart.partFileSource upload.partName path
  UploadBytes {filename = name, contentType = mime, bytes = payload} ->
    let part = Multipart.partFileRequestBody upload.partName (Text.unpack name) (HTTP.RequestBodyBS payload)
     in part {Multipart.partContentType = fmap Text.Encoding.encodeUtf8 mime}

-- | Unwrap @{ok, result, error_code, description}@.
readEnvelope :: Text -> Lazy.ByteString -> Either CallError Value
readEnvelope secret payload = case Aeson.eitherDecode payload of
  Left problem -> Left (TransportError (redact secret ("InvalidJson: " <> Text.pack problem)))
  Right (Object envelope) -> case KeyMap.lookup "ok" envelope of
    Just (Bool True) -> Right (fromMaybe Null (KeyMap.lookup "result" envelope))
    _ ->
      Left
        ApiError
          { errorCode = KeyMap.lookup "error_code" envelope >>= intOf
          , description = fromMaybe "" (KeyMap.lookup "description" envelope >>= textOf)
          }
  Right other -> Left (TransportError ("InvalidEnvelope: expected a response object, got " <> shortJson 200 other))

intOf :: Value -> Maybe Int
intOf = Aeson.parseMaybe Aeson.parseJSON

textOf :: Value -> Maybe Text
textOf = \case
  String text -> Just text
  _ -> Nothing

-- | One exchange as one JSON line, flushed as it is written. The token appears nowhere in it: the URL and the
-- headers are not logged, and the request is the planned body alone.
record :: Client -> Request -> Value -> IO ()
record client request response = do
  stamp <- wireStamp
  Lazy.hPut client.wire (Encoding.encodingToLazyByteString (line stamp) <> "\n")
  hFlush client.wire
  where
    line stamp =
      Encoding.pairs
        ( Encoding.pair "time" (Encoding.text stamp)
            <> Encoding.pair "method" (Encoding.text request.method)
            <> Encoding.pair "request" (Encoding.value (bodyJson request.body))
            <> Encoding.pair "response" (Encoding.value response)
        )

-- | The response as the log records it: the envelope when the body was JSON, the status and body when not.
envelopeJson :: HTTP.Response Lazy.ByteString -> Lazy.ByteString -> Value
envelopeJson response payload = case Aeson.decode payload of
  Just envelope -> envelope
  Nothing ->
    object
      [ "status" .= statusCode (HTTP.responseStatus response)
      , "body" .= decodeUtf8Lossy (Lazy.toStrict payload)
      ]

-- | A planned body as JSON; a multipart body is described, not embedded, so no upload bytes are logged.
bodyJson :: Body -> Value
bodyJson = \case
  JsonBody payload -> Object payload
  MultipartBody fields uploads ->
    object
      [ "fields" .= object [Key.fromText field.name .= decodeUtf8Lossy field.value | field <- fields]
      , "uploads" .= [object ["part" .= upload.partName, "source" .= sourceName upload.source] | upload <- uploads]
      ]

sourceName :: UploadSource -> Text
sourceName = \case
  UploadPath path -> Text.pack path
  UploadBytes {filename = name} -> name

wireStamp :: IO Text
wireStamp = Text.pack . formatTime defaultTimeLocale "%Y-%m-%dT%H:%M:%SZ" <$> getCurrentTime

-- | A planned body as one compact line for the terminal echo, keys sorted so a request always echoes alike.
bodyPreview :: Body -> Text
bodyPreview = \case
  JsonBody payload -> decodeUtf8Lossy (compactJson (Object payload))
  MultipartBody fields uploads ->
    "multipart "
      <> decodeUtf8Lossy
        (compactJson (Object (KeyMap.fromList [(Key.fromText field.name, String (decodeUtf8Lossy field.value)) | field <- fields])))
      <> " + uploads ["
      <> Text.intercalate ", " [upload.partName | upload <- uploads]
      <> "]"

shortJson :: Int -> Value -> Text
shortJson limit = Text.take limit . decodeUtf8Lossy . compactJson

decodeUtf8Lossy :: ByteString -> Text
decodeUtf8Lossy = Text.Encoding.decodeUtf8With Error.lenientDecode

-- | An HTTP failure as a kind word plus the library's own detail.
renderHttpException :: HTTP.HttpException -> Text
renderHttpException = \case
  HTTP.InvalidUrlException url reason -> "InvalidUrlException: " <> Text.pack url <> ": " <> Text.pack reason
  HTTP.HttpExceptionRequest _ content ->
    let rendered = Text.pack (show content)
     in firstWord rendered <> ": " <> rendered

firstWord :: Text -> Text
firstWord = Text.takeWhile (\letter -> letter /= ' ' && letter /= '(' && letter /= '\n')

-- | Replace the bot token wherever it appears. Every text that leaves this module passes through here: a URL,
-- a redirect, and an exception detail all carry the token the base URL bakes in.
redact :: Text -> Text -> Text
redact secret text
  | Text.null secret = text
  | otherwise = Text.replace secret "<token>" text
