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
module Telegram.Bot.Methods.GiftPremiumSubscription
  ( GiftPremiumSubscription (..)
  , mkGiftPremiumSubscription
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.MessageEntity (MessageEntity)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planList, planRequestBody, planned, plannedMaybe)

-- | Gifts a Telegram Premium subscription to the given user. Returns True on success.
--
-- Wire method spelling: @giftPremiumSubscription@.
--
-- Source: <https://core.telegram.org/bots/api#giftpremiumsubscription>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data GiftPremiumSubscription = MkGiftPremiumSubscription
  { -- | Unique identifier of the target user who will receive a Telegram Premium subscription
    --
    -- Wire key: @user_id@.
    user_id :: Int64
  , -- | Number of months the Telegram Premium subscription will be active for the user; must be one of 3, 6, or 12
    --
    -- Wire key: @month_count@.
    month_count :: Int64
  , -- | Number of Telegram Stars to pay for the Telegram Premium subscription; must be 1000 for 3 months, 1500 for 6 months, and 2500 for 12 months
    --
    -- Wire key: @star_count@.
    star_count :: Int64
  , -- | Text that will be shown along with the service message about the subscription; 0-128 characters
    --
    -- Wire key: @text@.
    -- Omitted from an encoded request when it is @Nothing@.
    text :: Maybe Text
  , -- | Mode for parsing entities in the text. See formatting options for more details. Entities other than \"bold\", \"italic\", \"underline\", \"strikethrough\", \"spoiler\", \"custom_emoji\", and \"date_time\" are ignored.
    --
    -- Wire key: @text_parse_mode@.
    -- Omitted from an encoded request when it is @Nothing@.
    text_parse_mode :: Maybe Text
  , -- | A JSON-serialized list of special entities that appear in the gift text. It can be specified instead of text_parse_mode. Entities other than \"bold\", \"italic\", \"underline\", \"strikethrough\", \"spoiler\", \"custom_emoji\", and \"date_time\" are ignored.
    --
    -- Wire key: @text_entities@.
    -- Omitted from an encoded request when it is @Nothing@.
    text_entities :: Maybe [MessageEntity]
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'GiftPremiumSubscription' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkGiftPremiumSubscription :: Int64 -> Int64 -> Int64 -> GiftPremiumSubscription
mkGiftPremiumSubscription arg0 arg1 arg2 =
  MkGiftPremiumSubscription
    { user_id = arg0
    , month_count = arg1
    , star_count = arg2
    , text = Nothing
    , text_parse_mode = Nothing
    , text_entities = Nothing
    , extra = mempty
    }

instance Method GiftPremiumSubscription where
  type Result GiftPremiumSubscription = TrueValue
  methodName _ = "giftPremiumSubscription"
  planRequest x =
    planRequestBody
      "giftPremiumSubscription"
      [ "user_id"
      , "month_count"
      , "star_count"
      , "text"
      , "text_parse_mode"
      , "text_entities"
      ]
      ( concat
          [ planned "user_id" (encodeJson x.user_id)
          , planned "month_count" (encodeJson x.month_count)
          , planned "star_count" (encodeJson x.star_count)
          , plannedMaybe "text" x.text encodeJson
          , plannedMaybe "text_parse_mode" x.text_parse_mode encodeJson
          , plannedMaybe "text_entities" x.text_entities (planList encodeJson)
          ]
      )
      x.extra
  parseResult _ = parseJSON
