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
module Telegram.Bot.Methods.SetBusinessAccountUsername
  ( SetBusinessAccountUsername (..)
  , mkSetBusinessAccountUsername
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Text (Text)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned, plannedMaybe)

-- | Changes the username of a managed business account. Requires the can_change_username business bot right. Returns True on success.
--
-- Wire method spelling: @setBusinessAccountUsername@.
--
-- Source: <https://core.telegram.org/bots/api#setbusinessaccountusername>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SetBusinessAccountUsername = MkSetBusinessAccountUsername
  { -- | Unique identifier of the business connection
    --
    -- Wire key: @business_connection_id@.
    business_connection_id :: Text
  , -- | The new value of the username for the business account; 0-32 characters
    --
    -- Wire key: @username@.
    -- Omitted from an encoded request when it is @Nothing@.
    username :: Maybe Text
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SetBusinessAccountUsername' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSetBusinessAccountUsername :: Text -> SetBusinessAccountUsername
mkSetBusinessAccountUsername arg0 =
  MkSetBusinessAccountUsername
    { business_connection_id = arg0
    , username = Nothing
    , extra = mempty
    }

instance Method SetBusinessAccountUsername where
  type Result SetBusinessAccountUsername = TrueValue
  methodName _ = "setBusinessAccountUsername"
  planRequest x =
    planRequestBody
      "setBusinessAccountUsername"
      [ "business_connection_id"
      , "username"
      ]
      ( concat
          [ planned "business_connection_id" (encodeJson x.business_connection_id)
          , plannedMaybe "username" x.username encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
