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
module Telegram.Bot.Internal.Group.Location
  ( Location (..)
  , mkLocation
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Scientific (Scientific)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseInt64, parseScientificValue, requiredWith)

-- | This object represents a point on the map.
--
-- Source: <https://core.telegram.org/bots/api#location>.
-- Codec directions: decoded from responses, encoded into requests.
data Location = MkLocation
  { -- | Latitude as defined by the sender
    --
    -- Wire key: @latitude@.
    latitude :: Scientific
  , -- | Longitude as defined by the sender
    --
    -- Wire key: @longitude@.
    longitude :: Scientific
  , -- | Optional. The radius of uncertainty for the location, measured in meters; 0-1500
    --
    -- Wire key: @horizontal_accuracy@.
    -- Omitted from an encoded request when it is @Nothing@.
    horizontal_accuracy :: Maybe Scientific
  , -- | Optional. Time relative to the message sending date, during which the location can be updated; in seconds. For active live locations only.
    --
    -- Wire key: @live_period@.
    -- Omitted from an encoded request when it is @Nothing@.
    live_period :: Maybe Int64
  , -- | Optional. The direction in which user is moving, in degrees; 1-360. For active live locations only.
    --
    -- Wire key: @heading@.
    -- Omitted from an encoded request when it is @Nothing@.
    heading :: Maybe Int64
  , -- | Optional. The maximum distance for proximity alerts about approaching another chat member, in meters. For sent live locations only.
    --
    -- Wire key: @proximity_alert_radius@.
    -- Omitted from an encoded request when it is @Nothing@.
    proximity_alert_radius :: Maybe Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'Location' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkLocation :: Scientific -> Scientific -> Location
mkLocation arg0 arg1 =
  MkLocation
    { latitude = arg0
    , longitude = arg1
    , horizontal_accuracy = Nothing
    , live_period = Nothing
    , heading = Nothing
    , proximity_alert_radius = Nothing
    }

instance FromJSON Location where
  parseJSON = withObject "Location" $ \obj ->
    do
      field_0 <- requiredWith obj "latitude" parseScientificValue
      field_1 <- requiredWith obj "longitude" parseScientificValue
      field_2 <- optionalWith obj "horizontal_accuracy" parseScientificValue
      field_3 <- optionalWith obj "live_period" parseInt64
      field_4 <- optionalWith obj "heading" parseInt64
      field_5 <- optionalWith obj "proximity_alert_radius" parseInt64
      pure
        MkLocation
          { latitude = field_0
          , longitude = field_1
          , horizontal_accuracy = field_2
          , live_period = field_3
          , heading = field_4
          , proximity_alert_radius = field_5
          }

instance ToJSON Location where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "latitude" x.latitude
          , jsonField "longitude" x.longitude
          , jsonOptional "horizontal_accuracy" x.horizontal_accuracy
          , jsonOptional "live_period" x.live_period
          , jsonOptional "heading" x.heading
          , jsonOptional "proximity_alert_radius" x.proximity_alert_radius
          ]
      )
  toEncoding = toEncoding . toJSON
