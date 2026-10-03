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
module Telegram.Bot.Internal.Group.RevenueWithdrawalStateSucceeded
  ( RevenueWithdrawalStateSucceeded (..)
  , mkRevenueWithdrawalStateSucceeded
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonLiteral, jsonObject, parseInt64, requiredWith)

-- | The withdrawal succeeded.
--
-- Source: <https://core.telegram.org/bots/api#revenuewithdrawalstatesucceeded>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"succeeded"@.
data RevenueWithdrawalStateSucceeded = MkRevenueWithdrawalStateSucceeded
  { -- | Date the withdrawal was completed in Unix time
    --
    -- Wire key: @date@.
    date :: Int64
  , -- | An HTTPS URL that can be used to see transaction details
    --
    -- Wire key: @url@.
    url :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RevenueWithdrawalStateSucceeded' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRevenueWithdrawalStateSucceeded :: Int64 -> Text -> RevenueWithdrawalStateSucceeded
mkRevenueWithdrawalStateSucceeded arg0 arg1 =
  MkRevenueWithdrawalStateSucceeded
    { date = arg0
    , url = arg1
    }

instance FromJSON RevenueWithdrawalStateSucceeded where
  parseJSON = withObject "RevenueWithdrawalStateSucceeded" $ \obj ->
    do
      checkStringConstant obj "type" "succeeded"
      field_1 <- requiredWith obj "date" parseInt64
      field_2 <- requiredWith obj "url" parseJSON
      pure
        MkRevenueWithdrawalStateSucceeded
          { date = field_1
          , url = field_2
          }

instance ToJSON RevenueWithdrawalStateSucceeded where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "succeeded")
          , jsonField "date" x.date
          , jsonField "url" x.url
          ]
      )
  toEncoding = toEncoding . toJSON
