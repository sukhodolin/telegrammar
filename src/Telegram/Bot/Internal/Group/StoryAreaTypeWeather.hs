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
module Telegram.Bot.Internal.Group.StoryAreaTypeWeather
  ( StoryAreaTypeWeather (..)
  , mkStoryAreaTypeWeather
  ) where

import Data.Aeson (ToJSON (..), Value (..))
import Data.Int (Int64)
import Data.Scientific (Scientific)
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonLiteral, jsonObject)

-- | Describes a story area containing weather information. Currently, a story can have up to 3 weather areas.
--
-- Source: <https://core.telegram.org/bots/api#storyareatypeweather>.
-- Codec directions: encoded into requests.
--
-- Supplied constants: @type@ = @"weather"@.
data StoryAreaTypeWeather = MkStoryAreaTypeWeather
  { -- | Temperature, in degree Celsius
    --
    -- Wire key: @temperature@.
    temperature :: Scientific
  , -- | Emoji representing the weather
    --
    -- Wire key: @emoji@.
    emoji :: Text
  , -- | A color of the area background in the ARGB format
    --
    -- Wire key: @background_color@.
    background_color :: Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'StoryAreaTypeWeather' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkStoryAreaTypeWeather :: Scientific -> Text -> Int64 -> StoryAreaTypeWeather
mkStoryAreaTypeWeather arg0 arg1 arg2 =
  MkStoryAreaTypeWeather
    { temperature = arg0
    , emoji = arg1
    , background_color = arg2
    }

instance ToJSON StoryAreaTypeWeather where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "weather")
          , jsonField "temperature" x.temperature
          , jsonField "emoji" x.emoji
          , jsonField "background_color" x.background_color
          ]
      )
  toEncoding = toEncoding . toJSON
