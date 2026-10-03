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
module Telegram.Bot.Internal.Group.StickerSet
  ( StickerSet (..)
  , mkStickerSet
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.PhotoSize (PhotoSize)
import Telegram.Bot.Internal.Group.Sticker (Sticker)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseList, requiredWith)

-- | This object represents a sticker set.
--
-- Source: <https://core.telegram.org/bots/api#stickerset>.
-- Codec directions: decoded from responses, encoded into requests.
data StickerSet = MkStickerSet
  { -- | Sticker set name
    --
    -- Wire key: @name@.
    name :: Text
  , -- | Sticker set title
    --
    -- Wire key: @title@.
    title :: Text
  , -- | Type of stickers in the set, currently one of \"regular\", \"mask\", \"custom_emoji\"
    --
    -- Wire key: @sticker_type@.
    sticker_type :: Text
  , -- | List of all set stickers
    --
    -- Wire key: @stickers@.
    stickers :: [Sticker]
  , -- | Optional. Sticker set thumbnail in the .WEBP, .TGS, or .WEBM format
    --
    -- Wire key: @thumbnail@.
    -- Omitted from an encoded request when it is @Nothing@.
    thumbnail :: Maybe PhotoSize
  }
  deriving stock (Eq, Show)

-- | Initialize a 'StickerSet' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkStickerSet :: Text -> Text -> Text -> [Sticker] -> StickerSet
mkStickerSet arg0 arg1 arg2 arg3 =
  MkStickerSet
    { name = arg0
    , title = arg1
    , sticker_type = arg2
    , stickers = arg3
    , thumbnail = Nothing
    }

instance FromJSON StickerSet where
  parseJSON = withObject "StickerSet" $ \obj ->
    do
      field_0 <- requiredWith obj "name" parseJSON
      field_1 <- requiredWith obj "title" parseJSON
      field_2 <- requiredWith obj "sticker_type" parseJSON
      field_3 <- requiredWith obj "stickers" (parseList parseJSON)
      field_4 <- optionalWith obj "thumbnail" parseJSON
      pure
        MkStickerSet
          { name = field_0
          , title = field_1
          , sticker_type = field_2
          , stickers = field_3
          , thumbnail = field_4
          }

instance ToJSON StickerSet where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "name" x.name
          , jsonField "title" x.title
          , jsonField "sticker_type" x.sticker_type
          , jsonField "stickers" x.stickers
          , jsonOptional "thumbnail" x.thumbnail
          ]
      )
  toEncoding = toEncoding . toJSON
