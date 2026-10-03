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
module Telegram.Bot.Internal.Group.GameHighScore
  ( GameHighScore (..)
  , mkGameHighScore
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Support (jsonField, jsonObject, parseInt64, requiredWith)

-- | This object represents one row of the high scores table for a game.
--
-- Source: <https://core.telegram.org/bots/api#gamehighscore>.
-- Codec directions: decoded from responses, encoded into requests.
data GameHighScore = MkGameHighScore
  { -- | Position in high score table for the game
    --
    -- Wire key: @position@.
    position :: Int64
  , -- | User
    --
    -- Wire key: @user@.
    user :: User
  , -- | Score
    --
    -- Wire key: @score@.
    score :: Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'GameHighScore' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkGameHighScore :: Int64 -> User -> Int64 -> GameHighScore
mkGameHighScore arg0 arg1 arg2 =
  MkGameHighScore
    { position = arg0
    , user = arg1
    , score = arg2
    }

instance FromJSON GameHighScore where
  parseJSON = withObject "GameHighScore" $ \obj ->
    do
      field_0 <- requiredWith obj "position" parseInt64
      field_1 <- requiredWith obj "user" parseJSON
      field_2 <- requiredWith obj "score" parseInt64
      pure
        MkGameHighScore
          { position = field_0
          , user = field_1
          , score = field_2
          }

instance ToJSON GameHighScore where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "position" x.position
          , jsonField "user" x.user
          , jsonField "score" x.score
          ]
      )
  toEncoding = toEncoding . toJSON
