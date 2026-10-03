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
module Telegram.Bot.Internal.Group.BotCommandScopeChat
  ( BotCommandScopeChat (..)
  , mkBotCommandScopeChat
  ) where

import Data.Aeson (ToJSON (..), Value (..))
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (jsonField, jsonLiteral, jsonObject)

-- | Represents the scope of bot commands, covering a specific chat.
--
-- Source: <https://core.telegram.org/bots/api#botcommandscopechat>.
-- Codec directions: encoded into requests.
--
-- Supplied constants: @type@ = @"chat"@.
data BotCommandScopeChat = MkBotCommandScopeChat
  { -- | Unique identifier for the target chat or username of the target supergroup in the format \@username. Channel direct messages chats and channel chats aren\'t supported.
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  }
  deriving stock (Eq, Show)

-- | Initialize a 'BotCommandScopeChat' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkBotCommandScopeChat :: IntegerOrString -> BotCommandScopeChat
mkBotCommandScopeChat arg0 =
  MkBotCommandScopeChat
    { chat_id = arg0
    }

instance ToJSON BotCommandScopeChat where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "chat")
          , jsonField "chat_id" x.chat_id
          ]
      )
  toEncoding = toEncoding . toJSON
