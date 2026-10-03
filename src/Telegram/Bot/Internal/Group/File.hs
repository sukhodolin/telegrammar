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
module Telegram.Bot.Internal.Group.File
  ( File (..)
  , mkFile
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseInt64, requiredWith)

-- | This object represents a file ready to be downloaded. The file can be downloaded via the link https:\/\/api.telegram.org\/file\/bot\<token\>\/\<file_path\>. It is guaranteed that the link will be valid for at least 1 hour. When the link expires, a new one can be requested by calling getFile.
--
-- Source: <https://core.telegram.org/bots/api#file>.
-- Codec directions: decoded from responses, encoded into requests.
data File = MkFile
  { -- | Identifier for this file, which can be used to download or reuse the file
    --
    -- Wire key: @file_id@.
    file_id :: Text
  , -- | Unique identifier for this file, which is supposed to be the same over time and for different bots. Can\'t be used to download or reuse the file.
    --
    -- Wire key: @file_unique_id@.
    file_unique_id :: Text
  , -- | Optional. File size in bytes. It can be bigger than 2^31 and some programming languages may have difficulty\/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this value.
    --
    -- Wire key: @file_size@.
    -- Omitted from an encoded request when it is @Nothing@.
    file_size :: Maybe Int64
  , -- | Optional. File path. Use https:\/\/api.telegram.org\/file\/bot\<token\>\/\<file_path\> to get the file.
    --
    -- Wire key: @file_path@.
    -- Omitted from an encoded request when it is @Nothing@.
    file_path :: Maybe Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'File' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkFile :: Text -> Text -> File
mkFile arg0 arg1 =
  MkFile
    { file_id = arg0
    , file_unique_id = arg1
    , file_size = Nothing
    , file_path = Nothing
    }

instance FromJSON File where
  parseJSON = withObject "File" $ \obj ->
    do
      field_0 <- requiredWith obj "file_id" parseJSON
      field_1 <- requiredWith obj "file_unique_id" parseJSON
      field_2 <- optionalWith obj "file_size" parseInt64
      field_3 <- optionalWith obj "file_path" parseJSON
      pure
        MkFile
          { file_id = field_0
          , file_unique_id = field_1
          , file_size = field_2
          , file_path = field_3
          }

instance ToJSON File where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "file_id" x.file_id
          , jsonField "file_unique_id" x.file_unique_id
          , jsonOptional "file_size" x.file_size
          , jsonOptional "file_path" x.file_path
          ]
      )
  toEncoding = toEncoding . toJSON
