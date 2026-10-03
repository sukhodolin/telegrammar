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
module Telegram.Bot.Internal.Group.Giveaway
  ( Giveaway (..)
  , mkGiveaway
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.Chat (Chat)
import Telegram.Bot.Support (jsonField, jsonFlag, jsonObject, jsonOptional, optionalTrueFlag, optionalWith, parseInt64, parseList, requiredWith)

-- | This object represents a message about a scheduled giveaway.
--
-- Source: <https://core.telegram.org/bots/api#giveaway>.
-- Codec directions: decoded from responses, encoded into requests.
data Giveaway = MkGiveaway
  { -- | The list of chats which the user must join to participate in the giveaway
    --
    -- Wire key: @chats@.
    chats :: [Chat]
  , -- | Point in time (Unix timestamp) when winners of the giveaway will be selected
    --
    -- Wire key: @winners_selection_date@.
    winners_selection_date :: Int64
  , -- | The number of users which are supposed to be selected as winners of the giveaway
    --
    -- Wire key: @winner_count@.
    winner_count :: Int64
  , -- | Optional. True, if only users who join the chats after the giveaway started should be eligible to win
    --
    -- Wire key: @only_new_members@.
    -- Omitted from an encoded request when it is @False@.
    only_new_members :: Bool
  , -- | Optional. True, if the list of giveaway winners will be visible to everyone
    --
    -- Wire key: @has_public_winners@.
    -- Omitted from an encoded request when it is @False@.
    has_public_winners :: Bool
  , -- | Optional. Description of additional giveaway prize
    --
    -- Wire key: @prize_description@.
    -- Omitted from an encoded request when it is @Nothing@.
    prize_description :: Maybe Text
  , -- | Optional. A list of two-letter ISO 3166-1 alpha-2 country codes indicating the countries from which eligible users for the giveaway must come. If empty, then all users can participate in the giveaway. Users with a phone number that was bought on Fragment can always participate in giveaways.
    --
    -- Wire key: @country_codes@.
    -- Omitted from an encoded request when it is @Nothing@.
    country_codes :: Maybe [Text]
  , -- | Optional. The number of Telegram Stars to be split between giveaway winners; for Telegram Star giveaways only
    --
    -- Wire key: @prize_star_count@.
    -- Omitted from an encoded request when it is @Nothing@.
    prize_star_count :: Maybe Int64
  , -- | Optional. The number of months the Telegram Premium subscription won from the giveaway will be active for; for Telegram Premium giveaways only
    --
    -- Wire key: @premium_subscription_month_count@.
    -- Omitted from an encoded request when it is @Nothing@.
    premium_subscription_month_count :: Maybe Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'Giveaway' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkGiveaway :: [Chat] -> Int64 -> Int64 -> Giveaway
mkGiveaway arg0 arg1 arg2 =
  MkGiveaway
    { chats = arg0
    , winners_selection_date = arg1
    , winner_count = arg2
    , only_new_members = False
    , has_public_winners = False
    , prize_description = Nothing
    , country_codes = Nothing
    , prize_star_count = Nothing
    , premium_subscription_month_count = Nothing
    }

instance FromJSON Giveaway where
  parseJSON = withObject "Giveaway" $ \obj ->
    do
      field_0 <- requiredWith obj "chats" (parseList parseJSON)
      field_1 <- requiredWith obj "winners_selection_date" parseInt64
      field_2 <- requiredWith obj "winner_count" parseInt64
      field_3 <- optionalTrueFlag obj "only_new_members"
      field_4 <- optionalTrueFlag obj "has_public_winners"
      field_5 <- optionalWith obj "prize_description" parseJSON
      field_6 <- optionalWith obj "country_codes" (parseList parseJSON)
      field_7 <- optionalWith obj "prize_star_count" parseInt64
      field_8 <- optionalWith obj "premium_subscription_month_count" parseInt64
      pure
        MkGiveaway
          { chats = field_0
          , winners_selection_date = field_1
          , winner_count = field_2
          , only_new_members = field_3
          , has_public_winners = field_4
          , prize_description = field_5
          , country_codes = field_6
          , prize_star_count = field_7
          , premium_subscription_month_count = field_8
          }

instance ToJSON Giveaway where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "chats" x.chats
          , jsonField "winners_selection_date" x.winners_selection_date
          , jsonField "winner_count" x.winner_count
          , jsonFlag "only_new_members" x.only_new_members
          , jsonFlag "has_public_winners" x.has_public_winners
          , jsonOptional "prize_description" x.prize_description
          , jsonOptional "country_codes" x.country_codes
          , jsonOptional "prize_star_count" x.prize_star_count
          , jsonOptional "premium_subscription_month_count" x.premium_subscription_month_count
          ]
      )
  toEncoding = toEncoding . toJSON
