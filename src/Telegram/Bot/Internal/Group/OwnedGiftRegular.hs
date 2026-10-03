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
module Telegram.Bot.Internal.Group.OwnedGiftRegular
  ( OwnedGiftRegular (..)
  , mkOwnedGiftRegular
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.Gift (Gift)
import Telegram.Bot.Internal.Group.MessageEntity (MessageEntity)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonFlag, jsonLiteral, jsonObject, jsonOptional, optionalTrueFlag, optionalWith, parseInt64, parseList, requiredWith)

-- | Describes a regular gift owned by a user or a chat.
--
-- Source: <https://core.telegram.org/bots/api#ownedgiftregular>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"regular"@.
data OwnedGiftRegular = MkOwnedGiftRegular
  { -- | Information about the regular gift
    --
    -- Wire key: @gift@.
    gift :: Gift
  , -- | Optional. Unique identifier of the gift for the bot; for gifts received on behalf of business accounts only
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
  , -- | Optional. Text of the message that was added to the gift
    --
    -- Wire key: @text@.
    -- Omitted from an encoded request when it is @Nothing@.
    text :: Maybe Text
  , -- | Optional. Special entities that appear in the text
    --
    -- Wire key: @entities@.
    -- Omitted from an encoded request when it is @Nothing@.
    entities :: Maybe [MessageEntity]
  , -- | Optional. True, if the sender and gift text are shown only to the gift receiver; otherwise, everyone will be able to see them
    --
    -- Wire key: @is_private@.
    -- Omitted from an encoded request when it is @False@.
    is_private :: Bool
  , -- | Optional. True, if the gift is displayed on the account\'s profile page; for gifts received on behalf of business accounts only
    --
    -- Wire key: @is_saved@.
    -- Omitted from an encoded request when it is @False@.
    is_saved :: Bool
  , -- | Optional. True, if the gift can be upgraded to a unique gift; for gifts received on behalf of business accounts only
    --
    -- Wire key: @can_be_upgraded@.
    -- Omitted from an encoded request when it is @False@.
    can_be_upgraded :: Bool
  , -- | Optional. True, if the gift was refunded and isn\'t available anymore
    --
    -- Wire key: @was_refunded@.
    -- Omitted from an encoded request when it is @False@.
    was_refunded :: Bool
  , -- | Optional. Number of Telegram Stars that can be claimed by the receiver instead of the gift; omitted if the gift cannot be converted to Telegram Stars; for gifts received on behalf of business accounts only
    --
    -- Wire key: @convert_star_count@.
    -- Omitted from an encoded request when it is @Nothing@.
    convert_star_count :: Maybe Int64
  , -- | Optional. Number of Telegram Stars that were paid for the ability to upgrade the gift
    --
    -- Wire key: @prepaid_upgrade_star_count@.
    -- Omitted from an encoded request when it is @Nothing@.
    prepaid_upgrade_star_count :: Maybe Int64
  , -- | Optional. True, if the gift\'s upgrade was purchased after the gift was sent; for gifts received on behalf of business accounts only
    --
    -- Wire key: @is_upgrade_separate@.
    -- Omitted from an encoded request when it is @False@.
    is_upgrade_separate :: Bool
  , -- | Optional. Unique number reserved for this gift when upgraded. See the number field in UniqueGift.
    --
    -- Wire key: @unique_gift_number@.
    -- Omitted from an encoded request when it is @Nothing@.
    unique_gift_number :: Maybe Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'OwnedGiftRegular' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkOwnedGiftRegular :: Gift -> Int64 -> OwnedGiftRegular
mkOwnedGiftRegular arg0 arg1 =
  MkOwnedGiftRegular
    { gift = arg0
    , owned_gift_id = Nothing
    , sender_user = Nothing
    , send_date = arg1
    , text = Nothing
    , entities = Nothing
    , is_private = False
    , is_saved = False
    , can_be_upgraded = False
    , was_refunded = False
    , convert_star_count = Nothing
    , prepaid_upgrade_star_count = Nothing
    , is_upgrade_separate = False
    , unique_gift_number = Nothing
    }

instance FromJSON OwnedGiftRegular where
  parseJSON = withObject "OwnedGiftRegular" $ \obj ->
    do
      checkStringConstant obj "type" "regular"
      field_1 <- requiredWith obj "gift" parseJSON
      field_2 <- optionalWith obj "owned_gift_id" parseJSON
      field_3 <- optionalWith obj "sender_user" parseJSON
      field_4 <- requiredWith obj "send_date" parseInt64
      field_5 <- optionalWith obj "text" parseJSON
      field_6 <- optionalWith obj "entities" (parseList parseJSON)
      field_7 <- optionalTrueFlag obj "is_private"
      field_8 <- optionalTrueFlag obj "is_saved"
      field_9 <- optionalTrueFlag obj "can_be_upgraded"
      field_10 <- optionalTrueFlag obj "was_refunded"
      field_11 <- optionalWith obj "convert_star_count" parseInt64
      field_12 <- optionalWith obj "prepaid_upgrade_star_count" parseInt64
      field_13 <- optionalTrueFlag obj "is_upgrade_separate"
      field_14 <- optionalWith obj "unique_gift_number" parseInt64
      pure
        MkOwnedGiftRegular
          { gift = field_1
          , owned_gift_id = field_2
          , sender_user = field_3
          , send_date = field_4
          , text = field_5
          , entities = field_6
          , is_private = field_7
          , is_saved = field_8
          , can_be_upgraded = field_9
          , was_refunded = field_10
          , convert_star_count = field_11
          , prepaid_upgrade_star_count = field_12
          , is_upgrade_separate = field_13
          , unique_gift_number = field_14
          }

instance ToJSON OwnedGiftRegular where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "regular")
          , jsonField "gift" x.gift
          , jsonOptional "owned_gift_id" x.owned_gift_id
          , jsonOptional "sender_user" x.sender_user
          , jsonField "send_date" x.send_date
          , jsonOptional "text" x.text
          , jsonOptional "entities" x.entities
          , jsonFlag "is_private" x.is_private
          , jsonFlag "is_saved" x.is_saved
          , jsonFlag "can_be_upgraded" x.can_be_upgraded
          , jsonFlag "was_refunded" x.was_refunded
          , jsonOptional "convert_star_count" x.convert_star_count
          , jsonOptional "prepaid_upgrade_star_count" x.prepaid_upgrade_star_count
          , jsonFlag "is_upgrade_separate" x.is_upgrade_separate
          , jsonOptional "unique_gift_number" x.unique_gift_number
          ]
      )
  toEncoding = toEncoding . toJSON
