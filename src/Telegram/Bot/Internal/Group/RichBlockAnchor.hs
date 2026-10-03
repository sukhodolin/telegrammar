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
module Telegram.Bot.Internal.Group.RichBlockAnchor
  ( RichBlockAnchor (..)
  , mkRichBlockAnchor
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonLiteral, jsonObject, requiredWith)

-- | A block with an anchor, corresponding to the HTML tag \<a\> with the attribute name.
--
-- Source: <https://core.telegram.org/bots/api#richblockanchor>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"anchor"@.
data RichBlockAnchor = MkRichBlockAnchor
  { -- | The name of the anchor
    --
    -- Wire key: @name@.
    name :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichBlockAnchor' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichBlockAnchor :: Text -> RichBlockAnchor
mkRichBlockAnchor arg0 =
  MkRichBlockAnchor
    { name = arg0
    }

instance FromJSON RichBlockAnchor where
  parseJSON = withObject "RichBlockAnchor" $ \obj ->
    do
      checkStringConstant obj "type" "anchor"
      field_1 <- requiredWith obj "name" parseJSON
      pure
        MkRichBlockAnchor
          { name = field_1
          }

instance ToJSON RichBlockAnchor where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "anchor")
          , jsonField "name" x.name
          ]
      )
  toEncoding = toEncoding . toJSON
