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
module Telegram.Bot.Methods.SetCustomEmojiStickerSetThumbnail
  ( SetCustomEmojiStickerSetThumbnail (..)
  , mkSetCustomEmojiStickerSetThumbnail
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Text (Text)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned, plannedMaybe)

-- | Use this method to set the thumbnail of a custom emoji sticker set. Returns True on success.
--
-- Wire method spelling: @setCustomEmojiStickerSetThumbnail@.
--
-- Source: <https://core.telegram.org/bots/api#setcustomemojistickersetthumbnail>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SetCustomEmojiStickerSetThumbnail = MkSetCustomEmojiStickerSetThumbnail
  { -- | Sticker set name
    --
    -- Wire key: @name@.
    name :: Text
  , -- | Custom emoji identifier of a sticker from the sticker set; pass an empty string to drop the thumbnail and use the first sticker as the thumbnail
    --
    -- Wire key: @custom_emoji_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    custom_emoji_id :: Maybe Text
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SetCustomEmojiStickerSetThumbnail' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSetCustomEmojiStickerSetThumbnail :: Text -> SetCustomEmojiStickerSetThumbnail
mkSetCustomEmojiStickerSetThumbnail arg0 =
  MkSetCustomEmojiStickerSetThumbnail
    { name = arg0
    , custom_emoji_id = Nothing
    , extra = mempty
    }

instance Method SetCustomEmojiStickerSetThumbnail where
  type Result SetCustomEmojiStickerSetThumbnail = TrueValue
  methodName _ = "setCustomEmojiStickerSetThumbnail"
  planRequest x =
    planRequestBody
      "setCustomEmojiStickerSetThumbnail"
      [ "name"
      , "custom_emoji_id"
      ]
      ( concat
          [ planned "name" (encodeJson x.name)
          , plannedMaybe "custom_emoji_id" x.custom_emoji_id encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
