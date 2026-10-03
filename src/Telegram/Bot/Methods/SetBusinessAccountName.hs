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
module Telegram.Bot.Methods.SetBusinessAccountName
  ( SetBusinessAccountName (..)
  , mkSetBusinessAccountName
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Text (Text)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned, plannedMaybe)

-- | Changes the first and last name of a managed business account. Requires the can_change_name business bot right. Returns True on success.
--
-- Wire method spelling: @setBusinessAccountName@.
--
-- Source: <https://core.telegram.org/bots/api#setbusinessaccountname>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SetBusinessAccountName = MkSetBusinessAccountName
  { -- | Unique identifier of the business connection
    --
    -- Wire key: @business_connection_id@.
    business_connection_id :: Text
  , -- | The new value of the first name for the business account; 1-64 characters
    --
    -- Wire key: @first_name@.
    first_name :: Text
  , -- | The new value of the last name for the business account; 0-64 characters
    --
    -- Wire key: @last_name@.
    -- Omitted from an encoded request when it is @Nothing@.
    last_name :: Maybe Text
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SetBusinessAccountName' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSetBusinessAccountName :: Text -> Text -> SetBusinessAccountName
mkSetBusinessAccountName arg0 arg1 =
  MkSetBusinessAccountName
    { business_connection_id = arg0
    , first_name = arg1
    , last_name = Nothing
    , extra = mempty
    }

instance Method SetBusinessAccountName where
  type Result SetBusinessAccountName = TrueValue
  methodName _ = "setBusinessAccountName"
  planRequest x =
    planRequestBody
      "setBusinessAccountName"
      [ "business_connection_id"
      , "first_name"
      , "last_name"
      ]
      ( concat
          [ planned "business_connection_id" (encodeJson x.business_connection_id)
          , planned "first_name" (encodeJson x.first_name)
          , plannedMaybe "last_name" x.last_name encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
