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
module Telegram.Bot.Methods.GetMyDefaultAdministratorRights
  ( GetMyDefaultAdministratorRights (..)
  , mkGetMyDefaultAdministratorRights
  ) where

import Data.Aeson (FromJSON (..), Object)
import Telegram.Bot.Internal.Group.ChatAdministratorRights (ChatAdministratorRights)
import Telegram.Bot.Support (Method (..), encodeJson, planRequestBody, plannedMaybe)

-- | Use this method to get the current default administrator rights of the bot. Returns ChatAdministratorRights on success.
--
-- Wire method spelling: @getMyDefaultAdministratorRights@.
--
-- Source: <https://core.telegram.org/bots/api#getmydefaultadministratorrights>.
-- Result: @ChatAdministratorRights@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data GetMyDefaultAdministratorRights = MkGetMyDefaultAdministratorRights
  { -- | Pass True to get default administrator rights of the bot in channels. Otherwise, default administrator rights of the bot for groups and supergroups will be returned.
    --
    -- Wire key: @for_channels@.
    -- Omitted from an encoded request when it is @Nothing@.
    for_channels :: Maybe Bool
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'GetMyDefaultAdministratorRights' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkGetMyDefaultAdministratorRights :: GetMyDefaultAdministratorRights
mkGetMyDefaultAdministratorRights =
  MkGetMyDefaultAdministratorRights
    { for_channels = Nothing
    , extra = mempty
    }

instance Method GetMyDefaultAdministratorRights where
  type Result GetMyDefaultAdministratorRights = ChatAdministratorRights
  methodName _ = "getMyDefaultAdministratorRights"
  planRequest x =
    planRequestBody
      "getMyDefaultAdministratorRights"
      [ "for_channels"
      ]
      ( concat
          [ plannedMaybe "for_channels" x.for_channels encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
