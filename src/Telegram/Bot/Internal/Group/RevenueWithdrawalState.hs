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
module Telegram.Bot.Internal.Group.RevenueWithdrawalState
  ( RevenueWithdrawalState (..)
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Telegram.Bot.Internal.Group.RevenueWithdrawalStateFailed (RevenueWithdrawalStateFailed)
import Telegram.Bot.Internal.Group.RevenueWithdrawalStatePending (RevenueWithdrawalStatePending)
import Telegram.Bot.Internal.Group.RevenueWithdrawalStateSucceeded (RevenueWithdrawalStateSucceeded)
import Telegram.Bot.Support (tagField)

-- | This object describes the state of a revenue withdrawal operation. Currently, it can be one of
-- \- RevenueWithdrawalStatePending
-- \- RevenueWithdrawalStateSucceeded
-- \- RevenueWithdrawalStateFailed
--
-- Source: <https://core.telegram.org/bots/api#revenuewithdrawalstate>.
-- Codec directions: decoded from responses, encoded into requests.
data RevenueWithdrawalState
  = RevenueWithdrawalStateViaRevenueWithdrawalStateFailed RevenueWithdrawalStateFailed
  | RevenueWithdrawalStateViaRevenueWithdrawalStatePending RevenueWithdrawalStatePending
  | RevenueWithdrawalStateViaRevenueWithdrawalStateSucceeded RevenueWithdrawalStateSucceeded
  | -- | A value this decoder does not recognize, preserved verbatim so
    -- the raw payload survives the boundary.
    RevenueWithdrawalStateUnknown Value
  deriving stock (Eq, Show)

instance FromJSON RevenueWithdrawalState where
  parseJSON = withObject "RevenueWithdrawalState" $ \obj -> do
    tag_ <- tagField obj "type"
    case tag_ of
      "failed" ->
        RevenueWithdrawalStateViaRevenueWithdrawalStateFailed <$> parseJSON (Object obj)
      "pending" ->
        RevenueWithdrawalStateViaRevenueWithdrawalStatePending <$> parseJSON (Object obj)
      "succeeded" ->
        RevenueWithdrawalStateViaRevenueWithdrawalStateSucceeded <$> parseJSON (Object obj)
      _ -> pure (RevenueWithdrawalStateUnknown (Object obj))

instance ToJSON RevenueWithdrawalState where
  toJSON = \case
    RevenueWithdrawalStateViaRevenueWithdrawalStateFailed member_ -> toJSON member_
    RevenueWithdrawalStateViaRevenueWithdrawalStatePending member_ -> toJSON member_
    RevenueWithdrawalStateViaRevenueWithdrawalStateSucceeded member_ -> toJSON member_
    RevenueWithdrawalStateUnknown raw_ -> raw_
  toEncoding = toEncoding . toJSON
