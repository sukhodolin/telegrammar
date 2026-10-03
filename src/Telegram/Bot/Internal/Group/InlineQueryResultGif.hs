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
module Telegram.Bot.Internal.Group.InlineQueryResultGif
  ( InlineQueryResultGif (..)
  , mkInlineQueryResultGif
  , planInlineQueryResultGif
  ) where

import Data.Aeson (Value (..))
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.InlineKeyboardMarkup (InlineKeyboardMarkup)
import Telegram.Bot.Internal.Group.InputMessageContent (InputMessageContent, planInputMessageContent)
import Telegram.Bot.Internal.Group.MessageEntity (MessageEntity)
import Telegram.Bot.Support (FieldPlanner, encodeJson, planList, planRecord, planned, plannedLiteral, plannedMaybe)

-- | Represents a link to an animated GIF file. By default, this animated GIF file will be sent by the user with optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the animation.
--
-- Source: <https://core.telegram.org/bots/api#inlinequeryresultgif>.
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
--
-- Supplied constants: @type@ = @"gif"@.
data InlineQueryResultGif = MkInlineQueryResultGif
  { -- | Unique identifier for this result, 1-64 bytes
    --
    -- Wire key: @id@.
    id :: Text
  , -- | A valid URL for the GIF file
    --
    -- Wire key: @gif_url@.
    gif_url :: Text
  , -- | Optional. Width of the GIF
    --
    -- Wire key: @gif_width@.
    -- Omitted from an encoded request when it is @Nothing@.
    gif_width :: Maybe Int64
  , -- | Optional. Height of the GIF
    --
    -- Wire key: @gif_height@.
    -- Omitted from an encoded request when it is @Nothing@.
    gif_height :: Maybe Int64
  , -- | Optional. Duration of the GIF in seconds
    --
    -- Wire key: @gif_duration@.
    -- Omitted from an encoded request when it is @Nothing@.
    gif_duration :: Maybe Int64
  , -- | URL of the static (JPEG or GIF) or animated (MPEG4) thumbnail for the result
    --
    -- Wire key: @thumbnail_url@.
    thumbnail_url :: Text
  , -- | Optional. MIME type of the thumbnail, must be one of \"image\/jpeg\", \"image\/gif\", or \"video\/mp4\". Defaults to \"image\/jpeg\".
    --
    -- Wire key: @thumbnail_mime_type@.
    -- Omitted from an encoded request when it is @Nothing@.
    thumbnail_mime_type :: Maybe Text
  , -- | Optional. Title for the result
    --
    -- Wire key: @title@.
    -- Omitted from an encoded request when it is @Nothing@.
    title :: Maybe Text
  , -- | Optional. Caption of the GIF file to be sent, 0-1024 characters after entities parsing
    --
    -- Wire key: @caption@.
    -- Omitted from an encoded request when it is @Nothing@.
    caption :: Maybe Text
  , -- | Optional. Mode for parsing entities in the caption. See formatting options for more details.
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
  , -- | Optional. Inline keyboard attached to the message
    --
    -- Wire key: @reply_markup@.
    -- Omitted from an encoded request when it is @Nothing@.
    reply_markup :: Maybe InlineKeyboardMarkup
  , -- | Optional. Content of the message to be sent instead of the GIF animation
    --
    -- Wire key: @input_message_content@.
    -- Omitted from an encoded request when it is @Nothing@.
    input_message_content :: Maybe InputMessageContent
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InlineQueryResultGif' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInlineQueryResultGif :: Text -> Text -> Text -> InlineQueryResultGif
mkInlineQueryResultGif arg0 arg1 arg2 =
  MkInlineQueryResultGif
    { id = arg0
    , gif_url = arg1
    , gif_width = Nothing
    , gif_height = Nothing
    , gif_duration = Nothing
    , thumbnail_url = arg2
    , thumbnail_mime_type = Nothing
    , title = Nothing
    , caption = Nothing
    , parse_mode = Nothing
    , caption_entities = Nothing
    , show_caption_above_media = Nothing
    , reply_markup = Nothing
    , input_message_content = Nothing
    }

-- | Plan a 'InlineQueryResultGif' as part of an outgoing request.
--
-- The traversal is checked: it validates every file source against
-- the capabilities its occurrence permits and allocates one
-- attachment part per upload, in source field order.
planInlineQueryResultGif :: InlineQueryResultGif -> FieldPlanner
planInlineQueryResultGif x =
  planRecord
    ( concat
        [ plannedLiteral "type" (String "gif")
        , planned "id" (encodeJson x.id)
        , planned "gif_url" (encodeJson x.gif_url)
        , plannedMaybe "gif_width" x.gif_width encodeJson
        , plannedMaybe "gif_height" x.gif_height encodeJson
        , plannedMaybe "gif_duration" x.gif_duration encodeJson
        , planned "thumbnail_url" (encodeJson x.thumbnail_url)
        , plannedMaybe "thumbnail_mime_type" x.thumbnail_mime_type encodeJson
        , plannedMaybe "title" x.title encodeJson
        , plannedMaybe "caption" x.caption encodeJson
        , plannedMaybe "parse_mode" x.parse_mode encodeJson
        , plannedMaybe "caption_entities" x.caption_entities (planList encodeJson)
        , plannedMaybe "show_caption_above_media" x.show_caption_above_media encodeJson
        , plannedMaybe "reply_markup" x.reply_markup encodeJson
        , plannedMaybe "input_message_content" x.input_message_content planInputMessageContent
        ]
    )
