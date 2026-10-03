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
module Telegram.Bot.Internal.Group.PreCheckoutQuery
  ( PreCheckoutQuery (..)
  , mkPreCheckoutQuery
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.OrderInfo (OrderInfo)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseInt64, requiredWith)

-- | This object contains information about an incoming pre-checkout query.
--
-- Source: <https://core.telegram.org/bots/api#precheckoutquery>.
-- Codec directions: decoded from responses, encoded into requests.
data PreCheckoutQuery = MkPreCheckoutQuery
  { -- | Unique query identifier
    --
    -- Wire key: @id@.
    id :: Text
  , -- | User who sent the query
    --
    -- Wire key: @from@.
    from :: User
  , -- | Three-letter ISO 4217 currency code, or \"XTR\" for payments in Telegram Stars
    --
    -- Wire key: @currency@.
    currency :: Text
  , -- | Total price in the smallest units of the currency (integer, not float\/double). For example, for a price of US$ 1.45 pass amount = 145. See the exp parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies).
    --
    -- Wire key: @total_amount@.
    total_amount :: Int64
  , -- | Bot-specified invoice payload
    --
    -- Wire key: @invoice_payload@.
    invoice_payload :: Text
  , -- | Optional. Identifier of the shipping option chosen by the user
    --
    -- Wire key: @shipping_option_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    shipping_option_id :: Maybe Text
  , -- | Optional. Order information provided by the user
    --
    -- Wire key: @order_info@.
    -- Omitted from an encoded request when it is @Nothing@.
    order_info :: Maybe OrderInfo
  }
  deriving stock (Eq, Show)

-- | Initialize a 'PreCheckoutQuery' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkPreCheckoutQuery :: Text -> User -> Text -> Int64 -> Text -> PreCheckoutQuery
mkPreCheckoutQuery arg0 arg1 arg2 arg3 arg4 =
  MkPreCheckoutQuery
    { id = arg0
    , from = arg1
    , currency = arg2
    , total_amount = arg3
    , invoice_payload = arg4
    , shipping_option_id = Nothing
    , order_info = Nothing
    }

instance FromJSON PreCheckoutQuery where
  parseJSON = withObject "PreCheckoutQuery" $ \obj ->
    do
      field_0 <- requiredWith obj "id" parseJSON
      field_1 <- requiredWith obj "from" parseJSON
      field_2 <- requiredWith obj "currency" parseJSON
      field_3 <- requiredWith obj "total_amount" parseInt64
      field_4 <- requiredWith obj "invoice_payload" parseJSON
      field_5 <- optionalWith obj "shipping_option_id" parseJSON
      field_6 <- optionalWith obj "order_info" parseJSON
      pure
        MkPreCheckoutQuery
          { id = field_0
          , from = field_1
          , currency = field_2
          , total_amount = field_3
          , invoice_payload = field_4
          , shipping_option_id = field_5
          , order_info = field_6
          }

instance ToJSON PreCheckoutQuery where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "id" x.id
          , jsonField "from" x.from
          , jsonField "currency" x.currency
          , jsonField "total_amount" x.total_amount
          , jsonField "invoice_payload" x.invoice_payload
          , jsonOptional "shipping_option_id" x.shipping_option_id
          , jsonOptional "order_info" x.order_info
          ]
      )
  toEncoding = toEncoding . toJSON
