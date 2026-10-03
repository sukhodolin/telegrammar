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
module Telegram.Bot.Internal.Group.RichBlockMap
  ( RichBlockMap (..)
  , mkRichBlockMap
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.Location (Location)
import Telegram.Bot.Internal.Group.RichBlockCaption (RichBlockCaption)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonLiteral, jsonObject, jsonOptional, optionalWith, parseInt64, requiredWith)

-- | A block with a map, corresponding to the custom HTML tag \<tg-map\>.
--
-- Source: <https://core.telegram.org/bots/api#richblockmap>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"map"@.
data RichBlockMap = MkRichBlockMap
  { -- | Location of the center of the map
    --
    -- Wire key: @location@.
    location :: Location
  , -- | Map zoom level
    --
    -- Wire key: @zoom@.
    zoom :: Int64
  , -- | Expected width of the map
    --
    -- Wire key: @width@.
    width :: Int64
  , -- | Expected height of the map
    --
    -- Wire key: @height@.
    height :: Int64
  , -- | Optional. Caption of the block
    --
    -- Wire key: @caption@.
    -- Omitted from an encoded request when it is @Nothing@.
    caption :: Maybe RichBlockCaption
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichBlockMap' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichBlockMap :: Location -> Int64 -> Int64 -> Int64 -> RichBlockMap
mkRichBlockMap arg0 arg1 arg2 arg3 =
  MkRichBlockMap
    { location = arg0
    , zoom = arg1
    , width = arg2
    , height = arg3
    , caption = Nothing
    }

instance FromJSON RichBlockMap where
  parseJSON = withObject "RichBlockMap" $ \obj ->
    do
      checkStringConstant obj "type" "map"
      field_1 <- requiredWith obj "location" parseJSON
      field_2 <- requiredWith obj "zoom" parseInt64
      field_3 <- requiredWith obj "width" parseInt64
      field_4 <- requiredWith obj "height" parseInt64
      field_5 <- optionalWith obj "caption" parseJSON
      pure
        MkRichBlockMap
          { location = field_1
          , zoom = field_2
          , width = field_3
          , height = field_4
          , caption = field_5
          }

instance ToJSON RichBlockMap where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "map")
          , jsonField "location" x.location
          , jsonField "zoom" x.zoom
          , jsonField "width" x.width
          , jsonField "height" x.height
          , jsonOptional "caption" x.caption
          ]
      )
  toEncoding = toEncoding . toJSON
