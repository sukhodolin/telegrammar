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
module Telegram.Bot.Internal.Group.Document
  ( Document (..)
  , mkDocument
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.PhotoSize (PhotoSize)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseInt64, requiredWith)

-- | This object represents a general file (as opposed to photos, voice messages and audio files).
--
-- Source: <https://core.telegram.org/bots/api#document>.
-- Codec directions: decoded from responses, encoded into requests.
data Document = MkDocument
  { -- | Identifier for this file, which can be used to download or reuse the file
    --
    -- Wire key: @file_id@.
    file_id :: Text
  , -- | Unique identifier for this file, which is supposed to be the same over time and for different bots. Can\'t be used to download or reuse the file.
    --
    -- Wire key: @file_unique_id@.
    file_unique_id :: Text
  , -- | Optional. Document thumbnail as defined by the sender
    --
    -- Wire key: @thumbnail@.
    -- Omitted from an encoded request when it is @Nothing@.
    thumbnail :: Maybe PhotoSize
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

-- | Initialize a 'Document' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkDocument :: Text -> Text -> Document
mkDocument arg0 arg1 =
  MkDocument
    { file_id = arg0
    , file_unique_id = arg1
    , thumbnail = Nothing
    , file_name = Nothing
    , mime_type = Nothing
    , file_size = Nothing
    }

instance FromJSON Document where
  parseJSON = withObject "Document" $ \obj ->
    do
      field_0 <- requiredWith obj "file_id" parseJSON
      field_1 <- requiredWith obj "file_unique_id" parseJSON
      field_2 <- optionalWith obj "thumbnail" parseJSON
      field_3 <- optionalWith obj "file_name" parseJSON
      field_4 <- optionalWith obj "mime_type" parseJSON
      field_5 <- optionalWith obj "file_size" parseInt64
      pure
        MkDocument
          { file_id = field_0
          , file_unique_id = field_1
          , thumbnail = field_2
          , file_name = field_3
          , mime_type = field_4
          , file_size = field_5
          }

instance ToJSON Document where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "file_id" x.file_id
          , jsonField "file_unique_id" x.file_unique_id
          , jsonOptional "thumbnail" x.thumbnail
          , jsonOptional "file_name" x.file_name
          , jsonOptional "mime_type" x.mime_type
          , jsonOptional "file_size" x.file_size
          ]
      )
  toEncoding = toEncoding . toJSON
