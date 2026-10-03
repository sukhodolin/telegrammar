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
module Telegram.Bot.Methods.VerifyUser
  ( VerifyUser (..)
  , mkVerifyUser
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned, plannedMaybe)

-- | Verifies a user on behalf of the organization which is represented by the bot. Returns True on success.
--
-- Wire method spelling: @verifyUser@.
--
-- Source: <https://core.telegram.org/bots/api#verifyuser>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data VerifyUser = MkVerifyUser
  { -- | Unique identifier of the target user
    --
    -- Wire key: @user_id@.
    user_id :: Int64
  , -- | Custom description for the verification; 0-70 characters. Must be empty if the organization isn\'t allowed to provide a custom verification description.
    --
    -- Wire key: @custom_description@.
    -- Omitted from an encoded request when it is @Nothing@.
    custom_description :: Maybe Text
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'VerifyUser' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkVerifyUser :: Int64 -> VerifyUser
mkVerifyUser arg0 =
  MkVerifyUser
    { user_id = arg0
    , custom_description = Nothing
    , extra = mempty
    }

instance Method VerifyUser where
  type Result VerifyUser = TrueValue
  methodName _ = "verifyUser"
  planRequest x =
    planRequestBody
      "verifyUser"
      [ "user_id"
      , "custom_description"
      ]
      ( concat
          [ planned "user_id" (encodeJson x.user_id)
          , plannedMaybe "custom_description" x.custom_description encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
