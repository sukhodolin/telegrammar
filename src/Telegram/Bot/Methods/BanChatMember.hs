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
module Telegram.Bot.Methods.BanChatMember
  ( BanChatMember (..)
  , mkBanChatMember
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned, plannedMaybe)

-- | Use this method to ban a user in a group, a supergroup or a channel. In the case of supergroups and channels, the user will not be able to return to the chat on their own using invite links, etc., unless unbanned first. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns True on success.
--
-- Wire method spelling: @banChatMember@.
--
-- Source: <https://core.telegram.org/bots/api#banchatmember>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data BanChatMember = MkBanChatMember
  { -- | Unique identifier for the target group or username of the target supergroup or channel in the format \@username
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | Unique identifier of the target user
    --
    -- Wire key: @user_id@.
    user_id :: Int64
  , -- | Date when the user will be unbanned; Unix time. If user is banned for more than 366 days or less than 30 seconds from the current time they are considered to be banned forever. Applied for supergroups and channels only.
    --
    -- Wire key: @until_date@.
    -- Omitted from an encoded request when it is @Nothing@.
    until_date :: Maybe Int64
  , -- | Pass True to delete all messages from the chat for the user that is being removed. If False, the user will be able to see messages in the group that were sent before the user was removed. Always True for supergroups and channels.
    --
    -- Wire key: @revoke_messages@.
    -- Omitted from an encoded request when it is @Nothing@.
    revoke_messages :: Maybe Bool
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'BanChatMember' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkBanChatMember :: IntegerOrString -> Int64 -> BanChatMember
mkBanChatMember arg0 arg1 =
  MkBanChatMember
    { chat_id = arg0
    , user_id = arg1
    , until_date = Nothing
    , revoke_messages = Nothing
    , extra = mempty
    }

instance Method BanChatMember where
  type Result BanChatMember = TrueValue
  methodName _ = "banChatMember"
  planRequest x =
    planRequestBody
      "banChatMember"
      [ "chat_id"
      , "user_id"
      , "until_date"
      , "revoke_messages"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          , planned "user_id" (encodeJson x.user_id)
          , plannedMaybe "until_date" x.until_date encodeJson
          , plannedMaybe "revoke_messages" x.revoke_messages encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
