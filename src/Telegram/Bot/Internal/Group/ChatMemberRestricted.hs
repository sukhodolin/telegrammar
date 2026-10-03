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
module Telegram.Bot.Internal.Group.ChatMemberRestricted
  ( ChatMemberRestricted (..)
  , mkChatMemberRestricted
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonLiteral, jsonObject, jsonOptional, optionalWith, parseInt64, requiredWith)

-- | Represents a chat member that is under certain restrictions in the chat. Supergroups only.
--
-- Source: <https://core.telegram.org/bots/api#chatmemberrestricted>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @status@ = @"restricted"@.
data ChatMemberRestricted = MkChatMemberRestricted
  { -- | Optional. Tag of the member
    --
    -- Wire key: @tag@.
    -- Omitted from an encoded request when it is @Nothing@.
    tag :: Maybe Text
  , -- | Information about the user
    --
    -- Wire key: @user@.
    user :: User
  , -- | True, if the user is a member of the chat at the moment of the request
    --
    -- Wire key: @is_member@.
    is_member :: Bool
  , -- | True, if the user is allowed to send text messages, rich messages, contacts, giveaways, giveaway winners, invoices, locations and venues
    --
    -- Wire key: @can_send_messages@.
    can_send_messages :: Bool
  , -- | True, if the user is allowed to send audios
    --
    -- Wire key: @can_send_audios@.
    can_send_audios :: Bool
  , -- | True, if the user is allowed to send documents
    --
    -- Wire key: @can_send_documents@.
    can_send_documents :: Bool
  , -- | True, if the user is allowed to send photos
    --
    -- Wire key: @can_send_photos@.
    can_send_photos :: Bool
  , -- | True, if the user is allowed to send videos
    --
    -- Wire key: @can_send_videos@.
    can_send_videos :: Bool
  , -- | True, if the user is allowed to send video notes
    --
    -- Wire key: @can_send_video_notes@.
    can_send_video_notes :: Bool
  , -- | True, if the user is allowed to send voice notes
    --
    -- Wire key: @can_send_voice_notes@.
    can_send_voice_notes :: Bool
  , -- | True, if the user is allowed to send polls and checklists
    --
    -- Wire key: @can_send_polls@.
    can_send_polls :: Bool
  , -- | True, if the user is allowed to send animations, games, stickers and use inline bots
    --
    -- Wire key: @can_send_other_messages@.
    can_send_other_messages :: Bool
  , -- | True, if the user is allowed to add web page previews to their messages
    --
    -- Wire key: @can_add_web_page_previews@.
    can_add_web_page_previews :: Bool
  , -- | True, if the user is allowed to react to messages
    --
    -- Wire key: @can_react_to_messages@.
    can_react_to_messages :: Bool
  , -- | True, if the user is allowed to edit their own tag
    --
    -- Wire key: @can_edit_tag@.
    can_edit_tag :: Bool
  , -- | True, if the user is allowed to change the chat title, photo and other settings
    --
    -- Wire key: @can_change_info@.
    can_change_info :: Bool
  , -- | True, if the user is allowed to invite new users to the chat
    --
    -- Wire key: @can_invite_users@.
    can_invite_users :: Bool
  , -- | True, if the user is allowed to pin messages
    --
    -- Wire key: @can_pin_messages@.
    can_pin_messages :: Bool
  , -- | True, if the user is allowed to create forum topics
    --
    -- Wire key: @can_manage_topics@.
    can_manage_topics :: Bool
  , -- | Date when restrictions will be lifted for this user; Unix time. If 0, then the user is restricted forever.
    --
    -- Wire key: @until_date@.
    until_date :: Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ChatMemberRestricted' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkChatMemberRestricted :: User -> Bool -> Bool -> Bool -> Bool -> Bool -> Bool -> Bool -> Bool -> Bool -> Bool -> Bool -> Bool -> Bool -> Bool -> Bool -> Bool -> Bool -> Int64 -> ChatMemberRestricted
mkChatMemberRestricted arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9 arg10 arg11 arg12 arg13 arg14 arg15 arg16 arg17 arg18 =
  MkChatMemberRestricted
    { tag = Nothing
    , user = arg0
    , is_member = arg1
    , can_send_messages = arg2
    , can_send_audios = arg3
    , can_send_documents = arg4
    , can_send_photos = arg5
    , can_send_videos = arg6
    , can_send_video_notes = arg7
    , can_send_voice_notes = arg8
    , can_send_polls = arg9
    , can_send_other_messages = arg10
    , can_add_web_page_previews = arg11
    , can_react_to_messages = arg12
    , can_edit_tag = arg13
    , can_change_info = arg14
    , can_invite_users = arg15
    , can_pin_messages = arg16
    , can_manage_topics = arg17
    , until_date = arg18
    }

instance FromJSON ChatMemberRestricted where
  parseJSON = withObject "ChatMemberRestricted" $ \obj ->
    do
      checkStringConstant obj "status" "restricted"
      field_1 <- optionalWith obj "tag" parseJSON
      field_2 <- requiredWith obj "user" parseJSON
      field_3 <- requiredWith obj "is_member" parseJSON
      field_4 <- requiredWith obj "can_send_messages" parseJSON
      field_5 <- requiredWith obj "can_send_audios" parseJSON
      field_6 <- requiredWith obj "can_send_documents" parseJSON
      field_7 <- requiredWith obj "can_send_photos" parseJSON
      field_8 <- requiredWith obj "can_send_videos" parseJSON
      field_9 <- requiredWith obj "can_send_video_notes" parseJSON
      field_10 <- requiredWith obj "can_send_voice_notes" parseJSON
      field_11 <- requiredWith obj "can_send_polls" parseJSON
      field_12 <- requiredWith obj "can_send_other_messages" parseJSON
      field_13 <- requiredWith obj "can_add_web_page_previews" parseJSON
      field_14 <- requiredWith obj "can_react_to_messages" parseJSON
      field_15 <- requiredWith obj "can_edit_tag" parseJSON
      field_16 <- requiredWith obj "can_change_info" parseJSON
      field_17 <- requiredWith obj "can_invite_users" parseJSON
      field_18 <- requiredWith obj "can_pin_messages" parseJSON
      field_19 <- requiredWith obj "can_manage_topics" parseJSON
      field_20 <- requiredWith obj "until_date" parseInt64
      pure
        MkChatMemberRestricted
          { tag = field_1
          , user = field_2
          , is_member = field_3
          , can_send_messages = field_4
          , can_send_audios = field_5
          , can_send_documents = field_6
          , can_send_photos = field_7
          , can_send_videos = field_8
          , can_send_video_notes = field_9
          , can_send_voice_notes = field_10
          , can_send_polls = field_11
          , can_send_other_messages = field_12
          , can_add_web_page_previews = field_13
          , can_react_to_messages = field_14
          , can_edit_tag = field_15
          , can_change_info = field_16
          , can_invite_users = field_17
          , can_pin_messages = field_18
          , can_manage_topics = field_19
          , until_date = field_20
          }

instance ToJSON ChatMemberRestricted where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "status" (String "restricted")
          , jsonOptional "tag" x.tag
          , jsonField "user" x.user
          , jsonField "is_member" x.is_member
          , jsonField "can_send_messages" x.can_send_messages
          , jsonField "can_send_audios" x.can_send_audios
          , jsonField "can_send_documents" x.can_send_documents
          , jsonField "can_send_photos" x.can_send_photos
          , jsonField "can_send_videos" x.can_send_videos
          , jsonField "can_send_video_notes" x.can_send_video_notes
          , jsonField "can_send_voice_notes" x.can_send_voice_notes
          , jsonField "can_send_polls" x.can_send_polls
          , jsonField "can_send_other_messages" x.can_send_other_messages
          , jsonField "can_add_web_page_previews" x.can_add_web_page_previews
          , jsonField "can_react_to_messages" x.can_react_to_messages
          , jsonField "can_edit_tag" x.can_edit_tag
          , jsonField "can_change_info" x.can_change_info
          , jsonField "can_invite_users" x.can_invite_users
          , jsonField "can_pin_messages" x.can_pin_messages
          , jsonField "can_manage_topics" x.can_manage_topics
          , jsonField "until_date" x.until_date
          ]
      )
  toEncoding = toEncoding . toJSON
