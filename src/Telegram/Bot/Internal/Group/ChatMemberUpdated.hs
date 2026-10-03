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
module Telegram.Bot.Internal.Group.ChatMemberUpdated
  ( ChatMemberUpdated (..)
  , mkChatMemberUpdated
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.Chat (Chat)
import Telegram.Bot.Internal.Group.ChatInviteLink (ChatInviteLink)
import Telegram.Bot.Internal.Group.ChatMember (ChatMember)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseInt64, requiredWith)

-- | This object represents changes in the status of a chat member.
--
-- Source: <https://core.telegram.org/bots/api#chatmemberupdated>.
-- Codec directions: decoded from responses, encoded into requests.
data ChatMemberUpdated = MkChatMemberUpdated
  { -- | Chat the user belongs to
    --
    -- Wire key: @chat@.
    chat :: Chat
  , -- | Performer of the action, which resulted in the change
    --
    -- Wire key: @from@.
    from :: User
  , -- | Date the change was done in Unix time
    --
    -- Wire key: @date@.
    date :: Int64
  , -- | Previous information about the chat member
    --
    -- Wire key: @old_chat_member@.
    old_chat_member :: ChatMember
  , -- | New information about the chat member
    --
    -- Wire key: @new_chat_member@.
    new_chat_member :: ChatMember
  , -- | Optional. Chat invite link, which was used by the user to join the chat; for joining by invite link events only
    --
    -- Wire key: @invite_link@.
    -- Omitted from an encoded request when it is @Nothing@.
    invite_link :: Maybe ChatInviteLink
  , -- | Optional. True, if the user joined the chat after sending a direct join request without using an invite link and being approved by an administrator
    --
    -- Wire key: @via_join_request@.
    -- Omitted from an encoded request when it is @Nothing@.
    via_join_request :: Maybe Bool
  , -- | Optional. True, if the user joined the chat via a chat folder invite link
    --
    -- Wire key: @via_chat_folder_invite_link@.
    -- Omitted from an encoded request when it is @Nothing@.
    via_chat_folder_invite_link :: Maybe Bool
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ChatMemberUpdated' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkChatMemberUpdated :: Chat -> User -> Int64 -> ChatMember -> ChatMember -> ChatMemberUpdated
mkChatMemberUpdated arg0 arg1 arg2 arg3 arg4 =
  MkChatMemberUpdated
    { chat = arg0
    , from = arg1
    , date = arg2
    , old_chat_member = arg3
    , new_chat_member = arg4
    , invite_link = Nothing
    , via_join_request = Nothing
    , via_chat_folder_invite_link = Nothing
    }

instance FromJSON ChatMemberUpdated where
  parseJSON = withObject "ChatMemberUpdated" $ \obj ->
    do
      field_0 <- requiredWith obj "chat" parseJSON
      field_1 <- requiredWith obj "from" parseJSON
      field_2 <- requiredWith obj "date" parseInt64
      field_3 <- requiredWith obj "old_chat_member" parseJSON
      field_4 <- requiredWith obj "new_chat_member" parseJSON
      field_5 <- optionalWith obj "invite_link" parseJSON
      field_6 <- optionalWith obj "via_join_request" parseJSON
      field_7 <- optionalWith obj "via_chat_folder_invite_link" parseJSON
      pure
        MkChatMemberUpdated
          { chat = field_0
          , from = field_1
          , date = field_2
          , old_chat_member = field_3
          , new_chat_member = field_4
          , invite_link = field_5
          , via_join_request = field_6
          , via_chat_folder_invite_link = field_7
          }

instance ToJSON ChatMemberUpdated where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "chat" x.chat
          , jsonField "from" x.from
          , jsonField "date" x.date
          , jsonField "old_chat_member" x.old_chat_member
          , jsonField "new_chat_member" x.new_chat_member
          , jsonOptional "invite_link" x.invite_link
          , jsonOptional "via_join_request" x.via_join_request
          , jsonOptional "via_chat_folder_invite_link" x.via_chat_folder_invite_link
          ]
      )
  toEncoding = toEncoding . toJSON
