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
module Telegram.Bot.Internal.Group.InlineQueryResultPhoto
  ( InlineQueryResultPhoto (..)
  , mkInlineQueryResultPhoto
  , planInlineQueryResultPhoto
  ) where

import Data.Aeson (Value (..))
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.InlineKeyboardMarkup (InlineKeyboardMarkup)
import Telegram.Bot.Internal.Group.InputMessageContent (InputMessageContent, planInputMessageContent)
import Telegram.Bot.Internal.Group.MessageEntity (MessageEntity)
import Telegram.Bot.Support (FieldPlanner, encodeJson, planList, planRecord, planned, plannedLiteral, plannedMaybe)

-- | Represents a link to a photo. By default, this photo will be sent by the user with optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the photo.
--
-- Source: <https://core.telegram.org/bots/api#inlinequeryresultphoto>.
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
--
-- Supplied constants: @type@ = @"photo"@.
data InlineQueryResultPhoto = MkInlineQueryResultPhoto
  { -- | Unique identifier for this result, 1-64 bytes
    --
    -- Wire key: @id@.
    id :: Text
  , -- | A valid URL of the photo. Photo must be in JPEG format. Photo size must not exceed 5MB.
    --
    -- Wire key: @photo_url@.
    photo_url :: Text
  , -- | URL of the thumbnail for the photo
    --
    -- Wire key: @thumbnail_url@.
    thumbnail_url :: Text
  , -- | Optional. Width of the photo
    --
    -- Wire key: @photo_width@.
    -- Omitted from an encoded request when it is @Nothing@.
    photo_width :: Maybe Int64
  , -- | Optional. Height of the photo
    --
    -- Wire key: @photo_height@.
    -- Omitted from an encoded request when it is @Nothing@.
    photo_height :: Maybe Int64
  , -- | Optional. Title for the result
    --
    -- Wire key: @title@.
    -- Omitted from an encoded request when it is @Nothing@.
    title :: Maybe Text
  , -- | Optional. Short description of the result
    --
    -- Wire key: @description@.
    -- Omitted from an encoded request when it is @Nothing@.
    description :: Maybe Text
  , -- | Optional. Caption of the photo to be sent, 0-1024 characters after entities parsing
    --
    -- Wire key: @caption@.
    -- Omitted from an encoded request when it is @Nothing@.
    caption :: Maybe Text
  , -- | Optional. Mode for parsing entities in the photo caption. See formatting options for more details.
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
  , -- | Optional. Content of the message to be sent instead of the photo
    --
    -- Wire key: @input_message_content@.
    -- Omitted from an encoded request when it is @Nothing@.
    input_message_content :: Maybe InputMessageContent
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InlineQueryResultPhoto' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInlineQueryResultPhoto :: Text -> Text -> Text -> InlineQueryResultPhoto
mkInlineQueryResultPhoto arg0 arg1 arg2 =
  MkInlineQueryResultPhoto
    { id = arg0
    , photo_url = arg1
    , thumbnail_url = arg2
    , photo_width = Nothing
    , photo_height = Nothing
    , title = Nothing
    , description = Nothing
    , caption = Nothing
    , parse_mode = Nothing
    , caption_entities = Nothing
    , show_caption_above_media = Nothing
    , reply_markup = Nothing
    , input_message_content = Nothing
    }

-- | Plan a 'InlineQueryResultPhoto' as part of an outgoing request.
--
-- The traversal is checked: it validates every file source against
-- the capabilities its occurrence permits and allocates one
-- attachment part per upload, in source field order.
planInlineQueryResultPhoto :: InlineQueryResultPhoto -> FieldPlanner
planInlineQueryResultPhoto x =
  planRecord
    ( concat
        [ plannedLiteral "type" (String "photo")
        , planned "id" (encodeJson x.id)
        , planned "photo_url" (encodeJson x.photo_url)
        , planned "thumbnail_url" (encodeJson x.thumbnail_url)
        , plannedMaybe "photo_width" x.photo_width encodeJson
        , plannedMaybe "photo_height" x.photo_height encodeJson
        , plannedMaybe "title" x.title encodeJson
        , plannedMaybe "description" x.description encodeJson
        , plannedMaybe "caption" x.caption encodeJson
        , plannedMaybe "parse_mode" x.parse_mode encodeJson
        , plannedMaybe "caption_entities" x.caption_entities (planList encodeJson)
        , plannedMaybe "show_caption_above_media" x.show_caption_above_media encodeJson
        , plannedMaybe "reply_markup" x.reply_markup encodeJson
        , plannedMaybe "input_message_content" x.input_message_content planInputMessageContent
        ]
    )
