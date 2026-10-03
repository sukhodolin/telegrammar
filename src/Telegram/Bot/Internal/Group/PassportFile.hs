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
module Telegram.Bot.Internal.Group.PassportFile
  ( PassportFile (..)
  , mkPassportFile
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonObject, parseInt64, requiredWith)

-- | This object represents a file uploaded to Telegram Passport. Currently all Telegram Passport files are in JPEG format when decrypted and don\'t exceed 10MB.
--
-- Source: <https://core.telegram.org/bots/api#passportfile>.
-- Codec directions: decoded from responses, encoded into requests.
data PassportFile = MkPassportFile
  { -- | Identifier for this file, which can be used to download or reuse the file
    --
    -- Wire key: @file_id@.
    file_id :: Text
  , -- | Unique identifier for this file, which is supposed to be the same over time and for different bots. Can\'t be used to download or reuse the file.
    --
    -- Wire key: @file_unique_id@.
    file_unique_id :: Text
  , -- | File size in bytes
    --
    -- Wire key: @file_size@.
    file_size :: Int64
  , -- | Unix time when the file was uploaded
    --
    -- Wire key: @file_date@.
    file_date :: Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'PassportFile' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkPassportFile :: Text -> Text -> Int64 -> Int64 -> PassportFile
mkPassportFile arg0 arg1 arg2 arg3 =
  MkPassportFile
    { file_id = arg0
    , file_unique_id = arg1
    , file_size = arg2
    , file_date = arg3
    }

instance FromJSON PassportFile where
  parseJSON = withObject "PassportFile" $ \obj ->
    do
      field_0 <- requiredWith obj "file_id" parseJSON
      field_1 <- requiredWith obj "file_unique_id" parseJSON
      field_2 <- requiredWith obj "file_size" parseInt64
      field_3 <- requiredWith obj "file_date" parseInt64
      pure
        MkPassportFile
          { file_id = field_0
          , file_unique_id = field_1
          , file_size = field_2
          , file_date = field_3
          }

instance ToJSON PassportFile where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "file_id" x.file_id
          , jsonField "file_unique_id" x.file_unique_id
          , jsonField "file_size" x.file_size
          , jsonField "file_date" x.file_date
          ]
      )
  toEncoding = toEncoding . toJSON
