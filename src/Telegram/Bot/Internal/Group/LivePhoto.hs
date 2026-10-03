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
module Telegram.Bot.Internal.Group.LivePhoto
  ( LivePhoto (..)
  , mkLivePhoto
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.PhotoSize (PhotoSize)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseInt64, parseList, requiredWith)

-- | This object represents a live photo.
--
-- Source: <https://core.telegram.org/bots/api#livephoto>.
-- Codec directions: decoded from responses, encoded into requests.
data LivePhoto = MkLivePhoto
  { -- | Optional. Available sizes of the corresponding static photo
    --
    -- Wire key: @photo@.
    -- Omitted from an encoded request when it is @Nothing@.
    photo :: Maybe [PhotoSize]
  , -- | Identifier for the video file which can be used to download or reuse the file
    --
    -- Wire key: @file_id@.
    file_id :: Text
  , -- | Unique identifier for the video file which is supposed to be the same over time and for different bots. Can\'t be used to download or reuse the file.
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

-- | Initialize a 'LivePhoto' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkLivePhoto :: Text -> Text -> Int64 -> Int64 -> Int64 -> LivePhoto
mkLivePhoto arg0 arg1 arg2 arg3 arg4 =
  MkLivePhoto
    { photo = Nothing
    , file_id = arg0
    , file_unique_id = arg1
    , width = arg2
    , height = arg3
    , duration = arg4
    , mime_type = Nothing
    , file_size = Nothing
    }

instance FromJSON LivePhoto where
  parseJSON = withObject "LivePhoto" $ \obj ->
    do
      field_0 <- optionalWith obj "photo" (parseList parseJSON)
      field_1 <- requiredWith obj "file_id" parseJSON
      field_2 <- requiredWith obj "file_unique_id" parseJSON
      field_3 <- requiredWith obj "width" parseInt64
      field_4 <- requiredWith obj "height" parseInt64
      field_5 <- requiredWith obj "duration" parseInt64
      field_6 <- optionalWith obj "mime_type" parseJSON
      field_7 <- optionalWith obj "file_size" parseInt64
      pure
        MkLivePhoto
          { photo = field_0
          , file_id = field_1
          , file_unique_id = field_2
          , width = field_3
          , height = field_4
          , duration = field_5
          , mime_type = field_6
          , file_size = field_7
          }

instance ToJSON LivePhoto where
  toJSON x =
    jsonObject
      ( concat
          [ jsonOptional "photo" x.photo
          , jsonField "file_id" x.file_id
          , jsonField "file_unique_id" x.file_unique_id
          , jsonField "width" x.width
          , jsonField "height" x.height
          , jsonField "duration" x.duration
          , jsonOptional "mime_type" x.mime_type
          , jsonOptional "file_size" x.file_size
          ]
      )
  toEncoding = toEncoding . toJSON
