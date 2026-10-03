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
module Telegram.Bot.Internal.Group.SuggestedPostParameters
  ( SuggestedPostParameters (..)
  , mkSuggestedPostParameters
  ) where

import Data.Aeson (ToJSON (..))
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.SuggestedPostPrice (SuggestedPostPrice)
import Telegram.Bot.Support (jsonObject, jsonOptional)

-- | Contains parameters of a post that is being suggested by the bot.
--
-- Source: <https://core.telegram.org/bots/api#suggestedpostparameters>.
-- Codec directions: encoded into requests.
data SuggestedPostParameters = MkSuggestedPostParameters
  { -- | Optional. Proposed price for the post. If the field is omitted, then the post is unpaid.
    --
    -- Wire key: @price@.
    -- Omitted from an encoded request when it is @Nothing@.
    price :: Maybe SuggestedPostPrice
  , -- | Optional. Proposed send date of the post. If specified, then the date must be between 300 second and 2678400 seconds (30 days) in the future. If the field is omitted, then the post can be published at any time within 30 days at the sole discretion of the user who approves it.
    --
    -- Wire key: @send_date@.
    -- Omitted from an encoded request when it is @Nothing@.
    send_date :: Maybe Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SuggestedPostParameters' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSuggestedPostParameters :: SuggestedPostParameters
mkSuggestedPostParameters =
  MkSuggestedPostParameters
    { price = Nothing
    , send_date = Nothing
    }

instance ToJSON SuggestedPostParameters where
  toJSON x =
    jsonObject
      ( concat
          [ jsonOptional "price" x.price
          , jsonOptional "send_date" x.send_date
          ]
      )
  toEncoding = toEncoding . toJSON
