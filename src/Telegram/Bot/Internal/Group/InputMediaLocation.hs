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
module Telegram.Bot.Internal.Group.InputMediaLocation
  ( InputMediaLocation (..)
  , mkInputMediaLocation
  ) where

import Data.Aeson (ToJSON (..), Value (..))
import Data.Scientific (Scientific)
import Telegram.Bot.Support (jsonField, jsonLiteral, jsonObject, jsonOptional)

-- | Represents a location to be sent.
--
-- Source: <https://core.telegram.org/bots/api#inputmedialocation>.
-- Codec directions: encoded into requests.
--
-- Supplied constants: @type@ = @"location"@.
data InputMediaLocation = MkInputMediaLocation
  { -- | Latitude of the location
    --
    -- Wire key: @latitude@.
    latitude :: Scientific
  , -- | Longitude of the location
    --
    -- Wire key: @longitude@.
    longitude :: Scientific
  , -- | Optional. The radius of uncertainty for the location, measured in meters; 0-1500
    --
    -- Wire key: @horizontal_accuracy@.
    -- Omitted from an encoded request when it is @Nothing@.
    horizontal_accuracy :: Maybe Scientific
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InputMediaLocation' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputMediaLocation :: Scientific -> Scientific -> InputMediaLocation
mkInputMediaLocation arg0 arg1 =
  MkInputMediaLocation
    { latitude = arg0
    , longitude = arg1
    , horizontal_accuracy = Nothing
    }

instance ToJSON InputMediaLocation where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "location")
          , jsonField "latitude" x.latitude
          , jsonField "longitude" x.longitude
          , jsonOptional "horizontal_accuracy" x.horizontal_accuracy
          ]
      )
  toEncoding = toEncoding . toJSON
