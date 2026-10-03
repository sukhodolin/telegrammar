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
module Telegram.Bot.Methods.GetWebhookInfo
  ( GetWebhookInfo (..)
  , mkGetWebhookInfo
  ) where

import Data.Aeson (FromJSON (..), Object)
import Telegram.Bot.Internal.Group.WebhookInfo (WebhookInfo)
import Telegram.Bot.Support (Method (..), planRequestBody)

-- | Use this method to get current webhook status. Requires no parameters. On success, returns a WebhookInfo object. If the bot is using getUpdates, will return an object with the url field empty.
--
-- Wire method spelling: @getWebhookInfo@.
--
-- Source: <https://core.telegram.org/bots/api#getwebhookinfo>.
-- Result: @WebhookInfo@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data GetWebhookInfo = MkGetWebhookInfo
  { -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'GetWebhookInfo' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkGetWebhookInfo :: GetWebhookInfo
mkGetWebhookInfo =
  MkGetWebhookInfo
    { extra = mempty
    }

instance Method GetWebhookInfo where
  type Result GetWebhookInfo = WebhookInfo
  methodName _ = "getWebhookInfo"
  planRequest x =
    planRequestBody
      "getWebhookInfo"
      []
      []
      x.extra
  parseResult _ = parseJSON
