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
module Telegram.Bot.Internal.Group.InlineQueryResultVenue
  ( InlineQueryResultVenue (..)
  , mkInlineQueryResultVenue
  , planInlineQueryResultVenue
  ) where

import Data.Aeson (Value (..))
import Data.Int (Int64)
import Data.Scientific (Scientific)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.InlineKeyboardMarkup (InlineKeyboardMarkup)
import Telegram.Bot.Internal.Group.InputMessageContent (InputMessageContent, planInputMessageContent)
import Telegram.Bot.Support (FieldPlanner, encodeJson, planRecord, planned, plannedLiteral, plannedMaybe)

-- | Represents a venue. By default, the venue will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the venue.
--
-- Source: <https://core.telegram.org/bots/api#inlinequeryresultvenue>.
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
--
-- Supplied constants: @type@ = @"venue"@.
data InlineQueryResultVenue = MkInlineQueryResultVenue
  { -- | Unique identifier for this result, 1-64 Bytes
    --
    -- Wire key: @id@.
    id :: Text
  , -- | Latitude of the venue location in degrees
    --
    -- Wire key: @latitude@.
    latitude :: Scientific
  , -- | Longitude of the venue location in degrees
    --
    -- Wire key: @longitude@.
    longitude :: Scientific
  , -- | Title of the venue
    --
    -- Wire key: @title@.
    title :: Text
  , -- | Address of the venue
    --
    -- Wire key: @address@.
    address :: Text
  , -- | Optional. Foursquare identifier of the venue if known
    --
    -- Wire key: @foursquare_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    foursquare_id :: Maybe Text
  , -- | Optional. Foursquare type of the venue, if known. (For example, \"arts_entertainment\/default\", \"arts_entertainment\/aquarium\" or \"food\/icecream\".)
    --
    -- Wire key: @foursquare_type@.
    -- Omitted from an encoded request when it is @Nothing@.
    foursquare_type :: Maybe Text
  , -- | Optional. Google Places identifier of the venue
    --
    -- Wire key: @google_place_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    google_place_id :: Maybe Text
  , -- | Optional. Google Places type of the venue. (See supported types.)
    --
    -- Wire key: @google_place_type@.
    -- Omitted from an encoded request when it is @Nothing@.
    google_place_type :: Maybe Text
  , -- | Optional. Inline keyboard attached to the message
    --
    -- Wire key: @reply_markup@.
    -- Omitted from an encoded request when it is @Nothing@.
    reply_markup :: Maybe InlineKeyboardMarkup
  , -- | Optional. Content of the message to be sent instead of the venue
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

-- | Initialize a 'InlineQueryResultVenue' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInlineQueryResultVenue :: Text -> Scientific -> Scientific -> Text -> Text -> InlineQueryResultVenue
mkInlineQueryResultVenue arg0 arg1 arg2 arg3 arg4 =
  MkInlineQueryResultVenue
    { id = arg0
    , latitude = arg1
    , longitude = arg2
    , title = arg3
    , address = arg4
    , foursquare_id = Nothing
    , foursquare_type = Nothing
    , google_place_id = Nothing
    , google_place_type = Nothing
    , reply_markup = Nothing
    , input_message_content = Nothing
    , thumbnail_url = Nothing
    , thumbnail_width = Nothing
    , thumbnail_height = Nothing
    }

-- | Plan a 'InlineQueryResultVenue' as part of an outgoing request.
--
-- The traversal is checked: it validates every file source against
-- the capabilities its occurrence permits and allocates one
-- attachment part per upload, in source field order.
planInlineQueryResultVenue :: InlineQueryResultVenue -> FieldPlanner
planInlineQueryResultVenue x =
  planRecord
    ( concat
        [ plannedLiteral "type" (String "venue")
        , planned "id" (encodeJson x.id)
        , planned "latitude" (encodeJson x.latitude)
        , planned "longitude" (encodeJson x.longitude)
        , planned "title" (encodeJson x.title)
        , planned "address" (encodeJson x.address)
        , plannedMaybe "foursquare_id" x.foursquare_id encodeJson
        , plannedMaybe "foursquare_type" x.foursquare_type encodeJson
        , plannedMaybe "google_place_id" x.google_place_id encodeJson
        , plannedMaybe "google_place_type" x.google_place_type encodeJson
        , plannedMaybe "reply_markup" x.reply_markup encodeJson
        , plannedMaybe "input_message_content" x.input_message_content planInputMessageContent
        , plannedMaybe "thumbnail_url" x.thumbnail_url encodeJson
        , plannedMaybe "thumbnail_width" x.thumbnail_width encodeJson
        , plannedMaybe "thumbnail_height" x.thumbnail_height encodeJson
        ]
    )
