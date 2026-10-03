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
module Telegram.Bot.Internal.Group.ChatAdministratorRights
  ( ChatAdministratorRights (..)
  , mkChatAdministratorRights
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, requiredWith)

-- | Represents the rights of an administrator in a chat.
--
-- Source: <https://core.telegram.org/bots/api#chatadministratorrights>.
-- Codec directions: decoded from responses, encoded into requests.
data ChatAdministratorRights = MkChatAdministratorRights
  { -- | True, if the user\'s presence in the chat is hidden
    --
    -- Wire key: @is_anonymous@.
    is_anonymous :: Bool
  , -- | True, if the administrator can access the chat event log, get boost list, see hidden supergroup and channel members, report spam messages, ignore slow mode, and send messages to the chat without paying Telegram Stars. Implied by any other administrator privilege.
    --
    -- Wire key: @can_manage_chat@.
    can_manage_chat :: Bool
  , -- | True, if the administrator can delete messages of other users
    --
    -- Wire key: @can_delete_messages@.
    can_delete_messages :: Bool
  , -- | True, if the administrator can manage video chats
    --
    -- Wire key: @can_manage_video_chats@.
    can_manage_video_chats :: Bool
  , -- | True, if the administrator can restrict, ban or unban chat members, or access supergroup statistics
    --
    -- Wire key: @can_restrict_members@.
    can_restrict_members :: Bool
  , -- | True, if the administrator can add new administrators with a subset of their own privileges or demote administrators that they have promoted, directly or indirectly (promoted by administrators that were appointed by the user)
    --
    -- Wire key: @can_promote_members@.
    can_promote_members :: Bool
  , -- | True, if the user is allowed to change the chat title, photo and other settings
    --
    -- Wire key: @can_change_info@.
    can_change_info :: Bool
  , -- | True, if the user is allowed to invite new users to the chat
    --
    -- Wire key: @can_invite_users@.
    can_invite_users :: Bool
  , -- | True, if the administrator can post stories to the chat
    --
    -- Wire key: @can_post_stories@.
    can_post_stories :: Bool
  , -- | True, if the administrator can edit stories posted by other users, post stories to the chat page, pin chat stories, and access the chat\'s story archive
    --
    -- Wire key: @can_edit_stories@.
    can_edit_stories :: Bool
  , -- | True, if the administrator can delete stories posted by other users
    --
    -- Wire key: @can_delete_stories@.
    can_delete_stories :: Bool
  , -- | Optional. True, if the administrator can post messages in the channel, approve suggested posts, or access channel statistics; for channels only
    --
    -- Wire key: @can_post_messages@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_post_messages :: Maybe Bool
  , -- | Optional. True, if the administrator can edit messages of other users and can pin messages; for channels only
    --
    -- Wire key: @can_edit_messages@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_edit_messages :: Maybe Bool
  , -- | Optional. True, if the user is allowed to pin messages; for groups and supergroups only
    --
    -- Wire key: @can_pin_messages@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_pin_messages :: Maybe Bool
  , -- | Optional. True, if the user is allowed to create, rename, close, and reopen forum topics; for supergroups only
    --
    -- Wire key: @can_manage_topics@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_manage_topics :: Maybe Bool
  , -- | Optional. True, if the administrator can manage direct messages of the channel and decline suggested posts; for channels only
    --
    -- Wire key: @can_manage_direct_messages@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_manage_direct_messages :: Maybe Bool
  , -- | Optional. True, if the administrator can edit the tags of regular members; for groups and supergroups only
    --
    -- Wire key: @can_manage_tags@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_manage_tags :: Maybe Bool
  , -- | True, if the administrator can manage chat welcome messages or directly send them in the case of bots
    --
    -- Wire key: @can_send_welcome_messages@.
    can_send_welcome_messages :: Bool
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ChatAdministratorRights' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkChatAdministratorRights :: Bool -> Bool -> Bool -> Bool -> Bool -> Bool -> Bool -> Bool -> Bool -> Bool -> Bool -> Bool -> ChatAdministratorRights
mkChatAdministratorRights arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9 arg10 arg11 =
  MkChatAdministratorRights
    { is_anonymous = arg0
    , can_manage_chat = arg1
    , can_delete_messages = arg2
    , can_manage_video_chats = arg3
    , can_restrict_members = arg4
    , can_promote_members = arg5
    , can_change_info = arg6
    , can_invite_users = arg7
    , can_post_stories = arg8
    , can_edit_stories = arg9
    , can_delete_stories = arg10
    , can_post_messages = Nothing
    , can_edit_messages = Nothing
    , can_pin_messages = Nothing
    , can_manage_topics = Nothing
    , can_manage_direct_messages = Nothing
    , can_manage_tags = Nothing
    , can_send_welcome_messages = arg11
    }

instance FromJSON ChatAdministratorRights where
  parseJSON = withObject "ChatAdministratorRights" $ \obj ->
    do
      field_0 <- requiredWith obj "is_anonymous" parseJSON
      field_1 <- requiredWith obj "can_manage_chat" parseJSON
      field_2 <- requiredWith obj "can_delete_messages" parseJSON
      field_3 <- requiredWith obj "can_manage_video_chats" parseJSON
      field_4 <- requiredWith obj "can_restrict_members" parseJSON
      field_5 <- requiredWith obj "can_promote_members" parseJSON
      field_6 <- requiredWith obj "can_change_info" parseJSON
      field_7 <- requiredWith obj "can_invite_users" parseJSON
      field_8 <- requiredWith obj "can_post_stories" parseJSON
      field_9 <- requiredWith obj "can_edit_stories" parseJSON
      field_10 <- requiredWith obj "can_delete_stories" parseJSON
      field_11 <- optionalWith obj "can_post_messages" parseJSON
      field_12 <- optionalWith obj "can_edit_messages" parseJSON
      field_13 <- optionalWith obj "can_pin_messages" parseJSON
      field_14 <- optionalWith obj "can_manage_topics" parseJSON
      field_15 <- optionalWith obj "can_manage_direct_messages" parseJSON
      field_16 <- optionalWith obj "can_manage_tags" parseJSON
      field_17 <- requiredWith obj "can_send_welcome_messages" parseJSON
      pure
        MkChatAdministratorRights
          { is_anonymous = field_0
          , can_manage_chat = field_1
          , can_delete_messages = field_2
          , can_manage_video_chats = field_3
          , can_restrict_members = field_4
          , can_promote_members = field_5
          , can_change_info = field_6
          , can_invite_users = field_7
          , can_post_stories = field_8
          , can_edit_stories = field_9
          , can_delete_stories = field_10
          , can_post_messages = field_11
          , can_edit_messages = field_12
          , can_pin_messages = field_13
          , can_manage_topics = field_14
          , can_manage_direct_messages = field_15
          , can_manage_tags = field_16
          , can_send_welcome_messages = field_17
          }

instance ToJSON ChatAdministratorRights where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "is_anonymous" x.is_anonymous
          , jsonField "can_manage_chat" x.can_manage_chat
          , jsonField "can_delete_messages" x.can_delete_messages
          , jsonField "can_manage_video_chats" x.can_manage_video_chats
          , jsonField "can_restrict_members" x.can_restrict_members
          , jsonField "can_promote_members" x.can_promote_members
          , jsonField "can_change_info" x.can_change_info
          , jsonField "can_invite_users" x.can_invite_users
          , jsonField "can_post_stories" x.can_post_stories
          , jsonField "can_edit_stories" x.can_edit_stories
          , jsonField "can_delete_stories" x.can_delete_stories
          , jsonOptional "can_post_messages" x.can_post_messages
          , jsonOptional "can_edit_messages" x.can_edit_messages
          , jsonOptional "can_pin_messages" x.can_pin_messages
          , jsonOptional "can_manage_topics" x.can_manage_topics
          , jsonOptional "can_manage_direct_messages" x.can_manage_direct_messages
          , jsonOptional "can_manage_tags" x.can_manage_tags
          , jsonField "can_send_welcome_messages" x.can_send_welcome_messages
          ]
      )
  toEncoding = toEncoding . toJSON
