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
module Telegram.Bot.Internal.Group.BackgroundTypeFill
  ( BackgroundTypeFill (..)
  , mkBackgroundTypeFill
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.BackgroundFill (BackgroundFill)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonLiteral, jsonObject, parseInt64, requiredWith)

-- | The background is automatically filled based on the selected colors.
--
-- Source: <https://core.telegram.org/bots/api#backgroundtypefill>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"fill"@.
data BackgroundTypeFill = MkBackgroundTypeFill
  { -- | The background fill
    --
    -- Wire key: @fill@.
    fill :: BackgroundFill
  , -- | Dimming of the background in dark themes, as a percentage; 0-100
    --
    -- Wire key: @dark_theme_dimming@.
    dark_theme_dimming :: Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'BackgroundTypeFill' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkBackgroundTypeFill :: BackgroundFill -> Int64 -> BackgroundTypeFill
mkBackgroundTypeFill arg0 arg1 =
  MkBackgroundTypeFill
    { fill = arg0
    , dark_theme_dimming = arg1
    }

instance FromJSON BackgroundTypeFill where
  parseJSON = withObject "BackgroundTypeFill" $ \obj ->
    do
      checkStringConstant obj "type" "fill"
      field_1 <- requiredWith obj "fill" parseJSON
      field_2 <- requiredWith obj "dark_theme_dimming" parseInt64
      pure
        MkBackgroundTypeFill
          { fill = field_1
          , dark_theme_dimming = field_2
          }

instance ToJSON BackgroundTypeFill where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "fill")
          , jsonField "fill" x.fill
          , jsonField "dark_theme_dimming" x.dark_theme_dimming
          ]
      )
  toEncoding = toEncoding . toJSON
