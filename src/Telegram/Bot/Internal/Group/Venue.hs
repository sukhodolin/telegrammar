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
module Telegram.Bot.Internal.Group.Venue
  ( Venue (..)
  , mkVenue
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.Location (Location)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, requiredWith)

-- | This object represents a venue.
--
-- Source: <https://core.telegram.org/bots/api#venue>.
-- Codec directions: decoded from responses, encoded into requests.
data Venue = MkVenue
  { -- | Venue location. Can\'t be a live location.
    --
    -- Wire key: @location@.
    location :: Location
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
  , -- | Optional. Foursquare type of the venue. (For example, \"arts_entertainment\/default\", \"arts_entertainment\/aquarium\" or \"food\/icecream\".)
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

-- | Initialize a 'Venue' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkVenue :: Location -> Text -> Text -> Venue
mkVenue arg0 arg1 arg2 =
  MkVenue
    { location = arg0
    , title = arg1
    , address = arg2
    , foursquare_id = Nothing
    , foursquare_type = Nothing
    , google_place_id = Nothing
    , google_place_type = Nothing
    }

instance FromJSON Venue where
  parseJSON = withObject "Venue" $ \obj ->
    do
      field_0 <- requiredWith obj "location" parseJSON
      field_1 <- requiredWith obj "title" parseJSON
      field_2 <- requiredWith obj "address" parseJSON
      field_3 <- optionalWith obj "foursquare_id" parseJSON
      field_4 <- optionalWith obj "foursquare_type" parseJSON
      field_5 <- optionalWith obj "google_place_id" parseJSON
      field_6 <- optionalWith obj "google_place_type" parseJSON
      pure
        MkVenue
          { location = field_0
          , title = field_1
          , address = field_2
          , foursquare_id = field_3
          , foursquare_type = field_4
          , google_place_id = field_5
          , google_place_type = field_6
          }

instance ToJSON Venue where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "location" x.location
          , jsonField "title" x.title
          , jsonField "address" x.address
          , jsonOptional "foursquare_id" x.foursquare_id
          , jsonOptional "foursquare_type" x.foursquare_type
          , jsonOptional "google_place_id" x.google_place_id
          , jsonOptional "google_place_type" x.google_place_type
          ]
      )
  toEncoding = toEncoding . toJSON
