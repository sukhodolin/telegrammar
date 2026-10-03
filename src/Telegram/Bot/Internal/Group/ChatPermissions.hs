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
module Telegram.Bot.Internal.Group.ChatPermissions
  ( ChatPermissions (..)
  , mkChatPermissions
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Telegram.Bot.Support (jsonObject, jsonOptional, optionalWith)

-- | Describes actions that a non-administrator user is allowed to take in a chat.
--
-- Source: <https://core.telegram.org/bots/api#chatpermissions>.
-- Codec directions: decoded from responses, encoded into requests.
data ChatPermissions = MkChatPermissions
  { -- | Optional. True, if the user is allowed to send text messages, rich messages, contacts, giveaways, giveaway winners, invoices, locations and venues
    --
    -- Wire key: @can_send_messages@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_send_messages :: Maybe Bool
  , -- | Optional. True, if the user is allowed to send audios
    --
    -- Wire key: @can_send_audios@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_send_audios :: Maybe Bool
  , -- | Optional. True, if the user is allowed to send documents
    --
    -- Wire key: @can_send_documents@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_send_documents :: Maybe Bool
  , -- | Optional. True, if the user is allowed to send photos
    --
    -- Wire key: @can_send_photos@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_send_photos :: Maybe Bool
  , -- | Optional. True, if the user is allowed to send videos
    --
    -- Wire key: @can_send_videos@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_send_videos :: Maybe Bool
  , -- | Optional. True, if the user is allowed to send video notes
    --
    -- Wire key: @can_send_video_notes@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_send_video_notes :: Maybe Bool
  , -- | Optional. True, if the user is allowed to send voice notes
    --
    -- Wire key: @can_send_voice_notes@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_send_voice_notes :: Maybe Bool
  , -- | Optional. True, if the user is allowed to send polls and checklists
    --
    -- Wire key: @can_send_polls@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_send_polls :: Maybe Bool
  , -- | Optional. True, if the user is allowed to send animations, games, stickers and use inline bots
    --
    -- Wire key: @can_send_other_messages@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_send_other_messages :: Maybe Bool
  , -- | Optional. True, if the user is allowed to add web page previews to their messages
    --
    -- Wire key: @can_add_web_page_previews@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_add_web_page_previews :: Maybe Bool
  , -- | Optional. True, if the user is allowed to react to messages. If omitted, defaults to the value of can_send_messages.
    --
    -- Wire key: @can_react_to_messages@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_react_to_messages :: Maybe Bool
  , -- | Optional. True, if the user is allowed to edit their own tag. If omitted, defaults to the value of can_pin_messages.
    --
    -- Wire key: @can_edit_tag@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_edit_tag :: Maybe Bool
  , -- | Optional. True, if the user is allowed to change the chat title, photo and other settings. Ignored in public supergroups.
    --
    -- Wire key: @can_change_info@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_change_info :: Maybe Bool
  , -- | Optional. True, if the user is allowed to invite new users to the chat
    --
    -- Wire key: @can_invite_users@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_invite_users :: Maybe Bool
  , -- | Optional. True, if the user is allowed to pin messages. Ignored in public supergroups.
    --
    -- Wire key: @can_pin_messages@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_pin_messages :: Maybe Bool
  , -- | Optional. True, if the user is allowed to create forum topics. If omitted, defaults to the value of can_pin_messages.
    --
    -- Wire key: @can_manage_topics@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_manage_topics :: Maybe Bool
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ChatPermissions' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkChatPermissions :: ChatPermissions
mkChatPermissions =
  MkChatPermissions
    { can_send_messages = Nothing
    , can_send_audios = Nothing
    , can_send_documents = Nothing
    , can_send_photos = Nothing
    , can_send_videos = Nothing
    , can_send_video_notes = Nothing
    , can_send_voice_notes = Nothing
    , can_send_polls = Nothing
    , can_send_other_messages = Nothing
    , can_add_web_page_previews = Nothing
    , can_react_to_messages = Nothing
    , can_edit_tag = Nothing
    , can_change_info = Nothing
    , can_invite_users = Nothing
    , can_pin_messages = Nothing
    , can_manage_topics = Nothing
    }

instance FromJSON ChatPermissions where
  parseJSON = withObject "ChatPermissions" $ \obj ->
    do
      field_0 <- optionalWith obj "can_send_messages" parseJSON
      field_1 <- optionalWith obj "can_send_audios" parseJSON
      field_2 <- optionalWith obj "can_send_documents" parseJSON
      field_3 <- optionalWith obj "can_send_photos" parseJSON
      field_4 <- optionalWith obj "can_send_videos" parseJSON
      field_5 <- optionalWith obj "can_send_video_notes" parseJSON
      field_6 <- optionalWith obj "can_send_voice_notes" parseJSON
      field_7 <- optionalWith obj "can_send_polls" parseJSON
      field_8 <- optionalWith obj "can_send_other_messages" parseJSON
      field_9 <- optionalWith obj "can_add_web_page_previews" parseJSON
      field_10 <- optionalWith obj "can_react_to_messages" parseJSON
      field_11 <- optionalWith obj "can_edit_tag" parseJSON
      field_12 <- optionalWith obj "can_change_info" parseJSON
      field_13 <- optionalWith obj "can_invite_users" parseJSON
      field_14 <- optionalWith obj "can_pin_messages" parseJSON
      field_15 <- optionalWith obj "can_manage_topics" parseJSON
      pure
        MkChatPermissions
          { can_send_messages = field_0
          , can_send_audios = field_1
          , can_send_documents = field_2
          , can_send_photos = field_3
          , can_send_videos = field_4
          , can_send_video_notes = field_5
          , can_send_voice_notes = field_6
          , can_send_polls = field_7
          , can_send_other_messages = field_8
          , can_add_web_page_previews = field_9
          , can_react_to_messages = field_10
          , can_edit_tag = field_11
          , can_change_info = field_12
          , can_invite_users = field_13
          , can_pin_messages = field_14
          , can_manage_topics = field_15
          }

instance ToJSON ChatPermissions where
  toJSON x =
    jsonObject
      ( concat
          [ jsonOptional "can_send_messages" x.can_send_messages
          , jsonOptional "can_send_audios" x.can_send_audios
          , jsonOptional "can_send_documents" x.can_send_documents
          , jsonOptional "can_send_photos" x.can_send_photos
          , jsonOptional "can_send_videos" x.can_send_videos
          , jsonOptional "can_send_video_notes" x.can_send_video_notes
          , jsonOptional "can_send_voice_notes" x.can_send_voice_notes
          , jsonOptional "can_send_polls" x.can_send_polls
          , jsonOptional "can_send_other_messages" x.can_send_other_messages
          , jsonOptional "can_add_web_page_previews" x.can_add_web_page_previews
          , jsonOptional "can_react_to_messages" x.can_react_to_messages
          , jsonOptional "can_edit_tag" x.can_edit_tag
          , jsonOptional "can_change_info" x.can_change_info
          , jsonOptional "can_invite_users" x.can_invite_users
          , jsonOptional "can_pin_messages" x.can_pin_messages
          , jsonOptional "can_manage_topics" x.can_manage_topics
          ]
      )
  toEncoding = toEncoding . toJSON
