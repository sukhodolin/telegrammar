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
module Telegram.Bot.Methods.TransferBusinessAccountStars
  ( TransferBusinessAccountStars (..)
  , mkTransferBusinessAccountStars
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned)

-- | Transfers Telegram Stars from the business account balance to the bot\'s balance. Requires the can_transfer_stars business bot right. Returns True on success.
--
-- Wire method spelling: @transferBusinessAccountStars@.
--
-- Source: <https://core.telegram.org/bots/api#transferbusinessaccountstars>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data TransferBusinessAccountStars = MkTransferBusinessAccountStars
  { -- | Unique identifier of the business connection
    --
    -- Wire key: @business_connection_id@.
    business_connection_id :: Text
  , -- | Number of Telegram Stars to transfer; 1-10000
    --
    -- Wire key: @star_count@.
    star_count :: Int64
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'TransferBusinessAccountStars' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkTransferBusinessAccountStars :: Text -> Int64 -> TransferBusinessAccountStars
mkTransferBusinessAccountStars arg0 arg1 =
  MkTransferBusinessAccountStars
    { business_connection_id = arg0
    , star_count = arg1
    , extra = mempty
    }

instance Method TransferBusinessAccountStars where
  type Result TransferBusinessAccountStars = TrueValue
  methodName _ = "transferBusinessAccountStars"
  planRequest x =
    planRequestBody
      "transferBusinessAccountStars"
      [ "business_connection_id"
      , "star_count"
      ]
      ( concat
          [ planned "business_connection_id" (encodeJson x.business_connection_id)
          , planned "star_count" (encodeJson x.star_count)
          ]
      )
      x.extra
  parseResult _ = parseJSON
