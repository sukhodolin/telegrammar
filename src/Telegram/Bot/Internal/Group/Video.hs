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
module Telegram.Bot.Internal.Group.Video
  ( Video (..)
  , mkVideo
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.PhotoSize (PhotoSize)
import Telegram.Bot.Internal.Group.VideoQuality (VideoQuality)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseInt64, parseList, requiredWith)

-- | This object represents a video file.
--
-- Source: <https://core.telegram.org/bots/api#video>.
-- Codec directions: decoded from responses, encoded into requests.
data Video = MkVideo
  { -- | Identifier for this file, which can be used to download or reuse the file
    --
    -- Wire key: @file_id@.
    file_id :: Text
  , -- | Unique identifier for this file, which is supposed to be the same over time and for different bots. Can\'t be used to download or reuse the file.
    --
    -- Wire key: @file_unique_id@.
    file_unique_id :: Text
  , -- | Video width as defined by the sender
    --
    -- Wire key: @width@.
    width :: Int64
  , -- | Video height as defined by the sender
    --
    -- Wire key: @height@.
    height :: Int64
  , -- | Duration of the video in seconds as defined by the sender
    --
    -- Wire key: @duration@.
    duration :: Int64
  , -- | Optional. Video thumbnail
    --
    -- Wire key: @thumbnail@.
    -- Omitted from an encoded request when it is @Nothing@.
    thumbnail :: Maybe PhotoSize
  , -- | Optional. Available sizes of the cover of the video in the message
    --
    -- Wire key: @cover@.
    -- Omitted from an encoded request when it is @Nothing@.
    cover :: Maybe [PhotoSize]
  , -- | Optional. Timestamp in seconds from which the video will play in the message
    --
    -- Wire key: @start_timestamp@.
    -- Omitted from an encoded request when it is @Nothing@.
    start_timestamp :: Maybe Int64
  , -- | Optional. List of available qualities of the video
    --
    -- Wire key: @qualities@.
    -- Omitted from an encoded request when it is @Nothing@.
    qualities :: Maybe [VideoQuality]
  , -- | Optional. Original filename as defined by the sender
    --
    -- Wire key: @file_name@.
    -- Omitted from an encoded request when it is @Nothing@.
    file_name :: Maybe Text
  , -- | Optional. MIME type of the file as defined by the sender
    --
    -- Wire key: @mime_type@.
    -- Omitted from an encoded request when it is @Nothing@.
    mime_type :: Maybe Text
  , -- | Optional. File size in bytes. It can be bigger than 2^31 and some programming languages may have difficulty\/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this value.
    --
    -- Wire key: @file_size@.
    -- Omitted from an encoded request when it is @Nothing@.
    file_size :: Maybe Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'Video' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkVideo :: Text -> Text -> Int64 -> Int64 -> Int64 -> Video
mkVideo arg0 arg1 arg2 arg3 arg4 =
  MkVideo
    { file_id = arg0
    , file_unique_id = arg1
    , width = arg2
    , height = arg3
    , duration = arg4
    , thumbnail = Nothing
    , cover = Nothing
    , start_timestamp = Nothing
    , qualities = Nothing
    , file_name = Nothing
    , mime_type = Nothing
    , file_size = Nothing
    }

instance FromJSON Video where
  parseJSON = withObject "Video" $ \obj ->
    do
      field_0 <- requiredWith obj "file_id" parseJSON
      field_1 <- requiredWith obj "file_unique_id" parseJSON
      field_2 <- requiredWith obj "width" parseInt64
      field_3 <- requiredWith obj "height" parseInt64
      field_4 <- requiredWith obj "duration" parseInt64
      field_5 <- optionalWith obj "thumbnail" parseJSON
      field_6 <- optionalWith obj "cover" (parseList parseJSON)
      field_7 <- optionalWith obj "start_timestamp" parseInt64
      field_8 <- optionalWith obj "qualities" (parseList parseJSON)
      field_9 <- optionalWith obj "file_name" parseJSON
      field_10 <- optionalWith obj "mime_type" parseJSON
      field_11 <- optionalWith obj "file_size" parseInt64
      pure
        MkVideo
          { file_id = field_0
          , file_unique_id = field_1
          , width = field_2
          , height = field_3
          , duration = field_4
          , thumbnail = field_5
          , cover = field_6
          , start_timestamp = field_7
          , qualities = field_8
          , file_name = field_9
          , mime_type = field_10
          , file_size = field_11
          }

instance ToJSON Video where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "file_id" x.file_id
          , jsonField "file_unique_id" x.file_unique_id
          , jsonField "width" x.width
          , jsonField "height" x.height
          , jsonField "duration" x.duration
          , jsonOptional "thumbnail" x.thumbnail
          , jsonOptional "cover" x.cover
          , jsonOptional "start_timestamp" x.start_timestamp
          , jsonOptional "qualities" x.qualities
          , jsonOptional "file_name" x.file_name
          , jsonOptional "mime_type" x.mime_type
          , jsonOptional "file_size" x.file_size
          ]
      )
  toEncoding = toEncoding . toJSON
