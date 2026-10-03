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
module Telegram.Bot.Internal.Group.UserRating
  ( UserRating (..)
  , mkUserRating
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseInt64, requiredWith)

-- | This object describes the rating of a user based on their Telegram Star spendings.
--
-- Source: <https://core.telegram.org/bots/api#userrating>.
-- Codec directions: decoded from responses, encoded into requests.
data UserRating = MkUserRating
  { -- | Current level of the user, indicating their reliability when purchasing digital goods and services. A higher level suggests a more trustworthy customer; a negative level is likely reason for concern.
    --
    -- Wire key: @level@.
    level :: Int64
  , -- | Numerical value of the user\'s rating; the higher the rating, the better
    --
    -- Wire key: @rating@.
    rating :: Int64
  , -- | The rating value required to get the current level
    --
    -- Wire key: @current_level_rating@.
    current_level_rating :: Int64
  , -- | Optional. The rating value required to get to the next level; omitted if the maximum level was reached
    --
    -- Wire key: @next_level_rating@.
    -- Omitted from an encoded request when it is @Nothing@.
    next_level_rating :: Maybe Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'UserRating' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkUserRating :: Int64 -> Int64 -> Int64 -> UserRating
mkUserRating arg0 arg1 arg2 =
  MkUserRating
    { level = arg0
    , rating = arg1
    , current_level_rating = arg2
    , next_level_rating = Nothing
    }

instance FromJSON UserRating where
  parseJSON = withObject "UserRating" $ \obj ->
    do
      field_0 <- requiredWith obj "level" parseInt64
      field_1 <- requiredWith obj "rating" parseInt64
      field_2 <- requiredWith obj "current_level_rating" parseInt64
      field_3 <- optionalWith obj "next_level_rating" parseInt64
      pure
        MkUserRating
          { level = field_0
          , rating = field_1
          , current_level_rating = field_2
          , next_level_rating = field_3
          }

instance ToJSON UserRating where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "level" x.level
          , jsonField "rating" x.rating
          , jsonField "current_level_rating" x.current_level_rating
          , jsonOptional "next_level_rating" x.next_level_rating
          ]
      )
  toEncoding = toEncoding . toJSON
