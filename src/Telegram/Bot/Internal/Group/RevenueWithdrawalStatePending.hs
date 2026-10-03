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
module Telegram.Bot.Internal.Group.RevenueWithdrawalStatePending
  ( RevenueWithdrawalStatePending (..)
  , mkRevenueWithdrawalStatePending
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Telegram.Bot.Support (checkStringConstant, jsonLiteral, jsonObject)

-- | The withdrawal is in progress.
--
-- Source: <https://core.telegram.org/bots/api#revenuewithdrawalstatepending>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"pending"@.
data RevenueWithdrawalStatePending = MkRevenueWithdrawalStatePending
  deriving stock (Eq, Show)

-- | Initialize a 'RevenueWithdrawalStatePending' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRevenueWithdrawalStatePending :: RevenueWithdrawalStatePending
mkRevenueWithdrawalStatePending = MkRevenueWithdrawalStatePending

instance FromJSON RevenueWithdrawalStatePending where
  parseJSON = withObject "RevenueWithdrawalStatePending" $ \obj ->
    do
      checkStringConstant obj "type" "pending"
      pure MkRevenueWithdrawalStatePending

instance ToJSON RevenueWithdrawalStatePending where
  toJSON _ =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "pending")
          ]
      )
  toEncoding = toEncoding . toJSON
