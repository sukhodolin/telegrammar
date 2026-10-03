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
module Telegram.Bot.Methods.SetChatMemberTag
  ( SetChatMemberTag (..)
  , mkSetChatMemberTag
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned, plannedMaybe)

-- | Use this method to set a tag for a regular member in a group or a supergroup. The bot must be an administrator in the chat for this to work and must have the can_manage_tags administrator right. Returns True on success.
--
-- Wire method spelling: @setChatMemberTag@.
--
-- Source: <https://core.telegram.org/bots/api#setchatmembertag>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SetChatMemberTag = MkSetChatMemberTag
  { -- | Unique identifier for the target chat or username of the target supergroup in the format \@username
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | Unique identifier of the target user
    --
    -- Wire key: @user_id@.
    user_id :: Int64
  , -- | New tag for the member; 0-16 characters, emoji are not allowed
    --
    -- Wire key: @tag@.
    -- Omitted from an encoded request when it is @Nothing@.
    tag :: Maybe Text
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SetChatMemberTag' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSetChatMemberTag :: IntegerOrString -> Int64 -> SetChatMemberTag
mkSetChatMemberTag arg0 arg1 =
  MkSetChatMemberTag
    { chat_id = arg0
    , user_id = arg1
    , tag = Nothing
    , extra = mempty
    }

instance Method SetChatMemberTag where
  type Result SetChatMemberTag = TrueValue
  methodName _ = "setChatMemberTag"
  planRequest x =
    planRequestBody
      "setChatMemberTag"
      [ "chat_id"
      , "user_id"
      , "tag"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          , planned "user_id" (encodeJson x.user_id)
          , plannedMaybe "tag" x.tag encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
