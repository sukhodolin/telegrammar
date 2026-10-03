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
module Telegram.Bot.Internal.Group.BusinessLocation
  ( BusinessLocation (..)
  , mkBusinessLocation
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.Location (Location)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, requiredWith)

-- | Contains information about the location of a Telegram Business account.
--
-- Source: <https://core.telegram.org/bots/api#businesslocation>.
-- Codec directions: decoded from responses, encoded into requests.
data BusinessLocation = MkBusinessLocation
  { -- | Address of the business
    --
    -- Wire key: @address@.
    address :: Text
  , -- | Optional. Location of the business
    --
    -- Wire key: @location@.
    -- Omitted from an encoded request when it is @Nothing@.
    location :: Maybe Location
  }
  deriving stock (Eq, Show)

-- | Initialize a 'BusinessLocation' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkBusinessLocation :: Text -> BusinessLocation
mkBusinessLocation arg0 =
  MkBusinessLocation
    { address = arg0
    , location = Nothing
    }

instance FromJSON BusinessLocation where
  parseJSON = withObject "BusinessLocation" $ \obj ->
    do
      field_0 <- requiredWith obj "address" parseJSON
      field_1 <- optionalWith obj "location" parseJSON
      pure
        MkBusinessLocation
          { address = field_0
          , location = field_1
          }

instance ToJSON BusinessLocation where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "address" x.address
          , jsonOptional "location" x.location
          ]
      )
  toEncoding = toEncoding . toJSON
