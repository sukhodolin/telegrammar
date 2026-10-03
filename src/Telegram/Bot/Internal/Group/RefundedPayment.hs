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
module Telegram.Bot.Internal.Group.RefundedPayment
  ( RefundedPayment (..)
  , mkRefundedPayment
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseInt64, requiredWith)

-- | This object contains basic information about a refunded payment.
--
-- Source: <https://core.telegram.org/bots/api#refundedpayment>.
-- Codec directions: decoded from responses, encoded into requests.
data RefundedPayment = MkRefundedPayment
  { -- | Three-letter ISO 4217 currency code, or \"XTR\" for payments in Telegram Stars. Currently, always \"XTR\".
    --
    -- Wire key: @currency@.
    currency :: Text
  , -- | Total refunded price in the smallest units of the currency (integer, not float\/double). For example, for a price of US$ 1.45, total_amount = 145. See the exp parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies).
    --
    -- Wire key: @total_amount@.
    total_amount :: Int64
  , -- | Bot-specified invoice payload
    --
    -- Wire key: @invoice_payload@.
    invoice_payload :: Text
  , -- | Telegram payment identifier
    --
    -- Wire key: @telegram_payment_charge_id@.
    telegram_payment_charge_id :: Text
  , -- | Optional. Provider payment identifier
    --
    -- Wire key: @provider_payment_charge_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    provider_payment_charge_id :: Maybe Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RefundedPayment' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRefundedPayment :: Text -> Int64 -> Text -> Text -> RefundedPayment
mkRefundedPayment arg0 arg1 arg2 arg3 =
  MkRefundedPayment
    { currency = arg0
    , total_amount = arg1
    , invoice_payload = arg2
    , telegram_payment_charge_id = arg3
    , provider_payment_charge_id = Nothing
    }

instance FromJSON RefundedPayment where
  parseJSON = withObject "RefundedPayment" $ \obj ->
    do
      field_0 <- requiredWith obj "currency" parseJSON
      field_1 <- requiredWith obj "total_amount" parseInt64
      field_2 <- requiredWith obj "invoice_payload" parseJSON
      field_3 <- requiredWith obj "telegram_payment_charge_id" parseJSON
      field_4 <- optionalWith obj "provider_payment_charge_id" parseJSON
      pure
        MkRefundedPayment
          { currency = field_0
          , total_amount = field_1
          , invoice_payload = field_2
          , telegram_payment_charge_id = field_3
          , provider_payment_charge_id = field_4
          }

instance ToJSON RefundedPayment where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "currency" x.currency
          , jsonField "total_amount" x.total_amount
          , jsonField "invoice_payload" x.invoice_payload
          , jsonField "telegram_payment_charge_id" x.telegram_payment_charge_id
          , jsonOptional "provider_payment_charge_id" x.provider_payment_charge_id
          ]
      )
  toEncoding = toEncoding . toJSON
