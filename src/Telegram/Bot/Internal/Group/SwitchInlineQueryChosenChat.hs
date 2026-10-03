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
module Telegram.Bot.Internal.Group.SwitchInlineQueryChosenChat
  ( SwitchInlineQueryChosenChat (..)
  , mkSwitchInlineQueryChosenChat
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Support (jsonObject, jsonOptional, optionalWith)

-- | This object represents an inline button that switches the current user to inline mode in a chosen chat, with an optional default inline query.
--
-- Source: <https://core.telegram.org/bots/api#switchinlinequerychosenchat>.
-- Codec directions: decoded from responses, encoded into requests.
data SwitchInlineQueryChosenChat = MkSwitchInlineQueryChosenChat
  { -- | Optional. The default inline query to be inserted in the input field. If left empty, only the bot\'s username will be inserted.
    --
    -- Wire key: @query@.
    -- Omitted from an encoded request when it is @Nothing@.
    query :: Maybe Text
  , -- | Optional. True, if private chats with users can be chosen
    --
    -- Wire key: @allow_user_chats@.
    -- Omitted from an encoded request when it is @Nothing@.
    allow_user_chats :: Maybe Bool
  , -- | Optional. True, if private chats with bots can be chosen
    --
    -- Wire key: @allow_bot_chats@.
    -- Omitted from an encoded request when it is @Nothing@.
    allow_bot_chats :: Maybe Bool
  , -- | Optional. True, if group and supergroup chats can be chosen
    --
    -- Wire key: @allow_group_chats@.
    -- Omitted from an encoded request when it is @Nothing@.
    allow_group_chats :: Maybe Bool
  , -- | Optional. True, if channel chats can be chosen
    --
    -- Wire key: @allow_channel_chats@.
    -- Omitted from an encoded request when it is @Nothing@.
    allow_channel_chats :: Maybe Bool
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SwitchInlineQueryChosenChat' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSwitchInlineQueryChosenChat :: SwitchInlineQueryChosenChat
mkSwitchInlineQueryChosenChat =
  MkSwitchInlineQueryChosenChat
    { query = Nothing
    , allow_user_chats = Nothing
    , allow_bot_chats = Nothing
    , allow_group_chats = Nothing
    , allow_channel_chats = Nothing
    }

instance FromJSON SwitchInlineQueryChosenChat where
  parseJSON = withObject "SwitchInlineQueryChosenChat" $ \obj ->
    do
      field_0 <- optionalWith obj "query" parseJSON
      field_1 <- optionalWith obj "allow_user_chats" parseJSON
      field_2 <- optionalWith obj "allow_bot_chats" parseJSON
      field_3 <- optionalWith obj "allow_group_chats" parseJSON
      field_4 <- optionalWith obj "allow_channel_chats" parseJSON
      pure
        MkSwitchInlineQueryChosenChat
          { query = field_0
          , allow_user_chats = field_1
          , allow_bot_chats = field_2
          , allow_group_chats = field_3
          , allow_channel_chats = field_4
          }

instance ToJSON SwitchInlineQueryChosenChat where
  toJSON x =
    jsonObject
      ( concat
          [ jsonOptional "query" x.query
          , jsonOptional "allow_user_chats" x.allow_user_chats
          , jsonOptional "allow_bot_chats" x.allow_bot_chats
          , jsonOptional "allow_group_chats" x.allow_group_chats
          , jsonOptional "allow_channel_chats" x.allow_channel_chats
          ]
      )
  toEncoding = toEncoding . toJSON
