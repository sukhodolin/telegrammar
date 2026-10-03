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
module Telegram.Bot.Internal.Group.BackgroundFillSolid
  ( BackgroundFillSolid (..)
  , mkBackgroundFillSolid
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonLiteral, jsonObject, parseInt64, requiredWith)

-- | The background is filled using the selected color.
--
-- Source: <https://core.telegram.org/bots/api#backgroundfillsolid>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"solid"@.
data BackgroundFillSolid = MkBackgroundFillSolid
  { -- | The color of the background fill in the RGB24 format
    --
    -- Wire key: @color@.
    color :: Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'BackgroundFillSolid' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkBackgroundFillSolid :: Int64 -> BackgroundFillSolid
mkBackgroundFillSolid arg0 =
  MkBackgroundFillSolid
    { color = arg0
    }

instance FromJSON BackgroundFillSolid where
  parseJSON = withObject "BackgroundFillSolid" $ \obj ->
    do
      checkStringConstant obj "type" "solid"
      field_1 <- requiredWith obj "color" parseInt64
      pure
        MkBackgroundFillSolid
          { color = field_1
          }

instance ToJSON BackgroundFillSolid where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "solid")
          , jsonField "color" x.color
          ]
      )
  toEncoding = toEncoding . toJSON
