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
module Telegram.Bot.Internal.Group.InputRichBlockSectionHeading
  ( InputRichBlockSectionHeading (..)
  , mkInputRichBlockSectionHeading
  ) where

import Data.Aeson (ToJSON (..), Value (..))
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.RichMessageButton (RichText)
import Telegram.Bot.Support (jsonField, jsonLiteral, jsonObject)

-- | A section heading, corresponding to the HTML tags \<h1\>, \<h2\>, \<h3\>, \<h4\>, \<h5\>, or \<h6\>.
--
-- Source: <https://core.telegram.org/bots/api#inputrichblocksectionheading>.
-- Codec directions: encoded into requests.
--
-- Supplied constants: @type@ = @"heading"@.
data InputRichBlockSectionHeading = MkInputRichBlockSectionHeading
  { -- | Text of the block
    --
    -- Wire key: @text@.
    text :: RichText
  , -- | Relative size of the text font; 1-6, 1 is the largest, 6 is the smallest
    --
    -- Wire key: @size@.
    size :: Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InputRichBlockSectionHeading' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputRichBlockSectionHeading :: RichText -> Int64 -> InputRichBlockSectionHeading
mkInputRichBlockSectionHeading arg0 arg1 =
  MkInputRichBlockSectionHeading
    { text = arg0
    , size = arg1
    }

instance ToJSON InputRichBlockSectionHeading where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "heading")
          , jsonField "text" x.text
          , jsonField "size" x.size
          ]
      )
  toEncoding = toEncoding . toJSON
