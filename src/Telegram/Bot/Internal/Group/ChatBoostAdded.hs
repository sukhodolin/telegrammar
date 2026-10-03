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
module Telegram.Bot.Internal.Group.ChatBoostAdded
  ( ChatBoostAdded (..)
  , mkChatBoostAdded
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Support (jsonField, jsonObject, parseInt64, requiredWith)

-- | This object represents a service message about a user boosting a chat.
--
-- Source: <https://core.telegram.org/bots/api#chatboostadded>.
-- Codec directions: decoded from responses, encoded into requests.
data ChatBoostAdded = MkChatBoostAdded
  { -- | Number of boosts added by the user
    --
    -- Wire key: @boost_count@.
    boost_count :: Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ChatBoostAdded' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkChatBoostAdded :: Int64 -> ChatBoostAdded
mkChatBoostAdded arg0 =
  MkChatBoostAdded
    { boost_count = arg0
    }

instance FromJSON ChatBoostAdded where
  parseJSON = withObject "ChatBoostAdded" $ \obj ->
    do
      field_0 <- requiredWith obj "boost_count" parseInt64
      pure
        MkChatBoostAdded
          { boost_count = field_0
          }

instance ToJSON ChatBoostAdded where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "boost_count" x.boost_count
          ]
      )
  toEncoding = toEncoding . toJSON
