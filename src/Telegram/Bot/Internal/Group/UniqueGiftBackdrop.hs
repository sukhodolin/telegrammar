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
module Telegram.Bot.Internal.Group.UniqueGiftBackdrop
  ( UniqueGiftBackdrop (..)
  , mkUniqueGiftBackdrop
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.UniqueGiftBackdropColors (UniqueGiftBackdropColors)
import Telegram.Bot.Support (jsonField, jsonObject, parseInt64, requiredWith)

-- | This object describes the backdrop of a unique gift.
--
-- Source: <https://core.telegram.org/bots/api#uniquegiftbackdrop>.
-- Codec directions: decoded from responses, encoded into requests.
data UniqueGiftBackdrop = MkUniqueGiftBackdrop
  { -- | Name of the backdrop
    --
    -- Wire key: @name@.
    name :: Text
  , -- | Colors of the backdrop
    --
    -- Wire key: @colors@.
    colors :: UniqueGiftBackdropColors
  , -- | The number of unique gifts that receive this backdrop for every 1000 gifts upgraded
    --
    -- Wire key: @rarity_per_mille@.
    rarity_per_mille :: Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'UniqueGiftBackdrop' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkUniqueGiftBackdrop :: Text -> UniqueGiftBackdropColors -> Int64 -> UniqueGiftBackdrop
mkUniqueGiftBackdrop arg0 arg1 arg2 =
  MkUniqueGiftBackdrop
    { name = arg0
    , colors = arg1
    , rarity_per_mille = arg2
    }

instance FromJSON UniqueGiftBackdrop where
  parseJSON = withObject "UniqueGiftBackdrop" $ \obj ->
    do
      field_0 <- requiredWith obj "name" parseJSON
      field_1 <- requiredWith obj "colors" parseJSON
      field_2 <- requiredWith obj "rarity_per_mille" parseInt64
      pure
        MkUniqueGiftBackdrop
          { name = field_0
          , colors = field_1
          , rarity_per_mille = field_2
          }

instance ToJSON UniqueGiftBackdrop where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "name" x.name
          , jsonField "colors" x.colors
          , jsonField "rarity_per_mille" x.rarity_per_mille
          ]
      )
  toEncoding = toEncoding . toJSON
