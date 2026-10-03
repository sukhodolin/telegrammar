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
module Telegram.Bot.Internal.Group.InlineQueryResultVoice
  ( InlineQueryResultVoice (..)
  , mkInlineQueryResultVoice
  , planInlineQueryResultVoice
  ) where

import Data.Aeson (Value (..))
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.InlineKeyboardMarkup (InlineKeyboardMarkup)
import Telegram.Bot.Internal.Group.InputMessageContent (InputMessageContent, planInputMessageContent)
import Telegram.Bot.Internal.Group.MessageEntity (MessageEntity)
import Telegram.Bot.Support (FieldPlanner, encodeJson, planList, planRecord, planned, plannedLiteral, plannedMaybe)

-- | Represents a link to a voice recording in an .OGG container encoded with OPUS. By default, this voice recording will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the the voice message.
--
-- Source: <https://core.telegram.org/bots/api#inlinequeryresultvoice>.
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
--
-- Supplied constants: @type@ = @"voice"@.
data InlineQueryResultVoice = MkInlineQueryResultVoice
  { -- | Unique identifier for this result, 1-64 bytes
    --
    -- Wire key: @id@.
    id :: Text
  , -- | A valid URL for the voice recording
    --
    -- Wire key: @voice_url@.
    voice_url :: Text
  , -- | Recording title
    --
    -- Wire key: @title@.
    title :: Text
  , -- | Optional. Caption, 0-1024 characters after entities parsing
    --
    -- Wire key: @caption@.
    -- Omitted from an encoded request when it is @Nothing@.
    caption :: Maybe Text
  , -- | Optional. Mode for parsing entities in the voice message caption. See formatting options for more details.
    --
    -- Wire key: @parse_mode@.
    -- Omitted from an encoded request when it is @Nothing@.
    parse_mode :: Maybe Text
  , -- | Optional. List of special entities that appear in the caption, which can be specified instead of parse_mode
    --
    -- Wire key: @caption_entities@.
    -- Omitted from an encoded request when it is @Nothing@.
    caption_entities :: Maybe [MessageEntity]
  , -- | Optional. Recording duration in seconds
    --
    -- Wire key: @voice_duration@.
    -- Omitted from an encoded request when it is @Nothing@.
    voice_duration :: Maybe Int64
  , -- | Optional. Inline keyboard attached to the message
    --
    -- Wire key: @reply_markup@.
    -- Omitted from an encoded request when it is @Nothing@.
    reply_markup :: Maybe InlineKeyboardMarkup
  , -- | Optional. Content of the message to be sent instead of the voice recording
    --
    -- Wire key: @input_message_content@.
    -- Omitted from an encoded request when it is @Nothing@.
    input_message_content :: Maybe InputMessageContent
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InlineQueryResultVoice' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInlineQueryResultVoice :: Text -> Text -> Text -> InlineQueryResultVoice
mkInlineQueryResultVoice arg0 arg1 arg2 =
  MkInlineQueryResultVoice
    { id = arg0
    , voice_url = arg1
    , title = arg2
    , caption = Nothing
    , parse_mode = Nothing
    , caption_entities = Nothing
    , voice_duration = Nothing
    , reply_markup = Nothing
    , input_message_content = Nothing
    }

-- | Plan a 'InlineQueryResultVoice' as part of an outgoing request.
--
-- The traversal is checked: it validates every file source against
-- the capabilities its occurrence permits and allocates one
-- attachment part per upload, in source field order.
planInlineQueryResultVoice :: InlineQueryResultVoice -> FieldPlanner
planInlineQueryResultVoice x =
  planRecord
    ( concat
        [ plannedLiteral "type" (String "voice")
        , planned "id" (encodeJson x.id)
        , planned "voice_url" (encodeJson x.voice_url)
        , planned "title" (encodeJson x.title)
        , plannedMaybe "caption" x.caption encodeJson
        , plannedMaybe "parse_mode" x.parse_mode encodeJson
        , plannedMaybe "caption_entities" x.caption_entities (planList encodeJson)
        , plannedMaybe "voice_duration" x.voice_duration encodeJson
        , plannedMaybe "reply_markup" x.reply_markup encodeJson
        , plannedMaybe "input_message_content" x.input_message_content planInputMessageContent
        ]
    )
