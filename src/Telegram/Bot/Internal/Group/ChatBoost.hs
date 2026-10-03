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
module Telegram.Bot.Internal.Group.ChatBoost
  ( ChatBoost (..)
  , mkChatBoost
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.ChatBoostSource (ChatBoostSource)
import Telegram.Bot.Support (jsonField, jsonObject, parseInt64, requiredWith)

-- | This object contains information about a chat boost.
--
-- Source: <https://core.telegram.org/bots/api#chatboost>.
-- Codec directions: decoded from responses, encoded into requests.
data ChatBoost = MkChatBoost
  { -- | Unique identifier of the boost
    --
    -- Wire key: @boost_id@.
    boost_id :: Text
  , -- | Point in time (Unix timestamp) when the chat was boosted
    --
    -- Wire key: @add_date@.
    add_date :: Int64
  , -- | Point in time (Unix timestamp) when the boost will automatically expire, unless the booster\'s Telegram Premium subscription is prolonged
    --
    -- Wire key: @expiration_date@.
    expiration_date :: Int64
  , -- | Source of the added boost
    --
    -- Wire key: @source@.
    source :: ChatBoostSource
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ChatBoost' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkChatBoost :: Text -> Int64 -> Int64 -> ChatBoostSource -> ChatBoost
mkChatBoost arg0 arg1 arg2 arg3 =
  MkChatBoost
    { boost_id = arg0
    , add_date = arg1
    , expiration_date = arg2
    , source = arg3
    }

instance FromJSON ChatBoost where
  parseJSON = withObject "ChatBoost" $ \obj ->
    do
      field_0 <- requiredWith obj "boost_id" parseJSON
      field_1 <- requiredWith obj "add_date" parseInt64
      field_2 <- requiredWith obj "expiration_date" parseInt64
      field_3 <- requiredWith obj "source" parseJSON
      pure
        MkChatBoost
          { boost_id = field_0
          , add_date = field_1
          , expiration_date = field_2
          , source = field_3
          }

instance ToJSON ChatBoost where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "boost_id" x.boost_id
          , jsonField "add_date" x.add_date
          , jsonField "expiration_date" x.expiration_date
          , jsonField "source" x.source
          ]
      )
  toEncoding = toEncoding . toJSON
