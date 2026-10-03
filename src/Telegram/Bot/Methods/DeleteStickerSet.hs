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
module Telegram.Bot.Methods.DeleteStickerSet
  ( DeleteStickerSet (..)
  , mkDeleteStickerSet
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Text (Text)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned)

-- | Use this method to delete a sticker set that was created by the bot. Returns True on success.
--
-- Wire method spelling: @deleteStickerSet@.
--
-- Source: <https://core.telegram.org/bots/api#deletestickerset>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data DeleteStickerSet = MkDeleteStickerSet
  { -- | Sticker set name
    --
    -- Wire key: @name@.
    name :: Text
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'DeleteStickerSet' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkDeleteStickerSet :: Text -> DeleteStickerSet
mkDeleteStickerSet arg0 =
  MkDeleteStickerSet
    { name = arg0
    , extra = mempty
    }

instance Method DeleteStickerSet where
  type Result DeleteStickerSet = TrueValue
  methodName _ = "deleteStickerSet"
  planRequest x =
    planRequestBody
      "deleteStickerSet"
      [ "name"
      ]
      ( concat
          [ planned "name" (encodeJson x.name)
          ]
      )
      x.extra
  parseResult _ = parseJSON
