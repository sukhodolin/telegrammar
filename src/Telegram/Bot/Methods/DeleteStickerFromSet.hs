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
module Telegram.Bot.Methods.DeleteStickerFromSet
  ( DeleteStickerFromSet (..)
  , mkDeleteStickerFromSet
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Text (Text)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned)

-- | Use this method to delete a sticker from a set created by the bot. Returns True on success.
--
-- Wire method spelling: @deleteStickerFromSet@.
--
-- Source: <https://core.telegram.org/bots/api#deletestickerfromset>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data DeleteStickerFromSet = MkDeleteStickerFromSet
  { -- | File identifier of the sticker
    --
    -- Wire key: @sticker@.
    sticker :: Text
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'DeleteStickerFromSet' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkDeleteStickerFromSet :: Text -> DeleteStickerFromSet
mkDeleteStickerFromSet arg0 =
  MkDeleteStickerFromSet
    { sticker = arg0
    , extra = mempty
    }

instance Method DeleteStickerFromSet where
  type Result DeleteStickerFromSet = TrueValue
  methodName _ = "deleteStickerFromSet"
  planRequest x =
    planRequestBody
      "deleteStickerFromSet"
      [ "sticker"
      ]
      ( concat
          [ planned "sticker" (encodeJson x.sticker)
          ]
      )
      x.extra
  parseResult _ = parseJSON
