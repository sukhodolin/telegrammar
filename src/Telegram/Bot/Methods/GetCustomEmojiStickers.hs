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
module Telegram.Bot.Methods.GetCustomEmojiStickers
  ( GetCustomEmojiStickers (..)
  , mkGetCustomEmojiStickers
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.Sticker (Sticker)
import Telegram.Bot.Support (Method (..), encodeJson, parseList, planList, planRequestBody, planned, validateArrayCount, withValidation)

-- | Use this method to get information about custom emoji stickers by their identifiers. Returns an Array of Sticker objects.
--
-- Wire method spelling: @getCustomEmojiStickers@.
--
-- Source: <https://core.telegram.org/bots/api#getcustomemojistickers>.
-- Result: @[Sticker]@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data GetCustomEmojiStickers = MkGetCustomEmojiStickers
  { -- | A JSON-serialized list of custom emoji identifiers. At most 200 custom emoji identifiers can be specified.
    --
    -- Wire key: @custom_emoji_ids@.
    -- Checked when planning a request: at most 200 element(s).
    custom_emoji_ids :: [Text]
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'GetCustomEmojiStickers' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkGetCustomEmojiStickers :: [Text] -> GetCustomEmojiStickers
mkGetCustomEmojiStickers arg0 =
  MkGetCustomEmojiStickers
    { custom_emoji_ids = arg0
    , extra = mempty
    }

instance Method GetCustomEmojiStickers where
  type Result GetCustomEmojiStickers = [Sticker]
  methodName _ = "getCustomEmojiStickers"
  planRequest x =
    planRequestBody
      "getCustomEmojiStickers"
      [ "custom_emoji_ids"
      ]
      ( concat
          [ planned "custom_emoji_ids" (withValidation (\loc_ -> validateArrayCount Nothing (Just 200) loc_ x.custom_emoji_ids) ((planList encodeJson) x.custom_emoji_ids))
          ]
      )
      x.extra
  parseResult _ = (parseList parseJSON)
