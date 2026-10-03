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
module Telegram.Bot.Internal.Group.BackgroundTypeWallpaper
  ( BackgroundTypeWallpaper (..)
  , mkBackgroundTypeWallpaper
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.Document (Document)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonFlag, jsonLiteral, jsonObject, optionalTrueFlag, parseInt64, requiredWith)

-- | The background is a wallpaper in the JPEG format.
--
-- Source: <https://core.telegram.org/bots/api#backgroundtypewallpaper>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"wallpaper"@.
data BackgroundTypeWallpaper = MkBackgroundTypeWallpaper
  { -- | Document with the wallpaper
    --
    -- Wire key: @document@.
    document :: Document
  , -- | Dimming of the background in dark themes, as a percentage; 0-100
    --
    -- Wire key: @dark_theme_dimming@.
    dark_theme_dimming :: Int64
  , -- | Optional. True, if the wallpaper is downscaled to fit in a 450x450 square and then box-blurred with radius 12
    --
    -- Wire key: @is_blurred@.
    -- Omitted from an encoded request when it is @False@.
    is_blurred :: Bool
  , -- | Optional. True, if the background moves slightly when the device is tilted
    --
    -- Wire key: @is_moving@.
    -- Omitted from an encoded request when it is @False@.
    is_moving :: Bool
  }
  deriving stock (Eq, Show)

-- | Initialize a 'BackgroundTypeWallpaper' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkBackgroundTypeWallpaper :: Document -> Int64 -> BackgroundTypeWallpaper
mkBackgroundTypeWallpaper arg0 arg1 =
  MkBackgroundTypeWallpaper
    { document = arg0
    , dark_theme_dimming = arg1
    , is_blurred = False
    , is_moving = False
    }

instance FromJSON BackgroundTypeWallpaper where
  parseJSON = withObject "BackgroundTypeWallpaper" $ \obj ->
    do
      checkStringConstant obj "type" "wallpaper"
      field_1 <- requiredWith obj "document" parseJSON
      field_2 <- requiredWith obj "dark_theme_dimming" parseInt64
      field_3 <- optionalTrueFlag obj "is_blurred"
      field_4 <- optionalTrueFlag obj "is_moving"
      pure
        MkBackgroundTypeWallpaper
          { document = field_1
          , dark_theme_dimming = field_2
          , is_blurred = field_3
          , is_moving = field_4
          }

instance ToJSON BackgroundTypeWallpaper where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "wallpaper")
          , jsonField "document" x.document
          , jsonField "dark_theme_dimming" x.dark_theme_dimming
          , jsonFlag "is_blurred" x.is_blurred
          , jsonFlag "is_moving" x.is_moving
          ]
      )
  toEncoding = toEncoding . toJSON
