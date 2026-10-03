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
module Telegram.Bot.Internal.Group.IntegerOrString
  ( IntegerOrString (..)
  ) where

import Data.Aeson (ToJSON (..), Value)
import Data.Int (Int64)
import Data.Text (Text)

-- | A shared anonymous choice, interned by its resolved semantic identity.
--
-- Every occurrence with this exact member set, strategy, and resolved
-- members uses this one public type. Key digest:
-- @543f8c60b9ae9974@.
--
-- Codec directions: encoded into requests.
data IntegerOrString
  = IntegerOrStringViaInteger Int64
  | IntegerOrStringViaString Text
  | -- | A value this decoder does not recognize, preserved verbatim so
    -- the raw payload survives the boundary.
    IntegerOrStringUnknown Value
  deriving stock (Eq, Show)

instance ToJSON IntegerOrString where
  toJSON = \case
    IntegerOrStringViaInteger member_ -> toJSON member_
    IntegerOrStringViaString member_ -> toJSON member_
    IntegerOrStringUnknown raw_ -> raw_
  toEncoding = toEncoding . toJSON
