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
module Telegram.Bot.Internal.Group.RichBlockExpandableBlockQuotation
  ( RichBlockExpandableBlockQuotation (..)
  , mkRichBlockExpandableBlockQuotation
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Telegram.Bot.Internal.Group.RichMessageButton (RichText)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonLiteral, jsonObject, jsonOptional, optionalWith, requiredWith)

-- | A block quotation, corresponding to the HTML tag \<blockquote\> with custom attribute \"expandable\".
--
-- Source: <https://core.telegram.org/bots/api#richblockexpandableblockquotation>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"expandable_blockquote"@.
data RichBlockExpandableBlockQuotation = MkRichBlockExpandableBlockQuotation
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

-- | Initialize a 'RichBlockExpandableBlockQuotation' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichBlockExpandableBlockQuotation :: RichText -> RichBlockExpandableBlockQuotation
mkRichBlockExpandableBlockQuotation arg0 =
  MkRichBlockExpandableBlockQuotation
    { text = arg0
    , credit = Nothing
    }

instance FromJSON RichBlockExpandableBlockQuotation where
  parseJSON = withObject "RichBlockExpandableBlockQuotation" $ \obj ->
    do
      checkStringConstant obj "type" "expandable_blockquote"
      field_1 <- requiredWith obj "text" parseJSON
      field_2 <- optionalWith obj "credit" parseJSON
      pure
        MkRichBlockExpandableBlockQuotation
          { text = field_1
          , credit = field_2
          }

instance ToJSON RichBlockExpandableBlockQuotation where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "expandable_blockquote")
          , jsonField "text" x.text
          , jsonOptional "credit" x.credit
          ]
      )
  toEncoding = toEncoding . toJSON
