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
module Telegram.Bot.Internal.Group.Dice
  ( Dice (..)
  , mkDice
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonObject, parseInt64, requiredWith)

-- | This object represents an animated emoji that displays a random value.
--
-- Source: <https://core.telegram.org/bots/api#dice>.
-- Codec directions: decoded from responses, encoded into requests.
data Dice = MkDice
  { -- | Emoji on which the dice throw animation is based
    --
    -- Wire key: @emoji@.
    emoji :: Text
  , -- | Value of the dice, 1-6 for \"🎲\", \"🎯\" and \"🎳\" base emoji, 1-5 for \"🏀\" and \"⚽\" base emoji, 1-64 for \"🎰\" base emoji
    --
    -- Wire key: @value@.
    value :: Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'Dice' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkDice :: Text -> Int64 -> Dice
mkDice arg0 arg1 =
  MkDice
    { emoji = arg0
    , value = arg1
    }

instance FromJSON Dice where
  parseJSON = withObject "Dice" $ \obj ->
    do
      field_0 <- requiredWith obj "emoji" parseJSON
      field_1 <- requiredWith obj "value" parseInt64
      pure
        MkDice
          { emoji = field_0
          , value = field_1
          }

instance ToJSON Dice where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "emoji" x.emoji
          , jsonField "value" x.value
          ]
      )
  toEncoding = toEncoding . toJSON
