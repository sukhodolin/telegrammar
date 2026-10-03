{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE OverloadedStrings #-}

-- | The smallest telegrammar bot: it answers every message with a greeting that names the sender.
--
-- > export TELEGRAM_BOT_TOKEN=...
-- > cabal run telegrammar-hello
module Main (main) where

import Control.Monad (forM_)
import Data.Aeson (Value (..), eitherDecode, withObject, (.:))
import Data.Aeson.Types (parseEither)
import Data.Int (Int64)
import Data.Proxy (Proxy (..))
import Data.Text (Text)
import Data.Text qualified as Text
import Network.HTTP.Client qualified as HTTP
import Network.HTTP.Client.TLS (newTlsManager)
import System.Environment (getEnv)
import Telegram.Bot.Methods.GetUpdates qualified as GetUpdates
import Telegram.Bot.Methods.SendMessage (mkSendMessage)
import Telegram.Bot.Support (Body (..), Method (..), Request (..), compactJson)
import Telegram.Bot.Types (Chat (..), IntegerOrString (..), Message (..), Update (..), User (..))

main :: IO ()
main = do
  token <- getEnv "TELEGRAM_BOT_TOKEN"
  manager <- newTlsManager
  poll manager token Nothing

-- | Long-poll for updates forever and greet the sender of every message. The offset is one past the last
-- update seen, which is how Telegram learns that the earlier ones were handled.
poll :: HTTP.Manager -> String -> Maybe Int64 -> IO a
poll manager token offset = do
  updates <- call manager token (GetUpdates.mkGetUpdates {GetUpdates.offset = offset, GetUpdates.timeout = Just 25})
  forM_ updates $ \update ->
    forM_ update.message $ \message ->
      call manager token (mkSendMessage (IntegerOrStringViaInteger message.chat.id) (greeting message))
  poll manager token (if null updates then offset else Just (maximum [update.update_id | update <- updates] + 1))

-- | The sender's first name, or the chat's id for a message that has no sender.
greeting :: Message -> Text
greeting message = "Hello, " <> maybe (Text.pack (show message.chat.id)) (.first_name) message.from <> "!"

-- | The whole transport: plan the request, POST its JSON to the method's URL, and read @result@ out of the
-- response envelope with the generated parser. Any failure ends the program with its reason. An exception from
-- the HTTP client shows the URL, token included; the wizard example has a transport that redacts it.
call :: forall r. (Method r) => HTTP.Manager -> String -> r -> IO (Result r)
call manager token request = do
  planned <- either (fail . show) pure (planRequest request)
  payload <- case planned.body of
    JsonBody object -> pure (compactJson (Object object))
    MultipartBody {} -> fail "a request with an upload needs the multipart transport in examples/wizard"
  target <- HTTP.parseRequest ("https://api.telegram.org/bot" <> token <> "/" <> Text.unpack planned.method)
  response <-
    HTTP.httpLbs
      target
        { HTTP.method = "POST"
        , HTTP.requestHeaders = [("Content-Type", "application/json")]
        , HTTP.requestBody = HTTP.RequestBodyBS payload
        }
      manager
  let body = HTTP.responseBody response
      result = withObject "response" (\envelope -> envelope .: "result" >>= parseResult (Proxy @r))
  either (\why -> fail (why <> " in " <> show body)) pure (eitherDecode body >>= parseEither result)
