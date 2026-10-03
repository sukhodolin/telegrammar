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
module Telegram.Bot.Internal.Group.RichBlockTableCell
  ( RichBlockTableCell (..)
  , mkRichBlockTableCell
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.RichMessageButton (RichText)
import Telegram.Bot.Support (jsonField, jsonFlag, jsonObject, jsonOptional, optionalTrueFlag, optionalWith, parseInt64, requiredWith)

-- | Cell in a table.
--
-- Source: <https://core.telegram.org/bots/api#richblocktablecell>.
-- Codec directions: decoded from responses, encoded into requests.
data RichBlockTableCell = MkRichBlockTableCell
  { -- | Optional. Text in the cell. If omitted, then the cell is invisible.
    --
    -- Wire key: @text@.
    -- Omitted from an encoded request when it is @Nothing@.
    text :: Maybe RichText
  , -- | Optional. True, if the cell is a header cell
    --
    -- Wire key: @is_header@.
    -- Omitted from an encoded request when it is @False@.
    is_header :: Bool
  , -- | Optional. The number of columns the cell spans if it is bigger than 1
    --
    -- Wire key: @colspan@.
    -- Omitted from an encoded request when it is @Nothing@.
    colspan :: Maybe Int64
  , -- | Optional. The number of rows the cell spans if it is bigger than 1
    --
    -- Wire key: @rowspan@.
    -- Omitted from an encoded request when it is @Nothing@.
    rowspan :: Maybe Int64
  , -- | Horizontal cell content alignment. Currently, must be one of \"left\", \"center\", or \"right\".
    --
    -- Wire key: @align@.
    align :: Text
  , -- | Vertical cell content alignment. Currently, must be one of \"top\", \"middle\", or \"bottom\".
    --
    -- Wire key: @valign@.
    valign :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichBlockTableCell' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichBlockTableCell :: Text -> Text -> RichBlockTableCell
mkRichBlockTableCell arg0 arg1 =
  MkRichBlockTableCell
    { text = Nothing
    , is_header = False
    , colspan = Nothing
    , rowspan = Nothing
    , align = arg0
    , valign = arg1
    }

instance FromJSON RichBlockTableCell where
  parseJSON = withObject "RichBlockTableCell" $ \obj ->
    do
      field_0 <- optionalWith obj "text" parseJSON
      field_1 <- optionalTrueFlag obj "is_header"
      field_2 <- optionalWith obj "colspan" parseInt64
      field_3 <- optionalWith obj "rowspan" parseInt64
      field_4 <- requiredWith obj "align" parseJSON
      field_5 <- requiredWith obj "valign" parseJSON
      pure
        MkRichBlockTableCell
          { text = field_0
          , is_header = field_1
          , colspan = field_2
          , rowspan = field_3
          , align = field_4
          , valign = field_5
          }

instance ToJSON RichBlockTableCell where
  toJSON x =
    jsonObject
      ( concat
          [ jsonOptional "text" x.text
          , jsonFlag "is_header" x.is_header
          , jsonOptional "colspan" x.colspan
          , jsonOptional "rowspan" x.rowspan
          , jsonField "align" x.align
          , jsonField "valign" x.valign
          ]
      )
  toEncoding = toEncoding . toJSON
