{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE OverloadedStrings #-}

-- | What every wizard action can reach, and how it reaches it. The room an action paints in is in the
-- environment rather than in an argument, so nothing threads a chat id anywhere, and the whole state is one
-- value behind one 'IORef'.
module Wizard.Bot (Env (..), Bot, inRoom, hushed, peek, change, change_, onSession, session, echo, echoLine,
                   pause, catchBot, tshow, quoted) where

import Control.Concurrent (threadDelay)
import Control.Exception (Exception, catch)
import Control.Monad.IO.Class (liftIO)
import Control.Monad.Trans.Reader (ReaderT (..), asks, local, runReaderT)
import Data.IORef (IORef, atomicModifyIORef', readIORef)
import Data.Map.Strict qualified as Map
import Data.Text (Text)
import Data.Text qualified as Text
import Data.Text.IO qualified as Text.IO
import System.IO (hFlush, stdout)
import Wizard.Transport (Client)
import Wizard.Types (Room (..), Session (..), UserId, WizardState (..), keyOf, newSession)

-- | The transport, the bot's own id and name, the room this action paints in, the one cell the state lives
-- in, and whether a refusal may speak.
data Env = Env
  { client :: Client
  , botId :: UserId
  -- ^ The bot's own id, from the startup handshake: the rich showcase's user mention names it.
  , botName :: Text
  -- ^ The bot's own @username@, from the startup handshake: the invite link is built from it.
  , here :: Room
  , wizard :: IORef WizardState
  , quiet :: Bool
  -- ^ True outside any room, while a refusal notice is on the wire, and while the long poll runs. None of them
  -- may relay a refusal into the chat: the first has no chat, the second would answer itself, and a dropped
  -- idle long poll is routine and self-healing.
  }

-- | Every wizard action.
type Bot = ReaderT Env IO

-- | Serve a room. Entering one is also what lets a refusal speak, because only a room has a chat to relay
-- it into.
inRoom :: Room -> Bot a -> Bot a
inRoom room = local (\env -> env {here = room, quiet = False})

-- | Run an action with the refusal relay silenced.
hushed :: Bot a -> Bot a
hushed = local (\env -> env {quiet = True})

-- | Read something out of the whole state.
peek :: (WizardState -> a) -> Bot a
peek look = asks (.wizard) >>= fmap look . liftIO . readIORef

-- | Apply one pure transition to the whole state and keep what it decided.
change :: (WizardState -> (WizardState, a)) -> Bot a
change transition = asks (.wizard) >>= \cell -> liftIO (atomicModifyIORef' cell transition)

-- | Apply one pure transition that decides nothing.
change_ :: (WizardState -> WizardState) -> Bot ()
change_ transition = change (\state -> (transition state, ()))

-- | Change the current room's session, minting it on first sight; the only place a session is written.
onSession :: (Session -> (Session, a)) -> Bot a
onSession transition = do
  room <- asks (.here)
  change $ \state ->
    let key = keyOf room
        (changed, answer) = transition (Map.findWithDefault (newSession room.label) key state.rooms)
     in (state {rooms = Map.insert key changed state.rooms}, answer)

-- | The current room's session.
session :: Bot Session
session = onSession (\current -> (current, current))

-- | One flushed line on stdout: the wizard is watched from a terminal, so nothing may sit in a buffer.
echoLine :: Text -> IO ()
echoLine spoken = do
  Text.IO.putStrLn spoken
  hFlush stdout

-- | 'echoLine' in the bot monad.
echo :: Text -> Bot ()
echo = liftIO . echoLine

-- | Sleep, in seconds. The scenarios pace themselves so one exhibit can be watched before the next.
pause :: Double -> Bot ()
pause seconds = liftIO (threadDelay (round (seconds * 1000000)))

-- | 'catch' for the bot monad; the environment is immutable, so unlifting is handing the same one to both.
catchBot :: (Exception e) => Bot a -> (e -> Bot a) -> Bot a
catchBot action handler =
  ReaderT (\env -> runReaderT action env `catch` \problem -> runReaderT (handler problem) env)

-- | A shown value as text.
tshow :: (Show a) => a -> Text
tshow = Text.pack . show

-- | A text in single quotes, the way the terminal lines quote a name.
quoted :: Text -> Text
quoted text = "'" <> text <> "'"
