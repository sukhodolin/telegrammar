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
module Telegram.Bot.Internal.Group.InputRichBlockMap
  ( InputRichBlockMap (..)
  , mkInputRichBlockMap
  ) where

import Data.Aeson (ToJSON (..), Value (..))
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.Location (Location)
import Telegram.Bot.Internal.Group.RichBlockCaption (RichBlockCaption)
import Telegram.Bot.Support (jsonField, jsonLiteral, jsonObject, jsonOptional)

-- | A block with a map, corresponding to the custom HTML tag \<tg-map\>. The map\'s width and height must not exceed 10000 in total. The width and height ratio must be at most 20.
--
-- Source: <https://core.telegram.org/bots/api#inputrichblockmap>.
-- Codec directions: encoded into requests.
--
-- Supplied constants: @type@ = @"map"@.
data InputRichBlockMap = MkInputRichBlockMap
  { -- | Location of the center of the map
    --
    -- Wire key: @location@.
    location :: Location
  , -- | Optional. Map zoom level; 0-24
    --
    -- Wire key: @zoom@.
    -- Omitted from an encoded request when it is @Nothing@.
    zoom :: Maybe Int64
  , -- | Optional. Map width; 0-10000
    --
    -- Wire key: @width@.
    -- Omitted from an encoded request when it is @Nothing@.
    width :: Maybe Int64
  , -- | Optional. Map height; 0-10000
    --
    -- Wire key: @height@.
    -- Omitted from an encoded request when it is @Nothing@.
    height :: Maybe Int64
  , -- | Optional. Caption of the block
    --
    -- Wire key: @caption@.
    -- Omitted from an encoded request when it is @Nothing@.
    caption :: Maybe RichBlockCaption
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InputRichBlockMap' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputRichBlockMap :: Location -> InputRichBlockMap
mkInputRichBlockMap arg0 =
  MkInputRichBlockMap
    { location = arg0
    , zoom = Nothing
    , width = Nothing
    , height = Nothing
    , caption = Nothing
    }

instance ToJSON InputRichBlockMap where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "map")
          , jsonField "location" x.location
          , jsonOptional "zoom" x.zoom
          , jsonOptional "width" x.width
          , jsonOptional "height" x.height
          , jsonOptional "caption" x.caption
          ]
      )
  toEncoding = toEncoding . toJSON
