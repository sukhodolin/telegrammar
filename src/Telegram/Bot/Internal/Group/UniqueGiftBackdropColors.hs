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
module Telegram.Bot.Internal.Group.UniqueGiftBackdropColors
  ( UniqueGiftBackdropColors (..)
  , mkUniqueGiftBackdropColors
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Support (jsonField, jsonObject, parseInt64, requiredWith)

-- | This object describes the colors of the backdrop of a unique gift.
--
-- Source: <https://core.telegram.org/bots/api#uniquegiftbackdropcolors>.
-- Codec directions: decoded from responses, encoded into requests.
data UniqueGiftBackdropColors = MkUniqueGiftBackdropColors
  { -- | The color in the center of the backdrop in RGB format
    --
    -- Wire key: @center_color@.
    center_color :: Int64
  , -- | The color on the edges of the backdrop in RGB format
    --
    -- Wire key: @edge_color@.
    edge_color :: Int64
  , -- | The color to be applied to the symbol in RGB format
    --
    -- Wire key: @symbol_color@.
    symbol_color :: Int64
  , -- | The color for the text on the backdrop in RGB format
    --
    -- Wire key: @text_color@.
    text_color :: Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'UniqueGiftBackdropColors' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkUniqueGiftBackdropColors :: Int64 -> Int64 -> Int64 -> Int64 -> UniqueGiftBackdropColors
mkUniqueGiftBackdropColors arg0 arg1 arg2 arg3 =
  MkUniqueGiftBackdropColors
    { center_color = arg0
    , edge_color = arg1
    , symbol_color = arg2
    , text_color = arg3
    }

instance FromJSON UniqueGiftBackdropColors where
  parseJSON = withObject "UniqueGiftBackdropColors" $ \obj ->
    do
      field_0 <- requiredWith obj "center_color" parseInt64
      field_1 <- requiredWith obj "edge_color" parseInt64
      field_2 <- requiredWith obj "symbol_color" parseInt64
      field_3 <- requiredWith obj "text_color" parseInt64
      pure
        MkUniqueGiftBackdropColors
          { center_color = field_0
          , edge_color = field_1
          , symbol_color = field_2
          , text_color = field_3
          }

instance ToJSON UniqueGiftBackdropColors where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "center_color" x.center_color
          , jsonField "edge_color" x.edge_color
          , jsonField "symbol_color" x.symbol_color
          , jsonField "text_color" x.text_color
          ]
      )
  toEncoding = toEncoding . toJSON
