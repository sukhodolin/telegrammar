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
module Telegram.Bot.Methods.DeleteForumTopic
  ( DeleteForumTopic (..)
  , mkDeleteForumTopic
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned)

-- | Use this method to delete a forum topic along with all its messages in a forum supergroup chat or a private chat with a user. In the case of a supergroup chat the bot must be an administrator in the chat for this to work and must have the can_delete_messages administrator rights. Returns True on success.
--
-- Wire method spelling: @deleteForumTopic@.
--
-- Source: <https://core.telegram.org/bots/api#deleteforumtopic>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data DeleteForumTopic = MkDeleteForumTopic
  { -- | Unique identifier for the target chat or username of the target supergroup in the format \@username
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | Unique identifier for the target message thread of the forum topic
    --
    -- Wire key: @message_thread_id@.
    message_thread_id :: Int64
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'DeleteForumTopic' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkDeleteForumTopic :: IntegerOrString -> Int64 -> DeleteForumTopic
mkDeleteForumTopic arg0 arg1 =
  MkDeleteForumTopic
    { chat_id = arg0
    , message_thread_id = arg1
    , extra = mempty
    }

instance Method DeleteForumTopic where
  type Result DeleteForumTopic = TrueValue
  methodName _ = "deleteForumTopic"
  planRequest x =
    planRequestBody
      "deleteForumTopic"
      [ "chat_id"
      , "message_thread_id"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          , planned "message_thread_id" (encodeJson x.message_thread_id)
          ]
      )
      x.extra
  parseResult _ = parseJSON
