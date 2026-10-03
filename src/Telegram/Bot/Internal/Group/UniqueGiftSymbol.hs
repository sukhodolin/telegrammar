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
module Telegram.Bot.Internal.Group.UniqueGiftSymbol
  ( UniqueGiftSymbol (..)
  , mkUniqueGiftSymbol
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.Sticker (Sticker)
import Telegram.Bot.Support (jsonField, jsonObject, parseInt64, requiredWith)

-- | This object describes the symbol shown on the pattern of a unique gift.
--
-- Source: <https://core.telegram.org/bots/api#uniquegiftsymbol>.
-- Codec directions: decoded from responses, encoded into requests.
data UniqueGiftSymbol = MkUniqueGiftSymbol
  { -- | Name of the symbol
    --
    -- Wire key: @name@.
    name :: Text
  , -- | The sticker that represents the unique gift
    --
    -- Wire key: @sticker@.
    sticker :: Sticker
  , -- | The number of unique gifts that receive this model for every 1000 gifts upgraded
    --
    -- Wire key: @rarity_per_mille@.
    rarity_per_mille :: Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'UniqueGiftSymbol' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkUniqueGiftSymbol :: Text -> Sticker -> Int64 -> UniqueGiftSymbol
mkUniqueGiftSymbol arg0 arg1 arg2 =
  MkUniqueGiftSymbol
    { name = arg0
    , sticker = arg1
    , rarity_per_mille = arg2
    }

instance FromJSON UniqueGiftSymbol where
  parseJSON = withObject "UniqueGiftSymbol" $ \obj ->
    do
      field_0 <- requiredWith obj "name" parseJSON
      field_1 <- requiredWith obj "sticker" parseJSON
      field_2 <- requiredWith obj "rarity_per_mille" parseInt64
      pure
        MkUniqueGiftSymbol
          { name = field_0
          , sticker = field_1
          , rarity_per_mille = field_2
          }

instance ToJSON UniqueGiftSymbol where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "name" x.name
          , jsonField "sticker" x.sticker
          , jsonField "rarity_per_mille" x.rarity_per_mille
          ]
      )
  toEncoding = toEncoding . toJSON
