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
module Telegram.Bot.Methods.RefundStarPayment
  ( RefundStarPayment (..)
  , mkRefundStarPayment
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned)

-- | Refunds a successful payment in Telegram Stars. Returns True on success.
--
-- Wire method spelling: @refundStarPayment@.
--
-- Source: <https://core.telegram.org/bots/api#refundstarpayment>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data RefundStarPayment = MkRefundStarPayment
  { -- | Identifier of the user whose payment will be refunded
    --
    -- Wire key: @user_id@.
    user_id :: Int64
  , -- | Telegram payment identifier
    --
    -- Wire key: @telegram_payment_charge_id@.
    telegram_payment_charge_id :: Text
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RefundStarPayment' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRefundStarPayment :: Int64 -> Text -> RefundStarPayment
mkRefundStarPayment arg0 arg1 =
  MkRefundStarPayment
    { user_id = arg0
    , telegram_payment_charge_id = arg1
    , extra = mempty
    }

instance Method RefundStarPayment where
  type Result RefundStarPayment = TrueValue
  methodName _ = "refundStarPayment"
  planRequest x =
    planRequestBody
      "refundStarPayment"
      [ "user_id"
      , "telegram_payment_charge_id"
      ]
      ( concat
          [ planned "user_id" (encodeJson x.user_id)
          , planned "telegram_payment_charge_id" (encodeJson x.telegram_payment_charge_id)
          ]
      )
      x.extra
  parseResult _ = parseJSON
