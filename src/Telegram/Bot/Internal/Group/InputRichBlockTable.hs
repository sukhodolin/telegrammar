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
module Telegram.Bot.Internal.Group.InputRichBlockTable
  ( InputRichBlockTable (..)
  , mkInputRichBlockTable
  ) where

import Data.Aeson (ToJSON (..), Value (..))
import Telegram.Bot.Internal.Group.RichBlockTableCell (RichBlockTableCell)
import Telegram.Bot.Internal.Group.RichMessageButton (RichText)
import Telegram.Bot.Support (jsonField, jsonFlag, jsonLiteral, jsonObject, jsonOptional)

-- | A table, corresponding to the HTML tag \<table\>.
--
-- Source: <https://core.telegram.org/bots/api#inputrichblocktable>.
-- Codec directions: encoded into requests.
--
-- Supplied constants: @type@ = @"table"@.
data InputRichBlockTable = MkInputRichBlockTable
  { -- | Cells of the table
    --
    -- Wire key: @cells@.
    cells :: [[RichBlockTableCell]]
  , -- | Optional. Pass True if the table has borders
    --
    -- Wire key: @is_bordered@.
    -- Omitted from an encoded request when it is @False@.
    is_bordered :: Bool
  , -- | Optional. Pass True if the table is striped
    --
    -- Wire key: @is_striped@.
    -- Omitted from an encoded request when it is @False@.
    is_striped :: Bool
  , -- | Optional. Pass True if table cells must have smaller indents
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

-- | Initialize a 'InputRichBlockTable' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputRichBlockTable :: [[RichBlockTableCell]] -> InputRichBlockTable
mkInputRichBlockTable arg0 =
  MkInputRichBlockTable
    { cells = arg0
    , is_bordered = False
    , is_striped = False
    , is_compact = False
    , caption = Nothing
    }

instance ToJSON InputRichBlockTable where
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
