{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE OverloadedStrings #-}

-- | Everything the wizard is made of, and every pure transition over it. One state value holds every room's
-- session, and the transitions at the end of this module are the only things that change one.
module Wizard.Types (ChatId (..), MessageId (..), ThreadId (..), UserId (..), QueryId (..), chatArg,
                     numberOfChat, numberOfMessage, numberOfThread, numberOfUser, wordOfQuery, Room (..),
                     RoomKey (..), keyOf, nowhere, Posted (..), Slot (..), companions, slotWord,
                     ScenarioKey (..), scenarioWord, readScenarioKey, Datum (..), writeDatum, readDatum,
                     Position (..), Session (..), newSession, roomOf, WizardState (..), entering, carded,
                     kept, dropped, filling, releasing, finishing) where

import Data.Aeson (FromJSON, ToJSON)
import Data.Int (Int64)
import Data.Map.Strict (Map)
import Data.Map.Strict qualified as Map
import Data.Text (Text)
import Data.Text qualified as Text
import Telegram.Bot.Types (IntegerOrString (..))

-- | Telegram's flavours of number, kept apart so a message id can never be passed where a chat id belongs.
-- The instances are newtype-derived because an id travels as the bare number everywhere, the state file keys
-- included, and stock deriving would print @ChatId 5@ and rewrite that file.
newtype ChatId = ChatId Int64 deriving newtype (Eq, Ord, Show, ToJSON, FromJSON)

-- | A message's id inside its chat. See 'ChatId' for why the instances are newtype-derived.
newtype MessageId = MessageId Int64 deriving newtype (Eq, Ord, Show, ToJSON, FromJSON)

-- | A forum topic's id inside its chat.
newtype ThreadId = ThreadId Int64 deriving newtype (Eq, Ord, Show, ToJSON, FromJSON)

-- | A Telegram user's id.
newtype UserId = UserId Int64 deriving newtype (Eq, Ord, Show, ToJSON, FromJSON)

-- | The id a callback query is answered by.
newtype QueryId = QueryId Text deriving newtype (Eq, Show)

-- | A chat id where a method wants the @chat_id@ choice.
chatArg :: ChatId -> IntegerOrString
chatArg (ChatId chat) = IntegerOrStringViaInteger chat

-- | A chat id as the bare number a method that takes no choice wants.
numberOfChat :: ChatId -> Int64
numberOfChat (ChatId chat) = chat

-- | A message id as the bare number.
numberOfMessage :: MessageId -> Int64
numberOfMessage (MessageId message) = message

-- | A thread id as the bare number.
numberOfThread :: ThreadId -> Int64
numberOfThread (ThreadId topic) = topic

-- | A user id as the bare number a method that names a person wants.
numberOfUser :: UserId -> Int64
numberOfUser (UserId person) = person

-- | A callback query id as the string @answerCallbackQuery@ wants.
wordOfQuery :: QueryId -> Text
wordOfQuery (QueryId query) = query

-- | One room the wizard works in: a chat, or one forum topic inside it. The label is how the card names it.
data Room = Room {chat :: ChatId, thread :: Maybe ThreadId, label :: Text}
  deriving stock (Eq, Show)

-- | What a room's session is filed under: an unthreaded room and a topic are different keys here.
data RoomKey = RoomKey ChatId (Maybe ThreadId)
  deriving stock (Eq, Ord, Show)

-- | The key a room's session is filed under.
keyOf :: Room -> RoomKey
keyOf room = RoomKey room.chat room.thread

-- | Where an action runs while no room is being served: at startup, and for an update that names no chat.
-- Nothing is ever sent there, because a refusal is relayed only from inside a room.
nowhere :: Room
nowhere = Room {chat = ChatId 0, thread = Nothing, label = "nowhere"}

-- | A message the wizard put somewhere: scenario residue, or the standing exhibit of a slot. The chat travels
-- with the id because the sweep deletes per chat.
data Posted = Posted {chat :: ChatId, message :: MessageId}
  deriving stock (Eq, Show)

-- | The standing exhibits a scenario replaces rather than stacks: sending into a slot retires what stood in.
data Slot
  = Keyboard -- ^ Every keyboard exhibit.
  | KeyboardSecond -- ^ The icon grid's second half, when the full grid is refused.
  | Rich -- ^ The rich showcase's one morphing bubble.
  | RichTwin -- ^ The blocks-form twin the date-time step sends beside it.
  | Verdict -- ^ The standing verdict message.
  | ClearFinal -- ^ The clearing test's final message.
  | ClearQuestion -- ^ The clearing test's question.
  | Probe Int -- ^ One rich-button edge probe, by its index.
  deriving stock (Eq, Ord, Show)

-- | Retiring a slot retires the slots that belong to the same exhibit.
companions :: Slot -> [Slot]
companions = \case
  Rich -> [Rich, RichTwin]
  slot -> [slot]

-- | How the two terminal lines that quote a slot name spell it.
slotWord :: Slot -> Text
slotWord = \case
  Keyboard -> "kb"
  KeyboardSecond -> "kb2"
  Rich -> "rich"
  RichTwin -> "rich_b"
  Verdict -> "verdict"
  ClearFinal -> "clear_final"
  ClearQuestion -> "clear_q"
  Probe index -> "probe" <> Text.pack (show index)

-- | Every scenario the menu offers, in constructor order, which is the menu order and its only statement.
data ScenarioKey
  = Typing | Voice | DraftNative | DraftThinking
  | RichShowcase | RichPair | RichButtons
  | KbReply | KbStyles | KbRequest | KbForce | KbPick | KbFmt
  | Share | KnownContacts | ShareLink | ClearTest | KbIcons
  deriving stock (Eq, Ord, Show, Enum, Bounded)

-- | The wire word of a key: what a menu button carries and what the startup banner names.
scenarioWord :: ScenarioKey -> Text
scenarioWord = \case
  Typing -> "typing"
  Voice -> "voice"
  DraftNative -> "draft_native"
  DraftThinking -> "draft_thinking"
  RichShowcase -> "rich"
  RichPair -> "rich_pair"
  RichButtons -> "rich_buttons"
  KbReply -> "kb_reply"
  KbStyles -> "kb_styles"
  KbRequest -> "kb_request"
  KbForce -> "kb_force"
  KbPick -> "kb_pick"
  KbFmt -> "kb_fmt"
  Share -> "share"
  KnownContacts -> "known_contacts"
  ShareLink -> "share_link"
  ClearTest -> "clear_test"
  KbIcons -> "kb_icons"

-- | The key a wire word names, when this build offers one.
readScenarioKey :: Text -> Maybe ScenarioKey
readScenarioKey word = lookup word [(scenarioWord key, key) | key <- [minBound .. maxBound]]

-- | What a pressed button said. The wire spellings are fixed: a card from an earlier run still carries them.
data Datum
  = Run ScenarioKey -- ^ @run:\<word\>@
  | Next -- ^ @next@
  | Cancel -- ^ @cancel@
  | Close -- ^ @close@
  | Demo Text -- ^ @demo:\<anything\>@, the inert prefix an exhibit's own buttons carry.
  | Stale Text -- ^ Anything else, an absent datum included: an older run's button, or one this build dropped.
  deriving stock (Eq, Show)

-- | The bytes a button carries.
writeDatum :: Datum -> Text
writeDatum = \case
  Run key -> "run:" <> scenarioWord key
  Next -> "next"
  Cancel -> "cancel"
  Close -> "close"
  Demo payload -> "demo:" <> payload
  Stale raw -> raw

-- | What a pressed button's bytes mean here; one this build cannot place is 'Stale', routed like 'Cancel'.
readDatum :: Text -> Datum
readDatum raw
  | Just payload <- Text.stripPrefix "demo:" raw = Demo payload
  | Just word <- Text.stripPrefix "run:" raw = maybe (Stale raw) Run (readScenarioKey word)
  | raw == "next" = Next
  | raw == "cancel" = Cancel
  | raw == "close" = Close
  | otherwise = Stale raw

-- | Where a room is inside the scenario it has open.
data Position = Position {scenario :: ScenarioKey, step :: Int}
  deriving stock (Eq, Show)

-- | One independent wizard in one room: its card, its position, what it stands on, and what it will sweep.
data Session = Session
  { name :: Text -- ^ How the card names this room.
  , card :: Maybe MessageId -- ^ The control card, edited in place for its whole life.
  , open :: Maybe Position
  , residue :: [Posted] -- ^ Everything the open scenario created, oldest first.
  , slots :: Map Slot Posted
  }
  deriving stock (Eq, Show)

-- | A room the wizard has just met.
newSession :: Text -> Session
newSession label = Session {name = label, card = Nothing, open = Nothing, residue = [], slots = Map.empty}

-- | The room a session works in, from the key it is filed under.
roomOf :: RoomKey -> Session -> Room
roomOf (RoomKey chat thread) session = Room {chat, thread, label = session.name}

-- | Everything the wizard remembers, in the one value behind the 'Data.IORef.IORef' in the environment.
newtype WizardState = WizardState {rooms :: Map RoomKey Session}
  deriving stock (Eq, Show)

-- | Open a scenario at a step.
entering :: Position -> Session -> Session
entering position session = session {open = Just position}

-- | Remember, or forget, the room's control card.
carded :: Maybe MessageId -> Session -> Session
carded standing session = session {card = standing}

-- | File a message the open scenario created.
kept :: Posted -> Session -> Session
kept posted session = session {residue = session.residue <> [posted]}

-- | Forget a message that is already gone.
dropped :: Posted -> Session -> Session
dropped posted session = session {residue = filter (/= posted) session.residue}

-- | Put a message in a slot.
filling :: Slot -> Posted -> Session -> Session
filling slot posted session = session {slots = Map.insert slot posted session.slots}

-- | Forget these slots and hand back the exhibits that stood in this chat, dropping them from the residue.
releasing :: ChatId -> [Slot] -> Session -> (Session, [Posted])
releasing chat slots session = (foldr dropped forgotten mine, mine)
  where
    forgotten = session {slots = foldr Map.delete session.slots slots}
    mine = [posted | slot <- slots, Just posted <- [Map.lookup slot session.slots], posted.chat == chat]

-- | End whatever was open and hand the residue back for the caller to delete. The slots go with it: a slot
-- outliving the sweep would make the next replacement chase a deleted id.
finishing :: Session -> (Session, [Posted])
finishing session = (session {open = Nothing, residue = [], slots = Map.empty}, session.residue)
