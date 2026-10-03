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
module Telegram.Bot.Internal.Group.Gift
  ( Gift (..)
  , mkGift
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.Chat (Chat)
import Telegram.Bot.Internal.Group.GiftBackground (GiftBackground)
import Telegram.Bot.Internal.Group.Sticker (Sticker)
import Telegram.Bot.Support (jsonField, jsonFlag, jsonObject, jsonOptional, optionalTrueFlag, optionalWith, parseInt64, requiredWith)

-- | This object represents a gift that can be sent by the bot.
--
-- Source: <https://core.telegram.org/bots/api#gift>.
-- Codec directions: decoded from responses, encoded into requests.
data Gift = MkGift
  { -- | Unique identifier of the gift
    --
    -- Wire key: @id@.
    id :: Text
  , -- | The sticker that represents the gift
    --
    -- Wire key: @sticker@.
    sticker :: Sticker
  , -- | The number of Telegram Stars that must be paid to send the sticker
    --
    -- Wire key: @star_count@.
    star_count :: Int64
  , -- | Optional. The number of Telegram Stars that must be paid to upgrade the gift to a unique one
    --
    -- Wire key: @upgrade_star_count@.
    -- Omitted from an encoded request when it is @Nothing@.
    upgrade_star_count :: Maybe Int64
  , -- | Optional. True, if the gift can only be purchased by Telegram Premium subscribers
    --
    -- Wire key: @is_premium@.
    -- Omitted from an encoded request when it is @False@.
    is_premium :: Bool
  , -- | Optional. True, if the gift can be used (after being upgraded) to customize a user\'s appearance
    --
    -- Wire key: @has_colors@.
    -- Omitted from an encoded request when it is @False@.
    has_colors :: Bool
  , -- | Optional. The total number of gifts of this type that can be sent by all users; for limited gifts only
    --
    -- Wire key: @total_count@.
    -- Omitted from an encoded request when it is @Nothing@.
    total_count :: Maybe Int64
  , -- | Optional. The number of remaining gifts of this type that can be sent by all users; for limited gifts only
    --
    -- Wire key: @remaining_count@.
    -- Omitted from an encoded request when it is @Nothing@.
    remaining_count :: Maybe Int64
  , -- | Optional. The total number of gifts of this type that can be sent by the bot; for limited gifts only
    --
    -- Wire key: @personal_total_count@.
    -- Omitted from an encoded request when it is @Nothing@.
    personal_total_count :: Maybe Int64
  , -- | Optional. The number of remaining gifts of this type that can be sent by the bot; for limited gifts only
    --
    -- Wire key: @personal_remaining_count@.
    -- Omitted from an encoded request when it is @Nothing@.
    personal_remaining_count :: Maybe Int64
  , -- | Optional. Background of the gift
    --
    -- Wire key: @background@.
    -- Omitted from an encoded request when it is @Nothing@.
    background :: Maybe GiftBackground
  , -- | Optional. The total number of different unique gifts that can be obtained by upgrading the gift
    --
    -- Wire key: @unique_gift_variant_count@.
    -- Omitted from an encoded request when it is @Nothing@.
    unique_gift_variant_count :: Maybe Int64
  , -- | Optional. Information about the chat that published the gift
    --
    -- Wire key: @publisher_chat@.
    -- Omitted from an encoded request when it is @Nothing@.
    publisher_chat :: Maybe Chat
  }
  deriving stock (Eq, Show)

-- | Initialize a 'Gift' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkGift :: Text -> Sticker -> Int64 -> Gift
mkGift arg0 arg1 arg2 =
  MkGift
    { id = arg0
    , sticker = arg1
    , star_count = arg2
    , upgrade_star_count = Nothing
    , is_premium = False
    , has_colors = False
    , total_count = Nothing
    , remaining_count = Nothing
    , personal_total_count = Nothing
    , personal_remaining_count = Nothing
    , background = Nothing
    , unique_gift_variant_count = Nothing
    , publisher_chat = Nothing
    }

instance FromJSON Gift where
  parseJSON = withObject "Gift" $ \obj ->
    do
      field_0 <- requiredWith obj "id" parseJSON
      field_1 <- requiredWith obj "sticker" parseJSON
      field_2 <- requiredWith obj "star_count" parseInt64
      field_3 <- optionalWith obj "upgrade_star_count" parseInt64
      field_4 <- optionalTrueFlag obj "is_premium"
      field_5 <- optionalTrueFlag obj "has_colors"
      field_6 <- optionalWith obj "total_count" parseInt64
      field_7 <- optionalWith obj "remaining_count" parseInt64
      field_8 <- optionalWith obj "personal_total_count" parseInt64
      field_9 <- optionalWith obj "personal_remaining_count" parseInt64
      field_10 <- optionalWith obj "background" parseJSON
      field_11 <- optionalWith obj "unique_gift_variant_count" parseInt64
      field_12 <- optionalWith obj "publisher_chat" parseJSON
      pure
        MkGift
          { id = field_0
          , sticker = field_1
          , star_count = field_2
          , upgrade_star_count = field_3
          , is_premium = field_4
          , has_colors = field_5
          , total_count = field_6
          , remaining_count = field_7
          , personal_total_count = field_8
          , personal_remaining_count = field_9
          , background = field_10
          , unique_gift_variant_count = field_11
          , publisher_chat = field_12
          }

instance ToJSON Gift where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "id" x.id
          , jsonField "sticker" x.sticker
          , jsonField "star_count" x.star_count
          , jsonOptional "upgrade_star_count" x.upgrade_star_count
          , jsonFlag "is_premium" x.is_premium
          , jsonFlag "has_colors" x.has_colors
          , jsonOptional "total_count" x.total_count
          , jsonOptional "remaining_count" x.remaining_count
          , jsonOptional "personal_total_count" x.personal_total_count
          , jsonOptional "personal_remaining_count" x.personal_remaining_count
          , jsonOptional "background" x.background
          , jsonOptional "unique_gift_variant_count" x.unique_gift_variant_count
          , jsonOptional "publisher_chat" x.publisher_chat
          ]
      )
  toEncoding = toEncoding . toJSON
