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
module Telegram.Bot.Internal.Group.InputRichBlockAnchor
  ( InputRichBlockAnchor (..)
  , mkInputRichBlockAnchor
  ) where

import Data.Aeson (ToJSON (..), Value (..))
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonLiteral, jsonObject)

-- | A block with an anchor, corresponding to the HTML tag \<a\> with the attribute name.
--
-- Source: <https://core.telegram.org/bots/api#inputrichblockanchor>.
-- Codec directions: encoded into requests.
--
-- Supplied constants: @type@ = @"anchor"@.
data InputRichBlockAnchor = MkInputRichBlockAnchor
  { -- | The name of the anchor
    --
    -- Wire key: @name@.
    name :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InputRichBlockAnchor' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputRichBlockAnchor :: Text -> InputRichBlockAnchor
mkInputRichBlockAnchor arg0 =
  MkInputRichBlockAnchor
    { name = arg0
    }

instance ToJSON InputRichBlockAnchor where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "anchor")
          , jsonField "name" x.name
          ]
      )
  toEncoding = toEncoding . toJSON
