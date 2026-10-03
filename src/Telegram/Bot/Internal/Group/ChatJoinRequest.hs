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
module Telegram.Bot.Internal.Group.ChatJoinRequest
  ( ChatJoinRequest (..)
  , mkChatJoinRequest
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.Chat (Chat)
import Telegram.Bot.Internal.Group.ChatInviteLink (ChatInviteLink)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseInt64, requiredWith)

-- | Represents a join request sent to a chat.
--
-- Source: <https://core.telegram.org/bots/api#chatjoinrequest>.
-- Codec directions: decoded from responses, encoded into requests.
data ChatJoinRequest = MkChatJoinRequest
  { -- | Chat to which the request was sent
    --
    -- Wire key: @chat@.
    chat :: Chat
  , -- | User that sent the join request
    --
    -- Wire key: @from@.
    from :: User
  , -- | Identifier of a private chat with the user who sent the join request. This number may have more than 32 significant bits and some programming languages may have difficulty\/silent defects in interpreting it. But it has at most 52 significant bits, so a 64-bit integer or double-precision float type are safe for storing this identifier. The bot can use this identifier for 5 minutes to send messages until the join request is processed, assuming no other administrator contacted the user.
    --
    -- Wire key: @user_chat_id@.
    user_chat_id :: Int64
  , -- | Date the request was sent in Unix time
    --
    -- Wire key: @date@.
    date :: Int64
  , -- | Optional. Bio of the user
    --
    -- Wire key: @bio@.
    -- Omitted from an encoded request when it is @Nothing@.
    bio :: Maybe Text
  , -- | Optional. Chat invite link that was used by the user to send the join request
    --
    -- Wire key: @invite_link@.
    -- Omitted from an encoded request when it is @Nothing@.
    invite_link :: Maybe ChatInviteLink
  , -- | Optional. Identifier of the join request query; for bots assigned to process join requests only. If present, then the bot must call sendChatJoinRequestWebApp or directly call answerChatJoinRequestQuery within 10 seconds.
    --
    -- Wire key: @query_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    query_id :: Maybe Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ChatJoinRequest' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkChatJoinRequest :: Chat -> User -> Int64 -> Int64 -> ChatJoinRequest
mkChatJoinRequest arg0 arg1 arg2 arg3 =
  MkChatJoinRequest
    { chat = arg0
    , from = arg1
    , user_chat_id = arg2
    , date = arg3
    , bio = Nothing
    , invite_link = Nothing
    , query_id = Nothing
    }

instance FromJSON ChatJoinRequest where
  parseJSON = withObject "ChatJoinRequest" $ \obj ->
    do
      field_0 <- requiredWith obj "chat" parseJSON
      field_1 <- requiredWith obj "from" parseJSON
      field_2 <- requiredWith obj "user_chat_id" parseInt64
      field_3 <- requiredWith obj "date" parseInt64
      field_4 <- optionalWith obj "bio" parseJSON
      field_5 <- optionalWith obj "invite_link" parseJSON
      field_6 <- optionalWith obj "query_id" parseJSON
      pure
        MkChatJoinRequest
          { chat = field_0
          , from = field_1
          , user_chat_id = field_2
          , date = field_3
          , bio = field_4
          , invite_link = field_5
          , query_id = field_6
          }

instance ToJSON ChatJoinRequest where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "chat" x.chat
          , jsonField "from" x.from
          , jsonField "user_chat_id" x.user_chat_id
          , jsonField "date" x.date
          , jsonOptional "bio" x.bio
          , jsonOptional "invite_link" x.invite_link
          , jsonOptional "query_id" x.query_id
          ]
      )
  toEncoding = toEncoding . toJSON
