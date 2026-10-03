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
module Telegram.Bot.Internal.Group.ChatBoostSourceGiveaway
  ( ChatBoostSourceGiveaway (..)
  , mkChatBoostSourceGiveaway
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonFlag, jsonLiteral, jsonObject, jsonOptional, optionalTrueFlag, optionalWith, parseInt64, requiredWith)

-- | The boost was obtained by the creation of a Telegram Premium or a Telegram Star giveaway. This boosts the chat 4 times for the duration of the corresponding Telegram Premium subscription for Telegram Premium giveaways and prize_star_count \/ 500 times for one year for Telegram Star giveaways.
--
-- Source: <https://core.telegram.org/bots/api#chatboostsourcegiveaway>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @source@ = @"giveaway"@.
data ChatBoostSourceGiveaway = MkChatBoostSourceGiveaway
  { -- | Identifier of a message in the chat with the giveaway; the message could have been deleted already. May be 0 if the message isn\'t sent yet.
    --
    -- Wire key: @giveaway_message_id@.
    giveaway_message_id :: Int64
  , -- | Optional. User that won the prize in the giveaway if any; for Telegram Premium giveaways only
    --
    -- Wire key: @user@.
    -- Omitted from an encoded request when it is @Nothing@.
    user :: Maybe User
  , -- | Optional. The number of Telegram Stars to be split between giveaway winners; for Telegram Star giveaways only
    --
    -- Wire key: @prize_star_count@.
    -- Omitted from an encoded request when it is @Nothing@.
    prize_star_count :: Maybe Int64
  , -- | Optional. True, if the giveaway was completed, but there was no user to win the prize
    --
    -- Wire key: @is_unclaimed@.
    -- Omitted from an encoded request when it is @False@.
    is_unclaimed :: Bool
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ChatBoostSourceGiveaway' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkChatBoostSourceGiveaway :: Int64 -> ChatBoostSourceGiveaway
mkChatBoostSourceGiveaway arg0 =
  MkChatBoostSourceGiveaway
    { giveaway_message_id = arg0
    , user = Nothing
    , prize_star_count = Nothing
    , is_unclaimed = False
    }

instance FromJSON ChatBoostSourceGiveaway where
  parseJSON = withObject "ChatBoostSourceGiveaway" $ \obj ->
    do
      checkStringConstant obj "source" "giveaway"
      field_1 <- requiredWith obj "giveaway_message_id" parseInt64
      field_2 <- optionalWith obj "user" parseJSON
      field_3 <- optionalWith obj "prize_star_count" parseInt64
      field_4 <- optionalTrueFlag obj "is_unclaimed"
      pure
        MkChatBoostSourceGiveaway
          { giveaway_message_id = field_1
          , user = field_2
          , prize_star_count = field_3
          , is_unclaimed = field_4
          }

instance ToJSON ChatBoostSourceGiveaway where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "source" (String "giveaway")
          , jsonField "giveaway_message_id" x.giveaway_message_id
          , jsonOptional "user" x.user
          , jsonOptional "prize_star_count" x.prize_star_count
          , jsonFlag "is_unclaimed" x.is_unclaimed
          ]
      )
  toEncoding = toEncoding . toJSON
