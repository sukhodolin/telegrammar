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
module Telegram.Bot.Internal.Group.Sticker
  ( Sticker (..)
  , mkSticker
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.File (File)
import Telegram.Bot.Internal.Group.MaskPosition (MaskPosition)
import Telegram.Bot.Internal.Group.PhotoSize (PhotoSize)
import Telegram.Bot.Support (jsonField, jsonFlag, jsonObject, jsonOptional, optionalTrueFlag, optionalWith, parseInt64, requiredWith)

-- | This object represents a sticker.
--
-- Source: <https://core.telegram.org/bots/api#sticker>.
-- Codec directions: decoded from responses, encoded into requests.
data Sticker = MkSticker
  { -- | Identifier for this file, which can be used to download or reuse the file
    --
    -- Wire key: @file_id@.
    file_id :: Text
  , -- | Unique identifier for this file, which is supposed to be the same over time and for different bots. Can\'t be used to download or reuse the file.
    --
    -- Wire key: @file_unique_id@.
    file_unique_id :: Text
  , -- | Type of the sticker, currently one of \"regular\", \"mask\", \"custom_emoji\". The type of the sticker is independent from its format, which is determined by the fields is_animated and is_video.
    --
    -- Wire key: @type@.
    type_ :: Text
  , -- | Sticker width
    --
    -- Wire key: @width@.
    width :: Int64
  , -- | Sticker height
    --
    -- Wire key: @height@.
    height :: Int64
  , -- | True, if the sticker is animated
    --
    -- Wire key: @is_animated@.
    is_animated :: Bool
  , -- | True, if the sticker is a video sticker
    --
    -- Wire key: @is_video@.
    is_video :: Bool
  , -- | Optional. Sticker thumbnail in the .WEBP or .JPG format
    --
    -- Wire key: @thumbnail@.
    -- Omitted from an encoded request when it is @Nothing@.
    thumbnail :: Maybe PhotoSize
  , -- | Optional. Emoji associated with the sticker
    --
    -- Wire key: @emoji@.
    -- Omitted from an encoded request when it is @Nothing@.
    emoji :: Maybe Text
  , -- | Optional. Name of the sticker set to which the sticker belongs
    --
    -- Wire key: @set_name@.
    -- Omitted from an encoded request when it is @Nothing@.
    set_name :: Maybe Text
  , -- | Optional. For premium regular stickers, premium animation for the sticker
    --
    -- Wire key: @premium_animation@.
    -- Omitted from an encoded request when it is @Nothing@.
    premium_animation :: Maybe File
  , -- | Optional. For mask stickers, the position where the mask should be placed
    --
    -- Wire key: @mask_position@.
    -- Omitted from an encoded request when it is @Nothing@.
    mask_position :: Maybe MaskPosition
  , -- | Optional. For custom emoji stickers, unique identifier of the custom emoji
    --
    -- Wire key: @custom_emoji_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    custom_emoji_id :: Maybe Text
  , -- | Optional. True, if the sticker must be repainted to a text color in messages, the color of the Telegram Premium badge in emoji status, white color on chat photos, or another appropriate color in other places
    --
    -- Wire key: @needs_repainting@.
    -- Omitted from an encoded request when it is @False@.
    needs_repainting :: Bool
  , -- | Optional. File size in bytes
    --
    -- Wire key: @file_size@.
    -- Omitted from an encoded request when it is @Nothing@.
    file_size :: Maybe Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'Sticker' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSticker :: Text -> Text -> Text -> Int64 -> Int64 -> Bool -> Bool -> Sticker
mkSticker arg0 arg1 arg2 arg3 arg4 arg5 arg6 =
  MkSticker
    { file_id = arg0
    , file_unique_id = arg1
    , type_ = arg2
    , width = arg3
    , height = arg4
    , is_animated = arg5
    , is_video = arg6
    , thumbnail = Nothing
    , emoji = Nothing
    , set_name = Nothing
    , premium_animation = Nothing
    , mask_position = Nothing
    , custom_emoji_id = Nothing
    , needs_repainting = False
    , file_size = Nothing
    }

instance FromJSON Sticker where
  parseJSON = withObject "Sticker" $ \obj ->
    do
      field_0 <- requiredWith obj "file_id" parseJSON
      field_1 <- requiredWith obj "file_unique_id" parseJSON
      field_2 <- requiredWith obj "type" parseJSON
      field_3 <- requiredWith obj "width" parseInt64
      field_4 <- requiredWith obj "height" parseInt64
      field_5 <- requiredWith obj "is_animated" parseJSON
      field_6 <- requiredWith obj "is_video" parseJSON
      field_7 <- optionalWith obj "thumbnail" parseJSON
      field_8 <- optionalWith obj "emoji" parseJSON
      field_9 <- optionalWith obj "set_name" parseJSON
      field_10 <- optionalWith obj "premium_animation" parseJSON
      field_11 <- optionalWith obj "mask_position" parseJSON
      field_12 <- optionalWith obj "custom_emoji_id" parseJSON
      field_13 <- optionalTrueFlag obj "needs_repainting"
      field_14 <- optionalWith obj "file_size" parseInt64
      pure
        MkSticker
          { file_id = field_0
          , file_unique_id = field_1
          , type_ = field_2
          , width = field_3
          , height = field_4
          , is_animated = field_5
          , is_video = field_6
          , thumbnail = field_7
          , emoji = field_8
          , set_name = field_9
          , premium_animation = field_10
          , mask_position = field_11
          , custom_emoji_id = field_12
          , needs_repainting = field_13
          , file_size = field_14
          }

instance ToJSON Sticker where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "file_id" x.file_id
          , jsonField "file_unique_id" x.file_unique_id
          , jsonField "type" x.type_
          , jsonField "width" x.width
          , jsonField "height" x.height
          , jsonField "is_animated" x.is_animated
          , jsonField "is_video" x.is_video
          , jsonOptional "thumbnail" x.thumbnail
          , jsonOptional "emoji" x.emoji
          , jsonOptional "set_name" x.set_name
          , jsonOptional "premium_animation" x.premium_animation
          , jsonOptional "mask_position" x.mask_position
          , jsonOptional "custom_emoji_id" x.custom_emoji_id
          , jsonFlag "needs_repainting" x.needs_repainting
          , jsonOptional "file_size" x.file_size
          ]
      )
  toEncoding = toEncoding . toJSON
