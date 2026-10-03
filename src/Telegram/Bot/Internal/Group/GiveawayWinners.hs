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
module Telegram.Bot.Internal.Group.GiveawayWinners
  ( GiveawayWinners (..)
  , mkGiveawayWinners
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.Chat (Chat)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Support (jsonField, jsonFlag, jsonObject, jsonOptional, optionalTrueFlag, optionalWith, parseInt64, parseList, requiredWith)

-- | This object represents a message about the completion of a giveaway with public winners.
--
-- Source: <https://core.telegram.org/bots/api#giveawaywinners>.
-- Codec directions: decoded from responses, encoded into requests.
data GiveawayWinners = MkGiveawayWinners
  { -- | The chat that created the giveaway
    --
    -- Wire key: @chat@.
    chat :: Chat
  , -- | Identifier of the message with the giveaway in the chat
    --
    -- Wire key: @giveaway_message_id@.
    giveaway_message_id :: Int64
  , -- | Point in time (Unix timestamp) when winners of the giveaway were selected
    --
    -- Wire key: @winners_selection_date@.
    winners_selection_date :: Int64
  , -- | Total number of winners in the giveaway
    --
    -- Wire key: @winner_count@.
    winner_count :: Int64
  , -- | List of up to 100 winners of the giveaway
    --
    -- Wire key: @winners@.
    winners :: [User]
  , -- | Optional. The number of other chats the user had to join in order to be eligible for the giveaway
    --
    -- Wire key: @additional_chat_count@.
    -- Omitted from an encoded request when it is @Nothing@.
    additional_chat_count :: Maybe Int64
  , -- | Optional. The number of Telegram Stars that were split between giveaway winners; for Telegram Star giveaways only
    --
    -- Wire key: @prize_star_count@.
    -- Omitted from an encoded request when it is @Nothing@.
    prize_star_count :: Maybe Int64
  , -- | Optional. The number of months the Telegram Premium subscription won from the giveaway will be active for; for Telegram Premium giveaways only
    --
    -- Wire key: @premium_subscription_month_count@.
    -- Omitted from an encoded request when it is @Nothing@.
    premium_subscription_month_count :: Maybe Int64
  , -- | Optional. Number of undistributed prizes
    --
    -- Wire key: @unclaimed_prize_count@.
    -- Omitted from an encoded request when it is @Nothing@.
    unclaimed_prize_count :: Maybe Int64
  , -- | Optional. True, if only users who had joined the chats after the giveaway started were eligible to win
    --
    -- Wire key: @only_new_members@.
    -- Omitted from an encoded request when it is @False@.
    only_new_members :: Bool
  , -- | Optional. True, if the giveaway was canceled because the payment for it was refunded
    --
    -- Wire key: @was_refunded@.
    -- Omitted from an encoded request when it is @False@.
    was_refunded :: Bool
  , -- | Optional. Description of additional giveaway prize
    --
    -- Wire key: @prize_description@.
    -- Omitted from an encoded request when it is @Nothing@.
    prize_description :: Maybe Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'GiveawayWinners' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkGiveawayWinners :: Chat -> Int64 -> Int64 -> Int64 -> [User] -> GiveawayWinners
mkGiveawayWinners arg0 arg1 arg2 arg3 arg4 =
  MkGiveawayWinners
    { chat = arg0
    , giveaway_message_id = arg1
    , winners_selection_date = arg2
    , winner_count = arg3
    , winners = arg4
    , additional_chat_count = Nothing
    , prize_star_count = Nothing
    , premium_subscription_month_count = Nothing
    , unclaimed_prize_count = Nothing
    , only_new_members = False
    , was_refunded = False
    , prize_description = Nothing
    }

instance FromJSON GiveawayWinners where
  parseJSON = withObject "GiveawayWinners" $ \obj ->
    do
      field_0 <- requiredWith obj "chat" parseJSON
      field_1 <- requiredWith obj "giveaway_message_id" parseInt64
      field_2 <- requiredWith obj "winners_selection_date" parseInt64
      field_3 <- requiredWith obj "winner_count" parseInt64
      field_4 <- requiredWith obj "winners" (parseList parseJSON)
      field_5 <- optionalWith obj "additional_chat_count" parseInt64
      field_6 <- optionalWith obj "prize_star_count" parseInt64
      field_7 <- optionalWith obj "premium_subscription_month_count" parseInt64
      field_8 <- optionalWith obj "unclaimed_prize_count" parseInt64
      field_9 <- optionalTrueFlag obj "only_new_members"
      field_10 <- optionalTrueFlag obj "was_refunded"
      field_11 <- optionalWith obj "prize_description" parseJSON
      pure
        MkGiveawayWinners
          { chat = field_0
          , giveaway_message_id = field_1
          , winners_selection_date = field_2
          , winner_count = field_3
          , winners = field_4
          , additional_chat_count = field_5
          , prize_star_count = field_6
          , premium_subscription_month_count = field_7
          , unclaimed_prize_count = field_8
          , only_new_members = field_9
          , was_refunded = field_10
          , prize_description = field_11
          }

instance ToJSON GiveawayWinners where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "chat" x.chat
          , jsonField "giveaway_message_id" x.giveaway_message_id
          , jsonField "winners_selection_date" x.winners_selection_date
          , jsonField "winner_count" x.winner_count
          , jsonField "winners" x.winners
          , jsonOptional "additional_chat_count" x.additional_chat_count
          , jsonOptional "prize_star_count" x.prize_star_count
          , jsonOptional "premium_subscription_month_count" x.premium_subscription_month_count
          , jsonOptional "unclaimed_prize_count" x.unclaimed_prize_count
          , jsonFlag "only_new_members" x.only_new_members
          , jsonFlag "was_refunded" x.was_refunded
          , jsonOptional "prize_description" x.prize_description
          ]
      )
  toEncoding = toEncoding . toJSON
