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
module Telegram.Bot.Methods.GetManagedBotAccessSettings
  ( GetManagedBotAccessSettings (..)
  , mkGetManagedBotAccessSettings
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.BotAccessSettings (BotAccessSettings)
import Telegram.Bot.Support (Method (..), encodeJson, planRequestBody, planned)

-- | Use this method to get the access settings of a managed bot. Returns a BotAccessSettings object on success.
--
-- Wire method spelling: @getManagedBotAccessSettings@.
--
-- Source: <https://core.telegram.org/bots/api#getmanagedbotaccesssettings>.
-- Result: @BotAccessSettings@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data GetManagedBotAccessSettings = MkGetManagedBotAccessSettings
  { -- | User identifier of the managed bot whose access settings will be returned
    --
    -- Wire key: @user_id@.
    user_id :: Int64
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'GetManagedBotAccessSettings' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkGetManagedBotAccessSettings :: Int64 -> GetManagedBotAccessSettings
mkGetManagedBotAccessSettings arg0 =
  MkGetManagedBotAccessSettings
    { user_id = arg0
    , extra = mempty
    }

instance Method GetManagedBotAccessSettings where
  type Result GetManagedBotAccessSettings = BotAccessSettings
  methodName _ = "getManagedBotAccessSettings"
  planRequest x =
    planRequestBody
      "getManagedBotAccessSettings"
      [ "user_id"
      ]
      ( concat
          [ planned "user_id" (encodeJson x.user_id)
          ]
      )
      x.extra
  parseResult _ = parseJSON
