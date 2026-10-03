{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE OverloadedStrings #-}

-- | Every keyboard surface: reply keyboards, inline button styles, the contact and location requests, forced
-- replies, the two pickers, label formatting, the share exhibits, and the iconed button grid. Every exhibit
-- takes the keyboard slot, so a step morphs the standing keyboard instead of stacking one more on the pile.
module Wizard.Scenarios.Keyboards (reply, styles, request, force, pick, formatting, share, knownContacts,
                                   shareLink, icons) where

import Control.Monad (unless, void)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Methods.GetStickerSet qualified as GetStickerSet
import Telegram.Bot.Types (InlineKeyboardButton, KeyboardButton, KeyboardButtonRequestChat,
                               KeyboardButtonRequestUsers, ReplyKeyboardMarkup, SwitchInlineQueryChosenChat,
                               mkForceReply, mkInlineKeyboardButton, mkKeyboardButtonRequestChat,
                               mkKeyboardButtonRequestUsers, mkReplyKeyboardMarkup, mkSwitchInlineQueryChosenChat)
import Telegram.Bot.Types qualified as ChosenChat (SwitchInlineQueryChosenChat (..))
import Telegram.Bot.Types qualified as ForceReply (ForceReply (..))
import Telegram.Bot.Types qualified as InlineButton (InlineKeyboardButton (..))
import Telegram.Bot.Types qualified as KbButton (KeyboardButton (..))
import Telegram.Bot.Types qualified as ReplyKeyboard (ReplyKeyboardMarkup (..))
import Telegram.Bot.Types qualified as RequestChat (KeyboardButtonRequestChat (..))
import Telegram.Bot.Types qualified as RequestUsers (KeyboardButtonRequestUsers (..))
import Wizard.Bot (Bot, tshow)
import Wizard.Call (accepted, call, retire)
import Wizard.Exhibit (Scenario, scenario, step, copy, demo, forceReplyKb, iconed, iconedEmoji, inline, inviteLinkFor,
                       inviteText, kbButton, keyboard, keyboardIn, knownContactsId, link, removeKb, replyKb,
                       shareLinkId, strip, tell, tinted, unixNow)
import Wizard.Types (ScenarioKey (..), Slot (..))

-- | The @kb_reply@ menu entry.
reply :: Scenario
reply =
  scenario
    KbReply
    "Reply keyboard"
    [ step
        "ReplyKeyboardMarkup (resize + placeholder): buttons replace the system keyboard. Press one: its text arrives as your message."
        ( keyboard "Pick an answer with a button below:" . replyKb $
            (fitted [[kbButton "Yes", kbButton "No", kbButton "Later"]])
              {ReplyKeyboard.input_field_placeholder = Just "Or type your own"}
        )
    , step
        "one_time_keyboard: the same keyboard, but it should hide after the FIRST press."
        ( keyboard "A one-time keyboard:" . replyKb $
            (fitted [[kbButton "Confirm", kbButton "Cancel"]])
              {ReplyKeyboard.one_time_keyboard = Just True}
        )
    , step
        "ReplyKeyboardRemove: the keyboard goes away entirely, the system one returns. (Known iOS trap: applied lazily while the panel is open.)"
        (keyboard "Removing the keyboard." removeKb)
    ]

-- | The @kb_styles@ menu entry.
styles :: Scenario
styles =
  scenario
    KbStyles
    "Inline button styles"
    [ step
        "Three inline buttons with 9.4 styles: success (green), danger (red), primary (blue). Presses answer with a toast."
        ( keyboard "Styled buttons:" . inline $
            [ [ tinted "success" (demo "Confirm" "Confirm")
              , tinted "danger" (demo "Decline" "Decline")
              , tinted "primary" (demo "Later" "Later")
              ]
            ]
        )
    , step
        "A copy_text button (puts a string on the clipboard) next to a url button."
        ( keyboard "Copy the code or open the link:" . inline $
            [[copy "Copy code" "CODE-1234", link "example.com" "https://example.com"]]
        )
    , step
        "editMessageReplyMarkup: the standing exhibit's keyboard is being stripped, the receipt-strip pattern."
        (strip Keyboard)
    ]

-- | The @kb_request@ menu entry.
request :: Scenario
request =
  scenario
    KbRequest
    "Contact & location request"
    [ step
        "Reply buttons request_contact and request_location: a press sends your contact/point as your message (the wizard logs it)."
        ( keyboard "Share your contact or location:" . replyKb . fitted $
            [[contactButton "Share contact", locationButton "Share location"]]
        )
    , step
        "Removing the reply keyboard."
        (keyboard "Done, removing the buttons." removeKb)
    ]

-- | The @kb_force@ menu entry.
force :: Scenario
force =
  scenario
    KbForce
    "ForceReply"
    [ step
        "ForceReply with a placeholder: the client opens reply-to-this-message mode by itself."
        ( keyboard "When works for you on Saturday?" . forceReplyKb $
            mkForceReply {ForceReply.input_field_placeholder = Just "e.g. after lunch"}
        )
    ]

-- | The @kb_pick@ menu entry.
pick :: Scenario
pick =
  scenario
    KbPick
    "User & chat picker"
    [ step
        "request_users, single: the button opens the native contact picker (with search). What the bot receives is echoed into the chat."
        ( keyboard "Pick one person:" . replyKb $
            onePicker "Pick a person" (withNames 1) {RequestUsers.max_quantity = Just 1}
        )
    , step
        "A multi-picker (up to 5) next to a bots-only picker."
        ( keyboard "Pick several people, or a bot:" . replyKb . fitted $
            [ [ usersPicker
                  "Up to 5 people"
                  (withNames 2) {RequestUsers.max_quantity = Just 5, RequestUsers.request_photo = Just True}
              , usersPicker
                  "Pick a bot"
                  (mkKeyboardButtonRequestUsers 3) {RequestUsers.user_is_bot = Just True}
              ]
            ]
        )
    , step
        "request_chat, the sibling: a picker for a group (not a channel)."
        ( keyboard "Pick a group:" . replyKb . fitted $
            [ [ chatPicker
                  "Pick a chat"
                  (mkKeyboardButtonRequestChat 10 False)
                    {RequestChat.request_title = Just True, RequestChat.request_username = Just True}
              ]
            ]
        )
    , step
        "Removing the keyboard."
        (keyboard "Done, removing the buttons." removeKb)
    ]

-- | The @kb_fmt@ menu entry.
formatting :: Scenario
formatting =
  scenario
    KbFmt
    "Button formatting"
    [ step
        "Reply buttons: emoji in labels, \\n in a label (two-line?), an over-long label (how does it truncate?)."
        ( keyboard "Reply formatting:" . replyKb . fitted $
            [ [kbButton "✅ Yes", kbButton "❌ No", kbButton "📅 On Saturday"]
            , [kbButton "First line\nSecond line"]
            , [kbButton "A very long button label that clearly will not fit in full"]
            ]
        )
    , step
        "The same on inline buttons, plus style combined with emoji."
        ( keyboard "Inline formatting:" . inline $
            [ [tinted "success" (demo "✅ Confirm" "ok"), tinted "danger" (demo "❌ Decline" "no")]
            , [demo "First line\nSecond line" "two lines"]
            , [demo "A very long inline button label, checking truncation" "long"]
            ]
        )
    , step
        "icon_custom_emoji_id: the wizard fetched ids from the AIActions pack (getStickerSet) and just sent iconed buttons; any API verdict lands in the chat."
        iconedButtons
    , step
        "Removing the reply keyboard."
        (keyboard "Done, removing the buttons." removeKb)
    ]

-- | The @share@ menu entry.
share :: Scenario
share =
  scenario
    Share
    "Share the bot (inline mode)"
    [ step
        "One message, two ways to pass on an invite to this bot. 'Invite via Telegram' opens the chat chooser (switch_inline_query_chosen_chat) and then inline mode in the chat you pick, where the bot offers the invite as a result to send. 'Copy the invite' is a copy_text button carrying the same text. The link is a deep link that /starts this bot with a token."
        opener
    ]

-- | The @known_contacts@ menu entry.
knownContacts :: Scenario
knownContacts =
  scenario
    KnownContacts
    "Pick contacts: does the bot know them?"
    [ step
        "Pick up to 10 contacts; the wizard reports what users_shared carried for each one and whether the bot knows them, by a real check: getChat succeeds only for users the bot has met."
        ( keyboard "Pick the contacts to check:" . replyKb $
            (onePicker "Pick contacts" (withNames knownContactsId) {RequestUsers.max_quantity = Just 10})
              { ReplyKeyboard.is_persistent = Just True
              , ReplyKeyboard.input_field_placeholder = Just "Tap the button below"
              }
        )
    ]

-- | The @share_link@ menu entry.
shareLink :: Scenario
shareLink =
  scenario
    ShareLink
    "Pick a user → message with their link"
    [ step
        "Pick a person; the wizard answers with a RICH message where they appear as a tappable link (tg://user mention, plus t.me/username when they have one), with an invite text on a copy button: copy, tap the name, paste."
        ( keyboard "Pick who to send an invite to:" . replyKb $
            (onePicker "Pick a person" (withNames shareLinkId) {RequestUsers.max_quantity = Just 1})
              {ReplyKeyboard.one_time_keyboard = Just True}
        )
    ]

-- | The @kb_icons@ menu entry.
icons :: Scenario
icons =
  scenario
    KbIcons
    "All AIActions icons"
    [ step
        "A grid: one numbered button per pack emoji. A tap toasts 'number = emoji'."
        iconGrid
    ]

-- | The message that opens the share workflow: a chat-chooser button (@switch_inline_query_chosen_chat@) and
-- a copy button carrying the same invite. The chooser never tells the bot which chat was picked, so who
-- received the invite shows only when someone opens the tokened link.
opener :: Bot ()
opener = do
  now <- unixNow
  let token = "open" <> tshow (now `mod` 100000)
      chooser =
        mkSwitchInlineQueryChosenChat
          { ChosenChat.query = Just ("invite " <> token)
          , ChosenChat.allow_user_chats = Just True
          , ChosenChat.allow_group_chats = Just False
          , ChosenChat.allow_channel_chats = Just False
          }
  deep <- inviteLinkFor token
  keyboard ("Invite someone to this bot (token " <> token <> "):") . inline $
    [[chooseChat "Invite via Telegram" chooser], [copy "Copy the invite" (inviteText <> " " <> deep)]]

-- | Fetch real @custom_emoji_id@s from Telegram's own AIActions pack and try them as button icons.
iconedButtons :: Bot ()
iconedButtons = do
  fetched <- call (GetStickerSet.mkGetStickerSet "AIActions")
  case map fst (iconedEmoji fetched) of
    [] -> tell "Could not fetch custom_emoji_ids from AIActions; icons untestable."
    identifiers@(firstId : _) ->
      keyboard ("Buttons with icon_custom_emoji_id (AIActions pack, " <> howMany identifiers <> " emoji):") $
        inline
          [ [ iconed firstId (demo "With icon" "icon")
            , tinted "primary" (iconed (last identifiers) (demo "Icon + style" "icon+style"))
            ]
          ]

-- | One iconed button per AIActions emoji, numbered, six to a row. A grid this large can be refused whole, so
-- a refusal falls back to two half-grids, each standing in its own slot and both retired by the next run.
iconGrid :: Bot ()
iconGrid = do
  fetched <- call (GetStickerSet.mkGetStickerSet "AIActions")
  case iconedEmoji fetched of
    [] -> tell "Could not fetch the AIActions pack; no grid."
    stickers -> do
      let buttons =
            [ iconed identifier (demo (tshow n) (tshow n <> " = " <> face))
            | (n, (identifier, face)) <- zip [1 :: Int ..] stickers
            ]
          half = length buttons `div` 2
      -- The second half's slot is released before the send (the first releases with the send), so a grid that
      -- fits this time does not leave half of a previous fallback standing beside it.
      retire KeyboardSecond
      sent <-
        keyboardIn
          Keyboard
          ("All AIActions icons (" <> howMany buttons <> " total, numbered in pack order):")
          (inline (rowsOfSix buttons))
      unless (accepted sent) $ do
        void (keyboardIn Keyboard "AIActions, first half:" (inline (rowsOfSix (take half buttons))))
        void (keyboardIn KeyboardSecond "AIActions, second half:" (inline (rowsOfSix (drop half buttons))))

-- | The rows of the grid, which is six buttons wide.
rowsOfSix :: [InlineKeyboardButton] -> [[InlineKeyboardButton]]
rowsOfSix [] = []
rowsOfSix buttons = take 6 buttons : rowsOfSix (drop 6 buttons)

-- | The reply keyboard every scenario here starts from: rows the client resizes to fit.
fitted :: [[KeyboardButton]] -> ReplyKeyboardMarkup
fitted rows = (mkReplyKeyboardMarkup rows) {ReplyKeyboard.resize_keyboard = Just True}

-- | A picker request asking for the name and username of whoever is chosen, under the @request_id@ the
-- wizard's @users_shared@ answer dispatches on.
withNames :: Int64 -> KeyboardButtonRequestUsers
withNames identifier =
  (mkKeyboardButtonRequestUsers identifier)
    {RequestUsers.request_name = Just True, RequestUsers.request_username = Just True}

-- | A reply button that opens the native user picker.
usersPicker :: Text -> KeyboardButtonRequestUsers -> KeyboardButton
usersPicker name asked = (kbButton name) {KbButton.request_users = Just asked}

-- | The one-button reply keyboard the three picker exhibits stand on.
onePicker :: Text -> KeyboardButtonRequestUsers -> ReplyKeyboardMarkup
onePicker name asked = fitted [[usersPicker name asked]]

-- | A reply button that opens the native chat picker.
chatPicker :: Text -> KeyboardButtonRequestChat -> KeyboardButton
chatPicker name asked = (kbButton name) {KbButton.request_chat = Just asked}

-- | A reply button that sends the presser's phone number as a contact.
contactButton :: Text -> KeyboardButton
contactButton name = (kbButton name) {KbButton.request_contact = Just True}

-- | A reply button that sends the presser's current location.
locationButton :: Text -> KeyboardButton
locationButton name = (kbButton name) {KbButton.request_location = Just True}

-- | An inline button that opens the chat chooser in inline mode.
chooseChat :: Text -> SwitchInlineQueryChosenChat -> InlineKeyboardButton
chooseChat name chooser =
  (mkInlineKeyboardButton name) {InlineButton.switch_inline_query_chosen_chat = Just chooser}

-- | How many of something, for a header line.
howMany :: [a] -> Text
howMany = tshow . length
