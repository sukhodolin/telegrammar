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
module Telegram.Bot.Internal.Group.UniqueGiftInfo
  ( UniqueGiftInfo (..)
  , mkUniqueGiftInfo
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.MessageEntity (MessageEntity)
import Telegram.Bot.Internal.Group.UniqueGift (UniqueGift)
import Telegram.Bot.Support (jsonField, jsonFlag, jsonObject, jsonOptional, optionalTrueFlag, optionalWith, parseInt64, parseList, requiredWith)

-- | Describes a service message about a unique gift that was sent or received.
--
-- Source: <https://core.telegram.org/bots/api#uniquegiftinfo>.
-- Codec directions: decoded from responses, encoded into requests.
data UniqueGiftInfo = MkUniqueGiftInfo
  { -- | Information about the gift
    --
    -- Wire key: @gift@.
    gift :: UniqueGift
  , -- | Origin of the gift. Currently, either \"upgrade\" for gifts upgraded from regular gifts, \"transfer\" for gifts transferred from other users or channels, \"resale\" for gifts bought from other users, \"gifted_upgrade\" for upgrades purchased after the gift was sent, or \"offer\" for gifts bought or sold through gift purchase offers.
    --
    -- Wire key: @origin@.
    origin :: Text
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
  , -- | Optional. For gifts bought from other users, the currency in which the payment for the gift was done. Currently, one of \"XTR\" for Telegram Stars or \"TON\" for TON grams.
    --
    -- Wire key: @last_resale_currency@.
    -- Omitted from an encoded request when it is @Nothing@.
    last_resale_currency :: Maybe Text
  , -- | Optional. For gifts bought from other users, the price paid for the gift in either Telegram Stars or nanograms
    --
    -- Wire key: @last_resale_amount@.
    -- Omitted from an encoded request when it is @Nothing@.
    last_resale_amount :: Maybe Int64
  , -- | Optional. Unique identifier of the received gift for the bot; only present for gifts received on behalf of business accounts
    --
    -- Wire key: @owned_gift_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    owned_gift_id :: Maybe Text
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

-- | Initialize a 'UniqueGiftInfo' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkUniqueGiftInfo :: UniqueGift -> Text -> UniqueGiftInfo
mkUniqueGiftInfo arg0 arg1 =
  MkUniqueGiftInfo
    { gift = arg0
    , origin = arg1
    , text = Nothing
    , entities = Nothing
    , is_private = False
    , last_resale_currency = Nothing
    , last_resale_amount = Nothing
    , owned_gift_id = Nothing
    , transfer_star_count = Nothing
    , next_transfer_date = Nothing
    }

instance FromJSON UniqueGiftInfo where
  parseJSON = withObject "UniqueGiftInfo" $ \obj ->
    do
      field_0 <- requiredWith obj "gift" parseJSON
      field_1 <- requiredWith obj "origin" parseJSON
      field_2 <- optionalWith obj "text" parseJSON
      field_3 <- optionalWith obj "entities" (parseList parseJSON)
      field_4 <- optionalTrueFlag obj "is_private"
      field_5 <- optionalWith obj "last_resale_currency" parseJSON
      field_6 <- optionalWith obj "last_resale_amount" parseInt64
      field_7 <- optionalWith obj "owned_gift_id" parseJSON
      field_8 <- optionalWith obj "transfer_star_count" parseInt64
      field_9 <- optionalWith obj "next_transfer_date" parseInt64
      pure
        MkUniqueGiftInfo
          { gift = field_0
          , origin = field_1
          , text = field_2
          , entities = field_3
          , is_private = field_4
          , last_resale_currency = field_5
          , last_resale_amount = field_6
          , owned_gift_id = field_7
          , transfer_star_count = field_8
          , next_transfer_date = field_9
          }

instance ToJSON UniqueGiftInfo where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "gift" x.gift
          , jsonField "origin" x.origin
          , jsonOptional "text" x.text
          , jsonOptional "entities" x.entities
          , jsonFlag "is_private" x.is_private
          , jsonOptional "last_resale_currency" x.last_resale_currency
          , jsonOptional "last_resale_amount" x.last_resale_amount
          , jsonOptional "owned_gift_id" x.owned_gift_id
          , jsonOptional "transfer_star_count" x.transfer_star_count
          , jsonOptional "next_transfer_date" x.next_transfer_date
          ]
      )
  toEncoding = toEncoding . toJSON
