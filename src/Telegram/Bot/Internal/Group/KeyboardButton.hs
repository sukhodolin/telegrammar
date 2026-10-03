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
module Telegram.Bot.Internal.Group.KeyboardButton
  ( KeyboardButton (..)
  , mkKeyboardButton
  ) where

import Data.Aeson (ToJSON (..))
import Data.Text (Text)
import Telegram.Bot.Internal.Group.KeyboardButtonPollType (KeyboardButtonPollType)
import Telegram.Bot.Internal.Group.KeyboardButtonRequestChat (KeyboardButtonRequestChat)
import Telegram.Bot.Internal.Group.KeyboardButtonRequestManagedBot (KeyboardButtonRequestManagedBot)
import Telegram.Bot.Internal.Group.KeyboardButtonRequestUsers (KeyboardButtonRequestUsers)
import Telegram.Bot.Internal.Group.WebAppInfo (WebAppInfo)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional)

-- | This object represents one button of the reply keyboard. At most one of the fields other than text, icon_custom_emoji_id, and style must be used to specify the type of the button. For simple text buttons, String can be used instead of this object to specify the button text.
--
-- Source: <https://core.telegram.org/bots/api#keyboardbutton>.
-- Codec directions: encoded into requests.
data KeyboardButton = MkKeyboardButton
  { -- | Text of the button. If none of the fields other than text, icon_custom_emoji_id, and style are used, it will be sent as a message when the button is pressed.
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
  , -- | Optional. If specified, pressing the button will open a list of suitable users. Identifiers of selected users will be sent to the bot in a \"users_shared\" service message. Available in private chats only.
    --
    -- Wire key: @request_users@.
    -- Omitted from an encoded request when it is @Nothing@.
    request_users :: Maybe KeyboardButtonRequestUsers
  , -- | Optional. If specified, pressing the button will open a list of suitable chats. Tapping on a chat will send its identifier to the bot in a \"chat_shared\" service message. Available in private chats only.
    --
    -- Wire key: @request_chat@.
    -- Omitted from an encoded request when it is @Nothing@.
    request_chat :: Maybe KeyboardButtonRequestChat
  , -- | Optional. If specified, pressing the button will ask the user to create and share a bot that will be managed by the current bot. Available for bots that enabled management of other bots in the \@BotFather Mini App. Available in private chats only.
    --
    -- Wire key: @request_managed_bot@.
    -- Omitted from an encoded request when it is @Nothing@.
    request_managed_bot :: Maybe KeyboardButtonRequestManagedBot
  , -- | Optional. If True, the user\'s phone number will be sent as a contact when the button is pressed. Available in private chats only.
    --
    -- Wire key: @request_contact@.
    -- Omitted from an encoded request when it is @Nothing@.
    request_contact :: Maybe Bool
  , -- | Optional. If True, the user\'s current location will be sent when the button is pressed. Available in private chats only.
    --
    -- Wire key: @request_location@.
    -- Omitted from an encoded request when it is @Nothing@.
    request_location :: Maybe Bool
  , -- | Optional. If specified, the user will be asked to create a poll and send it to the bot when the button is pressed. Available in private chats only.
    --
    -- Wire key: @request_poll@.
    -- Omitted from an encoded request when it is @Nothing@.
    request_poll :: Maybe KeyboardButtonPollType
  , -- | Optional. If specified, the described Web App will be launched when the button is pressed. The Web App will be able to send a \"web_app_data\" service message. Available in private chats only.
    --
    -- Wire key: @web_app@.
    -- Omitted from an encoded request when it is @Nothing@.
    web_app :: Maybe WebAppInfo
  }
  deriving stock (Eq, Show)

-- | Initialize a 'KeyboardButton' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkKeyboardButton :: Text -> KeyboardButton
mkKeyboardButton arg0 =
  MkKeyboardButton
    { text = arg0
    , icon_custom_emoji_id = Nothing
    , style = Nothing
    , request_users = Nothing
    , request_chat = Nothing
    , request_managed_bot = Nothing
    , request_contact = Nothing
    , request_location = Nothing
    , request_poll = Nothing
    , web_app = Nothing
    }

instance ToJSON KeyboardButton where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "text" x.text
          , jsonOptional "icon_custom_emoji_id" x.icon_custom_emoji_id
          , jsonOptional "style" x.style
          , jsonOptional "request_users" x.request_users
          , jsonOptional "request_chat" x.request_chat
          , jsonOptional "request_managed_bot" x.request_managed_bot
          , jsonOptional "request_contact" x.request_contact
          , jsonOptional "request_location" x.request_location
          , jsonOptional "request_poll" x.request_poll
          , jsonOptional "web_app" x.web_app
          ]
      )
  toEncoding = toEncoding . toJSON
