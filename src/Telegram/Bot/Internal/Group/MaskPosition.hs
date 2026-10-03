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
module Telegram.Bot.Internal.Group.MaskPosition
  ( MaskPosition (..)
  , mkMaskPosition
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Scientific (Scientific)
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonObject, parseScientificValue, requiredWith)

-- | This object describes the position on faces where a mask should be placed by default.
--
-- Source: <https://core.telegram.org/bots/api#maskposition>.
-- Codec directions: decoded from responses, encoded into requests.
data MaskPosition = MkMaskPosition
  { -- | The part of the face relative to which the mask should be placed. One of \"forehead\", \"eyes\", \"mouth\", or \"chin\".
    --
    -- Wire key: @point@.
    point :: Text
  , -- | Shift by X-axis measured in widths of the mask scaled to the face size, from left to right. For example, choosing -1.0 will place mask just to the left of the default mask position.
    --
    -- Wire key: @x_shift@.
    x_shift :: Scientific
  , -- | Shift by Y-axis measured in heights of the mask scaled to the face size, from top to bottom. For example, 1.0 will place the mask just below the default mask position.
    --
    -- Wire key: @y_shift@.
    y_shift :: Scientific
  , -- | Mask scaling coefficient. For example, 2.0 means double size.
    --
    -- Wire key: @scale@.
    scale :: Scientific
  }
  deriving stock (Eq, Show)

-- | Initialize a 'MaskPosition' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkMaskPosition :: Text -> Scientific -> Scientific -> Scientific -> MaskPosition
mkMaskPosition arg0 arg1 arg2 arg3 =
  MkMaskPosition
    { point = arg0
    , x_shift = arg1
    , y_shift = arg2
    , scale = arg3
    }

instance FromJSON MaskPosition where
  parseJSON = withObject "MaskPosition" $ \obj ->
    do
      field_0 <- requiredWith obj "point" parseJSON
      field_1 <- requiredWith obj "x_shift" parseScientificValue
      field_2 <- requiredWith obj "y_shift" parseScientificValue
      field_3 <- requiredWith obj "scale" parseScientificValue
      pure
        MkMaskPosition
          { point = field_0
          , x_shift = field_1
          , y_shift = field_2
          , scale = field_3
          }

instance ToJSON MaskPosition where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "point" x.point
          , jsonField "x_shift" x.x_shift
          , jsonField "y_shift" x.y_shift
          , jsonField "scale" x.scale
          ]
      )
  toEncoding = toEncoding . toJSON
