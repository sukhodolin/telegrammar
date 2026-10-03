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
module Telegram.Bot.Internal.Group.BackgroundTypePattern
  ( BackgroundTypePattern (..)
  , mkBackgroundTypePattern
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.BackgroundFill (BackgroundFill)
import Telegram.Bot.Internal.Group.Document (Document)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonFlag, jsonLiteral, jsonObject, optionalTrueFlag, parseInt64, requiredWith)

-- | The background is a .PNG or .TGV (gzipped subset of SVG with MIME type \"application\/x-tgwallpattern\") pattern to be combined with the background fill chosen by the user.
--
-- Source: <https://core.telegram.org/bots/api#backgroundtypepattern>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"pattern"@.
data BackgroundTypePattern = MkBackgroundTypePattern
  { -- | Document with the pattern
    --
    -- Wire key: @document@.
    document :: Document
  , -- | The background fill that is combined with the pattern
    --
    -- Wire key: @fill@.
    fill :: BackgroundFill
  , -- | Intensity of the pattern when it is shown above the filled background; 0-100
    --
    -- Wire key: @intensity@.
    intensity :: Int64
  , -- | Optional. True, if the background fill must be applied only to the pattern itself. All other pixels are black in this case. For dark themes only.
    --
    -- Wire key: @is_inverted@.
    -- Omitted from an encoded request when it is @False@.
    is_inverted :: Bool
  , -- | Optional. True, if the background moves slightly when the device is tilted
    --
    -- Wire key: @is_moving@.
    -- Omitted from an encoded request when it is @False@.
    is_moving :: Bool
  }
  deriving stock (Eq, Show)

-- | Initialize a 'BackgroundTypePattern' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkBackgroundTypePattern :: Document -> BackgroundFill -> Int64 -> BackgroundTypePattern
mkBackgroundTypePattern arg0 arg1 arg2 =
  MkBackgroundTypePattern
    { document = arg0
    , fill = arg1
    , intensity = arg2
    , is_inverted = False
    , is_moving = False
    }

instance FromJSON BackgroundTypePattern where
  parseJSON = withObject "BackgroundTypePattern" $ \obj ->
    do
      checkStringConstant obj "type" "pattern"
      field_1 <- requiredWith obj "document" parseJSON
      field_2 <- requiredWith obj "fill" parseJSON
      field_3 <- requiredWith obj "intensity" parseInt64
      field_4 <- optionalTrueFlag obj "is_inverted"
      field_5 <- optionalTrueFlag obj "is_moving"
      pure
        MkBackgroundTypePattern
          { document = field_1
          , fill = field_2
          , intensity = field_3
          , is_inverted = field_4
          , is_moving = field_5
          }

instance ToJSON BackgroundTypePattern where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "pattern")
          , jsonField "document" x.document
          , jsonField "fill" x.fill
          , jsonField "intensity" x.intensity
          , jsonFlag "is_inverted" x.is_inverted
          , jsonFlag "is_moving" x.is_moving
          ]
      )
  toEncoding = toEncoding . toJSON
