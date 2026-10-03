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
module Telegram.Bot.Methods.SetStickerMaskPosition
  ( SetStickerMaskPosition (..)
  , mkSetStickerMaskPosition
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.MaskPosition (MaskPosition)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned, plannedMaybe)

-- | Use this method to change the mask position of a mask sticker. The sticker must belong to a sticker set that was created by the bot. Returns True on success.
--
-- Wire method spelling: @setStickerMaskPosition@.
--
-- Source: <https://core.telegram.org/bots/api#setstickermaskposition>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SetStickerMaskPosition = MkSetStickerMaskPosition
  { -- | File identifier of the sticker
    --
    -- Wire key: @sticker@.
    sticker :: Text
  , -- | A JSON-serialized object with the position where the mask should be placed on faces. Omit the parameter to remove the mask position.
    --
    -- Wire key: @mask_position@.
    -- Omitted from an encoded request when it is @Nothing@.
    mask_position :: Maybe MaskPosition
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SetStickerMaskPosition' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSetStickerMaskPosition :: Text -> SetStickerMaskPosition
mkSetStickerMaskPosition arg0 =
  MkSetStickerMaskPosition
    { sticker = arg0
    , mask_position = Nothing
    , extra = mempty
    }

instance Method SetStickerMaskPosition where
  type Result SetStickerMaskPosition = TrueValue
  methodName _ = "setStickerMaskPosition"
  planRequest x =
    planRequestBody
      "setStickerMaskPosition"
      [ "sticker"
      , "mask_position"
      ]
      ( concat
          [ planned "sticker" (encodeJson x.sticker)
          , plannedMaybe "mask_position" x.mask_position encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
