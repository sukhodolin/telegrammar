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
module Telegram.Bot.Internal.Group.TransactionPartnerAffiliateProgram
  ( TransactionPartnerAffiliateProgram (..)
  , mkTransactionPartnerAffiliateProgram
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonLiteral, jsonObject, jsonOptional, optionalWith, parseInt64, requiredWith)

-- | Describes the affiliate program that issued the affiliate commission received via this transaction.
--
-- Source: <https://core.telegram.org/bots/api#transactionpartneraffiliateprogram>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"affiliate_program"@.
data TransactionPartnerAffiliateProgram = MkTransactionPartnerAffiliateProgram
  { -- | Optional. Information about the bot that sponsored the affiliate program
    --
    -- Wire key: @sponsor_user@.
    -- Omitted from an encoded request when it is @Nothing@.
    sponsor_user :: Maybe User
  , -- | The number of Telegram Stars received by the bot for each 1000 Telegram Stars received by the affiliate program sponsor from referred users
    --
    -- Wire key: @commission_per_mille@.
    commission_per_mille :: Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'TransactionPartnerAffiliateProgram' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkTransactionPartnerAffiliateProgram :: Int64 -> TransactionPartnerAffiliateProgram
mkTransactionPartnerAffiliateProgram arg0 =
  MkTransactionPartnerAffiliateProgram
    { sponsor_user = Nothing
    , commission_per_mille = arg0
    }

instance FromJSON TransactionPartnerAffiliateProgram where
  parseJSON = withObject "TransactionPartnerAffiliateProgram" $ \obj ->
    do
      checkStringConstant obj "type" "affiliate_program"
      field_1 <- optionalWith obj "sponsor_user" parseJSON
      field_2 <- requiredWith obj "commission_per_mille" parseInt64
      pure
        MkTransactionPartnerAffiliateProgram
          { sponsor_user = field_1
          , commission_per_mille = field_2
          }

instance ToJSON TransactionPartnerAffiliateProgram where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "affiliate_program")
          , jsonOptional "sponsor_user" x.sponsor_user
          , jsonField "commission_per_mille" x.commission_per_mille
          ]
      )
  toEncoding = toEncoding . toJSON
