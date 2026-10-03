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
module Telegram.Bot.Internal.Group.OwnedGiftUnique
  ( OwnedGiftUnique (..)
  , mkOwnedGiftUnique
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.UniqueGift (UniqueGift)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonFlag, jsonLiteral, jsonObject, jsonOptional, optionalTrueFlag, optionalWith, parseInt64, requiredWith)

-- | Describes a unique gift received and owned by a user or a chat.
--
-- Source: <https://core.telegram.org/bots/api#ownedgiftunique>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"unique"@.
data OwnedGiftUnique = MkOwnedGiftUnique
  { -- | Information about the unique gift
    --
    -- Wire key: @gift@.
    gift :: UniqueGift
  , -- | Optional. Unique identifier of the received gift for the bot; for gifts received on behalf of business accounts only
    --
    -- Wire key: @owned_gift_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    owned_gift_id :: Maybe Text
  , -- | Optional. Sender of the gift if it is a known user
    --
    -- Wire key: @sender_user@.
    -- Omitted from an encoded request when it is @Nothing@.
    sender_user :: Maybe User
  , -- | Date the gift was sent in Unix time
    --
    -- Wire key: @send_date@.
    send_date :: Int64
  , -- | Optional. True, if the gift is displayed on the account\'s profile page; for gifts received on behalf of business accounts only
    --
    -- Wire key: @is_saved@.
    -- Omitted from an encoded request when it is @False@.
    is_saved :: Bool
  , -- | Optional. True, if the gift can be transferred to another owner; for gifts received on behalf of business accounts only
    --
    -- Wire key: @can_be_transferred@.
    -- Omitted from an encoded request when it is @False@.
    can_be_transferred :: Bool
  , -- | Optional. Number of Telegram Stars that must be paid to transfer the gift; omitted if the bot cannot transfer the gift
    --
    -- Wire key: @transfer_star_count@.
    -- Omitted from an encoded request when it is @Nothing@.
    transfer_star_count :: Maybe Int64
  , -- | Optional. Point in time (Unix timestamp) when the gift can be transferred. If it is in the past, then the gift can be transferred now.
    --
    -- Wire key: @next_transfer_date@.
    -- Omitted from an encoded request when it is @Nothing@.
    next_transfer_date :: Maybe Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'OwnedGiftUnique' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkOwnedGiftUnique :: UniqueGift -> Int64 -> OwnedGiftUnique
mkOwnedGiftUnique arg0 arg1 =
  MkOwnedGiftUnique
    { gift = arg0
    , owned_gift_id = Nothing
    , sender_user = Nothing
    , send_date = arg1
    , is_saved = False
    , can_be_transferred = False
    , transfer_star_count = Nothing
    , next_transfer_date = Nothing
    }

instance FromJSON OwnedGiftUnique where
  parseJSON = withObject "OwnedGiftUnique" $ \obj ->
    do
      checkStringConstant obj "type" "unique"
      field_1 <- requiredWith obj "gift" parseJSON
      field_2 <- optionalWith obj "owned_gift_id" parseJSON
      field_3 <- optionalWith obj "sender_user" parseJSON
      field_4 <- requiredWith obj "send_date" parseInt64
      field_5 <- optionalTrueFlag obj "is_saved"
      field_6 <- optionalTrueFlag obj "can_be_transferred"
      field_7 <- optionalWith obj "transfer_star_count" parseInt64
      field_8 <- optionalWith obj "next_transfer_date" parseInt64
      pure
        MkOwnedGiftUnique
          { gift = field_1
          , owned_gift_id = field_2
          , sender_user = field_3
          , send_date = field_4
          , is_saved = field_5
          , can_be_transferred = field_6
          , transfer_star_count = field_7
          , next_transfer_date = field_8
          }

instance ToJSON OwnedGiftUnique where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "unique")
          , jsonField "gift" x.gift
          , jsonOptional "owned_gift_id" x.owned_gift_id
          , jsonOptional "sender_user" x.sender_user
          , jsonField "send_date" x.send_date
          , jsonFlag "is_saved" x.is_saved
          , jsonFlag "can_be_transferred" x.can_be_transferred
          , jsonOptional "transfer_star_count" x.transfer_star_count
          , jsonOptional "next_transfer_date" x.next_transfer_date
          ]
      )
  toEncoding = toEncoding . toJSON
