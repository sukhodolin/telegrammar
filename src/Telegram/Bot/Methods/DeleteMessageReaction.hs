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
module Telegram.Bot.Methods.DeleteMessageReaction
  ( DeleteMessageReaction (..)
  , mkDeleteMessageReaction
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned, plannedMaybe)

-- | Use this method to remove a reaction from a message in a group or a supergroup chat. The bot must have the \'can_delete_messages\' administrator right in the chat. Returns True on success.
--
-- Wire method spelling: @deleteMessageReaction@.
--
-- Source: <https://core.telegram.org/bots/api#deletemessagereaction>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data DeleteMessageReaction = MkDeleteMessageReaction
  { -- | Unique identifier for the target chat or username of the target supergroup in the format \@username
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | Identifier of the target message
    --
    -- Wire key: @message_id@.
    message_id :: Int64
  , -- | Identifier of the user whose reaction will be removed, if the reaction was added by a user
    --
    -- Wire key: @user_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    user_id :: Maybe Int64
  , -- | Identifier of the chat whose reaction will be removed, if the reaction was added by a chat
    --
    -- Wire key: @actor_chat_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    actor_chat_id :: Maybe Int64
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'DeleteMessageReaction' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkDeleteMessageReaction :: IntegerOrString -> Int64 -> DeleteMessageReaction
mkDeleteMessageReaction arg0 arg1 =
  MkDeleteMessageReaction
    { chat_id = arg0
    , message_id = arg1
    , user_id = Nothing
    , actor_chat_id = Nothing
    , extra = mempty
    }

instance Method DeleteMessageReaction where
  type Result DeleteMessageReaction = TrueValue
  methodName _ = "deleteMessageReaction"
  planRequest x =
    planRequestBody
      "deleteMessageReaction"
      [ "chat_id"
      , "message_id"
      , "user_id"
      , "actor_chat_id"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          , planned "message_id" (encodeJson x.message_id)
          , plannedMaybe "user_id" x.user_id encodeJson
          , plannedMaybe "actor_chat_id" x.actor_chat_id encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
