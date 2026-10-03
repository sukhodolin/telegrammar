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
module Telegram.Bot.Methods.GetBusinessConnection
  ( GetBusinessConnection (..)
  , mkGetBusinessConnection
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.BusinessConnection (BusinessConnection)
import Telegram.Bot.Support (Method (..), encodeJson, planRequestBody, planned)

-- | Use this method to get information about the connection of the bot with a business account. Returns a BusinessConnection object on success.
--
-- Wire method spelling: @getBusinessConnection@.
--
-- Source: <https://core.telegram.org/bots/api#getbusinessconnection>.
-- Result: @BusinessConnection@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data GetBusinessConnection = MkGetBusinessConnection
  { -- | Unique identifier of the business connection
    --
    -- Wire key: @business_connection_id@.
    business_connection_id :: Text
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'GetBusinessConnection' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkGetBusinessConnection :: Text -> GetBusinessConnection
mkGetBusinessConnection arg0 =
  MkGetBusinessConnection
    { business_connection_id = arg0
    , extra = mempty
    }

instance Method GetBusinessConnection where
  type Result GetBusinessConnection = BusinessConnection
  methodName _ = "getBusinessConnection"
  planRequest x =
    planRequestBody
      "getBusinessConnection"
      [ "business_connection_id"
      ]
      ( concat
          [ planned "business_connection_id" (encodeJson x.business_connection_id)
          ]
      )
      x.extra
  parseResult _ = parseJSON
