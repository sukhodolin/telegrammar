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
module Telegram.Bot.Internal.Group.VideoNote
  ( VideoNote (..)
  , mkVideoNote
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.PhotoSize (PhotoSize)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseInt64, requiredWith)

-- | This object represents a video message.
--
-- Source: <https://core.telegram.org/bots/api#videonote>.
-- Codec directions: decoded from responses, encoded into requests.
data VideoNote = MkVideoNote
  { -- | Identifier for this file, which can be used to download or reuse the file
    --
    -- Wire key: @file_id@.
    file_id :: Text
  , -- | Unique identifier for this file, which is supposed to be the same over time and for different bots. Can\'t be used to download or reuse the file.
    --
    -- Wire key: @file_unique_id@.
    file_unique_id :: Text
  , -- | Video width and height (diameter of the video message) as defined by the sender
    --
    -- Wire key: @length@.
    length :: Int64
  , -- | Duration of the video in seconds as defined by the sender
    --
    -- Wire key: @duration@.
    duration :: Int64
  , -- | Optional. Video thumbnail
    --
    -- Wire key: @thumbnail@.
    -- Omitted from an encoded request when it is @Nothing@.
    thumbnail :: Maybe PhotoSize
  , -- | Optional. File size in bytes
    --
    -- Wire key: @file_size@.
    -- Omitted from an encoded request when it is @Nothing@.
    file_size :: Maybe Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'VideoNote' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkVideoNote :: Text -> Text -> Int64 -> Int64 -> VideoNote
mkVideoNote arg0 arg1 arg2 arg3 =
  MkVideoNote
    { file_id = arg0
    , file_unique_id = arg1
    , length = arg2
    , duration = arg3
    , thumbnail = Nothing
    , file_size = Nothing
    }

instance FromJSON VideoNote where
  parseJSON = withObject "VideoNote" $ \obj ->
    do
      field_0 <- requiredWith obj "file_id" parseJSON
      field_1 <- requiredWith obj "file_unique_id" parseJSON
      field_2 <- requiredWith obj "length" parseInt64
      field_3 <- requiredWith obj "duration" parseInt64
      field_4 <- optionalWith obj "thumbnail" parseJSON
      field_5 <- optionalWith obj "file_size" parseInt64
      pure
        MkVideoNote
          { file_id = field_0
          , file_unique_id = field_1
          , length = field_2
          , duration = field_3
          , thumbnail = field_4
          , file_size = field_5
          }

instance ToJSON VideoNote where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "file_id" x.file_id
          , jsonField "file_unique_id" x.file_unique_id
          , jsonField "length" x.length
          , jsonField "duration" x.duration
          , jsonOptional "thumbnail" x.thumbnail
          , jsonOptional "file_size" x.file_size
          ]
      )
  toEncoding = toEncoding . toJSON
