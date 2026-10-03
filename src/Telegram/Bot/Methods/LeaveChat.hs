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
module Telegram.Bot.Methods.LeaveChat
  ( LeaveChat (..)
  , mkLeaveChat
  ) where

import Data.Aeson (FromJSON (..), Object)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned)

-- | Use this method for your bot to leave a group, supergroup or channel. Returns True on success.
--
-- Wire method spelling: @leaveChat@.
--
-- Source: <https://core.telegram.org/bots/api#leavechat>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data LeaveChat = MkLeaveChat
  { -- | Unique identifier for the target chat or username of the target supergroup or channel in the format \@username. Channel direct messages chats aren\'t supported; leave the corresponding channel instead.
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'LeaveChat' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkLeaveChat :: IntegerOrString -> LeaveChat
mkLeaveChat arg0 =
  MkLeaveChat
    { chat_id = arg0
    , extra = mempty
    }

instance Method LeaveChat where
  type Result LeaveChat = TrueValue
  methodName _ = "leaveChat"
  planRequest x =
    planRequestBody
      "leaveChat"
      [ "chat_id"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          ]
      )
      x.extra
  parseResult _ = parseJSON
