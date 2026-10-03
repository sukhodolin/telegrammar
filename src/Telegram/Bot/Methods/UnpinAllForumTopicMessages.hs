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
module Telegram.Bot.Methods.UnpinAllForumTopicMessages
  ( UnpinAllForumTopicMessages (..)
  , mkUnpinAllForumTopicMessages
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned)

-- | Use this method to clear the list of pinned messages in a forum topic in a forum supergroup chat or a private chat with a user. In the case of a supergroup chat the bot must be an administrator in the chat for this to work and must have the can_pin_messages administrator right in the supergroup. Returns True on success.
--
-- Wire method spelling: @unpinAllForumTopicMessages@.
--
-- Source: <https://core.telegram.org/bots/api#unpinallforumtopicmessages>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data UnpinAllForumTopicMessages = MkUnpinAllForumTopicMessages
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

-- | Initialize a 'UnpinAllForumTopicMessages' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkUnpinAllForumTopicMessages :: IntegerOrString -> Int64 -> UnpinAllForumTopicMessages
mkUnpinAllForumTopicMessages arg0 arg1 =
  MkUnpinAllForumTopicMessages
    { chat_id = arg0
    , message_thread_id = arg1
    , extra = mempty
    }

instance Method UnpinAllForumTopicMessages where
  type Result UnpinAllForumTopicMessages = TrueValue
  methodName _ = "unpinAllForumTopicMessages"
  planRequest x =
    planRequestBody
      "unpinAllForumTopicMessages"
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
