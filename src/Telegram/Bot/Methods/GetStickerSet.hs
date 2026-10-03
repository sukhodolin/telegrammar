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
module Telegram.Bot.Methods.GetStickerSet
  ( GetStickerSet (..)
  , mkGetStickerSet
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.StickerSet (StickerSet)
import Telegram.Bot.Support (Method (..), encodeJson, planRequestBody, planned)

-- | Use this method to get a sticker set. On success, a StickerSet object is returned.
--
-- Wire method spelling: @getStickerSet@.
--
-- Source: <https://core.telegram.org/bots/api#getstickerset>.
-- Result: @StickerSet@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data GetStickerSet = MkGetStickerSet
  { -- | Name of the sticker set
    --
    -- Wire key: @name@.
    name :: Text
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'GetStickerSet' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkGetStickerSet :: Text -> GetStickerSet
mkGetStickerSet arg0 =
  MkGetStickerSet
    { name = arg0
    , extra = mempty
    }

instance Method GetStickerSet where
  type Result GetStickerSet = StickerSet
  methodName _ = "getStickerSet"
  planRequest x =
    planRequestBody
      "getStickerSet"
      [ "name"
      ]
      ( concat
          [ planned "name" (encodeJson x.name)
          ]
      )
      x.extra
  parseResult _ = parseJSON
