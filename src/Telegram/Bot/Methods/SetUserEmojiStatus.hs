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
module Telegram.Bot.Methods.SetUserEmojiStatus
  ( SetUserEmojiStatus (..)
  , mkSetUserEmojiStatus
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned, plannedMaybe)

-- | Changes the emoji status for a given user that previously allowed the bot to manage their emoji status via the Mini App method requestEmojiStatusAccess. Returns True on success.
--
-- Wire method spelling: @setUserEmojiStatus@.
--
-- Source: <https://core.telegram.org/bots/api#setuseremojistatus>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SetUserEmojiStatus = MkSetUserEmojiStatus
  { -- | Unique identifier of the target user
    --
    -- Wire key: @user_id@.
    user_id :: Int64
  , -- | Custom emoji identifier of the emoji status to set. Pass an empty string to remove the status.
    --
    -- Wire key: @emoji_status_custom_emoji_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    emoji_status_custom_emoji_id :: Maybe Text
  , -- | Expiration date of the emoji status, if any
    --
    -- Wire key: @emoji_status_expiration_date@.
    -- Omitted from an encoded request when it is @Nothing@.
    emoji_status_expiration_date :: Maybe Int64
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SetUserEmojiStatus' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSetUserEmojiStatus :: Int64 -> SetUserEmojiStatus
mkSetUserEmojiStatus arg0 =
  MkSetUserEmojiStatus
    { user_id = arg0
    , emoji_status_custom_emoji_id = Nothing
    , emoji_status_expiration_date = Nothing
    , extra = mempty
    }

instance Method SetUserEmojiStatus where
  type Result SetUserEmojiStatus = TrueValue
  methodName _ = "setUserEmojiStatus"
  planRequest x =
    planRequestBody
      "setUserEmojiStatus"
      [ "user_id"
      , "emoji_status_custom_emoji_id"
      , "emoji_status_expiration_date"
      ]
      ( concat
          [ planned "user_id" (encodeJson x.user_id)
          , plannedMaybe "emoji_status_custom_emoji_id" x.emoji_status_custom_emoji_id encodeJson
          , plannedMaybe "emoji_status_expiration_date" x.emoji_status_expiration_date encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
