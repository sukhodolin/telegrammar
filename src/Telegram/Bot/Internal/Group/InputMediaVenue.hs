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
module Telegram.Bot.Internal.Group.InputMediaVenue
  ( InputMediaVenue (..)
  , mkInputMediaVenue
  ) where

import Data.Aeson (ToJSON (..), Value (..))
import Data.Scientific (Scientific)
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonLiteral, jsonObject, jsonOptional)

-- | Represents a venue to be sent.
--
-- Source: <https://core.telegram.org/bots/api#inputmediavenue>.
-- Codec directions: encoded into requests.
--
-- Supplied constants: @type@ = @"venue"@.
data InputMediaVenue = MkInputMediaVenue
  { -- | Latitude of the location
    --
    -- Wire key: @latitude@.
    latitude :: Scientific
  , -- | Longitude of the location
    --
    -- Wire key: @longitude@.
    longitude :: Scientific
  , -- | Name of the venue
    --
    -- Wire key: @title@.
    title :: Text
  , -- | Address of the venue
    --
    -- Wire key: @address@.
    address :: Text
  , -- | Optional. Foursquare identifier of the venue
    --
    -- Wire key: @foursquare_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    foursquare_id :: Maybe Text
  , -- | Optional. Foursquare type of the venue, if known. (For example, \"arts_entertainment\/default\", \"arts_entertainment\/aquarium\" or \"food\/icecream\".)
    --
    -- Wire key: @foursquare_type@.
    -- Omitted from an encoded request when it is @Nothing@.
    foursquare_type :: Maybe Text
  , -- | Optional. Google Places identifier of the venue
    --
    -- Wire key: @google_place_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    google_place_id :: Maybe Text
  , -- | Optional. Google Places type of the venue. (See supported types.)
    --
    -- Wire key: @google_place_type@.
    -- Omitted from an encoded request when it is @Nothing@.
    google_place_type :: Maybe Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InputMediaVenue' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputMediaVenue :: Scientific -> Scientific -> Text -> Text -> InputMediaVenue
mkInputMediaVenue arg0 arg1 arg2 arg3 =
  MkInputMediaVenue
    { latitude = arg0
    , longitude = arg1
    , title = arg2
    , address = arg3
    , foursquare_id = Nothing
    , foursquare_type = Nothing
    , google_place_id = Nothing
    , google_place_type = Nothing
    }

instance ToJSON InputMediaVenue where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "venue")
          , jsonField "latitude" x.latitude
          , jsonField "longitude" x.longitude
          , jsonField "title" x.title
          , jsonField "address" x.address
          , jsonOptional "foursquare_id" x.foursquare_id
          , jsonOptional "foursquare_type" x.foursquare_type
          , jsonOptional "google_place_id" x.google_place_id
          , jsonOptional "google_place_type" x.google_place_type
          ]
      )
  toEncoding = toEncoding . toJSON
