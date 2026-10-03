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
module Telegram.Bot.Methods.EditUserStarSubscription
  ( EditUserStarSubscription (..)
  , mkEditUserStarSubscription
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned)

-- | Allows the bot to cancel or re-enable extension of a subscription paid in Telegram Stars. Returns True on success.
--
-- Wire method spelling: @editUserStarSubscription@.
--
-- Source: <https://core.telegram.org/bots/api#edituserstarsubscription>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data EditUserStarSubscription = MkEditUserStarSubscription
  { -- | Identifier of the user whose subscription will be edited
    --
    -- Wire key: @user_id@.
    user_id :: Int64
  , -- | Telegram payment identifier for the subscription
    --
    -- Wire key: @telegram_payment_charge_id@.
    telegram_payment_charge_id :: Text
  , -- | Pass True to cancel extension of the user subscription; the subscription must be active up to the end of the current subscription period. Pass False to allow the user to re-enable a subscription that was previously canceled by the bot.
    --
    -- Wire key: @is_canceled@.
    is_canceled :: Bool
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'EditUserStarSubscription' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkEditUserStarSubscription :: Int64 -> Text -> Bool -> EditUserStarSubscription
mkEditUserStarSubscription arg0 arg1 arg2 =
  MkEditUserStarSubscription
    { user_id = arg0
    , telegram_payment_charge_id = arg1
    , is_canceled = arg2
    , extra = mempty
    }

instance Method EditUserStarSubscription where
  type Result EditUserStarSubscription = TrueValue
  methodName _ = "editUserStarSubscription"
  planRequest x =
    planRequestBody
      "editUserStarSubscription"
      [ "user_id"
      , "telegram_payment_charge_id"
      , "is_canceled"
      ]
      ( concat
          [ planned "user_id" (encodeJson x.user_id)
          , planned "telegram_payment_charge_id" (encodeJson x.telegram_payment_charge_id)
          , planned "is_canceled" (encodeJson x.is_canceled)
          ]
      )
      x.extra
  parseResult _ = parseJSON
