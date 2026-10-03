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
module Telegram.Bot.Internal.Group.InputRichBlockDivider
  ( InputRichBlockDivider (..)
  , mkInputRichBlockDivider
  ) where

import Data.Aeson (ToJSON (..), Value (..))
import Telegram.Bot.Support (jsonLiteral, jsonObject)

-- | A divider, corresponding to the HTML tag \<hr\/\>.
--
-- Source: <https://core.telegram.org/bots/api#inputrichblockdivider>.
-- Codec directions: encoded into requests.
--
-- Supplied constants: @type@ = @"divider"@.
data InputRichBlockDivider = MkInputRichBlockDivider
  deriving stock (Eq, Show)

-- | Initialize a 'InputRichBlockDivider' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputRichBlockDivider :: InputRichBlockDivider
mkInputRichBlockDivider = MkInputRichBlockDivider

instance ToJSON InputRichBlockDivider where
  toJSON _ =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "divider")
          ]
      )
  toEncoding = toEncoding . toJSON
