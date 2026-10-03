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
module Telegram.Bot.Internal.Group.ChatPhoto
  ( ChatPhoto (..)
  , mkChatPhoto
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonObject, requiredWith)

-- | This object represents a chat photo.
--
-- Source: <https://core.telegram.org/bots/api#chatphoto>.
-- Codec directions: decoded from responses, encoded into requests.
data ChatPhoto = MkChatPhoto
  { -- | File identifier of small (160x160) chat photo. This file_id can be used only for photo download and only for as long as the photo is not changed.
    --
    -- Wire key: @small_file_id@.
    small_file_id :: Text
  , -- | Unique file identifier of small (160x160) chat photo, which is supposed to be the same over time and for different bots. Can\'t be used to download or reuse the file.
    --
    -- Wire key: @small_file_unique_id@.
    small_file_unique_id :: Text
  , -- | File identifier of big (640x640) chat photo. This file_id can be used only for photo download and only for as long as the photo is not changed.
    --
    -- Wire key: @big_file_id@.
    big_file_id :: Text
  , -- | Unique file identifier of big (640x640) chat photo, which is supposed to be the same over time and for different bots. Can\'t be used to download or reuse the file.
    --
    -- Wire key: @big_file_unique_id@.
    big_file_unique_id :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ChatPhoto' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkChatPhoto :: Text -> Text -> Text -> Text -> ChatPhoto
mkChatPhoto arg0 arg1 arg2 arg3 =
  MkChatPhoto
    { small_file_id = arg0
    , small_file_unique_id = arg1
    , big_file_id = arg2
    , big_file_unique_id = arg3
    }

instance FromJSON ChatPhoto where
  parseJSON = withObject "ChatPhoto" $ \obj ->
    do
      field_0 <- requiredWith obj "small_file_id" parseJSON
      field_1 <- requiredWith obj "small_file_unique_id" parseJSON
      field_2 <- requiredWith obj "big_file_id" parseJSON
      field_3 <- requiredWith obj "big_file_unique_id" parseJSON
      pure
        MkChatPhoto
          { small_file_id = field_0
          , small_file_unique_id = field_1
          , big_file_id = field_2
          , big_file_unique_id = field_3
          }

instance ToJSON ChatPhoto where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "small_file_id" x.small_file_id
          , jsonField "small_file_unique_id" x.small_file_unique_id
          , jsonField "big_file_id" x.big_file_id
          , jsonField "big_file_unique_id" x.big_file_unique_id
          ]
      )
  toEncoding = toEncoding . toJSON
