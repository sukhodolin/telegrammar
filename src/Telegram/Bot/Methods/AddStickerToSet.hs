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
module Telegram.Bot.Methods.AddStickerToSet
  ( AddStickerToSet (..)
  , mkAddStickerToSet
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.InputSticker (InputSticker, planInputSticker)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned)

-- | Use this method to add a new sticker to a set created by the bot. Emoji sticker sets can have up to 200 stickers. Other sticker sets can have up to 120 stickers. Returns True on success.
--
-- Wire method spelling: @addStickerToSet@.
--
-- Source: <https://core.telegram.org/bots/api#addstickertoset>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data AddStickerToSet = MkAddStickerToSet
  { -- | User identifier of sticker set owner
    --
    -- Wire key: @user_id@.
    user_id :: Int64
  , -- | Sticker set name
    --
    -- Wire key: @name@.
    name :: Text
  , -- | A JSON-serialized object with information about the added sticker. If exactly the same sticker had already been added to the set, then the set isn\'t changed.
    --
    -- Wire key: @sticker@.
    sticker :: InputSticker
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'AddStickerToSet' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkAddStickerToSet :: Int64 -> Text -> InputSticker -> AddStickerToSet
mkAddStickerToSet arg0 arg1 arg2 =
  MkAddStickerToSet
    { user_id = arg0
    , name = arg1
    , sticker = arg2
    , extra = mempty
    }

instance Method AddStickerToSet where
  type Result AddStickerToSet = TrueValue
  methodName _ = "addStickerToSet"
  planRequest x =
    planRequestBody
      "addStickerToSet"
      [ "user_id"
      , "name"
      , "sticker"
      ]
      ( concat
          [ planned "user_id" (encodeJson x.user_id)
          , planned "name" (encodeJson x.name)
          , planned "sticker" (planInputSticker x.sticker)
          ]
      )
      x.extra
  parseResult _ = parseJSON
