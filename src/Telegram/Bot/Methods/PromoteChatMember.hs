{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeFamilies #-}

-- | One method's request record, initializer, and result association.
--
-- Import this module qualified to update an optional parameter, which is
-- the supported idiom for a record whose field labels repeat across
-- methods.
--
-- Generated. Do not edit.
module Telegram.Bot.Methods.PromoteChatMember
  ( PromoteChatMember (..)
  , mkPromoteChatMember
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned, plannedMaybe)

-- | Use this method to promote or demote a user in a supergroup or a channel. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Pass False for all boolean parameters to demote a user. Returns True on success.
--
-- Wire method spelling: @promoteChatMember@.
--
-- Source: <https://core.telegram.org/bots/api#promotechatmember>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data PromoteChatMember = MkPromoteChatMember
  { -- | Unique identifier for the target chat or username of the target channel in the format \@username
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | Unique identifier of the target user
    --
    -- Wire key: @user_id@.
    user_id :: Int64
  , -- | Pass True if the administrator\'s presence in the chat is hidden
    --
    -- Wire key: @is_anonymous@.
    -- Omitted from an encoded request when it is @Nothing@.
    is_anonymous :: Maybe Bool
  , -- | Pass True if the administrator can access the chat event log, get boost list, see hidden supergroup and channel members, report spam messages, ignore slow mode, and send messages to the chat without paying Telegram Stars. Implied by any other administrator privilege.
    --
    -- Wire key: @can_manage_chat@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_manage_chat :: Maybe Bool
  , -- | Pass True if the administrator can delete messages of other users
    --
    -- Wire key: @can_delete_messages@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_delete_messages :: Maybe Bool
  , -- | Pass True if the administrator can manage video chats
    --
    -- Wire key: @can_manage_video_chats@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_manage_video_chats :: Maybe Bool
  , -- | Pass True if the administrator can restrict, ban or unban chat members, or access supergroup statistics. For backward compatibility, defaults to True for promotions of channel administrators.
    --
    -- Wire key: @can_restrict_members@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_restrict_members :: Maybe Bool
  , -- | Pass True if the administrator can add new administrators with a subset of their own privileges or demote administrators that they have promoted, directly or indirectly (promoted by administrators that were appointed by him)
    --
    -- Wire key: @can_promote_members@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_promote_members :: Maybe Bool
  , -- | Pass True if the administrator can change chat title, photo and other settings
    --
    -- Wire key: @can_change_info@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_change_info :: Maybe Bool
  , -- | Pass True if the administrator can invite new users to the chat
    --
    -- Wire key: @can_invite_users@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_invite_users :: Maybe Bool
  , -- | Pass True if the administrator can post stories to the chat
    --
    -- Wire key: @can_post_stories@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_post_stories :: Maybe Bool
  , -- | Pass True if the administrator can edit stories posted by other users, post stories to the chat page, pin chat stories, and access the chat\'s story archive
    --
    -- Wire key: @can_edit_stories@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_edit_stories :: Maybe Bool
  , -- | Pass True if the administrator can delete stories posted by other users
    --
    -- Wire key: @can_delete_stories@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_delete_stories :: Maybe Bool
  , -- | Pass True if the administrator can post messages in the channel, approve suggested posts, or access channel statistics; for channels only
    --
    -- Wire key: @can_post_messages@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_post_messages :: Maybe Bool
  , -- | Pass True if the administrator can edit messages of other users and can pin messages; for channels only
    --
    -- Wire key: @can_edit_messages@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_edit_messages :: Maybe Bool
  , -- | Pass True if the administrator can pin messages; for supergroups only
    --
    -- Wire key: @can_pin_messages@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_pin_messages :: Maybe Bool
  , -- | Pass True if the user is allowed to create, rename, close, and reopen forum topics; for supergroups only
    --
    -- Wire key: @can_manage_topics@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_manage_topics :: Maybe Bool
  , -- | Pass True if the administrator can manage direct messages within the channel and decline suggested posts; for channels only
    --
    -- Wire key: @can_manage_direct_messages@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_manage_direct_messages :: Maybe Bool
  , -- | Pass True if the administrator can edit the tags of regular members; for groups and supergroups only
    --
    -- Wire key: @can_manage_tags@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_manage_tags :: Maybe Bool
  , -- | Pass True if the administrator can manage chat welcome messages or directly send them in the case of bots
    --
    -- Wire key: @can_send_welcome_messages@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_send_welcome_messages :: Maybe Bool
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'PromoteChatMember' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkPromoteChatMember :: IntegerOrString -> Int64 -> PromoteChatMember
mkPromoteChatMember arg0 arg1 =
  MkPromoteChatMember
    { chat_id = arg0
    , user_id = arg1
    , is_anonymous = Nothing
    , can_manage_chat = Nothing
    , can_delete_messages = Nothing
    , can_manage_video_chats = Nothing
    , can_restrict_members = Nothing
    , can_promote_members = Nothing
    , can_change_info = Nothing
    , can_invite_users = Nothing
    , can_post_stories = Nothing
    , can_edit_stories = Nothing
    , can_delete_stories = Nothing
    , can_post_messages = Nothing
    , can_edit_messages = Nothing
    , can_pin_messages = Nothing
    , can_manage_topics = Nothing
    , can_manage_direct_messages = Nothing
    , can_manage_tags = Nothing
    , can_send_welcome_messages = Nothing
    , extra = mempty
    }

instance Method PromoteChatMember where
  type Result PromoteChatMember = TrueValue
  methodName _ = "promoteChatMember"
  planRequest x =
    planRequestBody
      "promoteChatMember"
      [ "chat_id"
      , "user_id"
      , "is_anonymous"
      , "can_manage_chat"
      , "can_delete_messages"
      , "can_manage_video_chats"
      , "can_restrict_members"
      , "can_promote_members"
      , "can_change_info"
      , "can_invite_users"
      , "can_post_stories"
      , "can_edit_stories"
      , "can_delete_stories"
      , "can_post_messages"
      , "can_edit_messages"
      , "can_pin_messages"
      , "can_manage_topics"
      , "can_manage_direct_messages"
      , "can_manage_tags"
      , "can_send_welcome_messages"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          , planned "user_id" (encodeJson x.user_id)
          , plannedMaybe "is_anonymous" x.is_anonymous encodeJson
          , plannedMaybe "can_manage_chat" x.can_manage_chat encodeJson
          , plannedMaybe "can_delete_messages" x.can_delete_messages encodeJson
          , plannedMaybe "can_manage_video_chats" x.can_manage_video_chats encodeJson
          , plannedMaybe "can_restrict_members" x.can_restrict_members encodeJson
          , plannedMaybe "can_promote_members" x.can_promote_members encodeJson
          , plannedMaybe "can_change_info" x.can_change_info encodeJson
          , plannedMaybe "can_invite_users" x.can_invite_users encodeJson
          , plannedMaybe "can_post_stories" x.can_post_stories encodeJson
          , plannedMaybe "can_edit_stories" x.can_edit_stories encodeJson
          , plannedMaybe "can_delete_stories" x.can_delete_stories encodeJson
          , plannedMaybe "can_post_messages" x.can_post_messages encodeJson
          , plannedMaybe "can_edit_messages" x.can_edit_messages encodeJson
          , plannedMaybe "can_pin_messages" x.can_pin_messages encodeJson
          , plannedMaybe "can_manage_topics" x.can_manage_topics encodeJson
          , plannedMaybe "can_manage_direct_messages" x.can_manage_direct_messages encodeJson
          , plannedMaybe "can_manage_tags" x.can_manage_tags encodeJson
          , plannedMaybe "can_send_welcome_messages" x.can_send_welcome_messages encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
