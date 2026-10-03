{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeFamilies #-}

-- | One method's request record, initializer, and result association.
--
-- Import this module qualified to update an optional parameter, which is
-- the supported idiom for a record whose field labels repeat across
-- methods.
--
-- Generated. Do not edit.
module Telegram.Bot.Methods.SetStickerSetThumbnail
  ( SetStickerSetThumbnail (..)
  , mkSetStickerSetThumbnail
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Support (FileCapability (..), InputFile, Method (..), TrueValue, encodeJson, filePolicy, planFileValue, planRequestBody, planned, plannedMaybe)

-- | Use this method to set the thumbnail of a regular or mask sticker set. The format of the thumbnail file must match the format of the stickers in the set. Returns True on success.
--
-- Wire method spelling: @setStickerSetThumbnail@.
--
-- Source: <https://core.telegram.org/bots/api#setstickersetthumbnail>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SetStickerSetThumbnail = MkSetStickerSetThumbnail
  { -- | Sticker set name
    --
    -- Wire key: @name@.
    name :: Text
  , -- | User identifier of the sticker set owner
    --
    -- Wire key: @user_id@.
    user_id :: Int64
  , -- | A .WEBP or .PNG image with the thumbnail, must be up to 128 kilobytes in size and have a width and height of exactly 100px, or a .TGS animation with a thumbnail up to 32 kilobytes in size (see https:\/\/core.telegram.org\/stickers\#animation-requirements for animated sticker technical requirements), or a .WEBM video with the thumbnail up to 32 kilobytes in size; see https:\/\/core.telegram.org\/stickers\#video-requirements for video sticker technical requirements. Pass a file_id as a String to send a file that already exists on the Telegram servers, pass an HTTP URL as a String for Telegram to get a file from the Internet, or upload a new one using multipart\/form-data. More information on Sending Files: https:\/\/core.telegram.org\/bots\/api\#sending-files. Animated and video sticker set thumbnails can\'t be uploaded via HTTP URL. If omitted, then the thumbnail is dropped and the first sticker is used as the thumbnail.
    --
    -- Wire key: @thumbnail@.
    -- Omitted from an encoded request when it is @Nothing@.
    -- File sources accepted here: @existing_file@, @http_url@, @upload@.
    thumbnail :: Maybe InputFile
  , -- | Format of the thumbnail, must be one of \"static\" for a .WEBP or .PNG image, \"animated\" for a .TGS animation, or \"video\" for a .WEBM video
    --
    -- Wire key: @format@.
    format :: Text
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SetStickerSetThumbnail' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSetStickerSetThumbnail :: Text -> Int64 -> Text -> SetStickerSetThumbnail
mkSetStickerSetThumbnail arg0 arg1 arg2 =
  MkSetStickerSetThumbnail
    { name = arg0
    , user_id = arg1
    , thumbnail = Nothing
    , format = arg2
    , extra = mempty
    }

instance Method SetStickerSetThumbnail where
  type Result SetStickerSetThumbnail = TrueValue
  methodName _ = "setStickerSetThumbnail"
  planRequest x =
    planRequestBody
      "setStickerSetThumbnail"
      [ "name"
      , "user_id"
      , "thumbnail"
      , "format"
      ]
      ( concat
          [ planned "name" (encodeJson x.name)
          , planned "user_id" (encodeJson x.user_id)
          , plannedMaybe "thumbnail" x.thumbnail (planFileValue (filePolicy [ExistingFileCapability, HttpUrlCapability, UploadCapability]))
          , planned "format" (encodeJson x.format)
          ]
      )
      x.extra
  parseResult _ = parseJSON
