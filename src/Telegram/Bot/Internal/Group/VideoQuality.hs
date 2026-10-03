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
module Telegram.Bot.Internal.Group.VideoQuality
  ( VideoQuality (..)
  , mkVideoQuality
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseInt64, requiredWith)

-- | This object represents a video file of a specific quality.
--
-- Source: <https://core.telegram.org/bots/api#videoquality>.
-- Codec directions: decoded from responses, encoded into requests.
data VideoQuality = MkVideoQuality
  { -- | Identifier for this file, which can be used to download or reuse the file
    --
    -- Wire key: @file_id@.
    file_id :: Text
  , -- | Unique identifier for this file, which is supposed to be the same over time and for different bots. Can\'t be used to download or reuse the file.
    --
    -- Wire key: @file_unique_id@.
    file_unique_id :: Text
  , -- | Video width
    --
    -- Wire key: @width@.
    width :: Int64
  , -- | Video height
    --
    -- Wire key: @height@.
    height :: Int64
  , -- | Codec that was used to encode the video, for example, \"h264\", \"h265\", or \"av01\"
    --
    -- Wire key: @codec@.
    codec :: Text
  , -- | Optional. File size in bytes. It can be bigger than 2^31 and some programming languages may have difficulty\/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this value.
    --
    -- Wire key: @file_size@.
    -- Omitted from an encoded request when it is @Nothing@.
    file_size :: Maybe Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'VideoQuality' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkVideoQuality :: Text -> Text -> Int64 -> Int64 -> Text -> VideoQuality
mkVideoQuality arg0 arg1 arg2 arg3 arg4 =
  MkVideoQuality
    { file_id = arg0
    , file_unique_id = arg1
    , width = arg2
    , height = arg3
    , codec = arg4
    , file_size = Nothing
    }

instance FromJSON VideoQuality where
  parseJSON = withObject "VideoQuality" $ \obj ->
    do
      field_0 <- requiredWith obj "file_id" parseJSON
      field_1 <- requiredWith obj "file_unique_id" parseJSON
      field_2 <- requiredWith obj "width" parseInt64
      field_3 <- requiredWith obj "height" parseInt64
      field_4 <- requiredWith obj "codec" parseJSON
      field_5 <- optionalWith obj "file_size" parseInt64
      pure
        MkVideoQuality
          { file_id = field_0
          , file_unique_id = field_1
          , width = field_2
          , height = field_3
          , codec = field_4
          , file_size = field_5
          }

instance ToJSON VideoQuality where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "file_id" x.file_id
          , jsonField "file_unique_id" x.file_unique_id
          , jsonField "width" x.width
          , jsonField "height" x.height
          , jsonField "codec" x.codec
          , jsonOptional "file_size" x.file_size
          ]
      )
  toEncoding = toEncoding . toJSON
