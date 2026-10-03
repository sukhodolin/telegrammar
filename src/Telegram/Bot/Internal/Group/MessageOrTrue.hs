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
module Telegram.Bot.Internal.Group.MessageOrTrue
  ( MessageOrTrue (..)
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..))
import Telegram.Bot.Internal.Group.ChecklistTasksAdded (Message)
import Telegram.Bot.Support (TrueValue, describeValue)

-- | A shared anonymous choice, interned by its resolved semantic identity.
--
-- Every occurrence with this exact member set, strategy, and resolved
-- members uses this one public type. Key digest:
-- @3eef4af5436ef500@.
--
-- Codec directions: decoded from responses, encoded into requests.
data MessageOrTrue
  = MessageOrTrueViaTrue TrueValue
  | MessageOrTrueViaMessage Message
  | -- | A value this decoder does not recognize, preserved verbatim so
    -- the raw payload survives the boundary.
    MessageOrTrueUnknown Value
  deriving stock (Eq, Show)

instance FromJSON MessageOrTrue where
  parseJSON value_ = case value_ of
    Bool _ ->
      MessageOrTrueViaTrue <$> parseJSON value_
    Object _ ->
      MessageOrTrueViaMessage <$> parseJSON value_
    other_ ->
      fail ("MessageOrTrue: unsupported JSON kind, got " <> describeValue other_)

instance ToJSON MessageOrTrue where
  toJSON = \case
    MessageOrTrueViaTrue member_ -> toJSON member_
    MessageOrTrueViaMessage member_ -> toJSON member_
    MessageOrTrueUnknown raw_ -> raw_
  toEncoding = toEncoding . toJSON
