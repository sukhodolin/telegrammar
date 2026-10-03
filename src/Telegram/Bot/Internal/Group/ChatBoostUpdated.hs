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
module Telegram.Bot.Internal.Group.ChatBoostUpdated
  ( ChatBoostUpdated (..)
  , mkChatBoostUpdated
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Telegram.Bot.Internal.Group.Chat (Chat)
import Telegram.Bot.Internal.Group.ChatBoost (ChatBoost)
import Telegram.Bot.Support (jsonField, jsonObject, requiredWith)

-- | This object represents a boost added to a chat or changed.
--
-- Source: <https://core.telegram.org/bots/api#chatboostupdated>.
-- Codec directions: decoded from responses, encoded into requests.
data ChatBoostUpdated = MkChatBoostUpdated
  { -- | Chat which was boosted
    --
    -- Wire key: @chat@.
    chat :: Chat
  , -- | Information about the chat boost
    --
    -- Wire key: @boost@.
    boost :: ChatBoost
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ChatBoostUpdated' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkChatBoostUpdated :: Chat -> ChatBoost -> ChatBoostUpdated
mkChatBoostUpdated arg0 arg1 =
  MkChatBoostUpdated
    { chat = arg0
    , boost = arg1
    }

instance FromJSON ChatBoostUpdated where
  parseJSON = withObject "ChatBoostUpdated" $ \obj ->
    do
      field_0 <- requiredWith obj "chat" parseJSON
      field_1 <- requiredWith obj "boost" parseJSON
      pure
        MkChatBoostUpdated
          { chat = field_0
          , boost = field_1
          }

instance ToJSON ChatBoostUpdated where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "chat" x.chat
          , jsonField "boost" x.boost
          ]
      )
  toEncoding = toEncoding . toJSON
