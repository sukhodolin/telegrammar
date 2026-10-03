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
module Telegram.Bot.Methods.GetMe
  ( GetMe (..)
  , mkGetMe
  ) where

import Data.Aeson (FromJSON (..), Object)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Support (Method (..), planRequestBody)

-- | A simple method for testing your bot\'s authentication token. Requires no parameters. Returns basic information about the bot in form of a User object.
--
-- Wire method spelling: @getMe@.
--
-- Source: <https://core.telegram.org/bots/api#getme>.
-- Result: @User@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data GetMe = MkGetMe
  { -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'GetMe' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkGetMe :: GetMe
mkGetMe =
  MkGetMe
    { extra = mempty
    }

instance Method GetMe where
  type Result GetMe = User
  methodName _ = "getMe"
  planRequest x =
    planRequestBody
      "getMe"
      []
      []
      x.extra
  parseResult _ = parseJSON
