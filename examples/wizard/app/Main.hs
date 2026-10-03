{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE OverloadedStrings #-}

-- | The entry point: one token in, one wizard out. @telegrammar-wizard [WIRE_LOG]@ takes the bot's token from
-- the process environment, as @TELEGRAM_BOT_TOKEN@, and appends the JSON-lines wire log to the one optional
-- argument.
module Main (main) where

import Control.Concurrent (myThreadId)
import Control.Exception (AsyncException (UserInterrupt), throwTo)
import Control.Monad.Trans.Reader (runReaderT)
import Data.IORef (newIORef)
import Data.Map.Strict qualified as Map
import Data.Maybe (fromMaybe)
import Data.Text (Text)
import Data.Text qualified as Text
import Data.Text.IO qualified as Text.IO
import System.Environment (getArgs, lookupEnv)
import System.Exit (ExitCode (ExitFailure), exitWith)
import System.IO (hFlush, stderr, stdout)
import System.Posix.Signals (Handler (Catch), installHandler, sigINT, sigTERM)
import Telegram.Bot.Methods.GetMe qualified as GetMe
import Telegram.Bot.Types (User (..))
import Wizard.Bot (Bot, Env (..), echoLine)
import Wizard.Call (Reply (..), call, setback)
import Wizard.Loop (runWizard)
import Wizard.Transport (Client, newClient)
import Wizard.Types (UserId (..), WizardState (..), nowhere)

main :: IO ()
main = do
  arguments <- getArgs
  logPath <- case arguments of
    [] -> pure defaultWireLog
    [path] -> pure path
    _ -> abort "usage: telegrammar-wizard [WIRE_LOG]"
  token <- botToken
  installGracefulSignals
  transport <- newClient token logPath
  identity <- handshake transport
  case identity of
    Answered _ me -> do
      echoLine ("wizard: connected as @" <> fromMaybe me.first_name me.username)
      runWizard transport (UserId me.id) (fromMaybe "" me.username)
    refused -> abort ("getMe failed: " <> setback refused)

-- | Where the wire log goes when the invocation names no path.
defaultWireLog :: FilePath
defaultWireLog = "telegrammar-wizard-wire.jsonl"

-- | The one credential, from the process environment.
botToken :: IO Text
botToken = do
  token <- maybe "" (Text.strip . Text.pack) <$> lookupEnv "TELEGRAM_BOT_TOKEN"
  if Text.null token
    then abort "TELEGRAM_BOT_TOKEN is empty: export the token of a bot dedicated to this wizard, which owns that bot's getUpdates"
    else pure token

-- | The proof the transport, the request planner and the generated result codec line up against the live API,
-- and where the bot learns the id and the name the run then carries. It runs hushed and in no room: there is
-- none to relay a refusal into yet, and a refusal here is what the exit line says.
handshake :: Client -> IO (Reply User)
handshake transport = do
  cell <- newIORef WizardState {rooms = Map.empty}
  runReaderT
    (call GetMe.mkGetMe :: Bot (Reply User))
    Env
      { client = transport
      , botId = UserId 0
      , botName = ""
      , here = nowhere
      , wizard = cell
      , quiet = True
      }

-- | One line on stderr, then exit 1.
abort :: Text -> IO a
abort problem = do
  hFlush stdout
  Text.IO.hPutStrLn stderr ("wizard: " <> problem)
  exitWith (ExitFailure 1)

-- | A run backgrounded from a non-interactive shell inherits SIGINT ignored, so the graceful sweep-and-retire
-- exit would be unreachable; install it explicitly, and let SIGTERM (kill's default) take the same path.
installGracefulSignals :: IO ()
installGracefulSignals = do
  loop <- myThreadId
  let graceful = Catch (throwTo loop UserInterrupt)
  _ <- installHandler sigINT graceful Nothing
  _ <- installHandler sigTERM graceful Nothing
  pure ()
