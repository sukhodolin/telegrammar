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
module Telegram.Bot.Internal.Group.StarAmount
  ( StarAmount (..)
  , mkStarAmount
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseInt64, requiredWith)

-- | Describes an amount of Telegram Stars.
--
-- Source: <https://core.telegram.org/bots/api#staramount>.
-- Codec directions: decoded from responses, encoded into requests.
data StarAmount = MkStarAmount
  { -- | Integer amount of Telegram Stars, rounded to 0; can be negative
    --
    -- Wire key: @amount@.
    amount :: Int64
  , -- | Optional. The number of 1\/1000000000 shares of Telegram Stars; from -999999999 to 999999999; can be negative if and only if amount is non-positive
    --
    -- Wire key: @nanostar_amount@.
    -- Omitted from an encoded request when it is @Nothing@.
    nanostar_amount :: Maybe Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'StarAmount' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkStarAmount :: Int64 -> StarAmount
mkStarAmount arg0 =
  MkStarAmount
    { amount = arg0
    , nanostar_amount = Nothing
    }

instance FromJSON StarAmount where
  parseJSON = withObject "StarAmount" $ \obj ->
    do
      field_0 <- requiredWith obj "amount" parseInt64
      field_1 <- optionalWith obj "nanostar_amount" parseInt64
      pure
        MkStarAmount
          { amount = field_0
          , nanostar_amount = field_1
          }

instance ToJSON StarAmount where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "amount" x.amount
          , jsonOptional "nanostar_amount" x.nanostar_amount
          ]
      )
  toEncoding = toEncoding . toJSON
