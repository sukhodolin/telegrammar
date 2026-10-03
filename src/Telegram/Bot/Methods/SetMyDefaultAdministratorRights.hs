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
module Telegram.Bot.Methods.SetMyDefaultAdministratorRights
  ( SetMyDefaultAdministratorRights (..)
  , mkSetMyDefaultAdministratorRights
  ) where

import Data.Aeson (FromJSON (..), Object)
import Telegram.Bot.Internal.Group.ChatAdministratorRights (ChatAdministratorRights)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, plannedMaybe)

-- | Use this method to change the default administrator rights requested by the bot when it\'s added as an administrator to groups or channels. These rights will be suggested to users, but they are free to modify the list before adding the bot. Returns True on success.
--
-- Wire method spelling: @setMyDefaultAdministratorRights@.
--
-- Source: <https://core.telegram.org/bots/api#setmydefaultadministratorrights>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SetMyDefaultAdministratorRights = MkSetMyDefaultAdministratorRights
  { -- | A JSON-serialized object describing new default administrator rights. If not specified, the default administrator rights will be cleared.
    --
    -- Wire key: @rights@.
    -- Omitted from an encoded request when it is @Nothing@.
    rights :: Maybe ChatAdministratorRights
  , -- | Pass True to change the default administrator rights of the bot in channels. Otherwise, the default administrator rights of the bot for groups and supergroups will be changed.
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

-- | Initialize a 'SetMyDefaultAdministratorRights' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSetMyDefaultAdministratorRights :: SetMyDefaultAdministratorRights
mkSetMyDefaultAdministratorRights =
  MkSetMyDefaultAdministratorRights
    { rights = Nothing
    , for_channels = Nothing
    , extra = mempty
    }

instance Method SetMyDefaultAdministratorRights where
  type Result SetMyDefaultAdministratorRights = TrueValue
  methodName _ = "setMyDefaultAdministratorRights"
  planRequest x =
    planRequestBody
      "setMyDefaultAdministratorRights"
      [ "rights"
      , "for_channels"
      ]
      ( concat
          [ plannedMaybe "rights" x.rights encodeJson
          , plannedMaybe "for_channels" x.for_channels encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
