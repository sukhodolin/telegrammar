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
module Telegram.Bot.Internal.Group.InputLocationMessageContent
  ( InputLocationMessageContent (..)
  , mkInputLocationMessageContent
  ) where

import Data.Aeson (ToJSON (..))
import Data.Int (Int64)
import Data.Scientific (Scientific)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional)

-- | Represents the content of a location message to be sent as the result of an inline query.
--
-- Source: <https://core.telegram.org/bots/api#inputlocationmessagecontent>.
-- Codec directions: encoded into requests.
data InputLocationMessageContent = MkInputLocationMessageContent
  { -- | Latitude of the location in degrees
    --
    -- Wire key: @latitude@.
    latitude :: Scientific
  , -- | Longitude of the location in degrees
    --
    -- Wire key: @longitude@.
    longitude :: Scientific
  , -- | Optional. The radius of uncertainty for the location, measured in meters; 0-1500
    --
    -- Wire key: @horizontal_accuracy@.
    -- Omitted from an encoded request when it is @Nothing@.
    horizontal_accuracy :: Maybe Scientific
  , -- | Optional. Period in seconds during which the location can be updated, must be between 60 and 86400, or 0x7FFFFFFF for live locations that can be edited indefinitely
    --
    -- Wire key: @live_period@.
    -- Omitted from an encoded request when it is @Nothing@.
    live_period :: Maybe Int64
  , -- | Optional. For live locations, a direction in which the user is moving, in degrees. Must be between 1 and 360 if specified.
    --
    -- Wire key: @heading@.
    -- Omitted from an encoded request when it is @Nothing@.
    heading :: Maybe Int64
  , -- | Optional. For live locations, a maximum distance for proximity alerts about approaching another chat member, in meters. Must be between 1 and 100000 if specified.
    --
    -- Wire key: @proximity_alert_radius@.
    -- Omitted from an encoded request when it is @Nothing@.
    proximity_alert_radius :: Maybe Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InputLocationMessageContent' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputLocationMessageContent :: Scientific -> Scientific -> InputLocationMessageContent
mkInputLocationMessageContent arg0 arg1 =
  MkInputLocationMessageContent
    { latitude = arg0
    , longitude = arg1
    , horizontal_accuracy = Nothing
    , live_period = Nothing
    , heading = Nothing
    , proximity_alert_radius = Nothing
    }

instance ToJSON InputLocationMessageContent where
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
