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
module Telegram.Bot.Methods.SetStickerEmojiList
  ( SetStickerEmojiList (..)
  , mkSetStickerEmojiList
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Text (Text)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planList, planRequestBody, planned, validateArrayCount, withValidation)

-- | Use this method to change the list of emoji assigned to a regular or custom emoji sticker. The sticker must belong to a sticker set created by the bot. Returns True on success.
--
-- Wire method spelling: @setStickerEmojiList@.
--
-- Source: <https://core.telegram.org/bots/api#setstickeremojilist>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SetStickerEmojiList = MkSetStickerEmojiList
  { -- | File identifier of the sticker
    --
    -- Wire key: @sticker@.
    sticker :: Text
  , -- | A JSON-serialized list of 1-20 emoji associated with the sticker
    --
    -- Wire key: @emoji_list@.
    -- Checked when planning a request: 1 to 20 elements.
    emoji_list :: [Text]
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SetStickerEmojiList' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSetStickerEmojiList :: Text -> [Text] -> SetStickerEmojiList
mkSetStickerEmojiList arg0 arg1 =
  MkSetStickerEmojiList
    { sticker = arg0
    , emoji_list = arg1
    , extra = mempty
    }

instance Method SetStickerEmojiList where
  type Result SetStickerEmojiList = TrueValue
  methodName _ = "setStickerEmojiList"
  planRequest x =
    planRequestBody
      "setStickerEmojiList"
      [ "sticker"
      , "emoji_list"
      ]
      ( concat
          [ planned "sticker" (encodeJson x.sticker)
          , planned "emoji_list" (withValidation (\loc_ -> validateArrayCount (Just 1) (Just 20) loc_ x.emoji_list) ((planList encodeJson) x.emoji_list))
          ]
      )
      x.extra
  parseResult _ = parseJSON
