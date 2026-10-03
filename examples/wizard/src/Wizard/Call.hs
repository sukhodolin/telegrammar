{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE OverloadedStrings #-}

-- | The one funnel every Bot API call goes through: 'call' echoes the request, sends it, debriefs the
-- response, and relays a refusal into the room being served. A 'Reply' carries the raw wire value beside
-- the decoded result.
module Wizard.Call (Reply (..), rawOf, accepted, createdMessage, setback, withRaw, call, post, proxyOf,
                    messageTo, richTo, actionTo, draftTo, richDraftTo, threadArg, retire, remember, standing,
                    sweep, field, textAt, arrayAt, hasKey, textOf, compact, emptyObject, rawMessageId,
                    rawHasMarkup, wireKeys) where

import Control.Monad (forM_, unless, void)
import Control.Monad.IO.Class (liftIO)
import Control.Monad.Trans.Reader (asks)
import Data.Aeson (Object, Value (..))
import Data.Aeson.Key qualified as Key
import Data.Aeson.KeyMap qualified as KeyMap
import Data.Aeson.Types qualified as Aeson
import Data.Foldable (toList)
import Data.Int (Int64)
import Data.List (sort)
import Data.Map.Strict qualified as Map
import Data.Maybe (fromMaybe, isJust)
import Data.Proxy (Proxy (..))
import Data.Text (Text)
import Data.Text qualified as Text
import Data.Text.Encoding qualified as Text.Encoding
import Data.Text.Encoding.Error qualified as Error
import Data.Time.Format (defaultTimeLocale, formatTime)
import Data.Time.LocalTime (getZonedTime)
import Telegram.Bot.Methods.DeleteMessage qualified as DeleteMessage
import Telegram.Bot.Methods.DeleteMessages qualified as DeleteMessages
import Telegram.Bot.Methods.SendChatAction qualified as SendChatAction
import Telegram.Bot.Methods.SendMessage qualified as SendMessage
import Telegram.Bot.Methods.SendMessageDraft qualified as SendMessageDraft
import Telegram.Bot.Methods.SendRichMessage qualified as SendRichMessage
import Telegram.Bot.Methods.SendRichMessageDraft qualified as SendRichMessageDraft
import Telegram.Bot.Support (EncodeError (..), Method (..), Request (..), compactJson)
import Telegram.Bot.Types (InputRichMessage)
import Wizard.Bot (Bot, Env (..), echo, echoLine, hushed, onSession, session, tshow)
import Wizard.Transport (CallError (..), bodyPreview, describeCallError, failureDescription, sendRequest,
                         transportKind)
import Wizard.Types (ChatId, MessageId (..), Posted (..), Room (..), Session (..), Slot, chatArg, companions,
                     filling, finishing, kept, numberOfChat, numberOfMessage, numberOfThread, releasing)

-- | What one call came back with: the raw result rides along with the decoded one, because a verdict usually
-- needs both the tree the API echoed and the key names it echoed it under.
data Reply a
  = -- | The API accepted the call and the generated codec read the result.
    Answered Value a
  | -- | The API accepted the call and the generated codec could not read the result. What happened in the
    -- chat still happened, and the raw value is the evidence of a defect in the generated codec.
    Unreadable Value Text
  | -- | The planner, the transport, or the API itself said no.
    Refused CallError
  deriving stock (Functor)

-- | The raw result of any call the API accepted.
rawOf :: Reply a -> Maybe Value
rawOf = \case
  Answered raw _ -> Just raw
  Unreadable raw _ -> Just raw
  Refused _ -> Nothing

-- | Whether the API accepted the call. A result the codec could not read is accepted: it must not turn a
-- message Telegram made into a message that does not exist.
accepted :: Reply a -> Bool
accepted = isJust . rawOf

-- | The @message_id@ read from the raw value, so a result the codec could not decode still names the message
-- Telegram made; losing it would leave an exhibit standing while the next step retires an older one.
createdMessage :: Reply a -> Maybe MessageId
createdMessage reply = MessageId <$> (rawOf reply >>= rawMessageId)

-- | Why a reply carries no usable answer: the API's words for a refusal, the decoder's for an unreadable one.
setback :: Reply a -> Text
setback = \case
  Answered _ _ -> ""
  Unreadable _ why -> "result decode: " <> why
  Refused problem -> failureDescription problem

-- | Rewrite a reply's decoded value with the raw result in hand.
withRaw :: (Value -> a -> b) -> Reply a -> Reply b
withRaw rewrite = \case
  Answered raw value -> Answered raw (rewrite raw value)
  Unreadable raw why -> Unreadable raw why
  Refused problem -> Refused problem

-- | One Bot API call: the echo before it goes, the transport, the refusal notice, and the debrief after it
-- comes back. A refusal is itself a finding, so it prints, relays, and flows on rather than stopping the run.
call :: (Method r) => r -> Bot (Reply (Result r))
call request = do
  transport <- asks (.client)
  reply <- liftIO (perform transport)
  debrief name reply
  pure reply
  where
    name = methodName (proxyOf request)
    perform transport = case planRequest request of
      Left problem -> pure (Refused (PlanFailed problem))
      Right planned -> do
        stamp <- clockStamp
        echoLine (stamp <> " -> " <> name <> " " <> Text.take 200 (bodyPreview planned.body))
        answer <- sendRequest transport planned
        pure $ case answer of
          Left problem -> Refused problem
          Right raw -> case Aeson.parseEither (parseResult (proxyOf request)) raw of
            Left why -> Unreadable raw (Text.pack why)
            Right value -> Answered raw value

-- | The proxy every 'Method' class member takes, from a request value.
proxyOf :: r -> Proxy r
proxyOf _ = Proxy

-- | A call that puts a new message in a chat, recorded as residue so that leaving the scenario sweeps it. The
-- chat is named rather than read off the request, because each method's request spells its chat in a field of
-- its own.
post :: (Method r) => ChatId -> r -> Bot (Reply (Result r))
post chat request = do
  reply <- call request
  forM_ (createdMessage reply) (\identifier -> onSession (\current -> (kept (Posted chat identifier) current, ())))
  pure reply

-- | The terminal lines and the relay. The failure lines come before the @ok@ line, so an accepted but
-- undecodable call reports the defect and then still reports the message it made.
debrief :: Text -> Reply a -> Bot ()
debrief name = \case
  Answered raw _ -> ok raw
  Unreadable raw why -> do
    echo ("   !! result decode: " <> why)
    echo ("   raw result: " <> Text.take 1000 (compact raw))
    flag name ("result decode failed, " <> why)
    -- The API accepted the call, so what happened in the chat still happened.
    ok raw
  Refused (TransportError detail) -> do
    echo ("   !! transport: " <> detail)
    flag name ("transport error, " <> transportKind detail)
  Refused ApiError {errorCode = code, description = detail} -> do
    echo ("   !! " <> maybe "-" tshow code <> ": " <> detail)
    -- "message is not modified" is the benign no-op edit, not a refusal.
    unless ("not modified" `Text.isInfixOf` detail) $
      flag name (if Text.null detail then maybe "" tshow code else detail)
  Refused problem@(PlanFailed failure) -> do
    echo ("   !! " <> describeCallError problem)
    flag name ("request could not be planned, " <> failure.code)
  Refused ResultDecodeFailed {} -> pure () -- 'call' has already made this an 'Unreadable'.

-- | The debrief line: the response's id and its markup state, the quantities every later step depends on.
ok :: Value -> Bot ()
ok raw = forM_ (rawMessageId raw) $ \identifier ->
  echo ("   ok id=" <> tshow identifier <> " markup=" <> (if rawHasMarkup raw then "yes" else "no"))

-- | Report a refused call in the chat, never terminal only. The notice is an ordinary send into
-- the current room, so it enters that room's residue, and it runs hushed because a failing notice must not
-- answer itself.
flag :: Text -> Text -> Bot ()
flag name finding = do
  hush <- asks (.quiet)
  unless hush $ do
    room <- asks (.here)
    void (hushed (post room.chat (messageTo room ("⚠ " <> name <> ": " <> finding))))

clockStamp :: IO Text
clockStamp = Text.pack . formatTime defaultTimeLocale "%H:%M:%S" <$> getZonedTime

-- | A request addressed at a room: its chat and, in a forum topic, its thread, both as the generated fields.
messageTo :: Room -> Text -> SendMessage.SendMessage
messageTo room body =
  (SendMessage.mkSendMessage (chatArg room.chat) body)
    {SendMessage.message_thread_id = threadArg room}

-- | A rich message addressed at a room.
richTo :: Room -> InputRichMessage -> SendRichMessage.SendRichMessage
richTo room body =
  (SendRichMessage.mkSendRichMessage (chatArg room.chat) body)
    {SendRichMessage.message_thread_id = threadArg room}

-- | A chat action addressed at a room.
actionTo :: Room -> Text -> SendChatAction.SendChatAction
actionTo room what =
  (SendChatAction.mkSendChatAction (chatArg room.chat) what)
    {SendChatAction.message_thread_id = threadArg room}

-- | The draft methods take the chat as a bare number, not the @chat_id@ choice: drafts are for private chats.
draftTo :: Room -> Int64 -> SendMessageDraft.SendMessageDraft
draftTo room draft =
  (SendMessageDraft.mkSendMessageDraft (numberOfChat room.chat) draft)
    {SendMessageDraft.message_thread_id = threadArg room}

-- | A rich draft addressed at a room. See 'draftTo' for the bare chat number.
richDraftTo :: Room -> Int64 -> InputRichMessage -> SendRichMessageDraft.SendRichMessageDraft
richDraftTo room draft body =
  (SendRichMessageDraft.mkSendRichMessageDraft (numberOfChat room.chat) draft body)
    {SendRichMessageDraft.message_thread_id = threadArg room}

-- | The thread a room is, when it is a forum topic.
threadArg :: Room -> Maybe Int64
threadArg room = numberOfThread <$> room.thread

-- | Retire the slot's standing exhibit and the slots that belong with it. This is replacement, not an edit: a
-- reply keyboard only attaches at send time. The retired message leaves the residue too, because it is gone.
retire :: Slot -> Bot ()
retire slot = do
  room <- asks (.here)
  gone <- onSession (releasing room.chat (companions slot))
  forM_ gone $ \posted ->
    void (call (DeleteMessage.mkDeleteMessage (chatArg posted.chat) (numberOfMessage posted.message)))

-- | Record a send as the slot's standing exhibit, in the room it went to.
remember :: Slot -> Reply a -> Bot ()
remember slot reply = do
  room <- asks (.here)
  forM_ (createdMessage reply) $ \identifier ->
    onSession (\current -> (filling slot (Posted room.chat identifier) current, ()))

-- | The exhibit a slot is holding.
standing :: Slot -> Bot (Maybe Posted)
standing slot = Map.lookup slot . (.slots) <$> session

-- | Delete everything this room's finished scenario created, in chunks of 100 (the @deleteMessages@ cap),
-- with a single-delete fallback when the bulk call is refused. Where the bot lacks the right to delete the
-- user's own presses (a group without admin), they stay.
sweep :: Bot ()
sweep = do
  residue <- onSession finishing
  forM_ (byChat residue) $ \(chat, messages) ->
    forM_ (chunksOf 100 messages) $ \chunk -> do
      bulk <- call (DeleteMessages.mkDeleteMessages (chatArg chat) (map numberOfMessage chunk))
      unless (accepted bulk) $
        forM_ chunk $ \message ->
          void (call (DeleteMessage.mkDeleteMessage (chatArg chat) (numberOfMessage message)))

-- | The residue grouped by the chat it lives in, order preserved within a chat.
byChat :: [Posted] -> [(ChatId, [MessageId])]
byChat residue = Map.toList (Map.fromListWith (flip (<>)) [(posted.chat, [posted.message]) | posted <- residue])

chunksOf :: Int -> [a] -> [[a]]
chunksOf size = \case
  [] -> []
  items -> let (chunk, rest) = splitAt size items in chunk : chunksOf size rest

-- | The value at a key, 'Null' when there is none.
field :: Text -> Value -> Value
field name = \case
  Object node -> fromMaybe Null (KeyMap.lookup (Key.fromText name) node)
  _ -> Null

-- | The string at a key.
textAt :: Text -> Value -> Maybe Text
textAt name value = textOf (field name value)

-- | The array at a key, empty when there is none.
arrayAt :: Text -> Object -> [Value]
arrayAt name node = case KeyMap.lookup (Key.fromText name) node of
  Just (Array items) -> toList items
  _ -> []

-- | Whether a raw object carries a key at all, which is what the wire means by a button's kind and style.
hasKey :: Text -> Value -> Bool
hasKey name = \case
  Object node -> KeyMap.member (Key.fromText name) node
  _ -> False

-- | A raw value as a string, when it is one.
textOf :: Value -> Maybe Text
textOf = \case
  String plain -> Just plain
  _ -> Nothing

-- | One line, keys sorted, through the planner's own compact encoder.
compact :: Value -> Text
compact = Text.Encoding.decodeUtf8With Error.lenientDecode . compactJson

-- | The empty object a placed but absent button stands in as.
emptyObject :: Value
emptyObject = Object KeyMap.empty

-- | The @message_id@ of a message-shaped raw result.
rawMessageId :: Value -> Maybe Int64
rawMessageId = \case
  Object node -> KeyMap.lookup "message_id" node >>= Aeson.parseMaybe Aeson.parseJSON
  _ -> Nothing

-- | Whether a message-shaped raw result came back carrying a keyboard.
rawHasMarkup :: Value -> Bool
rawHasMarkup = \case
  Object node -> KeyMap.member "reply_markup" node
  _ -> False

-- | The key names a raw result actually came back with. The typed 'Telegram.Bot.Types.Message' cannot
-- answer this: it has a field for every documented key whether the wire carried it or not, and the verdict is
-- about the wire.
wireKeys :: Value -> [Text]
wireKeys = \case
  Object node -> sort (map Key.toText (KeyMap.keys node))
  _ -> []
