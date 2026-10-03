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
module Telegram.Bot.Internal.Group.RevenueWithdrawalStateFailed
  ( RevenueWithdrawalStateFailed (..)
  , mkRevenueWithdrawalStateFailed
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Telegram.Bot.Support (checkStringConstant, jsonLiteral, jsonObject)

-- | The withdrawal failed and the transaction was refunded.
--
-- Source: <https://core.telegram.org/bots/api#revenuewithdrawalstatefailed>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"failed"@.
data RevenueWithdrawalStateFailed = MkRevenueWithdrawalStateFailed
  deriving stock (Eq, Show)

-- | Initialize a 'RevenueWithdrawalStateFailed' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRevenueWithdrawalStateFailed :: RevenueWithdrawalStateFailed
mkRevenueWithdrawalStateFailed = MkRevenueWithdrawalStateFailed

instance FromJSON RevenueWithdrawalStateFailed where
  parseJSON = withObject "RevenueWithdrawalStateFailed" $ \obj ->
    do
      checkStringConstant obj "type" "failed"
      pure MkRevenueWithdrawalStateFailed

instance ToJSON RevenueWithdrawalStateFailed where
  toJSON _ =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "failed")
          ]
      )
  toEncoding = toEncoding . toJSON
