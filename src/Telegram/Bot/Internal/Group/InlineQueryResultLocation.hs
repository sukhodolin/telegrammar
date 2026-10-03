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
module Telegram.Bot.Internal.Group.InlineQueryResultLocation
  ( InlineQueryResultLocation (..)
  , mkInlineQueryResultLocation
  , planInlineQueryResultLocation
  ) where

import Data.Aeson (Value (..))
import Data.Int (Int64)
import Data.Scientific (Scientific)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.InlineKeyboardMarkup (InlineKeyboardMarkup)
import Telegram.Bot.Internal.Group.InputMessageContent (InputMessageContent, planInputMessageContent)
import Telegram.Bot.Support (FieldPlanner, encodeJson, planRecord, planned, plannedLiteral, plannedMaybe)

-- | Represents a location on a map. By default, the location will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the location.
--
-- Source: <https://core.telegram.org/bots/api#inlinequeryresultlocation>.
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
--
-- Supplied constants: @type@ = @"location"@.
data InlineQueryResultLocation = MkInlineQueryResultLocation
  { -- | Unique identifier for this result, 1-64 Bytes
    --
    -- Wire key: @id@.
    id :: Text
  , -- | Location latitude in degrees
    --
    -- Wire key: @latitude@.
    latitude :: Scientific
  , -- | Location longitude in degrees
    --
    -- Wire key: @longitude@.
    longitude :: Scientific
  , -- | Location title
    --
    -- Wire key: @title@.
    title :: Text
  , -- | Optional. The radius of uncertainty for the location, measured in meters; 0-1500
    --
    -- Wire key: @horizontal_accuracy@.
    -- Omitted from an encoded request when it is @Nothing@.
    horizontal_accuracy :: Maybe Scientific
  , -- | Optional. Period in seconds during which the location can be updated, must be between 60 and 86400, or 0x7FFFFFFF for live locations that can be edited indefinitely
    --
    -- Wire key: @live_period@.
    -- Omitted from an encoded request when it is @Nothing@.
    live_period :: Maybe Int64
  , -- | Optional. For live locations, a direction in which the user is moving, in degrees. Must be between 1 and 360 if specified.
    --
    -- Wire key: @heading@.
    -- Omitted from an encoded request when it is @Nothing@.
    heading :: Maybe Int64
  , -- | Optional. For live locations, a maximum distance for proximity alerts about approaching another chat member, in meters. Must be between 1 and 100000 if specified.
    --
    -- Wire key: @proximity_alert_radius@.
    -- Omitted from an encoded request when it is @Nothing@.
    proximity_alert_radius :: Maybe Int64
  , -- | Optional. Inline keyboard attached to the message
    --
    -- Wire key: @reply_markup@.
    -- Omitted from an encoded request when it is @Nothing@.
    reply_markup :: Maybe InlineKeyboardMarkup
  , -- | Optional. Content of the message to be sent instead of the location
    --
    -- Wire key: @input_message_content@.
    -- Omitted from an encoded request when it is @Nothing@.
    input_message_content :: Maybe InputMessageContent
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

-- | Initialize a 'InlineQueryResultLocation' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInlineQueryResultLocation :: Text -> Scientific -> Scientific -> Text -> InlineQueryResultLocation
mkInlineQueryResultLocation arg0 arg1 arg2 arg3 =
  MkInlineQueryResultLocation
    { id = arg0
    , latitude = arg1
    , longitude = arg2
    , title = arg3
    , horizontal_accuracy = Nothing
    , live_period = Nothing
    , heading = Nothing
    , proximity_alert_radius = Nothing
    , reply_markup = Nothing
    , input_message_content = Nothing
    , thumbnail_url = Nothing
    , thumbnail_width = Nothing
    , thumbnail_height = Nothing
    }

-- | Plan a 'InlineQueryResultLocation' as part of an outgoing request.
--
-- The traversal is checked: it validates every file source against
-- the capabilities its occurrence permits and allocates one
-- attachment part per upload, in source field order.
planInlineQueryResultLocation :: InlineQueryResultLocation -> FieldPlanner
planInlineQueryResultLocation x =
  planRecord
    ( concat
        [ plannedLiteral "type" (String "location")
        , planned "id" (encodeJson x.id)
        , planned "latitude" (encodeJson x.latitude)
        , planned "longitude" (encodeJson x.longitude)
        , planned "title" (encodeJson x.title)
        , plannedMaybe "horizontal_accuracy" x.horizontal_accuracy encodeJson
        , plannedMaybe "live_period" x.live_period encodeJson
        , plannedMaybe "heading" x.heading encodeJson
        , plannedMaybe "proximity_alert_radius" x.proximity_alert_radius encodeJson
        , plannedMaybe "reply_markup" x.reply_markup encodeJson
        , plannedMaybe "input_message_content" x.input_message_content planInputMessageContent
        , plannedMaybe "thumbnail_url" x.thumbnail_url encodeJson
        , plannedMaybe "thumbnail_width" x.thumbnail_width encodeJson
        , plannedMaybe "thumbnail_height" x.thumbnail_height encodeJson
        ]
    )
