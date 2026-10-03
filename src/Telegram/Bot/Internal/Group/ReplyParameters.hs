{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE OverloadedStrings #-}

-- | Internal: one dependency component of the type graph.
--
-- This module is an implementation detail of the generated package. Its
-- declarations are re-exported by the aggregate types façade, which is
-- where consumers import them from. The module name is a deterministic
-- identifier taken from the component's smallest declaration name, not a
-- semantic family name, and it can change when the source graph changes.
--
-- Generated. Do not edit.
module Telegram.Bot.Internal.Group.ReplyParameters
  ( ReplyParameters (..)
  , mkReplyParameters
  ) where

import Data.Aeson (ToJSON (..))
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Internal.Group.MessageEntity (MessageEntity)
import Telegram.Bot.Support (jsonObject, jsonOptional)

-- | Describes reply parameters for the message that is being sent.
--
-- Source: <https://core.telegram.org/bots/api#replyparameters>.
-- Codec directions: encoded into requests.
data ReplyParameters = MkReplyParameters
  { -- | Optional. Identifier of the message that will be replied to in the current chat, or in the chat chat_id if it is specified. Required if ephemeral_message_id isn\'t specified.
    --
    -- Wire key: @message_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    message_id :: Maybe Int64
  , -- | Optional. If the message to be replied to is from a different chat, unique identifier for the chat or username of the bot, supergroup or channel in the format \@username. Not supported for messages sent on behalf of a business account, messages from channel direct messages chats and ephemeral messages.
    --
    -- Wire key: @chat_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    chat_id :: Maybe IntegerOrString
  , -- | Optional. Identifier of the incoming ephemeral message that will be replied to in the current chat. A reply to an ephemeral message must itself be an ephemeral message. An ephemeral message may only be replied to within 15 seconds of being sent. Required if message_id isn\'t specified.
    --
    -- Wire key: @ephemeral_message_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    ephemeral_message_id :: Maybe Int64
  , -- | Optional. Pass True if the message should be sent even if the specified message to be replied to is not found. Always False for replies in another chat or forum topic, and sent ephemeral messages. Always True for messages sent on behalf of a business account.
    --
    -- Wire key: @allow_sending_without_reply@.
    -- Omitted from an encoded request when it is @Nothing@.
    allow_sending_without_reply :: Maybe Bool
  , -- | Optional. Quoted part of the message to be replied to; 0-1024 characters after entities parsing. The quote must be an exact substring of the message to be replied to, including bold, italic, underline, strikethrough, spoiler, custom_emoji, and date_time entities. The message will fail to send if the quote isn\'t found in the original message. Ignored for ephemeral messages.
    --
    -- Wire key: @quote@.
    -- Omitted from an encoded request when it is @Nothing@.
    quote :: Maybe Text
  , -- | Optional. Mode for parsing entities in the quote. See formatting options for more details.
    --
    -- Wire key: @quote_parse_mode@.
    -- Omitted from an encoded request when it is @Nothing@.
    quote_parse_mode :: Maybe Text
  , -- | Optional. A JSON-serialized list of special entities that appear in the quote. It can be specified instead of quote_parse_mode.
    --
    -- Wire key: @quote_entities@.
    -- Omitted from an encoded request when it is @Nothing@.
    quote_entities :: Maybe [MessageEntity]
  , -- | Optional. Position of the quote in the original message in UTF-16 code units
    --
    -- Wire key: @quote_position@.
    -- Omitted from an encoded request when it is @Nothing@.
    quote_position :: Maybe Int64
  , -- | Optional. Identifier of the specific checklist task to be replied to
    --
    -- Wire key: @checklist_task_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    checklist_task_id :: Maybe Int64
  , -- | Optional. Persistent identifier of the specific poll option to be replied to
    --
    -- Wire key: @poll_option_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    poll_option_id :: Maybe Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ReplyParameters' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkReplyParameters :: ReplyParameters
mkReplyParameters =
  MkReplyParameters
    { message_id = Nothing
    , chat_id = Nothing
    , ephemeral_message_id = Nothing
    , allow_sending_without_reply = Nothing
    , quote = Nothing
    , quote_parse_mode = Nothing
    , quote_entities = Nothing
    , quote_position = Nothing
    , checklist_task_id = Nothing
    , poll_option_id = Nothing
    }

instance ToJSON ReplyParameters where
  toJSON x =
    jsonObject
      ( concat
          [ jsonOptional "message_id" x.message_id
          , jsonOptional "chat_id" x.chat_id
          , jsonOptional "ephemeral_message_id" x.ephemeral_message_id
          , jsonOptional "allow_sending_without_reply" x.allow_sending_without_reply
          , jsonOptional "quote" x.quote
          , jsonOptional "quote_parse_mode" x.quote_parse_mode
          , jsonOptional "quote_entities" x.quote_entities
          , jsonOptional "quote_position" x.quote_position
          , jsonOptional "checklist_task_id" x.checklist_task_id
          , jsonOptional "poll_option_id" x.poll_option_id
          ]
      )
  toEncoding = toEncoding . toJSON
