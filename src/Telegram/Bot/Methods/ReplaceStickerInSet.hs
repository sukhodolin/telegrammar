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
module Telegram.Bot.Methods.ReplaceStickerInSet
  ( ReplaceStickerInSet (..)
  , mkReplaceStickerInSet
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.InputSticker (InputSticker, planInputSticker)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned)

-- | Use this method to replace an existing sticker in a sticker set with a new one. The method is equivalent to calling deleteStickerFromSet, then addStickerToSet, then setStickerPositionInSet. Returns True on success.
--
-- Wire method spelling: @replaceStickerInSet@.
--
-- Source: <https://core.telegram.org/bots/api#replacestickerinset>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data ReplaceStickerInSet = MkReplaceStickerInSet
  { -- | User identifier of the sticker set owner
    --
    -- Wire key: @user_id@.
    user_id :: Int64
  , -- | Sticker set name
    --
    -- Wire key: @name@.
    name :: Text
  , -- | File identifier of the replaced sticker
    --
    -- Wire key: @old_sticker@.
    old_sticker :: Text
  , -- | A JSON-serialized object with information about the added sticker. If exactly the same sticker had already been added to the set, then the set remains unchanged.
    --
    -- Wire key: @sticker@.
    sticker :: InputSticker
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ReplaceStickerInSet' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkReplaceStickerInSet :: Int64 -> Text -> Text -> InputSticker -> ReplaceStickerInSet
mkReplaceStickerInSet arg0 arg1 arg2 arg3 =
  MkReplaceStickerInSet
    { user_id = arg0
    , name = arg1
    , old_sticker = arg2
    , sticker = arg3
    , extra = mempty
    }

instance Method ReplaceStickerInSet where
  type Result ReplaceStickerInSet = TrueValue
  methodName _ = "replaceStickerInSet"
  planRequest x =
    planRequestBody
      "replaceStickerInSet"
      [ "user_id"
      , "name"
      , "old_sticker"
      , "sticker"
      ]
      ( concat
          [ planned "user_id" (encodeJson x.user_id)
          , planned "name" (encodeJson x.name)
          , planned "old_sticker" (encodeJson x.old_sticker)
          , planned "sticker" (planInputSticker x.sticker)
          ]
      )
      x.extra
  parseResult _ = parseJSON
