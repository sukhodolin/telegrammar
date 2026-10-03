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
module Telegram.Bot.Internal.Group.UniqueGiftModel
  ( UniqueGiftModel (..)
  , mkUniqueGiftModel
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.Sticker (Sticker)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseInt64, requiredWith)

-- | This object describes the model of a unique gift.
--
-- Source: <https://core.telegram.org/bots/api#uniquegiftmodel>.
-- Codec directions: decoded from responses, encoded into requests.
data UniqueGiftModel = MkUniqueGiftModel
  { -- | Name of the model
    --
    -- Wire key: @name@.
    name :: Text
  , -- | The sticker that represents the unique gift
    --
    -- Wire key: @sticker@.
    sticker :: Sticker
  , -- | The number of unique gifts that receive this model for every 1000 gift upgrades. Always 0 for crafted gifts.
    --
    -- Wire key: @rarity_per_mille@.
    rarity_per_mille :: Int64
  , -- | Optional. Rarity of the model if it is a crafted model. Currently, can be \"uncommon\", \"rare\", \"epic\", or \"legendary\".
    --
    -- Wire key: @rarity@.
    -- Omitted from an encoded request when it is @Nothing@.
    rarity :: Maybe Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'UniqueGiftModel' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkUniqueGiftModel :: Text -> Sticker -> Int64 -> UniqueGiftModel
mkUniqueGiftModel arg0 arg1 arg2 =
  MkUniqueGiftModel
    { name = arg0
    , sticker = arg1
    , rarity_per_mille = arg2
    , rarity = Nothing
    }

instance FromJSON UniqueGiftModel where
  parseJSON = withObject "UniqueGiftModel" $ \obj ->
    do
      field_0 <- requiredWith obj "name" parseJSON
      field_1 <- requiredWith obj "sticker" parseJSON
      field_2 <- requiredWith obj "rarity_per_mille" parseInt64
      field_3 <- optionalWith obj "rarity" parseJSON
      pure
        MkUniqueGiftModel
          { name = field_0
          , sticker = field_1
          , rarity_per_mille = field_2
          , rarity = field_3
          }

instance ToJSON UniqueGiftModel where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "name" x.name
          , jsonField "sticker" x.sticker
          , jsonField "rarity_per_mille" x.rarity_per_mille
          , jsonOptional "rarity" x.rarity
          ]
      )
  toEncoding = toEncoding . toJSON
