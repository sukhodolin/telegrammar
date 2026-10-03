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
module Telegram.Bot.Methods.SetStickerSetTitle
  ( SetStickerSetTitle (..)
  , mkSetStickerSetTitle
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Text (Text)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned)

-- | Use this method to set the title of a created sticker set. Returns True on success.
--
-- Wire method spelling: @setStickerSetTitle@.
--
-- Source: <https://core.telegram.org/bots/api#setstickersettitle>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SetStickerSetTitle = MkSetStickerSetTitle
  { -- | Sticker set name
    --
    -- Wire key: @name@.
    name :: Text
  , -- | Sticker set title, 1-64 characters
    --
    -- Wire key: @title@.
    title :: Text
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SetStickerSetTitle' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSetStickerSetTitle :: Text -> Text -> SetStickerSetTitle
mkSetStickerSetTitle arg0 arg1 =
  MkSetStickerSetTitle
    { name = arg0
    , title = arg1
    , extra = mempty
    }

instance Method SetStickerSetTitle where
  type Result SetStickerSetTitle = TrueValue
  methodName _ = "setStickerSetTitle"
  planRequest x =
    planRequestBody
      "setStickerSetTitle"
      [ "name"
      , "title"
      ]
      ( concat
          [ planned "name" (encodeJson x.name)
          , planned "title" (encodeJson x.title)
          ]
      )
      x.extra
  parseResult _ = parseJSON
