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
module Telegram.Bot.Methods.SetStickerKeywords
  ( SetStickerKeywords (..)
  , mkSetStickerKeywords
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Text (Text)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planList, planRequestBody, planned, plannedMaybe, validateArrayCount, withValidation)

-- | Use this method to change search keywords assigned to a regular or custom emoji sticker. The sticker must belong to a sticker set created by the bot. Returns True on success.
--
-- Wire method spelling: @setStickerKeywords@.
--
-- Source: <https://core.telegram.org/bots/api#setstickerkeywords>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SetStickerKeywords = MkSetStickerKeywords
  { -- | File identifier of the sticker
    --
    -- Wire key: @sticker@.
    sticker :: Text
  , -- | A JSON-serialized list of 0-20 search keywords for the sticker with total length of up to 64 characters
    --
    -- Wire key: @keywords@.
    -- Omitted from an encoded request when it is @Nothing@.
    -- Checked when planning a request: at most 20 element(s).
    keywords :: Maybe [Text]
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SetStickerKeywords' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSetStickerKeywords :: Text -> SetStickerKeywords
mkSetStickerKeywords arg0 =
  MkSetStickerKeywords
    { sticker = arg0
    , keywords = Nothing
    , extra = mempty
    }

instance Method SetStickerKeywords where
  type Result SetStickerKeywords = TrueValue
  methodName _ = "setStickerKeywords"
  planRequest x =
    planRequestBody
      "setStickerKeywords"
      [ "sticker"
      , "keywords"
      ]
      ( concat
          [ planned "sticker" (encodeJson x.sticker)
          , plannedMaybe "keywords" x.keywords (\v_ -> withValidation (\loc_ -> validateArrayCount Nothing (Just 20) loc_ v_) ((planList encodeJson) v_))
          ]
      )
      x.extra
  parseResult _ = parseJSON
