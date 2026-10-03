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
module Telegram.Bot.Internal.Group.RichBlockDivider
  ( RichBlockDivider (..)
  , mkRichBlockDivider
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Telegram.Bot.Support (checkStringConstant, jsonLiteral, jsonObject)

-- | A divider, corresponding to the HTML tag \<hr\/\>.
--
-- Source: <https://core.telegram.org/bots/api#richblockdivider>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"divider"@.
data RichBlockDivider = MkRichBlockDivider
  deriving stock (Eq, Show)

-- | Initialize a 'RichBlockDivider' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichBlockDivider :: RichBlockDivider
mkRichBlockDivider = MkRichBlockDivider

instance FromJSON RichBlockDivider where
  parseJSON = withObject "RichBlockDivider" $ \obj ->
    do
      checkStringConstant obj "type" "divider"
      pure MkRichBlockDivider

instance ToJSON RichBlockDivider where
  toJSON _ =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "divider")
          ]
      )
  toEncoding = toEncoding . toJSON
