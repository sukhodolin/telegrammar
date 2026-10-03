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
module Telegram.Bot.Methods.SetStickerPositionInSet
  ( SetStickerPositionInSet (..)
  , mkSetStickerPositionInSet
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned)

-- | Use this method to move a sticker in a set created by the bot to a specific position. Returns True on success.
--
-- Wire method spelling: @setStickerPositionInSet@.
--
-- Source: <https://core.telegram.org/bots/api#setstickerpositioninset>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SetStickerPositionInSet = MkSetStickerPositionInSet
  { -- | File identifier of the sticker
    --
    -- Wire key: @sticker@.
    sticker :: Text
  , -- | New sticker position in the set, zero-based
    --
    -- Wire key: @position@.
    position :: Int64
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SetStickerPositionInSet' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSetStickerPositionInSet :: Text -> Int64 -> SetStickerPositionInSet
mkSetStickerPositionInSet arg0 arg1 =
  MkSetStickerPositionInSet
    { sticker = arg0
    , position = arg1
    , extra = mempty
    }

instance Method SetStickerPositionInSet where
  type Result SetStickerPositionInSet = TrueValue
  methodName _ = "setStickerPositionInSet"
  planRequest x =
    planRequestBody
      "setStickerPositionInSet"
      [ "sticker"
      , "position"
      ]
      ( concat
          [ planned "sticker" (encodeJson x.sticker)
          , planned "position" (encodeJson x.position)
          ]
      )
      x.extra
  parseResult _ = parseJSON
