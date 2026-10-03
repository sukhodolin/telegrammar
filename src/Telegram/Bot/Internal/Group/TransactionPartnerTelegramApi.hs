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
module Telegram.Bot.Internal.Group.TransactionPartnerTelegramApi
  ( TransactionPartnerTelegramApi (..)
  , mkTransactionPartnerTelegramApi
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonLiteral, jsonObject, parseInt64, requiredWith)

-- | Describes a transaction with payment for paid broadcasting.
--
-- Source: <https://core.telegram.org/bots/api#transactionpartnertelegramapi>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"telegram_api"@.
data TransactionPartnerTelegramApi = MkTransactionPartnerTelegramApi
  { -- | The number of successful requests that exceeded regular limits and were therefore billed
    --
    -- Wire key: @request_count@.
    request_count :: Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'TransactionPartnerTelegramApi' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkTransactionPartnerTelegramApi :: Int64 -> TransactionPartnerTelegramApi
mkTransactionPartnerTelegramApi arg0 =
  MkTransactionPartnerTelegramApi
    { request_count = arg0
    }

instance FromJSON TransactionPartnerTelegramApi where
  parseJSON = withObject "TransactionPartnerTelegramApi" $ \obj ->
    do
      checkStringConstant obj "type" "telegram_api"
      field_1 <- requiredWith obj "request_count" parseInt64
      pure
        MkTransactionPartnerTelegramApi
          { request_count = field_1
          }

instance ToJSON TransactionPartnerTelegramApi where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "telegram_api")
          , jsonField "request_count" x.request_count
          ]
      )
  toEncoding = toEncoding . toJSON
