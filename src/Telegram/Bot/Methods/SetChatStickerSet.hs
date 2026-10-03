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
module Telegram.Bot.Methods.SetChatStickerSet
  ( SetChatStickerSet (..)
  , mkSetChatStickerSet
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned)

-- | Use this method to set a new group sticker set for a supergroup. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Use the field can_set_sticker_set optionally returned in getChat requests to check if the bot can use this method. Returns True on success.
--
-- Wire method spelling: @setChatStickerSet@.
--
-- Source: <https://core.telegram.org/bots/api#setchatstickerset>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SetChatStickerSet = MkSetChatStickerSet
  { -- | Unique identifier for the target chat or username of the target supergroup in the format \@username
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | Name of the sticker set to be set as the group sticker set
    --
    -- Wire key: @sticker_set_name@.
    sticker_set_name :: Text
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SetChatStickerSet' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSetChatStickerSet :: IntegerOrString -> Text -> SetChatStickerSet
mkSetChatStickerSet arg0 arg1 =
  MkSetChatStickerSet
    { chat_id = arg0
    , sticker_set_name = arg1
    , extra = mempty
    }

instance Method SetChatStickerSet where
  type Result SetChatStickerSet = TrueValue
  methodName _ = "setChatStickerSet"
  planRequest x =
    planRequestBody
      "setChatStickerSet"
      [ "chat_id"
      , "sticker_set_name"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          , planned "sticker_set_name" (encodeJson x.sticker_set_name)
          ]
      )
      x.extra
  parseResult _ = parseJSON
