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
module Telegram.Bot.Internal.Group.Voice
  ( Voice (..)
  , mkVoice
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseInt64, requiredWith)

-- | This object represents a voice note.
--
-- Source: <https://core.telegram.org/bots/api#voice>.
-- Codec directions: decoded from responses, encoded into requests.
data Voice = MkVoice
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

-- | Initialize a 'Voice' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkVoice :: Text -> Text -> Int64 -> Voice
mkVoice arg0 arg1 arg2 =
  MkVoice
    { file_id = arg0
    , file_unique_id = arg1
    , duration = arg2
    , mime_type = Nothing
    , file_size = Nothing
    }

instance FromJSON Voice where
  parseJSON = withObject "Voice" $ \obj ->
    do
      field_0 <- requiredWith obj "file_id" parseJSON
      field_1 <- requiredWith obj "file_unique_id" parseJSON
      field_2 <- requiredWith obj "duration" parseInt64
      field_3 <- optionalWith obj "mime_type" parseJSON
      field_4 <- optionalWith obj "file_size" parseInt64
      pure
        MkVoice
          { file_id = field_0
          , file_unique_id = field_1
          , duration = field_2
          , mime_type = field_3
          , file_size = field_4
          }

instance ToJSON Voice where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "file_id" x.file_id
          , jsonField "file_unique_id" x.file_unique_id
          , jsonField "duration" x.duration
          , jsonOptional "mime_type" x.mime_type
          , jsonOptional "file_size" x.file_size
          ]
      )
  toEncoding = toEncoding . toJSON
