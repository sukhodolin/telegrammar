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
module Telegram.Bot.Internal.Group.MessageReactionUpdated
  ( MessageReactionUpdated (..)
  , mkMessageReactionUpdated
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.Chat (Chat)
import Telegram.Bot.Internal.Group.ReactionType (ReactionType)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseInt64, parseList, requiredWith)

-- | This object represents a change of a reaction on a message performed by a user.
--
-- Source: <https://core.telegram.org/bots/api#messagereactionupdated>.
-- Codec directions: decoded from responses, encoded into requests.
data MessageReactionUpdated = MkMessageReactionUpdated
  { -- | The chat containing the message the user reacted to
    --
    -- Wire key: @chat@.
    chat :: Chat
  , -- | Unique identifier of the message inside the chat
    --
    -- Wire key: @message_id@.
    message_id :: Int64
  , -- | Optional. The user that changed the reaction, if the user isn\'t anonymous
    --
    -- Wire key: @user@.
    -- Omitted from an encoded request when it is @Nothing@.
    user :: Maybe User
  , -- | Optional. The chat on behalf of which the reaction was changed, if the user is anonymous
    --
    -- Wire key: @actor_chat@.
    -- Omitted from an encoded request when it is @Nothing@.
    actor_chat :: Maybe Chat
  , -- | Date of the change in Unix time
    --
    -- Wire key: @date@.
    date :: Int64
  , -- | Previous list of reaction types that were set by the user
    --
    -- Wire key: @old_reaction@.
    old_reaction :: [ReactionType]
  , -- | New list of reaction types that have been set by the user
    --
    -- Wire key: @new_reaction@.
    new_reaction :: [ReactionType]
  }
  deriving stock (Eq, Show)

-- | Initialize a 'MessageReactionUpdated' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkMessageReactionUpdated :: Chat -> Int64 -> Int64 -> [ReactionType] -> [ReactionType] -> MessageReactionUpdated
mkMessageReactionUpdated arg0 arg1 arg2 arg3 arg4 =
  MkMessageReactionUpdated
    { chat = arg0
    , message_id = arg1
    , user = Nothing
    , actor_chat = Nothing
    , date = arg2
    , old_reaction = arg3
    , new_reaction = arg4
    }

instance FromJSON MessageReactionUpdated where
  parseJSON = withObject "MessageReactionUpdated" $ \obj ->
    do
      field_0 <- requiredWith obj "chat" parseJSON
      field_1 <- requiredWith obj "message_id" parseInt64
      field_2 <- optionalWith obj "user" parseJSON
      field_3 <- optionalWith obj "actor_chat" parseJSON
      field_4 <- requiredWith obj "date" parseInt64
      field_5 <- requiredWith obj "old_reaction" (parseList parseJSON)
      field_6 <- requiredWith obj "new_reaction" (parseList parseJSON)
      pure
        MkMessageReactionUpdated
          { chat = field_0
          , message_id = field_1
          , user = field_2
          , actor_chat = field_3
          , date = field_4
          , old_reaction = field_5
          , new_reaction = field_6
          }

instance ToJSON MessageReactionUpdated where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "chat" x.chat
          , jsonField "message_id" x.message_id
          , jsonOptional "user" x.user
          , jsonOptional "actor_chat" x.actor_chat
          , jsonField "date" x.date
          , jsonField "old_reaction" x.old_reaction
          , jsonField "new_reaction" x.new_reaction
          ]
      )
  toEncoding = toEncoding . toJSON
