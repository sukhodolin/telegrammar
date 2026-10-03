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
module Telegram.Bot.Internal.Group.ChatBoostRemoved
  ( ChatBoostRemoved (..)
  , mkChatBoostRemoved
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.Chat (Chat)
import Telegram.Bot.Internal.Group.ChatBoostSource (ChatBoostSource)
import Telegram.Bot.Support (jsonField, jsonObject, parseInt64, requiredWith)

-- | This object represents a boost removed from a chat.
--
-- Source: <https://core.telegram.org/bots/api#chatboostremoved>.
-- Codec directions: decoded from responses, encoded into requests.
data ChatBoostRemoved = MkChatBoostRemoved
  { -- | Chat which was boosted
    --
    -- Wire key: @chat@.
    chat :: Chat
  , -- | Unique identifier of the boost
    --
    -- Wire key: @boost_id@.
    boost_id :: Text
  , -- | Point in time (Unix timestamp) when the boost was removed
    --
    -- Wire key: @remove_date@.
    remove_date :: Int64
  , -- | Source of the removed boost
    --
    -- Wire key: @source@.
    source :: ChatBoostSource
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ChatBoostRemoved' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkChatBoostRemoved :: Chat -> Text -> Int64 -> ChatBoostSource -> ChatBoostRemoved
mkChatBoostRemoved arg0 arg1 arg2 arg3 =
  MkChatBoostRemoved
    { chat = arg0
    , boost_id = arg1
    , remove_date = arg2
    , source = arg3
    }

instance FromJSON ChatBoostRemoved where
  parseJSON = withObject "ChatBoostRemoved" $ \obj ->
    do
      field_0 <- requiredWith obj "chat" parseJSON
      field_1 <- requiredWith obj "boost_id" parseJSON
      field_2 <- requiredWith obj "remove_date" parseInt64
      field_3 <- requiredWith obj "source" parseJSON
      pure
        MkChatBoostRemoved
          { chat = field_0
          , boost_id = field_1
          , remove_date = field_2
          , source = field_3
          }

instance ToJSON ChatBoostRemoved where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "chat" x.chat
          , jsonField "boost_id" x.boost_id
          , jsonField "remove_date" x.remove_date
          , jsonField "source" x.source
          ]
      )
  toEncoding = toEncoding . toJSON
