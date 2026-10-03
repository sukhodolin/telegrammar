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
module Telegram.Bot.Internal.Group.LocationAddress
  ( LocationAddress (..)
  , mkLocationAddress
  ) where

import Data.Aeson (ToJSON (..))
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional)

-- | Describes the physical address of a location.
--
-- Source: <https://core.telegram.org/bots/api#locationaddress>.
-- Codec directions: encoded into requests.
data LocationAddress = MkLocationAddress
  { -- | The two-letter ISO 3166-1 alpha-2 country code of the country where the location is located
    --
    -- Wire key: @country_code@.
    country_code :: Text
  , -- | Optional. State of the location
    --
    -- Wire key: @state@.
    -- Omitted from an encoded request when it is @Nothing@.
    state :: Maybe Text
  , -- | Optional. City of the location
    --
    -- Wire key: @city@.
    -- Omitted from an encoded request when it is @Nothing@.
    city :: Maybe Text
  , -- | Optional. Street address of the location
    --
    -- Wire key: @street@.
    -- Omitted from an encoded request when it is @Nothing@.
    street :: Maybe Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'LocationAddress' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkLocationAddress :: Text -> LocationAddress
mkLocationAddress arg0 =
  MkLocationAddress
    { country_code = arg0
    , state = Nothing
    , city = Nothing
    , street = Nothing
    }

instance ToJSON LocationAddress where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "country_code" x.country_code
          , jsonOptional "state" x.state
          , jsonOptional "city" x.city
          , jsonOptional "street" x.street
          ]
      )
  toEncoding = toEncoding . toJSON
