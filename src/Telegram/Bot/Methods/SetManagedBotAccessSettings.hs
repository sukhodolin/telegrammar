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
module Telegram.Bot.Methods.SetManagedBotAccessSettings
  ( SetManagedBotAccessSettings (..)
  , mkSetManagedBotAccessSettings
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planList, planRequestBody, planned, plannedMaybe, validateArrayCount, withValidation)

-- | Use this method to change the access settings of a managed bot. Returns True on success.
--
-- Wire method spelling: @setManagedBotAccessSettings@.
--
-- Source: <https://core.telegram.org/bots/api#setmanagedbotaccesssettings>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SetManagedBotAccessSettings = MkSetManagedBotAccessSettings
  { -- | User identifier of the managed bot whose access settings will be changed
    --
    -- Wire key: @user_id@.
    user_id :: Int64
  , -- | Pass True if only selected users can access the bot. The bot\'s owner can always access it.
    --
    -- Wire key: @is_access_restricted@.
    is_access_restricted :: Bool
  , -- | A JSON-serialized list of up to 10 identifiers of users who will have access to the bot in addition to its owner. Ignored if is_access_restricted is False.
    --
    -- Wire key: @added_user_ids@.
    -- Omitted from an encoded request when it is @Nothing@.
    -- Checked when planning a request: at most 10 element(s).
    added_user_ids :: Maybe [Int64]
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SetManagedBotAccessSettings' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSetManagedBotAccessSettings :: Int64 -> Bool -> SetManagedBotAccessSettings
mkSetManagedBotAccessSettings arg0 arg1 =
  MkSetManagedBotAccessSettings
    { user_id = arg0
    , is_access_restricted = arg1
    , added_user_ids = Nothing
    , extra = mempty
    }

instance Method SetManagedBotAccessSettings where
  type Result SetManagedBotAccessSettings = TrueValue
  methodName _ = "setManagedBotAccessSettings"
  planRequest x =
    planRequestBody
      "setManagedBotAccessSettings"
      [ "user_id"
      , "is_access_restricted"
      , "added_user_ids"
      ]
      ( concat
          [ planned "user_id" (encodeJson x.user_id)
          , planned "is_access_restricted" (encodeJson x.is_access_restricted)
          , plannedMaybe "added_user_ids" x.added_user_ids (\v_ -> withValidation (\loc_ -> validateArrayCount Nothing (Just 10) loc_ v_) ((planList encodeJson) v_))
          ]
      )
      x.extra
  parseResult _ = parseJSON
