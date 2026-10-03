{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE OverloadedStrings #-}

-- | Internal: one dependency component of the type graph.
--
-- This module is an implementation detail of the generated package. Its
-- declarations are re-exported by the aggregate types façade, which is
-- where consumers import them from. The module name is a deterministic
-- identifier taken from the component's smallest declaration name, not a
-- semantic family name, and it can change when the source graph changes.
--
-- Generated. Do not edit.
module Telegram.Bot.Internal.Group.ProximityAlertTriggered
  ( ProximityAlertTriggered (..)
  , mkProximityAlertTriggered
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Support (jsonField, jsonObject, parseInt64, requiredWith)

-- | This object represents the content of a service message, sent whenever a user in the chat triggers a proximity alert set by another user.
--
-- Source: <https://core.telegram.org/bots/api#proximityalerttriggered>.
-- Codec directions: decoded from responses, encoded into requests.
data ProximityAlertTriggered = MkProximityAlertTriggered
  { -- | User that triggered the alert
    --
    -- Wire key: @traveler@.
    traveler :: User
  , -- | User that set the alert
    --
    -- Wire key: @watcher@.
    watcher :: User
  , -- | The distance between the users
    --
    -- Wire key: @distance@.
    distance :: Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ProximityAlertTriggered' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkProximityAlertTriggered :: User -> User -> Int64 -> ProximityAlertTriggered
mkProximityAlertTriggered arg0 arg1 arg2 =
  MkProximityAlertTriggered
    { traveler = arg0
    , watcher = arg1
    , distance = arg2
    }

instance FromJSON ProximityAlertTriggered where
  parseJSON = withObject "ProximityAlertTriggered" $ \obj ->
    do
      field_0 <- requiredWith obj "traveler" parseJSON
      field_1 <- requiredWith obj "watcher" parseJSON
      field_2 <- requiredWith obj "distance" parseInt64
      pure
        MkProximityAlertTriggered
          { traveler = field_0
          , watcher = field_1
          , distance = field_2
          }

instance ToJSON ProximityAlertTriggered where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "traveler" x.traveler
          , jsonField "watcher" x.watcher
          , jsonField "distance" x.distance
          ]
      )
  toEncoding = toEncoding . toJSON
