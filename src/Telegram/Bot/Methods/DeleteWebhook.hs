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
module Telegram.Bot.Methods.DeleteWebhook
  ( DeleteWebhook (..)
  , mkDeleteWebhook
  ) where

import Data.Aeson (FromJSON (..), Object)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, plannedMaybe)

-- | Use this method to remove webhook integration if you decide to switch back to getUpdates. Returns True on success.
--
-- Wire method spelling: @deleteWebhook@.
--
-- Source: <https://core.telegram.org/bots/api#deletewebhook>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data DeleteWebhook = MkDeleteWebhook
  { -- | Pass True to drop all pending updates
    --
    -- Wire key: @drop_pending_updates@.
    -- Omitted from an encoded request when it is @Nothing@.
    drop_pending_updates :: Maybe Bool
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'DeleteWebhook' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkDeleteWebhook :: DeleteWebhook
mkDeleteWebhook =
  MkDeleteWebhook
    { drop_pending_updates = Nothing
    , extra = mempty
    }

instance Method DeleteWebhook where
  type Result DeleteWebhook = TrueValue
  methodName _ = "deleteWebhook"
  planRequest x =
    planRequestBody
      "deleteWebhook"
      [ "drop_pending_updates"
      ]
      ( concat
          [ plannedMaybe "drop_pending_updates" x.drop_pending_updates encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
