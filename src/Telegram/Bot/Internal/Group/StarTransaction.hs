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
module Telegram.Bot.Internal.Group.StarTransaction
  ( StarTransaction (..)
  , mkStarTransaction
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.TransactionPartner (TransactionPartner)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseInt64, requiredWith)

-- | Describes a Telegram Star transaction. Note that if the buyer initiates a chargeback with the payment provider from whom they acquired Stars (e.g., Apple, Google) following this transaction, the refunded Stars will be deducted from the bot\'s balance. This is outside of Telegram\'s control.
--
-- Source: <https://core.telegram.org/bots/api#startransaction>.
-- Codec directions: decoded from responses, encoded into requests.
data StarTransaction = MkStarTransaction
  { -- | Unique identifier of the transaction. Coincides with the identifier of the original transaction for refund transactions. Coincides with SuccessfulPayment.telegram_payment_charge_id for successful incoming payments from users.
    --
    -- Wire key: @id@.
    id :: Text
  , -- | Integer amount of Telegram Stars transferred by the transaction
    --
    -- Wire key: @amount@.
    amount :: Int64
  , -- | Optional. The number of 1\/1000000000 shares of Telegram Stars transferred by the transaction; from 0 to 999999999
    --
    -- Wire key: @nanostar_amount@.
    -- Omitted from an encoded request when it is @Nothing@.
    nanostar_amount :: Maybe Int64
  , -- | Date the transaction was created in Unix time
    --
    -- Wire key: @date@.
    date :: Int64
  , -- | Optional. Source of an incoming transaction (e.g., a user purchasing goods or services, Fragment refunding a failed withdrawal). Only for incoming transactions.
    --
    -- Wire key: @source@.
    -- Omitted from an encoded request when it is @Nothing@.
    source :: Maybe TransactionPartner
  , -- | Optional. Receiver of an outgoing transaction (e.g., a user for a purchase refund, Fragment for a withdrawal). Only for outgoing transactions.
    --
    -- Wire key: @receiver@.
    -- Omitted from an encoded request when it is @Nothing@.
    receiver :: Maybe TransactionPartner
  }
  deriving stock (Eq, Show)

-- | Initialize a 'StarTransaction' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkStarTransaction :: Text -> Int64 -> Int64 -> StarTransaction
mkStarTransaction arg0 arg1 arg2 =
  MkStarTransaction
    { id = arg0
    , amount = arg1
    , nanostar_amount = Nothing
    , date = arg2
    , source = Nothing
    , receiver = Nothing
    }

instance FromJSON StarTransaction where
  parseJSON = withObject "StarTransaction" $ \obj ->
    do
      field_0 <- requiredWith obj "id" parseJSON
      field_1 <- requiredWith obj "amount" parseInt64
      field_2 <- optionalWith obj "nanostar_amount" parseInt64
      field_3 <- requiredWith obj "date" parseInt64
      field_4 <- optionalWith obj "source" parseJSON
      field_5 <- optionalWith obj "receiver" parseJSON
      pure
        MkStarTransaction
          { id = field_0
          , amount = field_1
          , nanostar_amount = field_2
          , date = field_3
          , source = field_4
          , receiver = field_5
          }

instance ToJSON StarTransaction where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "id" x.id
          , jsonField "amount" x.amount
          , jsonOptional "nanostar_amount" x.nanostar_amount
          , jsonField "date" x.date
          , jsonOptional "source" x.source
          , jsonOptional "receiver" x.receiver
          ]
      )
  toEncoding = toEncoding . toJSON
