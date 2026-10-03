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
module Telegram.Bot.Methods.GetStarTransactions
  ( GetStarTransactions (..)
  , mkGetStarTransactions
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.StarTransactions (StarTransactions)
import Telegram.Bot.Support (Method (..), encodeJson, planRequestBody, plannedMaybe)

-- | Returns the bot\'s Telegram Star transactions in chronological order. On success, returns a StarTransactions object.
--
-- Wire method spelling: @getStarTransactions@.
--
-- Source: <https://core.telegram.org/bots/api#getstartransactions>.
-- Result: @StarTransactions@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data GetStarTransactions = MkGetStarTransactions
  { -- | Number of transactions to skip in the response
    --
    -- Wire key: @offset@.
    -- Omitted from an encoded request when it is @Nothing@.
    offset :: Maybe Int64
  , -- | The maximum number of transactions to be retrieved. Values between 1-100 are accepted. Defaults to 100.
    --
    -- Wire key: @limit@.
    -- Omitted from an encoded request when it is @Nothing@.
    limit :: Maybe Int64
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'GetStarTransactions' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkGetStarTransactions :: GetStarTransactions
mkGetStarTransactions =
  MkGetStarTransactions
    { offset = Nothing
    , limit = Nothing
    , extra = mempty
    }

instance Method GetStarTransactions where
  type Result GetStarTransactions = StarTransactions
  methodName _ = "getStarTransactions"
  planRequest x =
    planRequestBody
      "getStarTransactions"
      [ "offset"
      , "limit"
      ]
      ( concat
          [ plannedMaybe "offset" x.offset encodeJson
          , plannedMaybe "limit" x.limit encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
