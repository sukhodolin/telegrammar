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
module Telegram.Bot.Internal.Group.KeyboardButtonRequestChat
  ( KeyboardButtonRequestChat (..)
  , mkKeyboardButtonRequestChat
  ) where

import Data.Aeson (ToJSON (..))
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.ChatAdministratorRights (ChatAdministratorRights)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional)

-- | This object defines the criteria used to request a suitable chat. Information about the selected chat will be shared with the bot when the corresponding button is pressed. The bot will be granted requested rights in the chat if appropriate. More about requesting chats: https:\/\/core.telegram.org\/bots\/features\#chat-and-user-selection.
--
-- Source: <https://core.telegram.org/bots/api#keyboardbuttonrequestchat>.
-- Codec directions: encoded into requests.
data KeyboardButtonRequestChat = MkKeyboardButtonRequestChat
  { -- | Signed 32-bit identifier of the request, which will be received back in the ChatShared object. Must be unique within the message.
    --
    -- Wire key: @request_id@.
    request_id :: Int64
  , -- | Pass True to request a channel chat, pass False to request a group or a supergroup chat
    --
    -- Wire key: @chat_is_channel@.
    chat_is_channel :: Bool
  , -- | Optional. Pass True to request a forum supergroup, pass False to request a non-forum chat. If not specified, no additional restrictions are applied.
    --
    -- Wire key: @chat_is_forum@.
    -- Omitted from an encoded request when it is @Nothing@.
    chat_is_forum :: Maybe Bool
  , -- | Optional. Pass True to request a supergroup or a channel with a username, pass False to request a chat without a username. If not specified, no additional restrictions are applied.
    --
    -- Wire key: @chat_has_username@.
    -- Omitted from an encoded request when it is @Nothing@.
    chat_has_username :: Maybe Bool
  , -- | Optional. Pass True to request a chat owned by the user. Otherwise, no additional restrictions are applied.
    --
    -- Wire key: @chat_is_created@.
    -- Omitted from an encoded request when it is @Nothing@.
    chat_is_created :: Maybe Bool
  , -- | Optional. A JSON-serialized object listing the required administrator rights of the user in the chat. The rights must be a superset of bot_administrator_rights. If not specified, no additional restrictions are applied.
    --
    -- Wire key: @user_administrator_rights@.
    -- Omitted from an encoded request when it is @Nothing@.
    user_administrator_rights :: Maybe ChatAdministratorRights
  , -- | Optional. A JSON-serialized object listing the required administrator rights of the bot in the chat. The rights must be a subset of user_administrator_rights. If not specified, no additional restrictions are applied.
    --
    -- Wire key: @bot_administrator_rights@.
    -- Omitted from an encoded request when it is @Nothing@.
    bot_administrator_rights :: Maybe ChatAdministratorRights
  , -- | Optional. Pass True to request a chat with the bot as a member. Otherwise, no additional restrictions are applied.
    --
    -- Wire key: @bot_is_member@.
    -- Omitted from an encoded request when it is @Nothing@.
    bot_is_member :: Maybe Bool
  , -- | Optional. Pass True to request the chat\'s title
    --
    -- Wire key: @request_title@.
    -- Omitted from an encoded request when it is @Nothing@.
    request_title :: Maybe Bool
  , -- | Optional. Pass True to request the chat\'s username
    --
    -- Wire key: @request_username@.
    -- Omitted from an encoded request when it is @Nothing@.
    request_username :: Maybe Bool
  , -- | Optional. Pass True to request the chat\'s photo
    --
    -- Wire key: @request_photo@.
    -- Omitted from an encoded request when it is @Nothing@.
    request_photo :: Maybe Bool
  }
  deriving stock (Eq, Show)

-- | Initialize a 'KeyboardButtonRequestChat' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkKeyboardButtonRequestChat :: Int64 -> Bool -> KeyboardButtonRequestChat
mkKeyboardButtonRequestChat arg0 arg1 =
  MkKeyboardButtonRequestChat
    { request_id = arg0
    , chat_is_channel = arg1
    , chat_is_forum = Nothing
    , chat_has_username = Nothing
    , chat_is_created = Nothing
    , user_administrator_rights = Nothing
    , bot_administrator_rights = Nothing
    , bot_is_member = Nothing
    , request_title = Nothing
    , request_username = Nothing
    , request_photo = Nothing
    }

instance ToJSON KeyboardButtonRequestChat where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "request_id" x.request_id
          , jsonField "chat_is_channel" x.chat_is_channel
          , jsonOptional "chat_is_forum" x.chat_is_forum
          , jsonOptional "chat_has_username" x.chat_has_username
          , jsonOptional "chat_is_created" x.chat_is_created
          , jsonOptional "user_administrator_rights" x.user_administrator_rights
          , jsonOptional "bot_administrator_rights" x.bot_administrator_rights
          , jsonOptional "bot_is_member" x.bot_is_member
          , jsonOptional "request_title" x.request_title
          , jsonOptional "request_username" x.request_username
          , jsonOptional "request_photo" x.request_photo
          ]
      )
  toEncoding = toEncoding . toJSON
