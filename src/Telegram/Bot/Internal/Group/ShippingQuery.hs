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
module Telegram.Bot.Internal.Group.ShippingQuery
  ( ShippingQuery (..)
  , mkShippingQuery
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.ShippingAddress (ShippingAddress)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Support (jsonField, jsonObject, requiredWith)

-- | This object contains information about an incoming shipping query.
--
-- Source: <https://core.telegram.org/bots/api#shippingquery>.
-- Codec directions: decoded from responses, encoded into requests.
data ShippingQuery = MkShippingQuery
  { -- | Unique query identifier
    --
    -- Wire key: @id@.
    id :: Text
  , -- | User who sent the query
    --
    -- Wire key: @from@.
    from :: User
  , -- | Bot-specified invoice payload
    --
    -- Wire key: @invoice_payload@.
    invoice_payload :: Text
  , -- | User specified shipping address
    --
    -- Wire key: @shipping_address@.
    shipping_address :: ShippingAddress
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ShippingQuery' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkShippingQuery :: Text -> User -> Text -> ShippingAddress -> ShippingQuery
mkShippingQuery arg0 arg1 arg2 arg3 =
  MkShippingQuery
    { id = arg0
    , from = arg1
    , invoice_payload = arg2
    , shipping_address = arg3
    }

instance FromJSON ShippingQuery where
  parseJSON = withObject "ShippingQuery" $ \obj ->
    do
      field_0 <- requiredWith obj "id" parseJSON
      field_1 <- requiredWith obj "from" parseJSON
      field_2 <- requiredWith obj "invoice_payload" parseJSON
      field_3 <- requiredWith obj "shipping_address" parseJSON
      pure
        MkShippingQuery
          { id = field_0
          , from = field_1
          , invoice_payload = field_2
          , shipping_address = field_3
          }

instance ToJSON ShippingQuery where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "id" x.id
          , jsonField "from" x.from
          , jsonField "invoice_payload" x.invoice_payload
          , jsonField "shipping_address" x.shipping_address
          ]
      )
  toEncoding = toEncoding . toJSON
