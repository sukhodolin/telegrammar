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
module Telegram.Bot.Methods.UpgradeGift
  ( UpgradeGift (..)
  , mkUpgradeGift
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned, plannedMaybe)

-- | Upgrades a given regular gift to a unique gift. Requires the can_transfer_and_upgrade_gifts business bot right. Additionally requires the can_transfer_stars business bot right if the upgrade is paid. Returns True on success.
--
-- Wire method spelling: @upgradeGift@.
--
-- Source: <https://core.telegram.org/bots/api#upgradegift>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data UpgradeGift = MkUpgradeGift
  { -- | Unique identifier of the business connection
    --
    -- Wire key: @business_connection_id@.
    business_connection_id :: Text
  , -- | Unique identifier of the regular gift that should be upgraded to a unique one
    --
    -- Wire key: @owned_gift_id@.
    owned_gift_id :: Text
  , -- | Pass True to keep the original gift text, sender and receiver in the upgraded gift
    --
    -- Wire key: @keep_original_details@.
    -- Omitted from an encoded request when it is @Nothing@.
    keep_original_details :: Maybe Bool
  , -- | The amount of Telegram Stars that will be paid for the upgrade from the business account balance. If gift.prepaid_upgrade_star_count \> 0, then pass 0, otherwise, the can_transfer_stars business bot right is required and gift.upgrade_star_count must be passed.
    --
    -- Wire key: @star_count@.
    -- Omitted from an encoded request when it is @Nothing@.
    star_count :: Maybe Int64
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'UpgradeGift' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkUpgradeGift :: Text -> Text -> UpgradeGift
mkUpgradeGift arg0 arg1 =
  MkUpgradeGift
    { business_connection_id = arg0
    , owned_gift_id = arg1
    , keep_original_details = Nothing
    , star_count = Nothing
    , extra = mempty
    }

instance Method UpgradeGift where
  type Result UpgradeGift = TrueValue
  methodName _ = "upgradeGift"
  planRequest x =
    planRequestBody
      "upgradeGift"
      [ "business_connection_id"
      , "owned_gift_id"
      , "keep_original_details"
      , "star_count"
      ]
      ( concat
          [ planned "business_connection_id" (encodeJson x.business_connection_id)
          , planned "owned_gift_id" (encodeJson x.owned_gift_id)
          , plannedMaybe "keep_original_details" x.keep_original_details encodeJson
          , plannedMaybe "star_count" x.star_count encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
