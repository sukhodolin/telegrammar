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
module Telegram.Bot.Methods.DeclineChatJoinRequest
  ( DeclineChatJoinRequest (..)
  , mkDeclineChatJoinRequest
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned)

-- | Use this method to decline a chat join request. The bot must be an administrator in the chat for this to work and must have the can_invite_users administrator right. Returns True on success.
--
-- Wire method spelling: @declineChatJoinRequest@.
--
-- Source: <https://core.telegram.org/bots/api#declinechatjoinrequest>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data DeclineChatJoinRequest = MkDeclineChatJoinRequest
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

-- | Initialize a 'DeclineChatJoinRequest' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkDeclineChatJoinRequest :: IntegerOrString -> Int64 -> DeclineChatJoinRequest
mkDeclineChatJoinRequest arg0 arg1 =
  MkDeclineChatJoinRequest
    { chat_id = arg0
    , user_id = arg1
    , extra = mempty
    }

instance Method DeclineChatJoinRequest where
  type Result DeclineChatJoinRequest = TrueValue
  methodName _ = "declineChatJoinRequest"
  planRequest x =
    planRequestBody
      "declineChatJoinRequest"
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
