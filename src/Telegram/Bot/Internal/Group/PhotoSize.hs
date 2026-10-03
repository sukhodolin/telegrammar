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
module Telegram.Bot.Internal.Group.PhotoSize
  ( PhotoSize (..)
  , mkPhotoSize
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseInt64, requiredWith)

-- | This object represents one size of a photo or a file \/ sticker thumbnail.
--
-- Source: <https://core.telegram.org/bots/api#photosize>.
-- Codec directions: decoded from responses, encoded into requests.
data PhotoSize = MkPhotoSize
  { -- | Identifier for this file, which can be used to download or reuse the file
    --
    -- Wire key: @file_id@.
    file_id :: Text
  , -- | Unique identifier for this file, which is supposed to be the same over time and for different bots. Can\'t be used to download or reuse the file.
    --
    -- Wire key: @file_unique_id@.
    file_unique_id :: Text
  , -- | Photo width
    --
    -- Wire key: @width@.
    width :: Int64
  , -- | Photo height
    --
    -- Wire key: @height@.
    height :: Int64
  , -- | Optional. File size in bytes
    --
    -- Wire key: @file_size@.
    -- Omitted from an encoded request when it is @Nothing@.
    file_size :: Maybe Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'PhotoSize' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkPhotoSize :: Text -> Text -> Int64 -> Int64 -> PhotoSize
mkPhotoSize arg0 arg1 arg2 arg3 =
  MkPhotoSize
    { file_id = arg0
    , file_unique_id = arg1
    , width = arg2
    , height = arg3
    , file_size = Nothing
    }

instance FromJSON PhotoSize where
  parseJSON = withObject "PhotoSize" $ \obj ->
    do
      field_0 <- requiredWith obj "file_id" parseJSON
      field_1 <- requiredWith obj "file_unique_id" parseJSON
      field_2 <- requiredWith obj "width" parseInt64
      field_3 <- requiredWith obj "height" parseInt64
      field_4 <- optionalWith obj "file_size" parseInt64
      pure
        MkPhotoSize
          { file_id = field_0
          , file_unique_id = field_1
          , width = field_2
          , height = field_3
          , file_size = field_4
          }

instance ToJSON PhotoSize where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "file_id" x.file_id
          , jsonField "file_unique_id" x.file_unique_id
          , jsonField "width" x.width
          , jsonField "height" x.height
          , jsonOptional "file_size" x.file_size
          ]
      )
  toEncoding = toEncoding . toJSON
