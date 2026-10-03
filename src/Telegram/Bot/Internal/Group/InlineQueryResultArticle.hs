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
module Telegram.Bot.Internal.Group.InlineQueryResultArticle
  ( InlineQueryResultArticle (..)
  , mkInlineQueryResultArticle
  , planInlineQueryResultArticle
  ) where

import Data.Aeson (Value (..))
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.InlineKeyboardMarkup (InlineKeyboardMarkup)
import Telegram.Bot.Internal.Group.InputMessageContent (InputMessageContent, planInputMessageContent)
import Telegram.Bot.Support (FieldPlanner, encodeJson, planRecord, planned, plannedLiteral, plannedMaybe)

-- | Represents a link to an article or web page.
--
-- Source: <https://core.telegram.org/bots/api#inlinequeryresultarticle>.
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
--
-- Supplied constants: @type@ = @"article"@.
data InlineQueryResultArticle = MkInlineQueryResultArticle
  { -- | Unique identifier for this result, 1-64 Bytes
    --
    -- Wire key: @id@.
    id :: Text
  , -- | Title of the result
    --
    -- Wire key: @title@.
    title :: Text
  , -- | Content of the message to be sent
    --
    -- Wire key: @input_message_content@.
    input_message_content :: InputMessageContent
  , -- | Optional. Inline keyboard attached to the message
    --
    -- Wire key: @reply_markup@.
    -- Omitted from an encoded request when it is @Nothing@.
    reply_markup :: Maybe InlineKeyboardMarkup
  , -- | Optional. URL of the result
    --
    -- Wire key: @url@.
    -- Omitted from an encoded request when it is @Nothing@.
    url :: Maybe Text
  , -- | Optional. Short description of the result
    --
    -- Wire key: @description@.
    -- Omitted from an encoded request when it is @Nothing@.
    description :: Maybe Text
  , -- | Optional. Url of the thumbnail for the result
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

-- | Initialize a 'InlineQueryResultArticle' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInlineQueryResultArticle :: Text -> Text -> InputMessageContent -> InlineQueryResultArticle
mkInlineQueryResultArticle arg0 arg1 arg2 =
  MkInlineQueryResultArticle
    { id = arg0
    , title = arg1
    , input_message_content = arg2
    , reply_markup = Nothing
    , url = Nothing
    , description = Nothing
    , thumbnail_url = Nothing
    , thumbnail_width = Nothing
    , thumbnail_height = Nothing
    }

-- | Plan a 'InlineQueryResultArticle' as part of an outgoing request.
--
-- The traversal is checked: it validates every file source against
-- the capabilities its occurrence permits and allocates one
-- attachment part per upload, in source field order.
planInlineQueryResultArticle :: InlineQueryResultArticle -> FieldPlanner
planInlineQueryResultArticle x =
  planRecord
    ( concat
        [ plannedLiteral "type" (String "article")
        , planned "id" (encodeJson x.id)
        , planned "title" (encodeJson x.title)
        , planned "input_message_content" (planInputMessageContent x.input_message_content)
        , plannedMaybe "reply_markup" x.reply_markup encodeJson
        , plannedMaybe "url" x.url encodeJson
        , plannedMaybe "description" x.description encodeJson
        , plannedMaybe "thumbnail_url" x.thumbnail_url encodeJson
        , plannedMaybe "thumbnail_width" x.thumbnail_width encodeJson
        , plannedMaybe "thumbnail_height" x.thumbnail_height encodeJson
        ]
    )
