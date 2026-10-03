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
module Telegram.Bot.Methods.ApproveChatJoinRequest
  ( ApproveChatJoinRequest (..)
  , mkApproveChatJoinRequest
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned)

-- | Use this method to approve a chat join request. The bot must be an administrator in the chat for this to work and must have the can_invite_users administrator right. Returns True on success.
--
-- Wire method spelling: @approveChatJoinRequest@.
--
-- Source: <https://core.telegram.org/bots/api#approvechatjoinrequest>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data ApproveChatJoinRequest = MkApproveChatJoinRequest
  { -- | Unique identifier for the target chat or username of the target channel in the format \@username
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | Unique identifier of the target user
    --
    -- Wire key: @user_id@.
    user_id :: Int64
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ApproveChatJoinRequest' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkApproveChatJoinRequest :: IntegerOrString -> Int64 -> ApproveChatJoinRequest
mkApproveChatJoinRequest arg0 arg1 =
  MkApproveChatJoinRequest
    { chat_id = arg0
    , user_id = arg1
    , extra = mempty
    }

instance Method ApproveChatJoinRequest where
  type Result ApproveChatJoinRequest = TrueValue
  methodName _ = "approveChatJoinRequest"
  planRequest x =
    planRequestBody
      "approveChatJoinRequest"
      [ "chat_id"
      , "user_id"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          , planned "user_id" (encodeJson x.user_id)
          ]
      )
      x.extra
  parseResult _ = parseJSON
