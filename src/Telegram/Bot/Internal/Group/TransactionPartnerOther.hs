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
module Telegram.Bot.Internal.Group.TransactionPartnerOther
  ( TransactionPartnerOther (..)
  , mkTransactionPartnerOther
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Telegram.Bot.Support (checkStringConstant, jsonLiteral, jsonObject)

-- | Describes a transaction with an unknown source or recipient.
--
-- Source: <https://core.telegram.org/bots/api#transactionpartnerother>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"other"@.
data TransactionPartnerOther = MkTransactionPartnerOther
  deriving stock (Eq, Show)

-- | Initialize a 'TransactionPartnerOther' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkTransactionPartnerOther :: TransactionPartnerOther
mkTransactionPartnerOther = MkTransactionPartnerOther

instance FromJSON TransactionPartnerOther where
  parseJSON = withObject "TransactionPartnerOther" $ \obj ->
    do
      checkStringConstant obj "type" "other"
      pure MkTransactionPartnerOther

instance ToJSON TransactionPartnerOther where
  toJSON _ =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "other")
          ]
      )
  toEncoding = toEncoding . toJSON
