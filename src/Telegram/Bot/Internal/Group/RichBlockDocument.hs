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
module Telegram.Bot.Internal.Group.RichBlockDocument
  ( RichBlockDocument (..)
  , mkRichBlockDocument
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Telegram.Bot.Internal.Group.Document (Document)
import Telegram.Bot.Internal.Group.RichBlockCaption (RichBlockCaption)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonLiteral, jsonObject, jsonOptional, optionalWith, requiredWith)

-- | A block with a general file, corresponding to the custom HTML tag \<tg-document\>.
--
-- Source: <https://core.telegram.org/bots/api#richblockdocument>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"document"@.
data RichBlockDocument = MkRichBlockDocument
  { -- | The document
    --
    -- Wire key: @document@.
    document :: Document
  , -- | Optional. Caption of the block
    --
    -- Wire key: @caption@.
    -- Omitted from an encoded request when it is @Nothing@.
    caption :: Maybe RichBlockCaption
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichBlockDocument' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichBlockDocument :: Document -> RichBlockDocument
mkRichBlockDocument arg0 =
  MkRichBlockDocument
    { document = arg0
    , caption = Nothing
    }

instance FromJSON RichBlockDocument where
  parseJSON = withObject "RichBlockDocument" $ \obj ->
    do
      checkStringConstant obj "type" "document"
      field_1 <- requiredWith obj "document" parseJSON
      field_2 <- optionalWith obj "caption" parseJSON
      pure
        MkRichBlockDocument
          { document = field_1
          , caption = field_2
          }

instance ToJSON RichBlockDocument where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "document")
          , jsonField "document" x.document
          , jsonOptional "caption" x.caption
          ]
      )
  toEncoding = toEncoding . toJSON
