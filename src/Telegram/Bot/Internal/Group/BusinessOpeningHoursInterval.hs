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
module Telegram.Bot.Internal.Group.BusinessOpeningHoursInterval
  ( BusinessOpeningHoursInterval (..)
  , mkBusinessOpeningHoursInterval
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Support (jsonField, jsonObject, parseInt64, requiredWith)

-- | Describes an interval of time during which a business is open.
--
-- Source: <https://core.telegram.org/bots/api#businessopeninghoursinterval>.
-- Codec directions: decoded from responses, encoded into requests.
data BusinessOpeningHoursInterval = MkBusinessOpeningHoursInterval
  { -- | The minute\'s sequence number in a week, starting on Monday, marking the start of the time interval during which the business is open; 0 - 7 * 24 * 60
    --
    -- Wire key: @opening_minute@.
    opening_minute :: Int64
  , -- | The minute\'s sequence number in a week, starting on Monday, marking the end of the time interval during which the business is open; 0 - 8 * 24 * 60
    --
    -- Wire key: @closing_minute@.
    closing_minute :: Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'BusinessOpeningHoursInterval' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkBusinessOpeningHoursInterval :: Int64 -> Int64 -> BusinessOpeningHoursInterval
mkBusinessOpeningHoursInterval arg0 arg1 =
  MkBusinessOpeningHoursInterval
    { opening_minute = arg0
    , closing_minute = arg1
    }

instance FromJSON BusinessOpeningHoursInterval where
  parseJSON = withObject "BusinessOpeningHoursInterval" $ \obj ->
    do
      field_0 <- requiredWith obj "opening_minute" parseInt64
      field_1 <- requiredWith obj "closing_minute" parseInt64
      pure
        MkBusinessOpeningHoursInterval
          { opening_minute = field_0
          , closing_minute = field_1
          }

instance ToJSON BusinessOpeningHoursInterval where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "opening_minute" x.opening_minute
          , jsonField "closing_minute" x.closing_minute
          ]
      )
  toEncoding = toEncoding . toJSON
