{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE OverloadedStrings #-}

-- | Internal: one dependency component of the type graph.
--
-- This module is an implementation detail of the generated package. Its
-- declarations are re-exported by the aggregate types façade, which is
-- where consumers import them from. The module name is a deterministic
-- identifier taken from the component's smallest declaration name, not a
-- semantic family name, and it can change when the source graph changes.
--
-- Generated. Do not edit.
module Telegram.Bot.Internal.Group.InlineKeyboardButton
  ( InlineKeyboardButton (..)
  , mkInlineKeyboardButton
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.CallbackGame (CallbackGame)
import Telegram.Bot.Internal.Group.CopyTextButton (CopyTextButton)
import Telegram.Bot.Internal.Group.DisabledButton (DisabledButton)
import Telegram.Bot.Internal.Group.LoginUrl (LoginUrl)
import Telegram.Bot.Internal.Group.SwitchInlineQueryChosenChat (SwitchInlineQueryChosenChat)
import Telegram.Bot.Internal.Group.WebAppInfo (WebAppInfo)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, requiredWith)

-- | This object represents one button of an inline keyboard. Exactly one of the fields other than text, icon_custom_emoji_id, and style must be used to specify the type of the button.
--
-- Source: <https://core.telegram.org/bots/api#inlinekeyboardbutton>.
-- Codec directions: decoded from responses, encoded into requests.
data InlineKeyboardButton = MkInlineKeyboardButton
  { -- | Label text on the button
    --
    -- Wire key: @text@.
    text :: Text
  , -- | Optional. Unique identifier of the custom emoji shown before the text of the button. Can only be used by bots that purchased additional usernames on Fragment or in the messages directly sent by the bot to private, group and supergroup chats if the owner of the bot has a Telegram Premium subscription.
    --
    -- Wire key: @icon_custom_emoji_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    icon_custom_emoji_id :: Maybe Text
  , -- | Optional. Style of the button. Must be one of \"danger\" (red), \"success\" (green) or \"primary\" (blue). If omitted, then an app-specific style is used.
    --
    -- Wire key: @style@.
    -- Omitted from an encoded request when it is @Nothing@.
    style :: Maybe Text
  , -- | Optional. HTTP or tg:\/\/ URL to be opened when the button is pressed. Links tg:\/\/user?id=\<user_id\> can be used to mention a user by their identifier without using a username, if this is allowed by their privacy settings.
    --
    -- Wire key: @url@.
    -- Omitted from an encoded request when it is @Nothing@.
    url :: Maybe Text
  , -- | Optional. Data to be sent in a callback query to the bot when the button is pressed, 1-64 bytes
    --
    -- Wire key: @callback_data@.
    -- Omitted from an encoded request when it is @Nothing@.
    callback_data :: Maybe Text
  , -- | Optional. Description of the Web App that will be launched when the user presses the button. The Web App will be able to send an arbitrary message on behalf of the user using the method answerWebAppQuery. Available only in private chats between a user and the bot. Not supported for messages sent on behalf of a business account.
    --
    -- Wire key: @web_app@.
    -- Omitted from an encoded request when it is @Nothing@.
    web_app :: Maybe WebAppInfo
  , -- | Optional. An HTTPS URL used to automatically authorize the user. Can be used as a replacement for the Telegram Login Widget. Not supported for ephemeral messages.
    --
    -- Wire key: @login_url@.
    -- Omitted from an encoded request when it is @Nothing@.
    login_url :: Maybe LoginUrl
  , -- | Optional. If set, pressing the button will prompt the user to select one of their chats, open that chat and insert the bot\'s username and the specified inline query in the input field. May be empty, in which case just the bot\'s username will be inserted. Not supported for messages sent in channel direct messages chats and on behalf of a business account.
    --
    -- Wire key: @switch_inline_query@.
    -- Omitted from an encoded request when it is @Nothing@.
    switch_inline_query :: Maybe Text
  , -- | Optional. If set, pressing the button will insert the bot\'s username and the specified inline query in the current chat\'s input field. May be empty, in which case only the bot\'s username will be inserted. This offers a quick way for the user to open your bot in inline mode in the same chat - good for selecting something from multiple options. Not supported in channels and for messages sent in channel direct messages chats and on behalf of a business account.
    --
    -- Wire key: @switch_inline_query_current_chat@.
    -- Omitted from an encoded request when it is @Nothing@.
    switch_inline_query_current_chat :: Maybe Text
  , -- | Optional. If set, pressing the button will prompt the user to select one of their chats of the specified type, open that chat and insert the bot\'s username and the specified inline query in the input field. Not supported for messages sent in channel direct messages chats and on behalf of a business account.
    --
    -- Wire key: @switch_inline_query_chosen_chat@.
    -- Omitted from an encoded request when it is @Nothing@.
    switch_inline_query_chosen_chat :: Maybe SwitchInlineQueryChosenChat
  , -- | Optional. Description of the button that copies the specified text to the clipboard
    --
    -- Wire key: @copy_text@.
    -- Omitted from an encoded request when it is @Nothing@.
    copy_text :: Maybe CopyTextButton
  , -- | Optional. Description of the game that will be launched when the user presses the button. NOTE: This type of button must always be the first button in the first row.
    --
    -- Wire key: @callback_game@.
    -- Omitted from an encoded request when it is @Nothing@.
    callback_game :: Maybe CallbackGame
  , -- | Optional. Specify True, to send a Pay button. Substrings \"⭐\" and \"XTR\" in the buttons\'s text will be replaced with a Telegram Star icon. NOTE: This type of button must always be the first button in the first row and can only be used in invoice messages.
    --
    -- Wire key: @pay@.
    -- Omitted from an encoded request when it is @Nothing@.
    pay :: Maybe Bool
  , -- | Optional. If set, then the button is disabled and does nothing
    --
    -- Wire key: @disabled@.
    -- Omitted from an encoded request when it is @Nothing@.
    disabled :: Maybe DisabledButton
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InlineKeyboardButton' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInlineKeyboardButton :: Text -> InlineKeyboardButton
mkInlineKeyboardButton arg0 =
  MkInlineKeyboardButton
    { text = arg0
    , icon_custom_emoji_id = Nothing
    , style = Nothing
    , url = Nothing
    , callback_data = Nothing
    , web_app = Nothing
    , login_url = Nothing
    , switch_inline_query = Nothing
    , switch_inline_query_current_chat = Nothing
    , switch_inline_query_chosen_chat = Nothing
    , copy_text = Nothing
    , callback_game = Nothing
    , pay = Nothing
    , disabled = Nothing
    }

instance FromJSON InlineKeyboardButton where
  parseJSON = withObject "InlineKeyboardButton" $ \obj ->
    do
      field_0 <- requiredWith obj "text" parseJSON
      field_1 <- optionalWith obj "icon_custom_emoji_id" parseJSON
      field_2 <- optionalWith obj "style" parseJSON
      field_3 <- optionalWith obj "url" parseJSON
      field_4 <- optionalWith obj "callback_data" parseJSON
      field_5 <- optionalWith obj "web_app" parseJSON
      field_6 <- optionalWith obj "login_url" parseJSON
      field_7 <- optionalWith obj "switch_inline_query" parseJSON
      field_8 <- optionalWith obj "switch_inline_query_current_chat" parseJSON
      field_9 <- optionalWith obj "switch_inline_query_chosen_chat" parseJSON
      field_10 <- optionalWith obj "copy_text" parseJSON
      field_11 <- optionalWith obj "callback_game" parseJSON
      field_12 <- optionalWith obj "pay" parseJSON
      field_13 <- optionalWith obj "disabled" parseJSON
      pure
        MkInlineKeyboardButton
          { text = field_0
          , icon_custom_emoji_id = field_1
          , style = field_2
          , url = field_3
          , callback_data = field_4
          , web_app = field_5
          , login_url = field_6
          , switch_inline_query = field_7
          , switch_inline_query_current_chat = field_8
          , switch_inline_query_chosen_chat = field_9
          , copy_text = field_10
          , callback_game = field_11
          , pay = field_12
          , disabled = field_13
          }

instance ToJSON InlineKeyboardButton where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "text" x.text
          , jsonOptional "icon_custom_emoji_id" x.icon_custom_emoji_id
          , jsonOptional "style" x.style
          , jsonOptional "url" x.url
          , jsonOptional "callback_data" x.callback_data
          , jsonOptional "web_app" x.web_app
          , jsonOptional "login_url" x.login_url
          , jsonOptional "switch_inline_query" x.switch_inline_query
          , jsonOptional "switch_inline_query_current_chat" x.switch_inline_query_current_chat
          , jsonOptional "switch_inline_query_chosen_chat" x.switch_inline_query_chosen_chat
          , jsonOptional "copy_text" x.copy_text
          , jsonOptional "callback_game" x.callback_game
          , jsonOptional "pay" x.pay
          , jsonOptional "disabled" x.disabled
          ]
      )
  toEncoding = toEncoding . toJSON
