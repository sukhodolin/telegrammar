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
module Telegram.Bot.Methods.LogOut
  ( LogOut (..)
  , mkLogOut
  ) where

import Data.Aeson (FromJSON (..), Object)
import Telegram.Bot.Support (Method (..), TrueValue, planRequestBody)

-- | Use this method to log out from the cloud Bot API server before launching the bot locally. You must log out the bot before running it locally, otherwise there is no guarantee that the bot will receive updates. After a successful call, you can immediately log in on a local server, but will not be able to log in back to the cloud Bot API server for 10 minutes. Returns True on success. Requires no parameters.
--
-- Wire method spelling: @logOut@.
--
-- Source: <https://core.telegram.org/bots/api#logout>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data LogOut = MkLogOut
  { -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'LogOut' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkLogOut :: LogOut
mkLogOut =
  MkLogOut
    { extra = mempty
    }

instance Method LogOut where
  type Result LogOut = TrueValue
  methodName _ = "logOut"
  planRequest x =
    planRequestBody
      "logOut"
      []
      []
      x.extra
  parseResult _ = parseJSON
