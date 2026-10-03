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
module Telegram.Bot.Methods.CreateNewStickerSet
  ( CreateNewStickerSet (..)
  , mkCreateNewStickerSet
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.InputSticker (InputSticker, planInputSticker)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planList, planRequestBody, planned, plannedMaybe, validateArrayCount, withValidation)

-- | Use this method to create a new sticker set owned by a user. The bot will be able to edit the sticker set thus created. Returns True on success.
--
-- Wire method spelling: @createNewStickerSet@.
--
-- Source: <https://core.telegram.org/bots/api#createnewstickerset>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data CreateNewStickerSet = MkCreateNewStickerSet
  { -- | User identifier of created sticker set owner
    --
    -- Wire key: @user_id@.
    user_id :: Int64
  , -- | Short name of sticker set, to be used in t.me\/addstickers\/ URLs (e.g., animals). Can contain only English letters, digits and underscores. Must begin with a letter, can\'t contain consecutive underscores and must end in \"_by_\<bot_username\>\". \<bot_username\> is case insensitive. 1-64 characters.
    --
    -- Wire key: @name@.
    name :: Text
  , -- | Sticker set title, 1-64 characters
    --
    -- Wire key: @title@.
    title :: Text
  , -- | A JSON-serialized list of 1-50 initial stickers to be added to the sticker set
    --
    -- Wire key: @stickers@.
    -- Checked when planning a request: 1 to 50 elements.
    stickers :: [InputSticker]
  , -- | Type of stickers in the set, pass \"regular\", \"mask\", or \"custom_emoji\". By default, a regular sticker set is created.
    --
    -- Wire key: @sticker_type@.
    -- Omitted from an encoded request when it is @Nothing@.
    sticker_type :: Maybe Text
  , -- | Pass True if stickers in the sticker set must be repainted to the color of text when used in messages, the accent color if used as emoji status, white on chat photos, or another appropriate color based on context; for custom emoji sticker sets only
    --
    -- Wire key: @needs_repainting@.
    -- Omitted from an encoded request when it is @Nothing@.
    needs_repainting :: Maybe Bool
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'CreateNewStickerSet' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkCreateNewStickerSet :: Int64 -> Text -> Text -> [InputSticker] -> CreateNewStickerSet
mkCreateNewStickerSet arg0 arg1 arg2 arg3 =
  MkCreateNewStickerSet
    { user_id = arg0
    , name = arg1
    , title = arg2
    , stickers = arg3
    , sticker_type = Nothing
    , needs_repainting = Nothing
    , extra = mempty
    }

instance Method CreateNewStickerSet where
  type Result CreateNewStickerSet = TrueValue
  methodName _ = "createNewStickerSet"
  planRequest x =
    planRequestBody
      "createNewStickerSet"
      [ "user_id"
      , "name"
      , "title"
      , "stickers"
      , "sticker_type"
      , "needs_repainting"
      ]
      ( concat
          [ planned "user_id" (encodeJson x.user_id)
          , planned "name" (encodeJson x.name)
          , planned "title" (encodeJson x.title)
          , planned "stickers" (withValidation (\loc_ -> validateArrayCount (Just 1) (Just 50) loc_ x.stickers) ((planList planInputSticker) x.stickers))
          , plannedMaybe "sticker_type" x.sticker_type encodeJson
          , plannedMaybe "needs_repainting" x.needs_repainting encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
