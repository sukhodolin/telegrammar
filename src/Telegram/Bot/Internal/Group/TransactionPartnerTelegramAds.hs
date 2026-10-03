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
module Telegram.Bot.Internal.Group.TransactionPartnerTelegramAds
  ( TransactionPartnerTelegramAds (..)
  , mkTransactionPartnerTelegramAds
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Telegram.Bot.Support (checkStringConstant, jsonLiteral, jsonObject)

-- | Describes a withdrawal transaction to the Telegram Ads platform.
--
-- Source: <https://core.telegram.org/bots/api#transactionpartnertelegramads>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"telegram_ads"@.
data TransactionPartnerTelegramAds = MkTransactionPartnerTelegramAds
  deriving stock (Eq, Show)

-- | Initialize a 'TransactionPartnerTelegramAds' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkTransactionPartnerTelegramAds :: TransactionPartnerTelegramAds
mkTransactionPartnerTelegramAds = MkTransactionPartnerTelegramAds

instance FromJSON TransactionPartnerTelegramAds where
  parseJSON = withObject "TransactionPartnerTelegramAds" $ \obj ->
    do
      checkStringConstant obj "type" "telegram_ads"
      pure MkTransactionPartnerTelegramAds

instance ToJSON TransactionPartnerTelegramAds where
  toJSON _ =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "telegram_ads")
          ]
      )
  toEncoding = toEncoding . toJSON
