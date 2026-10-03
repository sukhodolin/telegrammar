{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE OverloadedStrings #-}

-- | The scenario shape and the vocabulary the scenario groups speak: chat actions, drafts, rich sends, keyboards, the standing
-- verdict, the date-time entity, and the constants several groups share. An exhibit replaces rather than
-- stacks, a slot holds one standing message, and a retired message leaves the sweep with it.
module Wizard.Exhibit (Step (..), Scenario (..), step, scenario, draftPlainId, draftRichId, doneToast, unrendered,
                       inviteLink, inviteLinkFor, inviteText, shareLinkId, knownContactsId,
                       typingOnce, typingKeepalive, recordVoice, draftPlain,
                       draftRich, tell, tellInto, sendRich, richOut, swapRich, keyboard, keyboardIn, strip,
                       verdict, bySend, utc, timeEntity, timeFormatParts, timeFormats, inline, replyKb,
                       removeKb, forceReplyKb, callback, demo, link, copy, tinted, iconed, iconedEmoji,
                       kbButton, richHtml, richMarkdown, richBlocks, unixNow) where

import Control.Monad (void)
import Control.Monad.IO.Class (liftIO)
import Control.Monad.Trans.Reader (asks)
import Data.Int (Int64)
import Data.Map.Strict (Map)
import Data.Map.Strict qualified as Map
import Data.Maybe (fromMaybe)
import Data.Text (Text)
import Data.Text qualified as Text
import Data.Time.Clock.POSIX (getPOSIXTime, posixSecondsToUTCTime)
import Data.Time.Format (defaultTimeLocale, formatTime)
import Telegram.Bot.Methods.EditMessageReplyMarkup qualified as EditMessageReplyMarkup
import Telegram.Bot.Methods.SendMessage qualified as SendMessage
import Telegram.Bot.Methods.SendMessageDraft qualified as SendMessageDraft
import Telegram.Bot.Types (ForceReply, InlineKeyboardButton, InputRichBlock, InputRichMessage,
                               KeyboardButton, Message, ReplyKeyboardMarkup, ReplyMarkup (..), Sticker (..),
                               StickerSet (..), mkCopyTextButton, mkInlineKeyboardButton,
                               mkInlineKeyboardMarkup, mkInputRichMessage, mkKeyboardButton,
                               mkReplyKeyboardRemove)
import Telegram.Bot.Types qualified as InlineButton (InlineKeyboardButton (..))
import Telegram.Bot.Types qualified as RichInput (InputRichMessage (..))
import Wizard.Bot (Bot, Env (..), echo, pause, quoted, tshow)
import Wizard.Call (Reply (..), actionTo, call, draftTo, messageTo, post, remember, retire, richDraftTo,
                    richTo, standing)
import Wizard.Types (ScenarioKey, Datum (Demo), Posted (..), Room (..), Slot (..), chatArg, numberOfMessage, slotWord,
                     writeDatum)

-- | One step: what the card says while it happens, and what happens, shown and fired at the same moment.
data Step = Step {says :: Text, fire :: Bot ()}

-- | One scenario: the key that identifies it, the label its menu button wears, and its ordered steps.
data Scenario = Scenario {key :: ScenarioKey, label :: Text, steps :: [Step]}

-- | A step, from its description and its action.
step :: Text -> Bot () -> Step
step description action = Step {says = description, fire = action}

-- | A scenario, positionally, so a group module reads as a table.
scenario :: ScenarioKey -> Text -> [Step] -> Scenario
scenario identity name plan = Scenario {key = identity, label = name, steps = plan}


-- | The plain draft's fixed id; the same id animates across calls, so a reused id replaces a stale draft.
draftPlainId :: Int64
draftPlainId = 101

-- | The rich draft's fixed id. See 'draftPlainId'.
draftRichId :: Int64
draftRichId = 102

-- | The toast a finished scenario answers its last press with.
doneToast :: Text
doneToast = "Scenario finished"

-- | What an unrendered entity says: a client that supports the entity replaces this alt text with the
-- formatted stamp, and one that does not shows it verbatim instead of a stamp mistakable for a render.
unrendered :: Text
unrendered = "not rendered by this client"

-- | The invite link the share exhibits use when no token was made: a deep link that @\/start@s this bot.
inviteLink :: Bot Text
inviteLink = inviteLinkFor "invite"

-- | An invite's deep link for one token, built from the bot's own name so none is hard-coded.
inviteLinkFor :: Text -> Bot Text
inviteLinkFor token = do
  name <- asks (.botName)
  pure ("https://t.me/" <> name <> "?start=" <> token)

-- | The words an invite travels with.
inviteText :: Text
inviteText = "I'd like to show you this bot:"

-- | The @request_users@ id whose answer is a message with a tappable link to the picked user.
shareLinkId :: Int64
shareLinkId = 21

-- | The batch pick whose answer reports which of the picked contacts the bot knows.
knownContactsId :: Int64
knownContactsId = 23

-- | Paint the @typing@ chat action once; a client shows it for a few seconds and then lets it fade.
typingOnce :: Bot ()
typingOnce = do
  room <- asks (.here)
  void (call (actionTo room "typing"))

-- | Three typing paints four seconds apart, so the header holds continuously instead of fading after one.
typingKeepalive :: Bot ()
typingKeepalive = sequence_ (replicate 3 (typingOnce >> pause 4))

-- | Paint the @record_voice@ chat action once.
recordVoice :: Bot ()
recordVoice = do
  room <- asks (.here)
  void (call (actionTo room "record_voice"))

-- | A plain draft under the fixed plain id; an empty text asks for the client's own localized placeholder.
draftPlain :: Text -> Bot ()
draftPlain body = do
  room <- asks (.here)
  void (call (draftTo room draftPlainId) {SendMessageDraft.text = Just body})

-- | A rich draft, spelled in HTML, under the fixed rich draft id.
draftRich :: Text -> Bot ()
draftRich html = do
  room <- asks (.here)
  void (call (richDraftTo room draftRichId (richHtml html)))

-- | Send one plain, unadorned text message into the current room.
tell :: Text -> Bot ()
tell body = do
  room <- asks (.here)
  void (post room.chat (messageTo room body))

-- | A plain message that takes a slot, so the next exhibit there retires it instead of stacking beside it.
tellInto :: Slot -> Text -> Bot ()
tellInto slot body = do
  retire slot
  room <- asks (.here)
  sent <- post room.chat (messageTo room body)
  remember slot sent

-- | One @sendRichMessage@ into the current room.
sendRich :: InputRichMessage -> Bot (Reply Message)
sendRich body = do
  room <- asks (.here)
  post room.chat (richTo room body)

-- | One @sendRichMessage@ into a slot, retiring what stood there.
richOut :: Slot -> InputRichMessage -> Bot (Reply Message)
richOut slot body = do
  retire slot
  sent <- sendRich body
  remember slot sent
  pure sent

-- | One markdown rich message into the rich showcase's one morphing bubble.
swapRich :: Text -> Bot ()
swapRich markdown = void (richOut Rich (richMarkdown markdown))

-- | A keyboard exhibit: the standing one retires and this takes the slot, so a scenario morphs one message.
keyboard :: Text -> ReplyMarkup -> Bot ()
keyboard body markup = void (keyboardIn Keyboard body markup)

-- | A keyboard exhibit in a named slot, handing the send back for the grid that acts on its own refusal.
keyboardIn :: Slot -> Text -> ReplyMarkup -> Bot (Reply Message)
keyboardIn slot body markup = do
  retire slot
  room <- asks (.here)
  sent <- post room.chat (messageTo room body) {SendMessage.reply_markup = Just markup}
  remember slot sent
  pure sent

-- | The receipt-strip pattern: @editMessageReplyMarkup@ with an empty inline keyboard over the exhibit.
strip :: Slot -> Bot ()
strip slot = do
  room <- asks (.here)
  standing slot >>= \case
    Nothing -> echo ("   !! strip: no remembered message under " <> quoted (slotWord slot) <> "; nothing stripped")
    Just posted -> do
      echo ("   strip target: " <> quoted (slotWord slot) <> " -> message_id " <> tshow posted.message)
      void $
        call
          EditMessageReplyMarkup.mkEditMessageReplyMarkup
            { EditMessageReplyMarkup.chat_id = Just (chatArg room.chat)
            , EditMessageReplyMarkup.message_id = Just (numberOfMessage posted.message)
            , EditMessageReplyMarkup.reply_markup = Just (mkInlineKeyboardMarkup [])
            }

-- | One standing verdict message per room; each new verdict replaces it, and the terminal keeps a copy.
verdict :: Text -> Bot ()
verdict finding = do
  echo ("   VERDICT " <> finding)
  retire Verdict
  room <- asks (.here)
  sent <- post room.chat (messageTo room finding)
  remember Verdict sent

-- | A send always answers with a message.
bySend :: Reply Message -> Reply (Either Text Message)
bySend = fmap Right

-- | The @%Y-%m-%d %H:%M:%S UTC@ stamp of a unix time, what a rendered date-time entity is checked against.
utc :: Int64 -> Text
utc unix =
  Text.pack (formatTime defaultTimeLocale "%Y-%m-%d %H:%M:%S UTC" (posixSecondsToUTCTime (fromIntegral unix)))

-- | One @tg:\/\/time@ entity in the rich markdown dialect, with 'unrendered' as its alt text.
timeEntity :: Int64 -> Text -> Text
timeEntity unix format =
  "![" <> unrendered <> "](tg://time?unix=" <> tshow unix <> "&format=" <> format <> ")"

-- | What each control character of the date-time entity's format grammar means, verbatim from the docs.
timeFormatParts :: Map Char Text
timeFormatParts =
  Map.fromList
    [ ('w', "weekday")
    , ('d', "short date (17.03.22)")
    , ('D', "long date (March 17, 2022)")
    , ('t', "short time (22:45)")
    , ('T', "long time (22:45:00)")
    ]

-- | The 17 non-empty fixed formats the grammar @r|w?[dD]?[tT]?@ admits, generated rather than listed. The
-- 18th, the empty format, is absent because the rich markdown dialect has no spelling for it.
timeFormats :: [Text]
timeFormats =
  [ weekday <> date <> time
  | weekday <- ["", "w"]
  , date <- ["", "d", "D"]
  , time <- ["", "t", "T"]
  , not (Text.null (weekday <> date <> time))
  ]

-- | An inline keyboard as the @reply_markup@ choice.
inline :: [[InlineKeyboardButton]] -> ReplyMarkup
inline = ReplyMarkupViaInlineKeyboardMarkup . mkInlineKeyboardMarkup

-- | A reply keyboard as the @reply_markup@ choice.
replyKb :: ReplyKeyboardMarkup -> ReplyMarkup
replyKb = ReplyMarkupViaReplyKeyboardMarkup

-- | The keyboard-removal choice: @remove_keyboard: true@ is a literal the encoder supplies, so no field.
removeKb :: ReplyMarkup
removeKb = ReplyMarkupViaReplyKeyboardRemove mkReplyKeyboardRemove

-- | A forced reply as the @reply_markup@ choice; its @force_reply: true@ is likewise a supplied literal.
forceReplyKb :: ForceReply -> ReplyMarkup
forceReplyKb = ReplyMarkupViaForceReply

-- | An inline button carrying one of the wizard's own callback data.
callback :: Text -> Datum -> InlineKeyboardButton
callback name datum =
  (mkInlineKeyboardButton name) {InlineButton.callback_data = Just (writeDatum datum)}

-- | A callback button under the inert @demo:@ prefix, which the dispatcher toasts and otherwise ignores.
demo :: Text -> Text -> InlineKeyboardButton
demo name payload = callback name (Demo payload)

-- | An inline button that opens a URL.
link :: Text -> Text -> InlineKeyboardButton
link name target = (mkInlineKeyboardButton name) {InlineButton.url = Just target}

-- | An inline button that puts a string on the clipboard.
copy :: Text -> Text -> InlineKeyboardButton
copy name payload =
  (mkInlineKeyboardButton name) {InlineButton.copy_text = Just (mkCopyTextButton payload)}

-- | Tint an inline button: @"danger"@, @"success"@, @"primary"@, or @"link"@.
tinted :: Text -> InlineKeyboardButton -> InlineKeyboardButton
tinted name button = button {InlineButton.style = Just name}

-- | Put a custom emoji in front of an inline button's label.
iconed :: Text -> InlineKeyboardButton -> InlineKeyboardButton
iconed identifier button = button {InlineButton.icon_custom_emoji_id = Just identifier}

-- | Every sticker of a fetched pack carrying a custom emoji id, paired with its emoji: the ids 'iconed' and
-- the @tg-emoji@ tag are minted from. A refused fetch folds in as the empty pack.
iconedEmoji :: Reply StickerSet -> [(Text, Text)]
iconedEmoji = \case
  Answered _ pack ->
    [ (identifier, fromMaybe "?" sticker.emoji)
    | sticker <- pack.stickers
    , Just identifier <- [sticker.custom_emoji_id]
    ]
  _ -> []

-- | A plain reply-keyboard button whose label is what it sends.
kbButton :: Text -> KeyboardButton
kbButton = mkKeyboardButton

-- | A rich message spelled in HTML.
richHtml :: Text -> InputRichMessage
richHtml body = mkInputRichMessage {RichInput.html = Just body}

-- | A rich message spelled in the rich markdown dialect.
richMarkdown :: Text -> InputRichMessage
richMarkdown body = mkInputRichMessage {RichInput.markdown = Just body}

-- | A rich message spelled as typed blocks, the form markdown cannot express.
richBlocks :: [InputRichBlock] -> InputRichMessage
richBlocks body = mkInputRichMessage {RichInput.blocks = Just body}

-- | The current unix time in whole seconds, which every date-time entity in this example is minted from.
unixNow :: Bot Int64
unixNow = liftIO (truncate <$> getPOSIXTime)
