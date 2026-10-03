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
module Telegram.Bot.Internal.Group.Invoice
  ( Invoice (..)
  , mkInvoice
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonObject, parseInt64, requiredWith)

-- | This object contains basic information about an invoice.
--
-- Source: <https://core.telegram.org/bots/api#invoice>.
-- Codec directions: decoded from responses, encoded into requests.
data Invoice = MkInvoice
  { -- | Product name
    --
    -- Wire key: @title@.
    title :: Text
  , -- | Product description
    --
    -- Wire key: @description@.
    description :: Text
  , -- | Unique bot deep-linking parameter that can be used to generate this invoice
    --
    -- Wire key: @start_parameter@.
    start_parameter :: Text
  , -- | Three-letter ISO 4217 currency code, or \"XTR\" for payments in Telegram Stars
    --
    -- Wire key: @currency@.
    currency :: Text
  , -- | Total price in the smallest units of the currency (integer, not float\/double). For example, for a price of US$ 1.45 pass amount = 145. See the exp parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies).
    --
    -- Wire key: @total_amount@.
    total_amount :: Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'Invoice' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInvoice :: Text -> Text -> Text -> Text -> Int64 -> Invoice
mkInvoice arg0 arg1 arg2 arg3 arg4 =
  MkInvoice
    { title = arg0
    , description = arg1
    , start_parameter = arg2
    , currency = arg3
    , total_amount = arg4
    }

instance FromJSON Invoice where
  parseJSON = withObject "Invoice" $ \obj ->
    do
      field_0 <- requiredWith obj "title" parseJSON
      field_1 <- requiredWith obj "description" parseJSON
      field_2 <- requiredWith obj "start_parameter" parseJSON
      field_3 <- requiredWith obj "currency" parseJSON
      field_4 <- requiredWith obj "total_amount" parseInt64
      pure
        MkInvoice
          { title = field_0
          , description = field_1
          , start_parameter = field_2
          , currency = field_3
          , total_amount = field_4
          }

instance ToJSON Invoice where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "title" x.title
          , jsonField "description" x.description
          , jsonField "start_parameter" x.start_parameter
          , jsonField "currency" x.currency
          , jsonField "total_amount" x.total_amount
          ]
      )
  toEncoding = toEncoding . toJSON
