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
module Telegram.Bot.Internal.Group.Audio
  ( Audio (..)
  , mkAudio
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.PhotoSize (PhotoSize)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseInt64, requiredWith)

-- | This object represents an audio file to be treated as music by the Telegram clients.
--
-- Source: <https://core.telegram.org/bots/api#audio>.
-- Codec directions: decoded from responses, encoded into requests.
data Audio = MkAudio
  { -- | Identifier for this file, which can be used to download or reuse the file
    --
    -- Wire key: @file_id@.
    file_id :: Text
  , -- | Unique identifier for this file, which is supposed to be the same over time and for different bots. Can\'t be used to download or reuse the file.
    --
    -- Wire key: @file_unique_id@.
    file_unique_id :: Text
  , -- | Duration of the audio in seconds as defined by the sender
    --
    -- Wire key: @duration@.
    duration :: Int64
  , -- | Optional. Performer of the audio as defined by the sender or by audio tags
    --
    -- Wire key: @performer@.
    -- Omitted from an encoded request when it is @Nothing@.
    performer :: Maybe Text
  , -- | Optional. Title of the audio as defined by the sender or by audio tags
    --
    -- Wire key: @title@.
    -- Omitted from an encoded request when it is @Nothing@.
    title :: Maybe Text
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
  , -- | Optional. Thumbnail of the album cover to which the music file belongs
    --
    -- Wire key: @thumbnail@.
    -- Omitted from an encoded request when it is @Nothing@.
    thumbnail :: Maybe PhotoSize
  }
  deriving stock (Eq, Show)

-- | Initialize a 'Audio' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkAudio :: Text -> Text -> Int64 -> Audio
mkAudio arg0 arg1 arg2 =
  MkAudio
    { file_id = arg0
    , file_unique_id = arg1
    , duration = arg2
    , performer = Nothing
    , title = Nothing
    , file_name = Nothing
    , mime_type = Nothing
    , file_size = Nothing
    , thumbnail = Nothing
    }

instance FromJSON Audio where
  parseJSON = withObject "Audio" $ \obj ->
    do
      field_0 <- requiredWith obj "file_id" parseJSON
      field_1 <- requiredWith obj "file_unique_id" parseJSON
      field_2 <- requiredWith obj "duration" parseInt64
      field_3 <- optionalWith obj "performer" parseJSON
      field_4 <- optionalWith obj "title" parseJSON
      field_5 <- optionalWith obj "file_name" parseJSON
      field_6 <- optionalWith obj "mime_type" parseJSON
      field_7 <- optionalWith obj "file_size" parseInt64
      field_8 <- optionalWith obj "thumbnail" parseJSON
      pure
        MkAudio
          { file_id = field_0
          , file_unique_id = field_1
          , duration = field_2
          , performer = field_3
          , title = field_4
          , file_name = field_5
          , mime_type = field_6
          , file_size = field_7
          , thumbnail = field_8
          }

instance ToJSON Audio where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "file_id" x.file_id
          , jsonField "file_unique_id" x.file_unique_id
          , jsonField "duration" x.duration
          , jsonOptional "performer" x.performer
          , jsonOptional "title" x.title
          , jsonOptional "file_name" x.file_name
          , jsonOptional "mime_type" x.mime_type
          , jsonOptional "file_size" x.file_size
          , jsonOptional "thumbnail" x.thumbnail
          ]
      )
  toEncoding = toEncoding . toJSON
