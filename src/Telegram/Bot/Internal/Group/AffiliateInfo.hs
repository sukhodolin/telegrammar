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
module Telegram.Bot.Internal.Group.AffiliateInfo
  ( AffiliateInfo (..)
  , mkAffiliateInfo
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.Chat (Chat)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseInt64, requiredWith)

-- | Contains information about the affiliate that received a commission via this transaction.
--
-- Source: <https://core.telegram.org/bots/api#affiliateinfo>.
-- Codec directions: decoded from responses, encoded into requests.
data AffiliateInfo = MkAffiliateInfo
  { -- | Optional. The bot or the user that received an affiliate commission if it was received by a bot or a user
    --
    -- Wire key: @affiliate_user@.
    -- Omitted from an encoded request when it is @Nothing@.
    affiliate_user :: Maybe User
  , -- | Optional. The chat that received an affiliate commission if it was received by a chat
    --
    -- Wire key: @affiliate_chat@.
    -- Omitted from an encoded request when it is @Nothing@.
    affiliate_chat :: Maybe Chat
  , -- | The number of Telegram Stars received by the affiliate for each 1000 Telegram Stars received by the bot from referred users
    --
    -- Wire key: @commission_per_mille@.
    commission_per_mille :: Int64
  , -- | Integer amount of Telegram Stars received by the affiliate from the transaction, rounded to 0; can be negative for refunds
    --
    -- Wire key: @amount@.
    amount :: Int64
  , -- | Optional. The number of 1\/1000000000 shares of Telegram Stars received by the affiliate; from -999999999 to 999999999; can be negative for refunds
    --
    -- Wire key: @nanostar_amount@.
    -- Omitted from an encoded request when it is @Nothing@.
    nanostar_amount :: Maybe Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'AffiliateInfo' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkAffiliateInfo :: Int64 -> Int64 -> AffiliateInfo
mkAffiliateInfo arg0 arg1 =
  MkAffiliateInfo
    { affiliate_user = Nothing
    , affiliate_chat = Nothing
    , commission_per_mille = arg0
    , amount = arg1
    , nanostar_amount = Nothing
    }

instance FromJSON AffiliateInfo where
  parseJSON = withObject "AffiliateInfo" $ \obj ->
    do
      field_0 <- optionalWith obj "affiliate_user" parseJSON
      field_1 <- optionalWith obj "affiliate_chat" parseJSON
      field_2 <- requiredWith obj "commission_per_mille" parseInt64
      field_3 <- requiredWith obj "amount" parseInt64
      field_4 <- optionalWith obj "nanostar_amount" parseInt64
      pure
        MkAffiliateInfo
          { affiliate_user = field_0
          , affiliate_chat = field_1
          , commission_per_mille = field_2
          , amount = field_3
          , nanostar_amount = field_4
          }

instance ToJSON AffiliateInfo where
  toJSON x =
    jsonObject
      ( concat
          [ jsonOptional "affiliate_user" x.affiliate_user
          , jsonOptional "affiliate_chat" x.affiliate_chat
          , jsonField "commission_per_mille" x.commission_per_mille
          , jsonField "amount" x.amount
          , jsonOptional "nanostar_amount" x.nanostar_amount
          ]
      )
  toEncoding = toEncoding . toJSON
