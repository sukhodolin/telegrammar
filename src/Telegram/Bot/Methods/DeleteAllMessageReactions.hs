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
module Telegram.Bot.Methods.DeleteAllMessageReactions
  ( DeleteAllMessageReactions (..)
  , mkDeleteAllMessageReactions
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned, plannedMaybe)

-- | Use this method to remove up to 10000 recent reactions in a group or a supergroup chat added by a given user or chat. The bot must have the \'can_delete_messages\' administrator right in the chat. Returns True on success.
--
-- Wire method spelling: @deleteAllMessageReactions@.
--
-- Source: <https://core.telegram.org/bots/api#deleteallmessagereactions>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data DeleteAllMessageReactions = MkDeleteAllMessageReactions
  { -- | Unique identifier for the target chat or username of the target supergroup in the format \@username
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | Identifier of the user whose reactions will be removed, if the reactions were added by a user
    --
    -- Wire key: @user_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    user_id :: Maybe Int64
  , -- | Identifier of the chat whose reactions will be removed, if the reactions were added by a chat
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

-- | Initialize a 'DeleteAllMessageReactions' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkDeleteAllMessageReactions :: IntegerOrString -> DeleteAllMessageReactions
mkDeleteAllMessageReactions arg0 =
  MkDeleteAllMessageReactions
    { chat_id = arg0
    , user_id = Nothing
    , actor_chat_id = Nothing
    , extra = mempty
    }

instance Method DeleteAllMessageReactions where
  type Result DeleteAllMessageReactions = TrueValue
  methodName _ = "deleteAllMessageReactions"
  planRequest x =
    planRequestBody
      "deleteAllMessageReactions"
      [ "chat_id"
      , "user_id"
      , "actor_chat_id"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          , plannedMaybe "user_id" x.user_id encodeJson
          , plannedMaybe "actor_chat_id" x.actor_chat_id encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
