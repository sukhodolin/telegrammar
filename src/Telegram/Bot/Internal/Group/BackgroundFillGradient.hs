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
module Telegram.Bot.Internal.Group.BackgroundFillGradient
  ( BackgroundFillGradient (..)
  , mkBackgroundFillGradient
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonLiteral, jsonObject, parseInt64, requiredWith)

-- | The background is a gradient fill.
--
-- Source: <https://core.telegram.org/bots/api#backgroundfillgradient>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"gradient"@.
data BackgroundFillGradient = MkBackgroundFillGradient
  { -- | Top color of the gradient in the RGB24 format
    --
    -- Wire key: @top_color@.
    top_color :: Int64
  , -- | Bottom color of the gradient in the RGB24 format
    --
    -- Wire key: @bottom_color@.
    bottom_color :: Int64
  , -- | Clockwise rotation angle of the background fill in degrees; 0-359
    --
    -- Wire key: @rotation_angle@.
    rotation_angle :: Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'BackgroundFillGradient' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkBackgroundFillGradient :: Int64 -> Int64 -> Int64 -> BackgroundFillGradient
mkBackgroundFillGradient arg0 arg1 arg2 =
  MkBackgroundFillGradient
    { top_color = arg0
    , bottom_color = arg1
    , rotation_angle = arg2
    }

instance FromJSON BackgroundFillGradient where
  parseJSON = withObject "BackgroundFillGradient" $ \obj ->
    do
      checkStringConstant obj "type" "gradient"
      field_1 <- requiredWith obj "top_color" parseInt64
      field_2 <- requiredWith obj "bottom_color" parseInt64
      field_3 <- requiredWith obj "rotation_angle" parseInt64
      pure
        MkBackgroundFillGradient
          { top_color = field_1
          , bottom_color = field_2
          , rotation_angle = field_3
          }

instance ToJSON BackgroundFillGradient where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "gradient")
          , jsonField "top_color" x.top_color
          , jsonField "bottom_color" x.bottom_color
          , jsonField "rotation_angle" x.rotation_angle
          ]
      )
  toEncoding = toEncoding . toJSON
