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
module Telegram.Bot.Internal.Group.ReplyKeyboardMarkup
  ( ReplyKeyboardMarkup (..)
  , mkReplyKeyboardMarkup
  ) where

import Data.Aeson (ToJSON (..))
import Data.Text (Text)
import Telegram.Bot.Internal.Group.KeyboardButton (KeyboardButton)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional)

-- | This object represents a custom keyboard with reply options (see Introduction to bots for details and examples). Not supported in channels and for messages sent on behalf of a business account.
--
-- Source: <https://core.telegram.org/bots/api#replykeyboardmarkup>.
-- Codec directions: encoded into requests.
data ReplyKeyboardMarkup = MkReplyKeyboardMarkup
  { -- | Array of button rows, each represented by an Array of KeyboardButton objects
    --
    -- Wire key: @keyboard@.
    keyboard :: [[KeyboardButton]]
  , -- | Optional. Requests clients to always show the keyboard when the regular keyboard is hidden. Defaults to False, in which case the custom keyboard can be hidden and opened with a keyboard icon.
    --
    -- Wire key: @is_persistent@.
    -- Omitted from an encoded request when it is @Nothing@.
    is_persistent :: Maybe Bool
  , -- | Optional. Requests clients to resize the keyboard vertically for optimal fit (e.g., make the keyboard smaller if there are just two rows of buttons). Defaults to False, in which case the custom keyboard is always of the same height as the app\'s standard keyboard.
    --
    -- Wire key: @resize_keyboard@.
    -- Omitted from an encoded request when it is @Nothing@.
    resize_keyboard :: Maybe Bool
  , -- | Optional. Requests clients to hide the keyboard as soon as it\'s been used. The keyboard will still be available, but clients will automatically display the usual letter-keyboard in the chat - the user can press a special button in the input field to see the custom keyboard again. Defaults to False.
    --
    -- Wire key: @one_time_keyboard@.
    -- Omitted from an encoded request when it is @Nothing@.
    one_time_keyboard :: Maybe Bool
  , -- | Optional. The placeholder to be shown in the input field when the keyboard is active; 1-64 characters
    --
    -- Wire key: @input_field_placeholder@.
    -- Omitted from an encoded request when it is @Nothing@.
    input_field_placeholder :: Maybe Text
  , -- | Optional. Use this parameter if you want to show the keyboard to specific users only. Targets: 1) users that are \@mentioned in the text of the Message object; 2) if the bot\'s message is a reply to a message in the same chat and forum topic, sender of the original message. Example: A user requests to change the bot\'s language, bot replies to the request with a keyboard to select the new language. Other users in the group don\'t see the keyboard.
    --
    -- Wire key: @selective@.
    -- Omitted from an encoded request when it is @Nothing@.
    selective :: Maybe Bool
  , -- | Optional. Pass True if the reply interface must be shown to the user, as if they had manually selected the bot\'s message and tapped \'Reply\'
    --
    -- Wire key: @force_reply@.
    -- Omitted from an encoded request when it is @Nothing@.
    force_reply :: Maybe Bool
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ReplyKeyboardMarkup' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkReplyKeyboardMarkup :: [[KeyboardButton]] -> ReplyKeyboardMarkup
mkReplyKeyboardMarkup arg0 =
  MkReplyKeyboardMarkup
    { keyboard = arg0
    , is_persistent = Nothing
    , resize_keyboard = Nothing
    , one_time_keyboard = Nothing
    , input_field_placeholder = Nothing
    , selective = Nothing
    , force_reply = Nothing
    }

instance ToJSON ReplyKeyboardMarkup where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "keyboard" x.keyboard
          , jsonOptional "is_persistent" x.is_persistent
          , jsonOptional "resize_keyboard" x.resize_keyboard
          , jsonOptional "one_time_keyboard" x.one_time_keyboard
          , jsonOptional "input_field_placeholder" x.input_field_placeholder
          , jsonOptional "selective" x.selective
          , jsonOptional "force_reply" x.force_reply
          ]
      )
  toEncoding = toEncoding . toJSON
