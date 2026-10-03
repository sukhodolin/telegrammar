{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE OverloadedStrings #-}

-- | The rooms the wizard is open in: how a room is named, what the table answers, and the file that lets a
-- restart find its standing card again. The state file is this example's own, because a second bot can work
-- the same chat and neither should edit the other's card.
module Wizard.Rooms (roomLabel, knownRoom, roomFor, openRooms, closeRoom, SavedRoom (..), restored,
                     stateFile, loadRooms, saveRooms) where

import Control.Exception (IOException, try)
import Control.Monad (forM_, void)
import Control.Monad.IO.Class (liftIO)
import Control.Monad.Trans.Reader (asks)
import Data.Aeson (FromJSON (..), ToJSON (..), object, withObject, (.:), (.:?), (.=))
import Data.Aeson qualified as Aeson
import Data.ByteString qualified as ByteString
import Data.ByteString.Lazy qualified as Lazy
import Data.Map.Strict qualified as Map
import Data.Maybe (fromMaybe)
import Data.Text (Text)
import Data.Text qualified as Text
import System.Directory (createDirectoryIfMissing, getHomeDirectory)
import System.Environment (lookupEnv)
import System.FilePath (takeDirectory, (</>))
import Telegram.Bot.Methods.DeleteMessage qualified as DeleteMessage
import Telegram.Bot.Types (Chat (..))
import Wizard.Bot (Bot, Env (..), change_, echo, peek, session, tshow)
import Wizard.Call (call, sweep)
import Wizard.Types (ChatId (..), MessageId, Room (..), RoomKey (..), Session (..), ThreadId, WizardState (..),
                     carded, chatArg, keyOf, newSession, numberOfMessage, roomOf)

-- | How the card names the room it is working in.
roomLabel :: Chat -> Maybe ThreadId -> Text
roomLabel place topic
  | place.type_ == "private" = "my DM"
  | otherwise = name <> " (" <> place.type_ <> pane <> ")"
  where
    name = firstNonEmpty [fromMaybe "" place.title, fromMaybe "" place.username] (tshow place.id)
    pane = case topic of
      Just identifier -> ", topic " <> tshow identifier
      Nothing
        -- Unthreaded chrome in a forum paints on the chat header, not in any topic pane, and naming General
        -- makes that legible.
        | place.is_forum -> ", General"
        | otherwise -> ""

firstNonEmpty :: [Text] -> Text -> Text
firstNonEmpty candidates fallback = case filter (not . Text.null) candidates of
  chosen : _ -> chosen
  [] -> fallback

-- | The room a key names, when the table knows it, under the label it is filed with.
knownRoom :: RoomKey -> Bot (Maybe Room)
knownRoom key = fmap (roomOf key) . Map.lookup key <$> peek (.rooms)

-- | The room a chat and topic name: the one the table knows, or a fresh one under the label this chat earns.
roomFor :: Chat -> Maybe ThreadId -> Bot Room
roomFor place topic = do
  let fresh = Room {chat = ChatId place.id, thread = topic, label = roomLabel place topic}
  fromMaybe fresh <$> knownRoom (RoomKey (ChatId place.id) topic)

-- | Every room the wizard is open in.
openRooms :: Bot [Room]
openRooms = map (uncurry roomOf) . Map.toList <$> peek (.rooms)

-- | Close the wizard in the current room: sweep what the scenario left, retire the card, forget the room.
closeRoom :: Bot ()
closeRoom = do
  room <- asks (.here)
  current <- session
  sweep
  forM_ current.card $ \identifier ->
    void (call (DeleteMessage.mkDeleteMessage (chatArg room.chat) (numberOfMessage identifier)))
  change_ (\state -> state {rooms = Map.delete (keyOf room) state.rooms})
  saveRooms

-- | The part of a room that outlives the process. The card's id survives here, so a fresh process edits the
-- standing card back into a menu instead of minting a duplicate.
data SavedRoom = SavedRoom
  { chat :: ChatId
  , thread :: Maybe ThreadId
  , label :: Text
  , cardId :: Maybe MessageId
  }
  deriving stock (Eq, Show)

instance ToJSON SavedRoom where
  toJSON saved =
    object ["chat" .= saved.chat, "thread" .= saved.thread, "label" .= saved.label, "card_id" .= saved.cardId]

instance FromJSON SavedRoom where
  parseJSON = withObject "SavedRoom" $ \payload -> do
    place <- payload .: "chat"
    topic <- payload .:? "thread"
    name <- payload .:? "label"
    card <- payload .:? "card_id"
    pure SavedRoom {chat = place, thread = topic, label = fromMaybe (tshow place) name, cardId = card}

-- | A remembered room as the table holds it: the room and its card, with nothing open and no residue.
restored :: SavedRoom -> (RoomKey, Session)
restored saved = (RoomKey saved.chat saved.thread, carded saved.cardId (newSession saved.label))

-- | @$XDG_CACHE_HOME\/telegrammar-wizard.json@, or @~\/.cache\/telegrammar-wizard.json@ when that is unset or empty.
stateFile :: IO FilePath
stateFile = do
  configured <- lookupEnv "XDG_CACHE_HOME"
  cache <- case configured of
    Just path | not (null path) -> pure path
    _ -> (</> ".cache") <$> getHomeDirectory
  pure (cache </> "telegrammar-wizard.json")

-- | Read the remembered rooms; a missing, unreadable, or unparsable file is simply no remembered rooms.
loadRooms :: IO [SavedRoom]
loadRooms = do
  path <- stateFile
  attempt <- try (ByteString.readFile path)
  pure $ case attempt of
    Left (_ :: IOException) -> []
    Right payload -> case Aeson.decodeStrict payload :: Maybe StateFile of
      Just remembered -> remembered.sessions
      Nothing -> []

-- | The file's one key.
newtype StateFile = StateFile
  { sessions :: [SavedRoom]
  }

instance FromJSON StateFile where
  parseJSON = withObject "StateFile" $ \payload ->
    StateFile . fromMaybe [] <$> payload .:? "sessions"

-- | Write every open room, creating the cache directory if it is not there. A write failure is survived,
-- because losing the card ids costs one duplicated card, not the run.
saveRooms :: Bot ()
saveRooms = do
  open <- openRooms
  table <- peek (.rooms)
  path <- liftIO stateFile
  let snapshot room =
        SavedRoom
          { chat = room.chat
          , thread = room.thread
          , label = room.label
          , cardId = Map.lookup (keyOf room) table >>= (.card)
          }
  attempt <- liftIO . try $ do
    createDirectoryIfMissing True (takeDirectory path)
    Lazy.writeFile path (Aeson.encode (object ["sessions" .= map snapshot open]))
  case attempt of
    Left (problem :: IOException) -> echo ("   !! state save failed: " <> tshow problem)
    Right () -> pure ()
