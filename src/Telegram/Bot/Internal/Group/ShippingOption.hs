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
module Telegram.Bot.Internal.Group.ShippingOption
  ( ShippingOption (..)
  , mkShippingOption
  ) where

import Data.Aeson (ToJSON (..))
import Data.Text (Text)
import Telegram.Bot.Internal.Group.LabeledPrice (LabeledPrice)
import Telegram.Bot.Support (jsonField, jsonObject)

-- | This object represents one shipping option.
--
-- Source: <https://core.telegram.org/bots/api#shippingoption>.
-- Codec directions: encoded into requests.
data ShippingOption = MkShippingOption
  { -- | Shipping option identifier
    --
    -- Wire key: @id@.
    id :: Text
  , -- | Option title
    --
    -- Wire key: @title@.
    title :: Text
  , -- | List of price portions
    --
    -- Wire key: @prices@.
    prices :: [LabeledPrice]
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ShippingOption' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkShippingOption :: Text -> Text -> [LabeledPrice] -> ShippingOption
mkShippingOption arg0 arg1 arg2 =
  MkShippingOption
    { id = arg0
    , title = arg1
    , prices = arg2
    }

instance ToJSON ShippingOption where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "id" x.id
          , jsonField "title" x.title
          , jsonField "prices" x.prices
          ]
      )
  toEncoding = toEncoding . toJSON
