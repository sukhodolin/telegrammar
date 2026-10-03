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
module Telegram.Bot.Internal.Group.StoryAreaTypeLocation
  ( StoryAreaTypeLocation (..)
  , mkStoryAreaTypeLocation
  ) where

import Data.Aeson (ToJSON (..), Value (..))
import Data.Scientific (Scientific)
import Telegram.Bot.Internal.Group.LocationAddress (LocationAddress)
import Telegram.Bot.Support (jsonField, jsonLiteral, jsonObject, jsonOptional)

-- | Describes a story area pointing to a location. Currently, a story can have up to 10 location areas.
--
-- Source: <https://core.telegram.org/bots/api#storyareatypelocation>.
-- Codec directions: encoded into requests.
--
-- Supplied constants: @type@ = @"location"@.
data StoryAreaTypeLocation = MkStoryAreaTypeLocation
  { -- | Location latitude in degrees
    --
    -- Wire key: @latitude@.
    latitude :: Scientific
  , -- | Location longitude in degrees
    --
    -- Wire key: @longitude@.
    longitude :: Scientific
  , -- | Optional. Address of the location
    --
    -- Wire key: @address@.
    -- Omitted from an encoded request when it is @Nothing@.
    address :: Maybe LocationAddress
  }
  deriving stock (Eq, Show)

-- | Initialize a 'StoryAreaTypeLocation' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkStoryAreaTypeLocation :: Scientific -> Scientific -> StoryAreaTypeLocation
mkStoryAreaTypeLocation arg0 arg1 =
  MkStoryAreaTypeLocation
    { latitude = arg0
    , longitude = arg1
    , address = Nothing
    }

instance ToJSON StoryAreaTypeLocation where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "location")
          , jsonField "latitude" x.latitude
          , jsonField "longitude" x.longitude
          , jsonOptional "address" x.address
          ]
      )
  toEncoding = toEncoding . toJSON
