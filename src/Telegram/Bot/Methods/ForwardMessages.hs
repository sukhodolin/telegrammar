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
module Telegram.Bot.Methods.ForwardMessages
  ( ForwardMessages (..)
  , mkForwardMessages
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Internal.Group.MessageId (MessageId)
import Telegram.Bot.Support (Method (..), encodeJson, parseList, planList, planRequestBody, planned, plannedMaybe, validateArrayCount, withValidation)

-- | Use this method to forward multiple messages of any kind. If some of the specified messages can\'t be found or forwarded, they are skipped. Service messages and messages with protected content can\'t be forwarded. Album grouping is kept for forwarded messages. On success, an Array of MessageId of the sent messages is returned.
--
-- Wire method spelling: @forwardMessages@.
--
-- Source: <https://core.telegram.org/bots/api#forwardmessages>.
-- Result: @[MessageId]@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data ForwardMessages = MkForwardMessages
  { -- | Unique identifier for the target chat or username of the target bot, supergroup or channel in the format \@username
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | Unique identifier for the target message thread (topic) of a forum; for forum supergroups and private chats of bots with forum topic mode enabled only
    --
    -- Wire key: @message_thread_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    message_thread_id :: Maybe Int64
  , -- | Identifier of the direct messages topic to which the messages will be forwarded; required if the messages are forwarded to a direct messages chat
    --
    -- Wire key: @direct_messages_topic_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    direct_messages_topic_id :: Maybe Int64
  , -- | Unique identifier for the chat where the original messages were sent (or username of the target bot, supergroup or channel in the format \@username)
    --
    -- Wire key: @from_chat_id@.
    from_chat_id :: IntegerOrString
  , -- | A JSON-serialized list of 1-100 identifiers of messages in the chat from_chat_id to forward. The identifiers must be specified in a strictly increasing order.
    --
    -- Wire key: @message_ids@.
    -- Checked when planning a request: 1 to 100 elements.
    message_ids :: [Int64]
  , -- | Sends the messages silently. Users will receive a notification with no sound.
    --
    -- Wire key: @disable_notification@.
    -- Omitted from an encoded request when it is @Nothing@.
    disable_notification :: Maybe Bool
  , -- | Protects the contents of the forwarded messages from forwarding and saving
    --
    -- Wire key: @protect_content@.
    -- Omitted from an encoded request when it is @Nothing@.
    protect_content :: Maybe Bool
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ForwardMessages' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkForwardMessages :: IntegerOrString -> IntegerOrString -> [Int64] -> ForwardMessages
mkForwardMessages arg0 arg1 arg2 =
  MkForwardMessages
    { chat_id = arg0
    , message_thread_id = Nothing
    , direct_messages_topic_id = Nothing
    , from_chat_id = arg1
    , message_ids = arg2
    , disable_notification = Nothing
    , protect_content = Nothing
    , extra = mempty
    }

instance Method ForwardMessages where
  type Result ForwardMessages = [MessageId]
  methodName _ = "forwardMessages"
  planRequest x =
    planRequestBody
      "forwardMessages"
      [ "chat_id"
      , "message_thread_id"
      , "direct_messages_topic_id"
      , "from_chat_id"
      , "message_ids"
      , "disable_notification"
      , "protect_content"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          , plannedMaybe "message_thread_id" x.message_thread_id encodeJson
          , plannedMaybe "direct_messages_topic_id" x.direct_messages_topic_id encodeJson
          , planned "from_chat_id" (encodeJson x.from_chat_id)
          , planned "message_ids" (withValidation (\loc_ -> validateArrayCount (Just 1) (Just 100) loc_ x.message_ids) ((planList encodeJson) x.message_ids))
          , plannedMaybe "disable_notification" x.disable_notification encodeJson
          , plannedMaybe "protect_content" x.protect_content encodeJson
          ]
      )
      x.extra
  parseResult _ = (parseList parseJSON)
