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
module Telegram.Bot.Internal.Group.BotCommandScopeDefault
  ( BotCommandScopeDefault (..)
  , mkBotCommandScopeDefault
  ) where

import Data.Aeson (ToJSON (..), Value (..))
import Telegram.Bot.Support (jsonLiteral, jsonObject)

-- | Represents the default scope of bot commands. Default commands are used if no commands with a narrower scope are specified for the user.
--
-- Source: <https://core.telegram.org/bots/api#botcommandscopedefault>.
-- Codec directions: encoded into requests.
--
-- Supplied constants: @type@ = @"default"@.
data BotCommandScopeDefault = MkBotCommandScopeDefault
  deriving stock (Eq, Show)

-- | Initialize a 'BotCommandScopeDefault' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkBotCommandScopeDefault :: BotCommandScopeDefault
mkBotCommandScopeDefault = MkBotCommandScopeDefault

instance ToJSON BotCommandScopeDefault where
  toJSON _ =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "default")
          ]
      )
  toEncoding = toEncoding . toJSON
