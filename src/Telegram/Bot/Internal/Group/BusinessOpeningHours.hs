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
module Telegram.Bot.Internal.Group.BusinessOpeningHours
  ( BusinessOpeningHours (..)
  , mkBusinessOpeningHours
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.BusinessOpeningHoursInterval (BusinessOpeningHoursInterval)
import Telegram.Bot.Support (jsonField, jsonObject, parseList, requiredWith)

-- | Describes the opening hours of a business.
--
-- Source: <https://core.telegram.org/bots/api#businessopeninghours>.
-- Codec directions: decoded from responses, encoded into requests.
data BusinessOpeningHours = MkBusinessOpeningHours
  { -- | Unique name of the time zone for which the opening hours are defined
    --
    -- Wire key: @time_zone_name@.
    time_zone_name :: Text
  , -- | List of time intervals describing business opening hours
    --
    -- Wire key: @opening_hours@.
    opening_hours :: [BusinessOpeningHoursInterval]
  }
  deriving stock (Eq, Show)

-- | Initialize a 'BusinessOpeningHours' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkBusinessOpeningHours :: Text -> [BusinessOpeningHoursInterval] -> BusinessOpeningHours
mkBusinessOpeningHours arg0 arg1 =
  MkBusinessOpeningHours
    { time_zone_name = arg0
    , opening_hours = arg1
    }

instance FromJSON BusinessOpeningHours where
  parseJSON = withObject "BusinessOpeningHours" $ \obj ->
    do
      field_0 <- requiredWith obj "time_zone_name" parseJSON
      field_1 <- requiredWith obj "opening_hours" (parseList parseJSON)
      pure
        MkBusinessOpeningHours
          { time_zone_name = field_0
          , opening_hours = field_1
          }

instance ToJSON BusinessOpeningHours where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "time_zone_name" x.time_zone_name
          , jsonField "opening_hours" x.opening_hours
          ]
      )
  toEncoding = toEncoding . toJSON
