{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE OverloadedStrings #-}

-- | The run loop: startup, the resilient long poll, the update dispatch, the press and message
-- handlers, and the sweep-and-retire shutdown.
module Wizard.Loop (runWizard) where

import Control.Exception (AsyncException (UserInterrupt), throwIO)
import Control.Monad (foldM, forM_, void, when)
import Control.Monad.IO.Class (liftIO)
import Control.Monad.Trans.Reader (runReaderT)
import Data.Aeson (Value)
import Data.Int (Int64)
import Data.IORef (newIORef)
import Data.Map.Strict qualified as Map
import Data.Maybe (fromMaybe, isNothing)
import Data.Text (Text)
import Data.Text qualified as Text
import Telegram.Bot.Methods.AnswerCallbackQuery qualified as AnswerCallbackQuery
import Telegram.Bot.Methods.EditMessageText qualified as EditMessageText
import Telegram.Bot.Methods.GetUpdates qualified as GetUpdates
import Telegram.Bot.Support (DecodeError (..), renderPath)
import Telegram.Bot.Types (CallbackQuery (..), Chat (..), InaccessibleMessage (..),
  MaybeInaccessibleMessage (..), Message (..))
import Telegram.Bot.Updates (DecodedUpdate (..), InvalidUpdateEnvelope (..), UpdatePart (..),
  UpdatePayload (..), decodeUpdateBatch)
import Wizard.Answers (answer, answerInline)
import Wizard.Bot (Bot, Env (..), catchBot, echo, hushed, inRoom, onSession, pause, quoted, session, tshow)
import Wizard.Call (call, compact, rawOf, sweep)
import Wizard.Card (enterStep, lookupScenario, menu, showMenu)
import Wizard.Exhibit (Scenario (..), doneToast)
import Wizard.Rooms (closeRoom, knownRoom, loadRooms, openRooms, restored, roomFor, roomLabel)
import Wizard.Transport (Client)
import Wizard.Types (ChatId (..), Datum (..), MessageId (..), Position (..), Posted (..), QueryId (..),
  Room (..), RoomKey (..), Session (..), ThreadId (..), UserId, WizardState (..), carded, chatArg, kept,
  nowhere, numberOfMessage, readDatum, scenarioWord, wordOfQuery)

-- | Drive the wizard for one bot, named by its id and username, until it is stopped. Every remembered room
-- comes back with its card, so a restart edits the standing cards instead of minting second menus.
runWizard :: Client -> UserId -> Text -> IO ()
runWizard transport identity name = do
  remembered <- loadRooms
  cell <- newIORef WizardState {rooms = Map.fromList (map restored remembered)}
  runReaderT
    start
    Env {client = transport, botId = identity, botName = name, here = nowhere, wizard = cell, quiet = True}

start :: Bot ()
start = do
  echo
    ( "wizard: " <> tshow (length menu) <> " scenarios on the menu: "
        <> Text.intercalate ", " (map (scenarioWord . (.key)) menu)
    )
  echo "wizard: menu cards heading to their rooms; Ctrl-C to stop."
  rooms <- openRooms
  forM_ rooms (\room -> inRoom room showMenu)
  cards <- traverse (\room -> inRoom room ((.card) <$> session)) rooms
  when (all isNothing cards) $
    echo "wizard: the bot cannot speak first: open its chat, press Start; waiting..."
  poll 0 `catchBot` \case
    UserInterrupt -> stop
    other -> liftIO (throwIO other)

-- | The long poll, run hushed because a dropped idle long poll is routine and self-healing.
poll :: Int64 -> Bot ()
poll next = do
  reply <-
    hushed $
      call
        GetUpdates.mkGetUpdates
          { GetUpdates.offset = Just next
          , GetUpdates.timeout = Just 50
          , GetUpdates.allowed_updates = Just ["message", "channel_post", "callback_query", "inline_query"]
          }
  following <- case rawOf reply of
    -- An accepted batch and one the strict codec could not read carry the same result value, and the
    -- boundary reads what decoded from either.
    Just raw -> consume next raw
    -- A dropped long poll is routine; back off instead of hammering reconnects during a real outage.
    Nothing -> pause 3 >> pure next
  poll following

-- | One @getUpdates@ result through the resilient boundary, answering with the offset to ask for next.
-- The strict @[Update]@ codec is all or nothing, so one unreadable payload would cost the whole batch
-- and stall the offset; here an intact envelope still advances it and delivers the parts that decoded.
consume :: Int64 -> Value -> Bot Int64
consume next raw = case decodeUpdateBatch raw of
  Left problem -> do
    echo ("   !! update batch failed to decode: " <> renderDecodeError problem)
    pure next
  Right entries -> foldM acknowledge next entries
  where
    -- An update whose own envelope is unreadable cannot be acknowledged by identifier.
    acknowledge sofar (Left broken) = do
      echo
        ( "   !! update envelope failed to decode: "
            <> renderDecodeError broken.decodeError
            <> "; raw " <> shortJson broken.rawUpdate
        )
      pure sofar
    acknowledge _ (Right decoded) = do
      mapM_ (part decoded.updateId) decoded.parts
      pure (decoded.updateId + 1)

part :: Int64 -> UpdatePart UpdatePayload -> Bot ()
part identifier = \case
  KnownUpdatePart payload -> dispatch payload
  -- A payload the generated codec cannot read is where a defect in that codec surfaces, so the field, the
  -- error and the raw part all print and the run continues on the parts that did decode.
  FailedUpdatePart {field = name, rawPart = raw, decodeError = problem} -> do
    echo ("   !! update " <> tshow identifier <> " field " <> name <> " failed to decode: " <> renderDecodeError problem)
    echo ("   raw part: " <> shortJson raw)
  UnknownUpdatePart {field = name} ->
    echo ("   ?? update " <> tshow identifier <> " carries an unknown part: " <> name)

renderDecodeError :: DecodeError -> Text
renderDecodeError problem = renderPath problem.path <> ": " <> problem.message

shortJson :: Value -> Text
shortJson = Text.take 1000 . compact

dispatch :: UpdatePayload -> Bot ()
dispatch = \case
  -- A channel speaks in posts, so that is how its /here arrives.
  UpdatePayloadChannelPost notice ->
    when (commandWord (fromMaybe "" notice.text) == "/here") (openRoom notice.chat Nothing)
  UpdatePayloadCallbackQuery query -> onPress query
  UpdatePayloadInlineQuery query -> answerInline query
  UpdatePayloadMessage message -> onMessage message
  _ -> pure ()

-- | Route a pressed button: a demo press, a scenario move, or closing the wizard in the card's room.
onPress :: CallbackQuery -> Bot ()
onPress query = case readDatum (fromMaybe "" query.data_) of
  -- A press on a rich-message button arrives as an ordinary callback_query; acknowledge, touch nothing.
  Demo pressed -> do
    echo
      ( "<- press " <> quoted pressed
          <> " on message " <> maybe "none" (\(_, identifier, _) -> tshow identifier) carrier
          <> " (" <> maybe "text" (const "rich") (accessible query.message >>= \held -> held.rich_message) <> ")"
      )
    toast asked ("Pressed: " <> pressed)
  datum -> case carrier of
    -- A press that names no message is on no card of the wizard's; acknowledge, touch nothing.
    Nothing -> toast asked ""
    Just card -> do
      room <- roomOfCard card
      inRoom room $ do
        current <- session
        case datum of
          Close -> do
            toast asked "Wizard closed here"
            closeRoom
          Run wanted | Just _ <- lookupScenario wanted -> do
            toast asked ""
            enterStep wanted 0
          Next
            | Just position <- current.open
            , Just plan <- lookupScenario position.scenario ->
                if position.step + 1 < length plan.steps
                  then toast asked "" >> enterStep position.scenario (position.step + 1)
                  else do
                    -- The last step already fired when its card appeared; Continue just closes the scenario.
                    toast asked doneToast
                    showMenu
          _ -> toast asked "" >> showMenu
  where
    asked = QueryId query.id
    carrier = pressedCard query.message

-- | Acknowledge a pressed button, with a toast on the client when there is something to say.
toast :: QueryId -> Text -> Bot ()
toast asked spoken =
  void
    ( call
        (AnswerCallbackQuery.mkAnswerCallbackQuery (wordOfQuery asked)) {AnswerCallbackQuery.text = Just spoken}
    )

-- | The room a pressed card lives in. A card this process does not know, an older run's leftover menu,
-- is adopted as that room's card so the press stays where the button lives.
roomOfCard :: (Chat, MessageId, Maybe ThreadId) -> Bot Room
roomOfCard (place, identifier, topic) = do
  open <- openAt (ChatId place.id) topic
  case open of
    Just room -> pure room
    Nothing -> do
      let room = Room {chat = ChatId place.id, thread = topic, label = roomLabel place topic}
      inRoom room (onSession (\current -> (carded (Just identifier) current, ())))
      pure room

-- | The room open at a chat and topic: the topic's own, or else the chat's unthreaded one.
openAt :: ChatId -> Maybe ThreadId -> Bot (Maybe Room)
openAt chat topic = do
  known <- knownRoom (RoomKey chat topic)
  maybe (knownRoom (RoomKey chat Nothing)) (pure . Just) known

-- | The chat a pressed card lives in, its id there, and its topic when it has one. A card the client can
-- no longer show arrives as an 'InaccessibleMessage', which still carries its chat and its message id, so
-- such a press stays in the room the button lives in instead of falling back to the DM.
pressedCard :: Maybe MaybeInaccessibleMessage -> Maybe (Chat, MessageId, Maybe ThreadId)
pressedCard = \case
  Just (MaybeInaccessibleMessageViaMessage held) ->
    Just (held.chat, MessageId held.message_id, ThreadId <$> held.message_thread_id)
  Just (MaybeInaccessibleMessageViaInaccessibleMessage held) ->
    Just (held.chat, MessageId held.message_id, Nothing)
  _ -> Nothing

-- | The accessible branch alone, for the one question only a whole 'Message' can answer: whether the
-- pressed button rode a rich message.
accessible :: Maybe MaybeInaccessibleMessage -> Maybe Message
accessible = \case
  Just (MaybeInaccessibleMessageViaMessage held) -> Just held
  _ -> Nothing

-- | Handle one message, in the room it arrived in. One that arrives where the wizard is not open is not
-- the wizard's to handle.
onMessage :: Message -> Bot ()
onMessage message
  -- A /here is how a shared room asks for the wizard; inside a topic it opens a session there.
  | commandWord body == "/here" && message.chat.type_ /= "private" =
      openRoom message.chat (ThreadId <$> message.message_thread_id)
  | otherwise = do
      known <- roomOfMessage message
      forM_ known $ \room -> inRoom room $ do
        current <- session
        -- A message sent during a scenario is experiment residue (a keyboard press, a share):
        -- swept with the rest on exit. Bots may delete incoming messages in private chats (48 h).
        case current.open of
          Just _ | not ("/start" `Text.isPrefixOf` body) ->
            onSession (\held -> (kept (Posted (ChatId message.chat.id) (MessageId message.message_id)) held, ()))
          _ -> pure ()
        answer message body
  where
    body = fromMaybe "" message.text

-- | The room a message arrived in, when the wizard is open there. A @\/start@ is how a private chat asks
-- for the wizard, so that one message finds a room whether or not one is open yet.
roomOfMessage :: Message -> Bot (Maybe Room)
roomOfMessage message
  | message.chat.type_ == "private" && "/start" `Text.isPrefixOf` fromMaybe "" message.text =
      Just <$> roomFor message.chat Nothing
  | otherwise = openAt (ChatId message.chat.id) (ThreadId <$> message.message_thread_id)

-- | Open the wizard in a room that asked for it, or refresh it if it is already open there.
openRoom :: Chat -> Maybe ThreadId -> Bot ()
openRoom place topic = do
  room <- roomFor place topic
  echo ("-> wizard open in " <> room.label)
  inRoom room showMenu

-- | Ctrl-C, or SIGTERM: every room is swept and its card retired, so the chat is left as it was found.
stop :: Bot ()
stop = do
  rooms <- openRooms
  forM_ rooms $ \room -> inRoom room $ do
    current <- session
    sweep
    forM_ current.card $ \identifier ->
      void $
        call
          EditMessageText.mkEditMessageText
            { EditMessageText.chat_id = Just (chatArg room.chat)
            , EditMessageText.message_id = Just (numberOfMessage identifier)
            , EditMessageText.text = Just "Wizard stopped."
            }
  echo "\nwizard: stopped."

-- | A command with its @\@botname@ suffix removed, the way a group spells one addressed to a bot.
commandWord :: Text -> Text
commandWord = Text.strip . Text.takeWhile (/= '@')
