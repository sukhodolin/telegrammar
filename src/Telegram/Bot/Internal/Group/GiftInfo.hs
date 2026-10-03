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
module Telegram.Bot.Internal.Group.GiftInfo
  ( GiftInfo (..)
  , mkGiftInfo
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.Gift (Gift)
import Telegram.Bot.Internal.Group.MessageEntity (MessageEntity)
import Telegram.Bot.Support (jsonField, jsonFlag, jsonObject, jsonOptional, optionalTrueFlag, optionalWith, parseInt64, parseList, requiredWith)

-- | Describes a service message about a regular gift that was sent or received.
--
-- Source: <https://core.telegram.org/bots/api#giftinfo>.
-- Codec directions: decoded from responses, encoded into requests.
data GiftInfo = MkGiftInfo
  { -- | Information about the gift
    --
    -- Wire key: @gift@.
    gift :: Gift
  , -- | Optional. Unique identifier of the received gift for the bot; only present for gifts received on behalf of business accounts
    --
    -- Wire key: @owned_gift_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    owned_gift_id :: Maybe Text
  , -- | Optional. Number of Telegram Stars that can be claimed by the receiver by converting the gift; omitted if conversion to Telegram Stars is impossible
    --
    -- Wire key: @convert_star_count@.
    -- Omitted from an encoded request when it is @Nothing@.
    convert_star_count :: Maybe Int64
  , -- | Optional. Number of Telegram Stars that were prepaid for the ability to upgrade the gift
    --
    -- Wire key: @prepaid_upgrade_star_count@.
    -- Omitted from an encoded request when it is @Nothing@.
    prepaid_upgrade_star_count :: Maybe Int64
  , -- | Optional. True, if the gift\'s upgrade was purchased after the gift was sent
    --
    -- Wire key: @is_upgrade_separate@.
    -- Omitted from an encoded request when it is @False@.
    is_upgrade_separate :: Bool
  , -- | Optional. True, if the gift can be upgraded to a unique gift
    --
    -- Wire key: @can_be_upgraded@.
    -- Omitted from an encoded request when it is @False@.
    can_be_upgraded :: Bool
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
  , -- | Optional. Unique number reserved for this gift when upgraded. See the number field in UniqueGift.
    --
    -- Wire key: @unique_gift_number@.
    -- Omitted from an encoded request when it is @Nothing@.
    unique_gift_number :: Maybe Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'GiftInfo' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkGiftInfo :: Gift -> GiftInfo
mkGiftInfo arg0 =
  MkGiftInfo
    { gift = arg0
    , owned_gift_id = Nothing
    , convert_star_count = Nothing
    , prepaid_upgrade_star_count = Nothing
    , is_upgrade_separate = False
    , can_be_upgraded = False
    , text = Nothing
    , entities = Nothing
    , is_private = False
    , unique_gift_number = Nothing
    }

instance FromJSON GiftInfo where
  parseJSON = withObject "GiftInfo" $ \obj ->
    do
      field_0 <- requiredWith obj "gift" parseJSON
      field_1 <- optionalWith obj "owned_gift_id" parseJSON
      field_2 <- optionalWith obj "convert_star_count" parseInt64
      field_3 <- optionalWith obj "prepaid_upgrade_star_count" parseInt64
      field_4 <- optionalTrueFlag obj "is_upgrade_separate"
      field_5 <- optionalTrueFlag obj "can_be_upgraded"
      field_6 <- optionalWith obj "text" parseJSON
      field_7 <- optionalWith obj "entities" (parseList parseJSON)
      field_8 <- optionalTrueFlag obj "is_private"
      field_9 <- optionalWith obj "unique_gift_number" parseInt64
      pure
        MkGiftInfo
          { gift = field_0
          , owned_gift_id = field_1
          , convert_star_count = field_2
          , prepaid_upgrade_star_count = field_3
          , is_upgrade_separate = field_4
          , can_be_upgraded = field_5
          , text = field_6
          , entities = field_7
          , is_private = field_8
          , unique_gift_number = field_9
          }

instance ToJSON GiftInfo where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "gift" x.gift
          , jsonOptional "owned_gift_id" x.owned_gift_id
          , jsonOptional "convert_star_count" x.convert_star_count
          , jsonOptional "prepaid_upgrade_star_count" x.prepaid_upgrade_star_count
          , jsonFlag "is_upgrade_separate" x.is_upgrade_separate
          , jsonFlag "can_be_upgraded" x.can_be_upgraded
          , jsonOptional "text" x.text
          , jsonOptional "entities" x.entities
          , jsonFlag "is_private" x.is_private
          , jsonOptional "unique_gift_number" x.unique_gift_number
          ]
      )
  toEncoding = toEncoding . toJSON
