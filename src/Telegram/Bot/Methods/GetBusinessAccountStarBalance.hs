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
module Telegram.Bot.Methods.GetBusinessAccountStarBalance
  ( GetBusinessAccountStarBalance (..)
  , mkGetBusinessAccountStarBalance
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.StarAmount (StarAmount)
import Telegram.Bot.Support (Method (..), encodeJson, planRequestBody, planned)

-- | Returns the amount of Telegram Stars owned by a managed business account. Requires the can_view_gifts_and_stars business bot right. Returns StarAmount on success.
--
-- Wire method spelling: @getBusinessAccountStarBalance@.
--
-- Source: <https://core.telegram.org/bots/api#getbusinessaccountstarbalance>.
-- Result: @StarAmount@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data GetBusinessAccountStarBalance = MkGetBusinessAccountStarBalance
  { -- | Unique identifier of the business connection
    --
    -- Wire key: @business_connection_id@.
    business_connection_id :: Text
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'GetBusinessAccountStarBalance' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkGetBusinessAccountStarBalance :: Text -> GetBusinessAccountStarBalance
mkGetBusinessAccountStarBalance arg0 =
  MkGetBusinessAccountStarBalance
    { business_connection_id = arg0
    , extra = mempty
    }

instance Method GetBusinessAccountStarBalance where
  type Result GetBusinessAccountStarBalance = StarAmount
  methodName _ = "getBusinessAccountStarBalance"
  planRequest x =
    planRequestBody
      "getBusinessAccountStarBalance"
      [ "business_connection_id"
      ]
      ( concat
          [ planned "business_connection_id" (encodeJson x.business_connection_id)
          ]
      )
      x.extra
  parseResult _ = parseJSON
