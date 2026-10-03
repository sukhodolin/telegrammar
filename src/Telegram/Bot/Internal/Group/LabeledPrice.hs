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
module Telegram.Bot.Internal.Group.LabeledPrice
  ( LabeledPrice (..)
  , mkLabeledPrice
  ) where

import Data.Aeson (ToJSON (..))
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonObject)

-- | This object represents a portion of the price for goods or services.
--
-- Source: <https://core.telegram.org/bots/api#labeledprice>.
-- Codec directions: encoded into requests.
data LabeledPrice = MkLabeledPrice
  { -- | Portion label
    --
    -- Wire key: @label@.
    label :: Text
  , -- | Price of the product in the smallest units of the currency (integer, not float\/double). For example, for a price of US$ 1.45 pass amount = 145. See the exp parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies).
    --
    -- Wire key: @amount@.
    amount :: Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'LabeledPrice' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkLabeledPrice :: Text -> Int64 -> LabeledPrice
mkLabeledPrice arg0 arg1 =
  MkLabeledPrice
    { label = arg0
    , amount = arg1
    }

instance ToJSON LabeledPrice where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "label" x.label
          , jsonField "amount" x.amount
          ]
      )
  toEncoding = toEncoding . toJSON
