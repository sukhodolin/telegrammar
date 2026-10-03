{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE OverloadedStrings #-}

-- | The menu, and the control card: one standing message per room, edited in place for its whole life.
-- A new bot message clears the typing indicator and the draft the chrome scenarios exhibit while an edit
-- does not, so the card is re-sent only when there is none or the edit is refused.
module Wizard.Card (menu, lookupScenario, Card (..), menuCard, scenarioCard, showCard, showMenu, enterStep) where

import Control.Monad (forM_, unless)
import Control.Monad.Trans.Reader (asks)
import Data.Maybe (listToMaybe)
import Data.List (find)
import Data.Text (Text)
import Data.Text qualified as Text
import Telegram.Bot.Methods.EditMessageText qualified as EditMessageText
import Telegram.Bot.Methods.SendMessage qualified as SendMessage
import Telegram.Bot.Types (InlineKeyboardButton, mkInlineKeyboardMarkup)
import Wizard.Bot (Bot, Env (..), onSession, session, tshow)
import Wizard.Call (Reply (..), accepted, call, createdMessage, messageTo, sweep)
import Wizard.Exhibit (Scenario (..), Step (..), callback, inline)
import Wizard.Rooms (saveRooms)
import Wizard.Scenarios.Chrome qualified as Chrome
import Wizard.Scenarios.Keyboards qualified as Keyboards
import Wizard.Scenarios.Rich qualified as Rich
import Wizard.Scenarios.RichButtons qualified as RichButtons
import Wizard.Transport (CallError (..))
import Wizard.Types (Datum (..), Position (..), Room (..), ScenarioKey, Session (..), carded, chatArg, entering,
                     numberOfMessage)

-- | Every scenario the menu offers, in the order it offers them.
menu :: [Scenario]
menu =
  [ Chrome.typing, Chrome.voice, Chrome.draftNative, Chrome.draftThinking
  , Rich.showcase, Rich.pair, RichButtons.richButtons
  , Keyboards.reply, Keyboards.styles, Keyboards.request, Keyboards.force
  , Keyboards.pick, Keyboards.formatting, Keyboards.share, Keyboards.knownContacts
  , Keyboards.shareLink, Chrome.clearTest, Keyboards.icons
  ]

-- | The scenario a key names, when this build offers one.
lookupScenario :: ScenarioKey -> Maybe Scenario
lookupScenario wanted = find (\entry -> entry.key == wanted) menu


-- | What a card says and what it offers.
data Card = Card {text :: Text, rows :: [[InlineKeyboardButton]]}

-- | The menu face: the room being worked in, one button per scenario, and a close button.
menuCard :: Text -> Card
menuCard name =
  Card
    { text =
        "Wizard: Telegram surface test scenarios.\n"
          <> "Working in: " <> name <> ". /here in another shared room opens one there too.\n"
          <> "Pick a scenario:"
    , rows = [[callback entry.label (Run entry.key)] | entry <- menu] <> [[callback "Close the wizard here" Close]]
    }

-- | The scenario face: the scenario's label, the step's place in it, and the step's own text.
scenarioCard :: Scenario -> Int -> Card
scenarioCard plan index =
  Card
    { text =
        plan.label <> "\nStep " <> tshow (index + 1) <> "/" <> tshow total <> ".\n\n" <> maybe "" (.says) (stepAt plan index)
    , rows = [buttons]
    }
  where
    total = length plan.steps
    buttons
      -- On the last step a Cancel twin would do the same thing as the return, so only the return is offered.
      | index + 1 == total = [callback "Return to the menu" Next]
      | otherwise = [callback "Continue" Next, callback "Cancel" Cancel]

stepAt :: Scenario -> Int -> Maybe Step
stepAt plan index = listToMaybe (drop index plan.steps)

-- | Put one card in a room and keep it there, re-sent only when no card exists yet or the edit fails,
-- which is what happens once someone has deleted it.
showCard :: Card -> Bot ()
showCard face = do
  room <- asks (.here)
  current <- session
  settled <- case current.card of
    Nothing -> pure False
    Just identifier -> do
      edit <-
        call
          EditMessageText.mkEditMessageText
            { EditMessageText.chat_id = Just (chatArg room.chat)
            , EditMessageText.message_id = Just (numberOfMessage identifier)
            , EditMessageText.text = Just face.text
            , EditMessageText.reply_markup = Just (mkInlineKeyboardMarkup face.rows)
            }
      pure (accepted edit || alreadyRight edit)
  unless settled $ do
    -- The control card is not scenario residue, so it goes out through 'call' and never enters the sweep.
    sent <- call (messageTo room face.text) {SendMessage.reply_markup = Just (inline face.rows)}
    forM_ (createdMessage sent) $ \identifier -> do
      onSession (\current' -> (carded (Just identifier) current', ()))
      saveRooms

-- | Whether a refused edit was refused because the card already says this.
alreadyRight :: Reply a -> Bool
alreadyRight = \case
  Refused ApiError {description = detail} -> "not modified" `Text.isInfixOf` detail
  _ -> False

-- | Return a room to the menu: sweep what the open scenario left, then put the menu back on the room's card.
-- The sweep is what ends the scenario, because it clears the position, the residue and the slots in one step.
showMenu :: Bot ()
showMenu = do
  room <- asks (.here)
  sweep
  showCard (menuCard room.label)

-- | Move a room to one step of a scenario: its card, then its experiment.
-- Card first, so the edit cannot clear the chrome the step is about to paint.
enterStep :: ScenarioKey -> Int -> Bot ()
enterStep wanted index = forM_ (lookupScenario wanted) $ \plan -> do
  onSession (\current -> (entering Position {scenario = wanted, step = index} current, ()))
  showCard (scenarioCard plan index)
  forM_ (stepAt plan index) (.fire)
