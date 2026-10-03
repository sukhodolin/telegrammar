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
module Telegram.Bot.Internal.Group.UniqueGiftColors
  ( UniqueGiftColors (..)
  , mkUniqueGiftColors
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonObject, parseInt64, parseList, requiredWith)

-- | This object contains information about the color scheme for a user\'s name, message replies and link previews based on a unique gift.
--
-- Source: <https://core.telegram.org/bots/api#uniquegiftcolors>.
-- Codec directions: decoded from responses, encoded into requests.
data UniqueGiftColors = MkUniqueGiftColors
  { -- | Custom emoji identifier of the unique gift\'s model
    --
    -- Wire key: @model_custom_emoji_id@.
    model_custom_emoji_id :: Text
  , -- | Custom emoji identifier of the unique gift\'s symbol
    --
    -- Wire key: @symbol_custom_emoji_id@.
    symbol_custom_emoji_id :: Text
  , -- | Main color used in light themes; RGB format
    --
    -- Wire key: @light_theme_main_color@.
    light_theme_main_color :: Int64
  , -- | List of 1-3 additional colors used in light themes; RGB format
    --
    -- Wire key: @light_theme_other_colors@.
    light_theme_other_colors :: [Int64]
  , -- | Main color used in dark themes; RGB format
    --
    -- Wire key: @dark_theme_main_color@.
    dark_theme_main_color :: Int64
  , -- | List of 1-3 additional colors used in dark themes; RGB format
    --
    -- Wire key: @dark_theme_other_colors@.
    dark_theme_other_colors :: [Int64]
  }
  deriving stock (Eq, Show)

-- | Initialize a 'UniqueGiftColors' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkUniqueGiftColors :: Text -> Text -> Int64 -> [Int64] -> Int64 -> [Int64] -> UniqueGiftColors
mkUniqueGiftColors arg0 arg1 arg2 arg3 arg4 arg5 =
  MkUniqueGiftColors
    { model_custom_emoji_id = arg0
    , symbol_custom_emoji_id = arg1
    , light_theme_main_color = arg2
    , light_theme_other_colors = arg3
    , dark_theme_main_color = arg4
    , dark_theme_other_colors = arg5
    }

instance FromJSON UniqueGiftColors where
  parseJSON = withObject "UniqueGiftColors" $ \obj ->
    do
      field_0 <- requiredWith obj "model_custom_emoji_id" parseJSON
      field_1 <- requiredWith obj "symbol_custom_emoji_id" parseJSON
      field_2 <- requiredWith obj "light_theme_main_color" parseInt64
      field_3 <- requiredWith obj "light_theme_other_colors" (parseList parseInt64)
      field_4 <- requiredWith obj "dark_theme_main_color" parseInt64
      field_5 <- requiredWith obj "dark_theme_other_colors" (parseList parseInt64)
      pure
        MkUniqueGiftColors
          { model_custom_emoji_id = field_0
          , symbol_custom_emoji_id = field_1
          , light_theme_main_color = field_2
          , light_theme_other_colors = field_3
          , dark_theme_main_color = field_4
          , dark_theme_other_colors = field_5
          }

instance ToJSON UniqueGiftColors where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "model_custom_emoji_id" x.model_custom_emoji_id
          , jsonField "symbol_custom_emoji_id" x.symbol_custom_emoji_id
          , jsonField "light_theme_main_color" x.light_theme_main_color
          , jsonField "light_theme_other_colors" x.light_theme_other_colors
          , jsonField "dark_theme_main_color" x.dark_theme_main_color
          , jsonField "dark_theme_other_colors" x.dark_theme_other_colors
          ]
      )
  toEncoding = toEncoding . toJSON
