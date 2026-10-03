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
module Telegram.Bot.Methods.RemoveMyProfilePhoto
  ( RemoveMyProfilePhoto (..)
  , mkRemoveMyProfilePhoto
  ) where

import Data.Aeson (FromJSON (..), Object)
import Telegram.Bot.Support (Method (..), TrueValue, planRequestBody)

-- | Removes the profile photo of the bot. Requires no parameters. Returns True on success.
--
-- Wire method spelling: @removeMyProfilePhoto@.
--
-- Source: <https://core.telegram.org/bots/api#removemyprofilephoto>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data RemoveMyProfilePhoto = MkRemoveMyProfilePhoto
  { -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RemoveMyProfilePhoto' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRemoveMyProfilePhoto :: RemoveMyProfilePhoto
mkRemoveMyProfilePhoto =
  MkRemoveMyProfilePhoto
    { extra = mempty
    }

instance Method RemoveMyProfilePhoto where
  type Result RemoveMyProfilePhoto = TrueValue
  methodName _ = "removeMyProfilePhoto"
  planRequest x =
    planRequestBody
      "removeMyProfilePhoto"
      []
      []
      x.extra
  parseResult _ = parseJSON
