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
module Telegram.Bot.Internal.Group.GiveawayCreated
  ( GiveawayCreated (..)
  , mkGiveawayCreated
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Support (jsonObject, jsonOptional, optionalWith, parseInt64)

-- | This object represents a service message about the creation of a scheduled giveaway.
--
-- Source: <https://core.telegram.org/bots/api#giveawaycreated>.
-- Codec directions: decoded from responses, encoded into requests.
data GiveawayCreated = MkGiveawayCreated
  { -- | Optional. The number of Telegram Stars to be split between giveaway winners; for Telegram Star giveaways only
    --
    -- Wire key: @prize_star_count@.
    -- Omitted from an encoded request when it is @Nothing@.
    prize_star_count :: Maybe Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'GiveawayCreated' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkGiveawayCreated :: GiveawayCreated
mkGiveawayCreated =
  MkGiveawayCreated
    { prize_star_count = Nothing
    }

instance FromJSON GiveawayCreated where
  parseJSON = withObject "GiveawayCreated" $ \obj ->
    do
      field_0 <- optionalWith obj "prize_star_count" parseInt64
      pure
        MkGiveawayCreated
          { prize_star_count = field_0
          }

instance ToJSON GiveawayCreated where
  toJSON x =
    jsonObject
      ( concat
          [ jsonOptional "prize_star_count" x.prize_star_count
          ]
      )
  toEncoding = toEncoding . toJSON
