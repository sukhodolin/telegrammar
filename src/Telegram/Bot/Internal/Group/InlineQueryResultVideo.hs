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
module Telegram.Bot.Internal.Group.InlineQueryResultVideo
  ( InlineQueryResultVideo (..)
  , mkInlineQueryResultVideo
  , planInlineQueryResultVideo
  ) where

import Data.Aeson (Value (..))
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.InlineKeyboardMarkup (InlineKeyboardMarkup)
import Telegram.Bot.Internal.Group.InputMessageContent (InputMessageContent, planInputMessageContent)
import Telegram.Bot.Internal.Group.MessageEntity (MessageEntity)
import Telegram.Bot.Support (FieldPlanner, encodeJson, planList, planRecord, planned, plannedLiteral, plannedMaybe)

-- | Represents a link to a page containing an embedded video player or a video file. By default, this video file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the video.
--
-- Source: <https://core.telegram.org/bots/api#inlinequeryresultvideo>.
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
--
-- Supplied constants: @type@ = @"video"@.
data InlineQueryResultVideo = MkInlineQueryResultVideo
  { -- | Unique identifier for this result, 1-64 bytes
    --
    -- Wire key: @id@.
    id :: Text
  , -- | A valid URL for the embedded video player or video file
    --
    -- Wire key: @video_url@.
    video_url :: Text
  , -- | MIME type of the content of the video URL, \"text\/html\" or \"video\/mp4\"
    --
    -- Wire key: @mime_type@.
    mime_type :: Text
  , -- | URL of the thumbnail (JPEG only) for the video
    --
    -- Wire key: @thumbnail_url@.
    thumbnail_url :: Text
  , -- | Title for the result
    --
    -- Wire key: @title@.
    title :: Text
  , -- | Optional. Caption of the video to be sent, 0-1024 characters after entities parsing
    --
    -- Wire key: @caption@.
    -- Omitted from an encoded request when it is @Nothing@.
    caption :: Maybe Text
  , -- | Optional. Mode for parsing entities in the video caption. See formatting options for more details.
    --
    -- Wire key: @parse_mode@.
    -- Omitted from an encoded request when it is @Nothing@.
    parse_mode :: Maybe Text
  , -- | Optional. List of special entities that appear in the caption, which can be specified instead of parse_mode
    --
    -- Wire key: @caption_entities@.
    -- Omitted from an encoded request when it is @Nothing@.
    caption_entities :: Maybe [MessageEntity]
  , -- | Optional. Pass True if the caption must be shown above the message media
    --
    -- Wire key: @show_caption_above_media@.
    -- Omitted from an encoded request when it is @Nothing@.
    show_caption_above_media :: Maybe Bool
  , -- | Optional. Video width
    --
    -- Wire key: @video_width@.
    -- Omitted from an encoded request when it is @Nothing@.
    video_width :: Maybe Int64
  , -- | Optional. Video height
    --
    -- Wire key: @video_height@.
    -- Omitted from an encoded request when it is @Nothing@.
    video_height :: Maybe Int64
  , -- | Optional. Video duration in seconds
    --
    -- Wire key: @video_duration@.
    -- Omitted from an encoded request when it is @Nothing@.
    video_duration :: Maybe Int64
  , -- | Optional. Short description of the result
    --
    -- Wire key: @description@.
    -- Omitted from an encoded request when it is @Nothing@.
    description :: Maybe Text
  , -- | Optional. Inline keyboard attached to the message
    --
    -- Wire key: @reply_markup@.
    -- Omitted from an encoded request when it is @Nothing@.
    reply_markup :: Maybe InlineKeyboardMarkup
  , -- | Optional. Content of the message to be sent instead of the video. This field is required if InlineQueryResultVideo is used to send an HTML-page as a result (e.g., a YouTube video).
    --
    -- Wire key: @input_message_content@.
    -- Omitted from an encoded request when it is @Nothing@.
    input_message_content :: Maybe InputMessageContent
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InlineQueryResultVideo' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInlineQueryResultVideo :: Text -> Text -> Text -> Text -> Text -> InlineQueryResultVideo
mkInlineQueryResultVideo arg0 arg1 arg2 arg3 arg4 =
  MkInlineQueryResultVideo
    { id = arg0
    , video_url = arg1
    , mime_type = arg2
    , thumbnail_url = arg3
    , title = arg4
    , caption = Nothing
    , parse_mode = Nothing
    , caption_entities = Nothing
    , show_caption_above_media = Nothing
    , video_width = Nothing
    , video_height = Nothing
    , video_duration = Nothing
    , description = Nothing
    , reply_markup = Nothing
    , input_message_content = Nothing
    }

-- | Plan a 'InlineQueryResultVideo' as part of an outgoing request.
--
-- The traversal is checked: it validates every file source against
-- the capabilities its occurrence permits and allocates one
-- attachment part per upload, in source field order.
planInlineQueryResultVideo :: InlineQueryResultVideo -> FieldPlanner
planInlineQueryResultVideo x =
  planRecord
    ( concat
        [ plannedLiteral "type" (String "video")
        , planned "id" (encodeJson x.id)
        , planned "video_url" (encodeJson x.video_url)
        , planned "mime_type" (encodeJson x.mime_type)
        , planned "thumbnail_url" (encodeJson x.thumbnail_url)
        , planned "title" (encodeJson x.title)
        , plannedMaybe "caption" x.caption encodeJson
        , plannedMaybe "parse_mode" x.parse_mode encodeJson
        , plannedMaybe "caption_entities" x.caption_entities (planList encodeJson)
        , plannedMaybe "show_caption_above_media" x.show_caption_above_media encodeJson
        , plannedMaybe "video_width" x.video_width encodeJson
        , plannedMaybe "video_height" x.video_height encodeJson
        , plannedMaybe "video_duration" x.video_duration encodeJson
        , plannedMaybe "description" x.description encodeJson
        , plannedMaybe "reply_markup" x.reply_markup encodeJson
        , plannedMaybe "input_message_content" x.input_message_content planInputMessageContent
        ]
    )
