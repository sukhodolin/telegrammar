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
module Telegram.Bot.Internal.Group.RichBlockPreformatted
  ( RichBlockPreformatted (..)
  , mkRichBlockPreformatted
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.RichMessageButton (RichText)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonLiteral, jsonObject, jsonOptional, optionalWith, requiredWith)

-- | A preformatted text block, corresponding to the nested HTML tags \<pre\> and \<code\>.
--
-- Source: <https://core.telegram.org/bots/api#richblockpreformatted>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"pre"@.
data RichBlockPreformatted = MkRichBlockPreformatted
  { -- | Text of the block
    --
    -- Wire key: @text@.
    text :: RichText
  , -- | Optional. The programming language of the text
    --
    -- Wire key: @language@.
    -- Omitted from an encoded request when it is @Nothing@.
    language :: Maybe Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichBlockPreformatted' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichBlockPreformatted :: RichText -> RichBlockPreformatted
mkRichBlockPreformatted arg0 =
  MkRichBlockPreformatted
    { text = arg0
    , language = Nothing
    }

instance FromJSON RichBlockPreformatted where
  parseJSON = withObject "RichBlockPreformatted" $ \obj ->
    do
      checkStringConstant obj "type" "pre"
      field_1 <- requiredWith obj "text" parseJSON
      field_2 <- optionalWith obj "language" parseJSON
      pure
        MkRichBlockPreformatted
          { text = field_1
          , language = field_2
          }

instance ToJSON RichBlockPreformatted where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "pre")
          , jsonField "text" x.text
          , jsonOptional "language" x.language
          ]
      )
  toEncoding = toEncoding . toJSON
