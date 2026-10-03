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
module Telegram.Bot.Internal.Group.InlineQueryResultDocument
  ( InlineQueryResultDocument (..)
  , mkInlineQueryResultDocument
  , planInlineQueryResultDocument
  ) where

import Data.Aeson (Value (..))
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.InlineKeyboardMarkup (InlineKeyboardMarkup)
import Telegram.Bot.Internal.Group.InputMessageContent (InputMessageContent, planInputMessageContent)
import Telegram.Bot.Internal.Group.MessageEntity (MessageEntity)
import Telegram.Bot.Support (FieldPlanner, encodeJson, planList, planRecord, planned, plannedLiteral, plannedMaybe)

-- | Represents a link to a file. By default, this file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the file. Currently, only .PDF and .ZIP files can be sent using this method.
--
-- Source: <https://core.telegram.org/bots/api#inlinequeryresultdocument>.
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
--
-- Supplied constants: @type@ = @"document"@.
data InlineQueryResultDocument = MkInlineQueryResultDocument
  { -- | Unique identifier for this result, 1-64 bytes
    --
    -- Wire key: @id@.
    id :: Text
  , -- | Title for the result
    --
    -- Wire key: @title@.
    title :: Text
  , -- | Optional. Caption of the document to be sent, 0-1024 characters after entities parsing
    --
    -- Wire key: @caption@.
    -- Omitted from an encoded request when it is @Nothing@.
    caption :: Maybe Text
  , -- | Optional. Mode for parsing entities in the document caption. See formatting options for more details.
    --
    -- Wire key: @parse_mode@.
    -- Omitted from an encoded request when it is @Nothing@.
    parse_mode :: Maybe Text
  , -- | Optional. List of special entities that appear in the caption, which can be specified instead of parse_mode
    --
    -- Wire key: @caption_entities@.
    -- Omitted from an encoded request when it is @Nothing@.
    caption_entities :: Maybe [MessageEntity]
  , -- | A valid URL for the file
    --
    -- Wire key: @document_url@.
    document_url :: Text
  , -- | MIME type of the content of the file, either \"application\/pdf\" or \"application\/zip\"
    --
    -- Wire key: @mime_type@.
    mime_type :: Text
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
  , -- | Optional. Content of the message to be sent instead of the file
    --
    -- Wire key: @input_message_content@.
    -- Omitted from an encoded request when it is @Nothing@.
    input_message_content :: Maybe InputMessageContent
  , -- | Optional. URL of the thumbnail (JPEG only) for the file
    --
    -- Wire key: @thumbnail_url@.
    -- Omitted from an encoded request when it is @Nothing@.
    thumbnail_url :: Maybe Text
  , -- | Optional. Thumbnail width
    --
    -- Wire key: @thumbnail_width@.
    -- Omitted from an encoded request when it is @Nothing@.
    thumbnail_width :: Maybe Int64
  , -- | Optional. Thumbnail height
    --
    -- Wire key: @thumbnail_height@.
    -- Omitted from an encoded request when it is @Nothing@.
    thumbnail_height :: Maybe Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InlineQueryResultDocument' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInlineQueryResultDocument :: Text -> Text -> Text -> Text -> InlineQueryResultDocument
mkInlineQueryResultDocument arg0 arg1 arg2 arg3 =
  MkInlineQueryResultDocument
    { id = arg0
    , title = arg1
    , caption = Nothing
    , parse_mode = Nothing
    , caption_entities = Nothing
    , document_url = arg2
    , mime_type = arg3
    , description = Nothing
    , reply_markup = Nothing
    , input_message_content = Nothing
    , thumbnail_url = Nothing
    , thumbnail_width = Nothing
    , thumbnail_height = Nothing
    }

-- | Plan a 'InlineQueryResultDocument' as part of an outgoing request.
--
-- The traversal is checked: it validates every file source against
-- the capabilities its occurrence permits and allocates one
-- attachment part per upload, in source field order.
planInlineQueryResultDocument :: InlineQueryResultDocument -> FieldPlanner
planInlineQueryResultDocument x =
  planRecord
    ( concat
        [ plannedLiteral "type" (String "document")
        , planned "id" (encodeJson x.id)
        , planned "title" (encodeJson x.title)
        , plannedMaybe "caption" x.caption encodeJson
        , plannedMaybe "parse_mode" x.parse_mode encodeJson
        , plannedMaybe "caption_entities" x.caption_entities (planList encodeJson)
        , planned "document_url" (encodeJson x.document_url)
        , planned "mime_type" (encodeJson x.mime_type)
        , plannedMaybe "description" x.description encodeJson
        , plannedMaybe "reply_markup" x.reply_markup encodeJson
        , plannedMaybe "input_message_content" x.input_message_content planInputMessageContent
        , plannedMaybe "thumbnail_url" x.thumbnail_url encodeJson
        , plannedMaybe "thumbnail_width" x.thumbnail_width encodeJson
        , plannedMaybe "thumbnail_height" x.thumbnail_height encodeJson
        ]
    )
