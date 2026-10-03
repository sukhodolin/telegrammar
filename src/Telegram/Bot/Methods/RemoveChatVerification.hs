{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeFamilies #-}

-- | One method's request record, initializer, and result association.
--
-- Import this module qualified to update an optional parameter, which is
-- the supported idiom for a record whose field labels repeat across
-- methods.
--
-- Generated. Do not edit.
module Telegram.Bot.Methods.RemoveChatVerification
  ( RemoveChatVerification (..)
  , mkRemoveChatVerification
  ) where

import Data.Aeson (FromJSON (..), Object)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned)

-- | Removes verification from a chat that is currently verified on behalf of the organization represented by the bot. Returns True on success.
--
-- Wire method spelling: @removeChatVerification@.
--
-- Source: <https://core.telegram.org/bots/api#removechatverification>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data RemoveChatVerification = MkRemoveChatVerification
  { -- | Unique identifier for the target chat or username of the target bot or channel in the format \@username
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RemoveChatVerification' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRemoveChatVerification :: IntegerOrString -> RemoveChatVerification
mkRemoveChatVerification arg0 =
  MkRemoveChatVerification
    { chat_id = arg0
    , extra = mempty
    }

instance Method RemoveChatVerification where
  type Result RemoveChatVerification = TrueValue
  methodName _ = "removeChatVerification"
  planRequest x =
    planRequestBody
      "removeChatVerification"
      [ "chat_id"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          ]
      )
      x.extra
  parseResult _ = parseJSON
