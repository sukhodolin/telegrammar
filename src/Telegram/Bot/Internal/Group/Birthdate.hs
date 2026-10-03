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
module Telegram.Bot.Internal.Group.Birthdate
  ( Birthdate (..)
  , mkBirthdate
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseInt64, requiredWith)

-- | Describes the birthdate of a user.
--
-- Source: <https://core.telegram.org/bots/api#birthdate>.
-- Codec directions: decoded from responses, encoded into requests.
data Birthdate = MkBirthdate
  { -- | Day of the user\'s birth; 1-31
    --
    -- Wire key: @day@.
    day :: Int64
  , -- | Month of the user\'s birth; 1-12
    --
    -- Wire key: @month@.
    month :: Int64
  , -- | Optional. Year of the user\'s birth
    --
    -- Wire key: @year@.
    -- Omitted from an encoded request when it is @Nothing@.
    year :: Maybe Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'Birthdate' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkBirthdate :: Int64 -> Int64 -> Birthdate
mkBirthdate arg0 arg1 =
  MkBirthdate
    { day = arg0
    , month = arg1
    , year = Nothing
    }

instance FromJSON Birthdate where
  parseJSON = withObject "Birthdate" $ \obj ->
    do
      field_0 <- requiredWith obj "day" parseInt64
      field_1 <- requiredWith obj "month" parseInt64
      field_2 <- optionalWith obj "year" parseInt64
      pure
        MkBirthdate
          { day = field_0
          , month = field_1
          , year = field_2
          }

instance ToJSON Birthdate where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "day" x.day
          , jsonField "month" x.month
          , jsonOptional "year" x.year
          ]
      )
  toEncoding = toEncoding . toJSON
