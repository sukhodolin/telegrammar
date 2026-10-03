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
module Telegram.Bot.Internal.Group.ReplyMarkup
  ( ReplyMarkup (..)
  ) where

import Data.Aeson (ToJSON (..), Value)
import Telegram.Bot.Internal.Group.ForceReply (ForceReply)
import Telegram.Bot.Internal.Group.InlineKeyboardMarkup (InlineKeyboardMarkup)
import Telegram.Bot.Internal.Group.ReplyKeyboardMarkup (ReplyKeyboardMarkup)
import Telegram.Bot.Internal.Group.ReplyKeyboardRemove (ReplyKeyboardRemove)

-- | A shared anonymous choice, interned by its resolved semantic identity.
--
-- Every occurrence with this exact member set, strategy, and resolved
-- members uses this one public type. Key digest:
-- @624f26d310de126f@.
--
-- Codec directions: encoded into requests.
data ReplyMarkup
  = ReplyMarkupViaForceReply ForceReply
  | ReplyMarkupViaInlineKeyboardMarkup InlineKeyboardMarkup
  | ReplyMarkupViaReplyKeyboardMarkup ReplyKeyboardMarkup
  | ReplyMarkupViaReplyKeyboardRemove ReplyKeyboardRemove
  | -- | A value this decoder does not recognize, preserved verbatim so
    -- the raw payload survives the boundary.
    ReplyMarkupUnknown Value
  deriving stock (Eq, Show)

instance ToJSON ReplyMarkup where
  toJSON = \case
    ReplyMarkupViaForceReply member_ -> toJSON member_
    ReplyMarkupViaInlineKeyboardMarkup member_ -> toJSON member_
    ReplyMarkupViaReplyKeyboardMarkup member_ -> toJSON member_
    ReplyMarkupViaReplyKeyboardRemove member_ -> toJSON member_
    ReplyMarkupUnknown raw_ -> raw_
  toEncoding = toEncoding . toJSON
