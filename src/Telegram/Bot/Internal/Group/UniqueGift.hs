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
module Telegram.Bot.Internal.Group.UniqueGift
  ( UniqueGift (..)
  , mkUniqueGift
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.Chat (Chat)
import Telegram.Bot.Internal.Group.UniqueGiftBackdrop (UniqueGiftBackdrop)
import Telegram.Bot.Internal.Group.UniqueGiftColors (UniqueGiftColors)
import Telegram.Bot.Internal.Group.UniqueGiftModel (UniqueGiftModel)
import Telegram.Bot.Internal.Group.UniqueGiftSymbol (UniqueGiftSymbol)
import Telegram.Bot.Support (jsonField, jsonFlag, jsonObject, jsonOptional, optionalTrueFlag, optionalWith, parseInt64, requiredWith)

-- | This object describes a unique gift that was upgraded from a regular gift.
--
-- Source: <https://core.telegram.org/bots/api#uniquegift>.
-- Codec directions: decoded from responses, encoded into requests.
data UniqueGift = MkUniqueGift
  { -- | Identifier of the regular gift from which the gift was upgraded
    --
    -- Wire key: @gift_id@.
    gift_id :: Text
  , -- | Human-readable name of the regular gift from which this unique gift was upgraded
    --
    -- Wire key: @base_name@.
    base_name :: Text
  , -- | Unique name of the gift. This name can be used in https:\/\/t.me\/nft\/... links and story areas.
    --
    -- Wire key: @name@.
    name :: Text
  , -- | Unique number of the upgraded gift among gifts upgraded from the same regular gift
    --
    -- Wire key: @number@.
    number :: Int64
  , -- | Model of the gift
    --
    -- Wire key: @model@.
    model :: UniqueGiftModel
  , -- | Symbol of the gift
    --
    -- Wire key: @symbol@.
    symbol :: UniqueGiftSymbol
  , -- | Backdrop of the gift
    --
    -- Wire key: @backdrop@.
    backdrop :: UniqueGiftBackdrop
  , -- | Optional. True, if the original regular gift was exclusively purchaseable by Telegram Premium subscribers
    --
    -- Wire key: @is_premium@.
    -- Omitted from an encoded request when it is @False@.
    is_premium :: Bool
  , -- | Optional. True, if the gift was used to craft another gift and isn\'t available anymore
    --
    -- Wire key: @is_burned@.
    -- Omitted from an encoded request when it is @False@.
    is_burned :: Bool
  , -- | Optional. True, if the gift is assigned from the TON blockchain and can\'t be resold or transferred in Telegram
    --
    -- Wire key: @is_from_blockchain@.
    -- Omitted from an encoded request when it is @False@.
    is_from_blockchain :: Bool
  , -- | Optional. The color scheme that can be used by the gift\'s owner for the chat\'s name, replies to messages and link previews; for business account gifts and gifts that are currently on sale only
    --
    -- Wire key: @colors@.
    -- Omitted from an encoded request when it is @Nothing@.
    colors :: Maybe UniqueGiftColors
  , -- | Optional. Information about the chat that published the gift
    --
    -- Wire key: @publisher_chat@.
    -- Omitted from an encoded request when it is @Nothing@.
    publisher_chat :: Maybe Chat
  }
  deriving stock (Eq, Show)

-- | Initialize a 'UniqueGift' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkUniqueGift :: Text -> Text -> Text -> Int64 -> UniqueGiftModel -> UniqueGiftSymbol -> UniqueGiftBackdrop -> UniqueGift
mkUniqueGift arg0 arg1 arg2 arg3 arg4 arg5 arg6 =
  MkUniqueGift
    { gift_id = arg0
    , base_name = arg1
    , name = arg2
    , number = arg3
    , model = arg4
    , symbol = arg5
    , backdrop = arg6
    , is_premium = False
    , is_burned = False
    , is_from_blockchain = False
    , colors = Nothing
    , publisher_chat = Nothing
    }

instance FromJSON UniqueGift where
  parseJSON = withObject "UniqueGift" $ \obj ->
    do
      field_0 <- requiredWith obj "gift_id" parseJSON
      field_1 <- requiredWith obj "base_name" parseJSON
      field_2 <- requiredWith obj "name" parseJSON
      field_3 <- requiredWith obj "number" parseInt64
      field_4 <- requiredWith obj "model" parseJSON
      field_5 <- requiredWith obj "symbol" parseJSON
      field_6 <- requiredWith obj "backdrop" parseJSON
      field_7 <- optionalTrueFlag obj "is_premium"
      field_8 <- optionalTrueFlag obj "is_burned"
      field_9 <- optionalTrueFlag obj "is_from_blockchain"
      field_10 <- optionalWith obj "colors" parseJSON
      field_11 <- optionalWith obj "publisher_chat" parseJSON
      pure
        MkUniqueGift
          { gift_id = field_0
          , base_name = field_1
          , name = field_2
          , number = field_3
          , model = field_4
          , symbol = field_5
          , backdrop = field_6
          , is_premium = field_7
          , is_burned = field_8
          , is_from_blockchain = field_9
          , colors = field_10
          , publisher_chat = field_11
          }

instance ToJSON UniqueGift where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "gift_id" x.gift_id
          , jsonField "base_name" x.base_name
          , jsonField "name" x.name
          , jsonField "number" x.number
          , jsonField "model" x.model
          , jsonField "symbol" x.symbol
          , jsonField "backdrop" x.backdrop
          , jsonFlag "is_premium" x.is_premium
          , jsonFlag "is_burned" x.is_burned
          , jsonFlag "is_from_blockchain" x.is_from_blockchain
          , jsonOptional "colors" x.colors
          , jsonOptional "publisher_chat" x.publisher_chat
          ]
      )
  toEncoding = toEncoding . toJSON
