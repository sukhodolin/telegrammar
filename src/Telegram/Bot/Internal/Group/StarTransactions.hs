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
module Telegram.Bot.Internal.Group.StarTransactions
  ( StarTransactions (..)
  , mkStarTransactions
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Telegram.Bot.Internal.Group.StarTransaction (StarTransaction)
import Telegram.Bot.Support (jsonField, jsonObject, parseList, requiredWith)

-- | Contains a list of Telegram Star transactions.
--
-- Source: <https://core.telegram.org/bots/api#startransactions>.
-- Codec directions: decoded from responses, encoded into requests.
data StarTransactions = MkStarTransactions
  { -- | The list of transactions
    --
    -- Wire key: @transactions@.
    transactions :: [StarTransaction]
  }
  deriving stock (Eq, Show)

-- | Initialize a 'StarTransactions' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkStarTransactions :: [StarTransaction] -> StarTransactions
mkStarTransactions arg0 =
  MkStarTransactions
    { transactions = arg0
    }

instance FromJSON StarTransactions where
  parseJSON = withObject "StarTransactions" $ \obj ->
    do
      field_0 <- requiredWith obj "transactions" (parseList parseJSON)
      pure
        MkStarTransactions
          { transactions = field_0
          }

instance ToJSON StarTransactions where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "transactions" x.transactions
          ]
      )
  toEncoding = toEncoding . toJSON
