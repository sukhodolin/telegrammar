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
module Telegram.Bot.Methods.GetMyStarBalance
  ( GetMyStarBalance (..)
  , mkGetMyStarBalance
  ) where

import Data.Aeson (FromJSON (..), Object)
import Telegram.Bot.Internal.Group.StarAmount (StarAmount)
import Telegram.Bot.Support (Method (..), planRequestBody)

-- | A method to get the current Telegram Stars balance of the bot. Requires no parameters. On success, returns a StarAmount object.
--
-- Wire method spelling: @getMyStarBalance@.
--
-- Source: <https://core.telegram.org/bots/api#getmystarbalance>.
-- Result: @StarAmount@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data GetMyStarBalance = MkGetMyStarBalance
  { -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'GetMyStarBalance' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkGetMyStarBalance :: GetMyStarBalance
mkGetMyStarBalance =
  MkGetMyStarBalance
    { extra = mempty
    }

instance Method GetMyStarBalance where
  type Result GetMyStarBalance = StarAmount
  methodName _ = "getMyStarBalance"
  planRequest x =
    planRequestBody
      "getMyStarBalance"
      []
      []
      x.extra
  parseResult _ = parseJSON
