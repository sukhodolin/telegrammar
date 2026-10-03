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
module Telegram.Bot.Methods.GetAvailableGifts
  ( GetAvailableGifts (..)
  , mkGetAvailableGifts
  ) where

import Data.Aeson (FromJSON (..), Object)
import Telegram.Bot.Internal.Group.Gifts (Gifts)
import Telegram.Bot.Support (Method (..), planRequestBody)

-- | Returns the list of gifts that can be sent by the bot to users and channel chats. Requires no parameters. Returns a Gifts object.
--
-- Wire method spelling: @getAvailableGifts@.
--
-- Source: <https://core.telegram.org/bots/api#getavailablegifts>.
-- Result: @Gifts@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data GetAvailableGifts = MkGetAvailableGifts
  { -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'GetAvailableGifts' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkGetAvailableGifts :: GetAvailableGifts
mkGetAvailableGifts =
  MkGetAvailableGifts
    { extra = mempty
    }

instance Method GetAvailableGifts where
  type Result GetAvailableGifts = Gifts
  methodName _ = "getAvailableGifts"
  planRequest x =
    planRequestBody
      "getAvailableGifts"
      []
      []
      x.extra
  parseResult _ = parseJSON
