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
module Telegram.Bot.Internal.Group.MessageReactionCountUpdated
  ( MessageReactionCountUpdated (..)
  , mkMessageReactionCountUpdated
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.Chat (Chat)
import Telegram.Bot.Internal.Group.ReactionCount (ReactionCount)
import Telegram.Bot.Support (jsonField, jsonObject, parseInt64, parseList, requiredWith)

-- | This object represents reaction changes on a message with anonymous reactions.
--
-- Source: <https://core.telegram.org/bots/api#messagereactioncountupdated>.
-- Codec directions: decoded from responses, encoded into requests.
data MessageReactionCountUpdated = MkMessageReactionCountUpdated
  { -- | The chat containing the message
    --
    -- Wire key: @chat@.
    chat :: Chat
  , -- | Unique message identifier inside the chat
    --
    -- Wire key: @message_id@.
    message_id :: Int64
  , -- | Date of the change in Unix time
    --
    -- Wire key: @date@.
    date :: Int64
  , -- | List of reactions that are present on the message
    --
    -- Wire key: @reactions@.
    reactions :: [ReactionCount]
  }
  deriving stock (Eq, Show)

-- | Initialize a 'MessageReactionCountUpdated' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkMessageReactionCountUpdated :: Chat -> Int64 -> Int64 -> [ReactionCount] -> MessageReactionCountUpdated
mkMessageReactionCountUpdated arg0 arg1 arg2 arg3 =
  MkMessageReactionCountUpdated
    { chat = arg0
    , message_id = arg1
    , date = arg2
    , reactions = arg3
    }

instance FromJSON MessageReactionCountUpdated where
  parseJSON = withObject "MessageReactionCountUpdated" $ \obj ->
    do
      field_0 <- requiredWith obj "chat" parseJSON
      field_1 <- requiredWith obj "message_id" parseInt64
      field_2 <- requiredWith obj "date" parseInt64
      field_3 <- requiredWith obj "reactions" (parseList parseJSON)
      pure
        MkMessageReactionCountUpdated
          { chat = field_0
          , message_id = field_1
          , date = field_2
          , reactions = field_3
          }

instance ToJSON MessageReactionCountUpdated where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "chat" x.chat
          , jsonField "message_id" x.message_id
          , jsonField "date" x.date
          , jsonField "reactions" x.reactions
          ]
      )
  toEncoding = toEncoding . toJSON
