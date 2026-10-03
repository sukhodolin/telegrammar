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
module Telegram.Bot.Internal.Group.SuccessfulPayment
  ( SuccessfulPayment (..)
  , mkSuccessfulPayment
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.OrderInfo (OrderInfo)
import Telegram.Bot.Support (jsonField, jsonFlag, jsonObject, jsonOptional, optionalTrueFlag, optionalWith, parseInt64, requiredWith)

-- | This object contains basic information about a successful payment. Note that if the buyer initiates a chargeback with the relevant payment provider following this transaction, the funds may be debited from your balance. This is outside of Telegram\'s control.
--
-- Source: <https://core.telegram.org/bots/api#successfulpayment>.
-- Codec directions: decoded from responses, encoded into requests.
data SuccessfulPayment = MkSuccessfulPayment
  { -- | Three-letter ISO 4217 currency code, or \"XTR\" for payments in Telegram Stars
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
  , -- | Optional. Expiration date of the subscription, in Unix time; for recurring payments only
    --
    -- Wire key: @subscription_expiration_date@.
    -- Omitted from an encoded request when it is @Nothing@.
    subscription_expiration_date :: Maybe Int64
  , -- | Optional. True, if the payment is a recurring payment for a subscription
    --
    -- Wire key: @is_recurring@.
    -- Omitted from an encoded request when it is @False@.
    is_recurring :: Bool
  , -- | Optional. True, if the payment is the first payment for a subscription
    --
    -- Wire key: @is_first_recurring@.
    -- Omitted from an encoded request when it is @False@.
    is_first_recurring :: Bool
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
  , -- | Telegram payment identifier
    --
    -- Wire key: @telegram_payment_charge_id@.
    telegram_payment_charge_id :: Text
  , -- | Provider payment identifier
    --
    -- Wire key: @provider_payment_charge_id@.
    provider_payment_charge_id :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SuccessfulPayment' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSuccessfulPayment :: Text -> Int64 -> Text -> Text -> Text -> SuccessfulPayment
mkSuccessfulPayment arg0 arg1 arg2 arg3 arg4 =
  MkSuccessfulPayment
    { currency = arg0
    , total_amount = arg1
    , invoice_payload = arg2
    , subscription_expiration_date = Nothing
    , is_recurring = False
    , is_first_recurring = False
    , shipping_option_id = Nothing
    , order_info = Nothing
    , telegram_payment_charge_id = arg3
    , provider_payment_charge_id = arg4
    }

instance FromJSON SuccessfulPayment where
  parseJSON = withObject "SuccessfulPayment" $ \obj ->
    do
      field_0 <- requiredWith obj "currency" parseJSON
      field_1 <- requiredWith obj "total_amount" parseInt64
      field_2 <- requiredWith obj "invoice_payload" parseJSON
      field_3 <- optionalWith obj "subscription_expiration_date" parseInt64
      field_4 <- optionalTrueFlag obj "is_recurring"
      field_5 <- optionalTrueFlag obj "is_first_recurring"
      field_6 <- optionalWith obj "shipping_option_id" parseJSON
      field_7 <- optionalWith obj "order_info" parseJSON
      field_8 <- requiredWith obj "telegram_payment_charge_id" parseJSON
      field_9 <- requiredWith obj "provider_payment_charge_id" parseJSON
      pure
        MkSuccessfulPayment
          { currency = field_0
          , total_amount = field_1
          , invoice_payload = field_2
          , subscription_expiration_date = field_3
          , is_recurring = field_4
          , is_first_recurring = field_5
          , shipping_option_id = field_6
          , order_info = field_7
          , telegram_payment_charge_id = field_8
          , provider_payment_charge_id = field_9
          }

instance ToJSON SuccessfulPayment where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "currency" x.currency
          , jsonField "total_amount" x.total_amount
          , jsonField "invoice_payload" x.invoice_payload
          , jsonOptional "subscription_expiration_date" x.subscription_expiration_date
          , jsonFlag "is_recurring" x.is_recurring
          , jsonFlag "is_first_recurring" x.is_first_recurring
          , jsonOptional "shipping_option_id" x.shipping_option_id
          , jsonOptional "order_info" x.order_info
          , jsonField "telegram_payment_charge_id" x.telegram_payment_charge_id
          , jsonField "provider_payment_charge_id" x.provider_payment_charge_id
          ]
      )
  toEncoding = toEncoding . toJSON
