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
module Telegram.Bot.Internal.Group.OrderInfo
  ( OrderInfo (..)
  , mkOrderInfo
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.ShippingAddress (ShippingAddress)
import Telegram.Bot.Support (jsonObject, jsonOptional, optionalWith)

-- | This object represents information about an order.
--
-- Source: <https://core.telegram.org/bots/api#orderinfo>.
-- Codec directions: decoded from responses, encoded into requests.
data OrderInfo = MkOrderInfo
  { -- | Optional. User name
    --
    -- Wire key: @name@.
    -- Omitted from an encoded request when it is @Nothing@.
    name :: Maybe Text
  , -- | Optional. User\'s phone number
    --
    -- Wire key: @phone_number@.
    -- Omitted from an encoded request when it is @Nothing@.
    phone_number :: Maybe Text
  , -- | Optional. User email
    --
    -- Wire key: @email@.
    -- Omitted from an encoded request when it is @Nothing@.
    email :: Maybe Text
  , -- | Optional. User shipping address
    --
    -- Wire key: @shipping_address@.
    -- Omitted from an encoded request when it is @Nothing@.
    shipping_address :: Maybe ShippingAddress
  }
  deriving stock (Eq, Show)

-- | Initialize a 'OrderInfo' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkOrderInfo :: OrderInfo
mkOrderInfo =
  MkOrderInfo
    { name = Nothing
    , phone_number = Nothing
    , email = Nothing
    , shipping_address = Nothing
    }

instance FromJSON OrderInfo where
  parseJSON = withObject "OrderInfo" $ \obj ->
    do
      field_0 <- optionalWith obj "name" parseJSON
      field_1 <- optionalWith obj "phone_number" parseJSON
      field_2 <- optionalWith obj "email" parseJSON
      field_3 <- optionalWith obj "shipping_address" parseJSON
      pure
        MkOrderInfo
          { name = field_0
          , phone_number = field_1
          , email = field_2
          , shipping_address = field_3
          }

instance ToJSON OrderInfo where
  toJSON x =
    jsonObject
      ( concat
          [ jsonOptional "name" x.name
          , jsonOptional "phone_number" x.phone_number
          , jsonOptional "email" x.email
          , jsonOptional "shipping_address" x.shipping_address
          ]
      )
  toEncoding = toEncoding . toJSON
