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
module Telegram.Bot.Methods.RemoveUserVerification
  ( RemoveUserVerification (..)
  , mkRemoveUserVerification
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned)

-- | Removes verification from a user who is currently verified on behalf of the organization represented by the bot. Returns True on success.
--
-- Wire method spelling: @removeUserVerification@.
--
-- Source: <https://core.telegram.org/bots/api#removeuserverification>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data RemoveUserVerification = MkRemoveUserVerification
  { -- | Unique identifier of the target user
    --
    -- Wire key: @user_id@.
    user_id :: Int64
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RemoveUserVerification' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRemoveUserVerification :: Int64 -> RemoveUserVerification
mkRemoveUserVerification arg0 =
  MkRemoveUserVerification
    { user_id = arg0
    , extra = mempty
    }

instance Method RemoveUserVerification where
  type Result RemoveUserVerification = TrueValue
  methodName _ = "removeUserVerification"
  planRequest x =
    planRequestBody
      "removeUserVerification"
      [ "user_id"
      ]
      ( concat
          [ planned "user_id" (encodeJson x.user_id)
          ]
      )
      x.extra
  parseResult _ = parseJSON
