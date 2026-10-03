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
module Telegram.Bot.Internal.Group.BotCommandScopeChatAdministrators
  ( BotCommandScopeChatAdministrators (..)
  , mkBotCommandScopeChatAdministrators
  ) where

import Data.Aeson (ToJSON (..), Value (..))
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (jsonField, jsonLiteral, jsonObject)

-- | Represents the scope of bot commands, covering all administrators of a specific group or supergroup chat.
--
-- Source: <https://core.telegram.org/bots/api#botcommandscopechatadministrators>.
-- Codec directions: encoded into requests.
--
-- Supplied constants: @type@ = @"chat_administrators"@.
data BotCommandScopeChatAdministrators = MkBotCommandScopeChatAdministrators
  { -- | Unique identifier for the target chat or username of the target supergroup in the format \@username. Channel direct messages chats and channel chats aren\'t supported.
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  }
  deriving stock (Eq, Show)

-- | Initialize a 'BotCommandScopeChatAdministrators' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkBotCommandScopeChatAdministrators :: IntegerOrString -> BotCommandScopeChatAdministrators
mkBotCommandScopeChatAdministrators arg0 =
  MkBotCommandScopeChatAdministrators
    { chat_id = arg0
    }

instance ToJSON BotCommandScopeChatAdministrators where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "chat_administrators")
          , jsonField "chat_id" x.chat_id
          ]
      )
  toEncoding = toEncoding . toJSON
