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
module Telegram.Bot.Internal.Group.InputVenueMessageContent
  ( InputVenueMessageContent (..)
  , mkInputVenueMessageContent
  ) where

import Data.Aeson (ToJSON (..))
import Data.Scientific (Scientific)
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional)

-- | Represents the content of a venue message to be sent as the result of an inline query.
--
-- Source: <https://core.telegram.org/bots/api#inputvenuemessagecontent>.
-- Codec directions: encoded into requests.
data InputVenueMessageContent = MkInputVenueMessageContent
  { -- | Latitude of the venue in degrees
    --
    -- Wire key: @latitude@.
    latitude :: Scientific
  , -- | Longitude of the venue in degrees
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
  , -- | Optional. Foursquare identifier of the venue, if known
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

-- | Initialize a 'InputVenueMessageContent' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputVenueMessageContent :: Scientific -> Scientific -> Text -> Text -> InputVenueMessageContent
mkInputVenueMessageContent arg0 arg1 arg2 arg3 =
  MkInputVenueMessageContent
    { latitude = arg0
    , longitude = arg1
    , title = arg2
    , address = arg3
    , foursquare_id = Nothing
    , foursquare_type = Nothing
    , google_place_id = Nothing
    , google_place_type = Nothing
    }

instance ToJSON InputVenueMessageContent where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "latitude" x.latitude
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
