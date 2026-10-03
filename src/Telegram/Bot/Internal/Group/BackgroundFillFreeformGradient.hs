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
module Telegram.Bot.Internal.Group.BackgroundFillFreeformGradient
  ( BackgroundFillFreeformGradient (..)
  , mkBackgroundFillFreeformGradient
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonLiteral, jsonObject, parseInt64, parseList, requiredWith)

-- | The background is a freeform gradient that rotates after every message in the chat.
--
-- Source: <https://core.telegram.org/bots/api#backgroundfillfreeformgradient>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"freeform_gradient"@.
data BackgroundFillFreeformGradient = MkBackgroundFillFreeformGradient
  { -- | A list of the 3 or 4 base colors that are used to generate the freeform gradient in the RGB24 format
    --
    -- Wire key: @colors@.
    colors :: [Int64]
  }
  deriving stock (Eq, Show)

-- | Initialize a 'BackgroundFillFreeformGradient' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkBackgroundFillFreeformGradient :: [Int64] -> BackgroundFillFreeformGradient
mkBackgroundFillFreeformGradient arg0 =
  MkBackgroundFillFreeformGradient
    { colors = arg0
    }

instance FromJSON BackgroundFillFreeformGradient where
  parseJSON = withObject "BackgroundFillFreeformGradient" $ \obj ->
    do
      checkStringConstant obj "type" "freeform_gradient"
      field_1 <- requiredWith obj "colors" (parseList parseInt64)
      pure
        MkBackgroundFillFreeformGradient
          { colors = field_1
          }

instance ToJSON BackgroundFillFreeformGradient where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "freeform_gradient")
          , jsonField "colors" x.colors
          ]
      )
  toEncoding = toEncoding . toJSON
