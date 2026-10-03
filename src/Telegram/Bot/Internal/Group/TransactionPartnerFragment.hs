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
module Telegram.Bot.Internal.Group.TransactionPartnerFragment
  ( TransactionPartnerFragment (..)
  , mkTransactionPartnerFragment
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Telegram.Bot.Internal.Group.RevenueWithdrawalState (RevenueWithdrawalState)
import Telegram.Bot.Support (checkStringConstant, jsonLiteral, jsonObject, jsonOptional, optionalWith)

-- | Describes a withdrawal transaction with Fragment.
--
-- Source: <https://core.telegram.org/bots/api#transactionpartnerfragment>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"fragment"@.
data TransactionPartnerFragment = MkTransactionPartnerFragment
  { -- | Optional. State of the transaction if the transaction is outgoing
    --
    -- Wire key: @withdrawal_state@.
    -- Omitted from an encoded request when it is @Nothing@.
    withdrawal_state :: Maybe RevenueWithdrawalState
  }
  deriving stock (Eq, Show)

-- | Initialize a 'TransactionPartnerFragment' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkTransactionPartnerFragment :: TransactionPartnerFragment
mkTransactionPartnerFragment =
  MkTransactionPartnerFragment
    { withdrawal_state = Nothing
    }

instance FromJSON TransactionPartnerFragment where
  parseJSON = withObject "TransactionPartnerFragment" $ \obj ->
    do
      checkStringConstant obj "type" "fragment"
      field_1 <- optionalWith obj "withdrawal_state" parseJSON
      pure
        MkTransactionPartnerFragment
          { withdrawal_state = field_1
          }

instance ToJSON TransactionPartnerFragment where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "fragment")
          , jsonOptional "withdrawal_state" x.withdrawal_state
          ]
      )
  toEncoding = toEncoding . toJSON
