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
module Telegram.Bot.Internal.Group.InputRichBlockParagraph
  ( InputRichBlockParagraph (..)
  , mkInputRichBlockParagraph
  ) where

import Data.Aeson (ToJSON (..), Value (..))
import Telegram.Bot.Internal.Group.RichMessageButton (RichText)
import Telegram.Bot.Support (jsonField, jsonLiteral, jsonObject)

-- | A text paragraph, corresponding to the HTML tag \<p\>.
--
-- Source: <https://core.telegram.org/bots/api#inputrichblockparagraph>.
-- Codec directions: encoded into requests.
--
-- Supplied constants: @type@ = @"paragraph"@.
data InputRichBlockParagraph = MkInputRichBlockParagraph
  { -- | Text of the block
    --
    -- Wire key: @text@.
    text :: RichText
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InputRichBlockParagraph' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputRichBlockParagraph :: RichText -> InputRichBlockParagraph
mkInputRichBlockParagraph arg0 =
  MkInputRichBlockParagraph
    { text = arg0
    }

instance ToJSON InputRichBlockParagraph where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "paragraph")
          , jsonField "text" x.text
          ]
      )
  toEncoding = toEncoding . toJSON
