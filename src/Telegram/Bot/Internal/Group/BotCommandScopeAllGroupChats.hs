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
module Telegram.Bot.Internal.Group.BotCommandScopeAllGroupChats
  ( BotCommandScopeAllGroupChats (..)
  , mkBotCommandScopeAllGroupChats
  ) where

import Data.Aeson (ToJSON (..), Value (..))
import Telegram.Bot.Support (jsonLiteral, jsonObject)

-- | Represents the scope of bot commands, covering all group and supergroup chats.
--
-- Source: <https://core.telegram.org/bots/api#botcommandscopeallgroupchats>.
-- Codec directions: encoded into requests.
--
-- Supplied constants: @type@ = @"all_group_chats"@.
data BotCommandScopeAllGroupChats = MkBotCommandScopeAllGroupChats
  deriving stock (Eq, Show)

-- | Initialize a 'BotCommandScopeAllGroupChats' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkBotCommandScopeAllGroupChats :: BotCommandScopeAllGroupChats
mkBotCommandScopeAllGroupChats = MkBotCommandScopeAllGroupChats

instance ToJSON BotCommandScopeAllGroupChats where
  toJSON _ =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "all_group_chats")
          ]
      )
  toEncoding = toEncoding . toJSON
