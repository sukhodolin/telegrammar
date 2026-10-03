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
module Telegram.Bot.Methods.UploadStickerFile
  ( UploadStickerFile (..)
  , mkUploadStickerFile
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.File (File)
import Telegram.Bot.Support (FileCapability (..), InputFile, Method (..), encodeJson, filePolicy, planFileValue, planRequestBody, planned)

-- | Use this method to upload a file with a sticker for later use in the createNewStickerSet, addStickerToSet, or replaceStickerInSet methods (the file can be used multiple times). Returns the uploaded File on success.
--
-- Wire method spelling: @uploadStickerFile@.
--
-- Source: <https://core.telegram.org/bots/api#uploadstickerfile>.
-- Result: @File@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data UploadStickerFile = MkUploadStickerFile
  { -- | User identifier of sticker file owner
    --
    -- Wire key: @user_id@.
    user_id :: Int64
  , -- | A file with the sticker in .WEBP, .PNG, .TGS, or .WEBM format. See https:\/\/core.telegram.org\/stickers for technical requirements. More information on Sending Files: https:\/\/core.telegram.org\/bots\/api\#sending-files
    --
    -- Wire key: @sticker@.
    -- File sources accepted here: @upload@.
    sticker :: InputFile
  , -- | Format of the sticker, must be one of \"static\", \"animated\", \"video\"
    --
    -- Wire key: @sticker_format@.
    sticker_format :: Text
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'UploadStickerFile' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkUploadStickerFile :: Int64 -> InputFile -> Text -> UploadStickerFile
mkUploadStickerFile arg0 arg1 arg2 =
  MkUploadStickerFile
    { user_id = arg0
    , sticker = arg1
    , sticker_format = arg2
    , extra = mempty
    }

instance Method UploadStickerFile where
  type Result UploadStickerFile = File
  methodName _ = "uploadStickerFile"
  planRequest x =
    planRequestBody
      "uploadStickerFile"
      [ "user_id"
      , "sticker"
      , "sticker_format"
      ]
      ( concat
          [ planned "user_id" (encodeJson x.user_id)
          , planned "sticker" ((planFileValue (filePolicy [UploadCapability])) x.sticker)
          , planned "sticker_format" (encodeJson x.sticker_format)
          ]
      )
      x.extra
  parseResult _ = parseJSON
