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
module Telegram.Bot.Internal.Group.RichBlockTable
  ( RichBlockTable (..)
  , mkRichBlockTable
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Telegram.Bot.Internal.Group.RichBlockTableCell (RichBlockTableCell)
import Telegram.Bot.Internal.Group.RichMessageButton (RichText)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonFlag, jsonLiteral, jsonObject, jsonOptional, optionalTrueFlag, optionalWith, parseList, requiredWith)

-- | A table, corresponding to the HTML tag \<table\>.
--
-- Source: <https://core.telegram.org/bots/api#richblocktable>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"table"@.
data RichBlockTable = MkRichBlockTable
  { -- | Cells of the table
    --
    -- Wire key: @cells@.
    cells :: [[RichBlockTableCell]]
  , -- | Optional. True, if the table has borders
    --
    -- Wire key: @is_bordered@.
    -- Omitted from an encoded request when it is @False@.
    is_bordered :: Bool
  , -- | Optional. True, if the table is striped
    --
    -- Wire key: @is_striped@.
    -- Omitted from an encoded request when it is @False@.
    is_striped :: Bool
  , -- | Optional. True, if table cells have smaller indents
    --
    -- Wire key: @is_compact@.
    -- Omitted from an encoded request when it is @False@.
    is_compact :: Bool
  , -- | Optional. Caption of the table
    --
    -- Wire key: @caption@.
    -- Omitted from an encoded request when it is @Nothing@.
    caption :: Maybe RichText
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichBlockTable' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichBlockTable :: [[RichBlockTableCell]] -> RichBlockTable
mkRichBlockTable arg0 =
  MkRichBlockTable
    { cells = arg0
    , is_bordered = False
    , is_striped = False
    , is_compact = False
    , caption = Nothing
    }

instance FromJSON RichBlockTable where
  parseJSON = withObject "RichBlockTable" $ \obj ->
    do
      checkStringConstant obj "type" "table"
      field_1 <- requiredWith obj "cells" (parseList (parseList parseJSON))
      field_2 <- optionalTrueFlag obj "is_bordered"
      field_3 <- optionalTrueFlag obj "is_striped"
      field_4 <- optionalTrueFlag obj "is_compact"
      field_5 <- optionalWith obj "caption" parseJSON
      pure
        MkRichBlockTable
          { cells = field_1
          , is_bordered = field_2
          , is_striped = field_3
          , is_compact = field_4
          , caption = field_5
          }

instance ToJSON RichBlockTable where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "table")
          , jsonField "cells" x.cells
          , jsonFlag "is_bordered" x.is_bordered
          , jsonFlag "is_striped" x.is_striped
          , jsonFlag "is_compact" x.is_compact
          , jsonOptional "caption" x.caption
          ]
      )
  toEncoding = toEncoding . toJSON
