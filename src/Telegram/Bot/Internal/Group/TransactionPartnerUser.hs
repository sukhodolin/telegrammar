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
module Telegram.Bot.Internal.Group.TransactionPartnerUser
  ( TransactionPartnerUser (..)
  , mkTransactionPartnerUser
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.AffiliateInfo (AffiliateInfo)
import Telegram.Bot.Internal.Group.Gift (Gift)
import Telegram.Bot.Internal.Group.PaidMedia (PaidMedia)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonLiteral, jsonObject, jsonOptional, optionalWith, parseInt64, parseList, requiredWith)

-- | Describes a transaction with a user.
--
-- Source: <https://core.telegram.org/bots/api#transactionpartneruser>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"user"@.
data TransactionPartnerUser = MkTransactionPartnerUser
  { -- | Type of the transaction, currently one of \"invoice_payment\" for payments via invoices, \"paid_media_payment\" for payments for paid media, \"gift_purchase\" for gifts sent by the bot, \"premium_purchase\" for Telegram Premium subscriptions gifted by the bot, \"business_account_transfer\" for direct transfers from managed business accounts
    --
    -- Wire key: @transaction_type@.
    transaction_type :: Text
  , -- | Information about the user
    --
    -- Wire key: @user@.
    user :: User
  , -- | Optional. Information about the affiliate that received a commission via this transaction. Can be available only for \"invoice_payment\" and \"paid_media_payment\" transactions.
    --
    -- Wire key: @affiliate@.
    -- Omitted from an encoded request when it is @Nothing@.
    affiliate :: Maybe AffiliateInfo
  , -- | Optional. Bot-specified invoice payload. Can be available only for \"invoice_payment\" transactions.
    --
    -- Wire key: @invoice_payload@.
    -- Omitted from an encoded request when it is @Nothing@.
    invoice_payload :: Maybe Text
  , -- | Optional. The duration of the paid subscription. Can be available only for \"invoice_payment\" transactions.
    --
    -- Wire key: @subscription_period@.
    -- Omitted from an encoded request when it is @Nothing@.
    subscription_period :: Maybe Int64
  , -- | Optional. Information about the paid media bought by the user; for \"paid_media_payment\" transactions only
    --
    -- Wire key: @paid_media@.
    -- Omitted from an encoded request when it is @Nothing@.
    paid_media :: Maybe [PaidMedia]
  , -- | Optional. Bot-specified paid media payload. Can be available only for \"paid_media_payment\" transactions.
    --
    -- Wire key: @paid_media_payload@.
    -- Omitted from an encoded request when it is @Nothing@.
    paid_media_payload :: Maybe Text
  , -- | Optional. The gift sent to the user by the bot; for \"gift_purchase\" transactions only
    --
    -- Wire key: @gift@.
    -- Omitted from an encoded request when it is @Nothing@.
    gift :: Maybe Gift
  , -- | Optional. Number of months the gifted Telegram Premium subscription will be active for; for \"premium_purchase\" transactions only
    --
    -- Wire key: @premium_subscription_duration@.
    -- Omitted from an encoded request when it is @Nothing@.
    premium_subscription_duration :: Maybe Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'TransactionPartnerUser' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkTransactionPartnerUser :: Text -> User -> TransactionPartnerUser
mkTransactionPartnerUser arg0 arg1 =
  MkTransactionPartnerUser
    { transaction_type = arg0
    , user = arg1
    , affiliate = Nothing
    , invoice_payload = Nothing
    , subscription_period = Nothing
    , paid_media = Nothing
    , paid_media_payload = Nothing
    , gift = Nothing
    , premium_subscription_duration = Nothing
    }

instance FromJSON TransactionPartnerUser where
  parseJSON = withObject "TransactionPartnerUser" $ \obj ->
    do
      checkStringConstant obj "type" "user"
      field_1 <- requiredWith obj "transaction_type" parseJSON
      field_2 <- requiredWith obj "user" parseJSON
      field_3 <- optionalWith obj "affiliate" parseJSON
      field_4 <- optionalWith obj "invoice_payload" parseJSON
      field_5 <- optionalWith obj "subscription_period" parseInt64
      field_6 <- optionalWith obj "paid_media" (parseList parseJSON)
      field_7 <- optionalWith obj "paid_media_payload" parseJSON
      field_8 <- optionalWith obj "gift" parseJSON
      field_9 <- optionalWith obj "premium_subscription_duration" parseInt64
      pure
        MkTransactionPartnerUser
          { transaction_type = field_1
          , user = field_2
          , affiliate = field_3
          , invoice_payload = field_4
          , subscription_period = field_5
          , paid_media = field_6
          , paid_media_payload = field_7
          , gift = field_8
          , premium_subscription_duration = field_9
          }

instance ToJSON TransactionPartnerUser where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "user")
          , jsonField "transaction_type" x.transaction_type
          , jsonField "user" x.user
          , jsonOptional "affiliate" x.affiliate
          , jsonOptional "invoice_payload" x.invoice_payload
          , jsonOptional "subscription_period" x.subscription_period
          , jsonOptional "paid_media" x.paid_media
          , jsonOptional "paid_media_payload" x.paid_media_payload
          , jsonOptional "gift" x.gift
          , jsonOptional "premium_subscription_duration" x.premium_subscription_duration
          ]
      )
  toEncoding = toEncoding . toJSON
