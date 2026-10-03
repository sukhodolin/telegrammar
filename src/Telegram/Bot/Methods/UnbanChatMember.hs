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
module Telegram.Bot.Methods.UnbanChatMember
  ( UnbanChatMember (..)
  , mkUnbanChatMember
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned, plannedMaybe)

-- | Use this method to unban a previously banned user in a supergroup or channel. The user will not return to the group or channel automatically, but will be able to join via link, etc. The bot must be an administrator for this to work. By default, this method guarantees that after the call the user is not a member of the chat, but will be able to join it. So if the user is a member of the chat they will also be removed from the chat. If you don\'t want this, use the parameter only_if_banned. Returns True on success.
--
-- Wire method spelling: @unbanChatMember@.
--
-- Source: <https://core.telegram.org/bots/api#unbanchatmember>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data UnbanChatMember = MkUnbanChatMember
  { -- | Unique identifier for the target group or username of the target supergroup or channel in the format \@username
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | Unique identifier of the target user
    --
    -- Wire key: @user_id@.
    user_id :: Int64
  , -- | Do nothing if the user is not banned
    --
    -- Wire key: @only_if_banned@.
    -- Omitted from an encoded request when it is @Nothing@.
    only_if_banned :: Maybe Bool
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'UnbanChatMember' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkUnbanChatMember :: IntegerOrString -> Int64 -> UnbanChatMember
mkUnbanChatMember arg0 arg1 =
  MkUnbanChatMember
    { chat_id = arg0
    , user_id = arg1
    , only_if_banned = Nothing
    , extra = mempty
    }

instance Method UnbanChatMember where
  type Result UnbanChatMember = TrueValue
  methodName _ = "unbanChatMember"
  planRequest x =
    planRequestBody
      "unbanChatMember"
      [ "chat_id"
      , "user_id"
      , "only_if_banned"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          , planned "user_id" (encodeJson x.user_id)
          , plannedMaybe "only_if_banned" x.only_if_banned encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
