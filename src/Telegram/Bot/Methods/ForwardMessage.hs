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
module Telegram.Bot.Methods.ForwardMessage
  ( ForwardMessage (..)
  , mkForwardMessage
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.ChecklistTasksAdded (Message)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Internal.Group.SuggestedPostParameters (SuggestedPostParameters)
import Telegram.Bot.Support (Method (..), encodeJson, planRequestBody, planned, plannedMaybe)

-- | Use this method to forward messages of any kind. Service messages and messages with protected content can\'t be forwarded. On success, the sent Message is returned.
--
-- Wire method spelling: @forwardMessage@.
--
-- Source: <https://core.telegram.org/bots/api#forwardmessage>.
-- Result: @Message@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data ForwardMessage = MkForwardMessage
  { -- | Unique identifier for the target chat or username of the target bot, supergroup or channel in the format \@username
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | Unique identifier for the target message thread (topic) of a forum; for forum supergroups and private chats of bots with forum topic mode enabled only
    --
    -- Wire key: @message_thread_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    message_thread_id :: Maybe Int64
  , -- | Identifier of the direct messages topic to which the message will be forwarded; required if the message is forwarded to a direct messages chat
    --
    -- Wire key: @direct_messages_topic_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    direct_messages_topic_id :: Maybe Int64
  , -- | Unique identifier for the chat where the original message was sent (or username of the target bot, supergroup or channel in the format \@username)
    --
    -- Wire key: @from_chat_id@.
    from_chat_id :: IntegerOrString
  , -- | New start timestamp for the forwarded video in the message
    --
    -- Wire key: @video_start_timestamp@.
    -- Omitted from an encoded request when it is @Nothing@.
    video_start_timestamp :: Maybe Int64
  , -- | Sends the message silently. Users will receive a notification with no sound.
    --
    -- Wire key: @disable_notification@.
    -- Omitted from an encoded request when it is @Nothing@.
    disable_notification :: Maybe Bool
  , -- | Protects the contents of the forwarded message from forwarding and saving
    --
    -- Wire key: @protect_content@.
    -- Omitted from an encoded request when it is @Nothing@.
    protect_content :: Maybe Bool
  , -- | Unique identifier of the message effect to be added to the message; only available when forwarding to private chats
    --
    -- Wire key: @message_effect_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    message_effect_id :: Maybe Text
  , -- | A JSON-serialized object containing the parameters of the suggested post to send; for direct messages chats only
    --
    -- Wire key: @suggested_post_parameters@.
    -- Omitted from an encoded request when it is @Nothing@.
    suggested_post_parameters :: Maybe SuggestedPostParameters
  , -- | Message identifier in the chat specified in from_chat_id
    --
    -- Wire key: @message_id@.
    message_id :: Int64
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ForwardMessage' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkForwardMessage :: IntegerOrString -> IntegerOrString -> Int64 -> ForwardMessage
mkForwardMessage arg0 arg1 arg2 =
  MkForwardMessage
    { chat_id = arg0
    , message_thread_id = Nothing
    , direct_messages_topic_id = Nothing
    , from_chat_id = arg1
    , video_start_timestamp = Nothing
    , disable_notification = Nothing
    , protect_content = Nothing
    , message_effect_id = Nothing
    , suggested_post_parameters = Nothing
    , message_id = arg2
    , extra = mempty
    }

instance Method ForwardMessage where
  type Result ForwardMessage = Message
  methodName _ = "forwardMessage"
  planRequest x =
    planRequestBody
      "forwardMessage"
      [ "chat_id"
      , "message_thread_id"
      , "direct_messages_topic_id"
      , "from_chat_id"
      , "video_start_timestamp"
      , "disable_notification"
      , "protect_content"
      , "message_effect_id"
      , "suggested_post_parameters"
      , "message_id"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          , plannedMaybe "message_thread_id" x.message_thread_id encodeJson
          , plannedMaybe "direct_messages_topic_id" x.direct_messages_topic_id encodeJson
          , planned "from_chat_id" (encodeJson x.from_chat_id)
          , plannedMaybe "video_start_timestamp" x.video_start_timestamp encodeJson
          , plannedMaybe "disable_notification" x.disable_notification encodeJson
          , plannedMaybe "protect_content" x.protect_content encodeJson
          , plannedMaybe "message_effect_id" x.message_effect_id encodeJson
          , plannedMaybe "suggested_post_parameters" x.suggested_post_parameters encodeJson
          , planned "message_id" (encodeJson x.message_id)
          ]
      )
      x.extra
  parseResult _ = parseJSON
