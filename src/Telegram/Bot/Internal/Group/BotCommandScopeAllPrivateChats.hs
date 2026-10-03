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
module Telegram.Bot.Internal.Group.BotCommandScopeAllPrivateChats
  ( BotCommandScopeAllPrivateChats (..)
  , mkBotCommandScopeAllPrivateChats
  ) where

import Data.Aeson (ToJSON (..), Value (..))
import Telegram.Bot.Support (jsonLiteral, jsonObject)

-- | Represents the scope of bot commands, covering all private chats.
--
-- Source: <https://core.telegram.org/bots/api#botcommandscopeallprivatechats>.
-- Codec directions: encoded into requests.
--
-- Supplied constants: @type@ = @"all_private_chats"@.
data BotCommandScopeAllPrivateChats = MkBotCommandScopeAllPrivateChats
  deriving stock (Eq, Show)

-- | Initialize a 'BotCommandScopeAllPrivateChats' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkBotCommandScopeAllPrivateChats :: BotCommandScopeAllPrivateChats
mkBotCommandScopeAllPrivateChats = MkBotCommandScopeAllPrivateChats

instance ToJSON BotCommandScopeAllPrivateChats where
  toJSON _ =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "all_private_chats")
          ]
      )
  toEncoding = toEncoding . toJSON
