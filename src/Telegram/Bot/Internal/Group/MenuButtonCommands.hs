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
module Telegram.Bot.Internal.Group.MenuButtonCommands
  ( MenuButtonCommands (..)
  , mkMenuButtonCommands
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Telegram.Bot.Support (checkStringConstant, jsonLiteral, jsonObject)

-- | Represents a menu button, which opens the bot\'s list of commands.
--
-- Source: <https://core.telegram.org/bots/api#menubuttoncommands>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"commands"@.
data MenuButtonCommands = MkMenuButtonCommands
  deriving stock (Eq, Show)

-- | Initialize a 'MenuButtonCommands' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkMenuButtonCommands :: MenuButtonCommands
mkMenuButtonCommands = MkMenuButtonCommands

instance FromJSON MenuButtonCommands where
  parseJSON = withObject "MenuButtonCommands" $ \obj ->
    do
      checkStringConstant obj "type" "commands"
      pure MkMenuButtonCommands

instance ToJSON MenuButtonCommands where
  toJSON _ =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "commands")
          ]
      )
  toEncoding = toEncoding . toJSON
