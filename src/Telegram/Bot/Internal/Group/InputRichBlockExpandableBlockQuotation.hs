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
module Telegram.Bot.Internal.Group.InputRichBlockExpandableBlockQuotation
  ( InputRichBlockExpandableBlockQuotation (..)
  , mkInputRichBlockExpandableBlockQuotation
  ) where

import Data.Aeson (ToJSON (..), Value (..))
import Telegram.Bot.Internal.Group.RichMessageButton (RichText)
import Telegram.Bot.Support (jsonField, jsonLiteral, jsonObject, jsonOptional)

-- | A block quotation, corresponding to the HTML tag \<blockquote\> with custom attribute \"expandable\".
--
-- Source: <https://core.telegram.org/bots/api#inputrichblockexpandableblockquotation>.
-- Codec directions: encoded into requests.
--
-- Supplied constants: @type@ = @"expandable_blockquote"@.
data InputRichBlockExpandableBlockQuotation = MkInputRichBlockExpandableBlockQuotation
  { -- | Content of the block
    --
    -- Wire key: @text@.
    text :: RichText
  , -- | Optional. Credit of the block
    --
    -- Wire key: @credit@.
    -- Omitted from an encoded request when it is @Nothing@.
    credit :: Maybe RichText
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InputRichBlockExpandableBlockQuotation' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputRichBlockExpandableBlockQuotation :: RichText -> InputRichBlockExpandableBlockQuotation
mkInputRichBlockExpandableBlockQuotation arg0 =
  MkInputRichBlockExpandableBlockQuotation
    { text = arg0
    , credit = Nothing
    }

instance ToJSON InputRichBlockExpandableBlockQuotation where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "expandable_blockquote")
          , jsonField "text" x.text
          , jsonOptional "credit" x.credit
          ]
      )
  toEncoding = toEncoding . toJSON
