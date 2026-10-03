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
module Telegram.Bot.Internal.Group.MenuButtonDefault
  ( MenuButtonDefault (..)
  , mkMenuButtonDefault
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Telegram.Bot.Support (checkStringConstant, jsonLiteral, jsonObject)

-- | Describes that no specific value for the menu button was set.
--
-- Source: <https://core.telegram.org/bots/api#menubuttondefault>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"default"@.
data MenuButtonDefault = MkMenuButtonDefault
  deriving stock (Eq, Show)

-- | Initialize a 'MenuButtonDefault' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkMenuButtonDefault :: MenuButtonDefault
mkMenuButtonDefault = MkMenuButtonDefault

instance FromJSON MenuButtonDefault where
  parseJSON = withObject "MenuButtonDefault" $ \obj ->
    do
      checkStringConstant obj "type" "default"
      pure MkMenuButtonDefault

instance ToJSON MenuButtonDefault where
  toJSON _ =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "default")
          ]
      )
  toEncoding = toEncoding . toJSON
