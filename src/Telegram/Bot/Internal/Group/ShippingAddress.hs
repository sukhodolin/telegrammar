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
module Telegram.Bot.Internal.Group.ShippingAddress
  ( ShippingAddress (..)
  , mkShippingAddress
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonObject, requiredWith)

-- | This object represents a shipping address.
--
-- Source: <https://core.telegram.org/bots/api#shippingaddress>.
-- Codec directions: decoded from responses, encoded into requests.
data ShippingAddress = MkShippingAddress
  { -- | Two-letter ISO 3166-1 alpha-2 country code
    --
    -- Wire key: @country_code@.
    country_code :: Text
  , -- | State, if applicable
    --
    -- Wire key: @state@.
    state :: Text
  , -- | City
    --
    -- Wire key: @city@.
    city :: Text
  , -- | First line for the address
    --
    -- Wire key: @street_line1@.
    street_line1 :: Text
  , -- | Second line for the address
    --
    -- Wire key: @street_line2@.
    street_line2 :: Text
  , -- | Address post code
    --
    -- Wire key: @post_code@.
    post_code :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ShippingAddress' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkShippingAddress :: Text -> Text -> Text -> Text -> Text -> Text -> ShippingAddress
mkShippingAddress arg0 arg1 arg2 arg3 arg4 arg5 =
  MkShippingAddress
    { country_code = arg0
    , state = arg1
    , city = arg2
    , street_line1 = arg3
    , street_line2 = arg4
    , post_code = arg5
    }

instance FromJSON ShippingAddress where
  parseJSON = withObject "ShippingAddress" $ \obj ->
    do
      field_0 <- requiredWith obj "country_code" parseJSON
      field_1 <- requiredWith obj "state" parseJSON
      field_2 <- requiredWith obj "city" parseJSON
      field_3 <- requiredWith obj "street_line1" parseJSON
      field_4 <- requiredWith obj "street_line2" parseJSON
      field_5 <- requiredWith obj "post_code" parseJSON
      pure
        MkShippingAddress
          { country_code = field_0
          , state = field_1
          , city = field_2
          , street_line1 = field_3
          , street_line2 = field_4
          , post_code = field_5
          }

instance ToJSON ShippingAddress where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "country_code" x.country_code
          , jsonField "state" x.state
          , jsonField "city" x.city
          , jsonField "street_line1" x.street_line1
          , jsonField "street_line2" x.street_line2
          , jsonField "post_code" x.post_code
          ]
      )
  toEncoding = toEncoding . toJSON
