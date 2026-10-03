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
module Telegram.Bot.Internal.Group.SuggestedPostPrice
  ( SuggestedPostPrice (..)
  , mkSuggestedPostPrice
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonObject, parseInt64, requiredWith)

-- | Describes the price of a suggested post.
--
-- Source: <https://core.telegram.org/bots/api#suggestedpostprice>.
-- Codec directions: decoded from responses, encoded into requests.
data SuggestedPostPrice = MkSuggestedPostPrice
  { -- | Currency in which the post will be paid. Currently, must be one of \"XTR\" for Telegram Stars or \"TON\" for TON grams.
    --
    -- Wire key: @currency@.
    currency :: Text
  , -- | The amount of the currency that will be paid for the post in the smallest units of the currency, i.e. Telegram Stars or nanograms. Currently, price in Telegram Stars must be between 5 and 100000, and price in nanograms must be between 10000000 and 10000000000000.
    --
    -- Wire key: @amount@.
    amount :: Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SuggestedPostPrice' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSuggestedPostPrice :: Text -> Int64 -> SuggestedPostPrice
mkSuggestedPostPrice arg0 arg1 =
  MkSuggestedPostPrice
    { currency = arg0
    , amount = arg1
    }

instance FromJSON SuggestedPostPrice where
  parseJSON = withObject "SuggestedPostPrice" $ \obj ->
    do
      field_0 <- requiredWith obj "currency" parseJSON
      field_1 <- requiredWith obj "amount" parseInt64
      pure
        MkSuggestedPostPrice
          { currency = field_0
          , amount = field_1
          }

instance ToJSON SuggestedPostPrice where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "currency" x.currency
          , jsonField "amount" x.amount
          ]
      )
  toEncoding = toEncoding . toJSON
