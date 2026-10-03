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
module Telegram.Bot.Internal.Group.ChatFullInfo
  ( ChatFullInfo (..)
  , mkChatFullInfo
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.AcceptedGiftTypes (AcceptedGiftTypes)
import Telegram.Bot.Internal.Group.Audio (Audio)
import Telegram.Bot.Internal.Group.Birthdate (Birthdate)
import Telegram.Bot.Internal.Group.BusinessIntro (BusinessIntro)
import Telegram.Bot.Internal.Group.BusinessLocation (BusinessLocation)
import Telegram.Bot.Internal.Group.BusinessOpeningHours (BusinessOpeningHours)
import Telegram.Bot.Internal.Group.Chat (Chat)
import Telegram.Bot.Internal.Group.ChatLocation (ChatLocation)
import Telegram.Bot.Internal.Group.ChatPermissions (ChatPermissions)
import Telegram.Bot.Internal.Group.ChatPhoto (ChatPhoto)
import Telegram.Bot.Internal.Group.ChecklistTasksAdded (Message)
import Telegram.Bot.Internal.Group.Community (Community)
import Telegram.Bot.Internal.Group.ReactionType (ReactionType)
import Telegram.Bot.Internal.Group.UniqueGiftColors (UniqueGiftColors)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Internal.Group.UserRating (UserRating)
import Telegram.Bot.Support (jsonField, jsonFlag, jsonObject, jsonOptional, optionalTrueFlag, optionalWith, parseInt64, parseList, requiredWith)

-- | This object contains full information about a chat.
--
-- Source: <https://core.telegram.org/bots/api#chatfullinfo>.
-- Codec directions: decoded from responses, encoded into requests.
data ChatFullInfo = MkChatFullInfo
  { -- | Unique identifier for this chat. This number may have more than 32 significant bits and some programming languages may have difficulty\/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this identifier.
    --
    -- Wire key: @id@.
    id :: Int64
  , -- | Type of the chat, can be either \"private\", \"group\", \"supergroup\" or \"channel\"
    --
    -- Wire key: @type@.
    type_ :: Text
  , -- | Optional. Title, for supergroups, channels and group chats
    --
    -- Wire key: @title@.
    -- Omitted from an encoded request when it is @Nothing@.
    title :: Maybe Text
  , -- | Optional. Username, for private chats, supergroups and channels if available
    --
    -- Wire key: @username@.
    -- Omitted from an encoded request when it is @Nothing@.
    username :: Maybe Text
  , -- | Optional. First name of the other party in a private chat
    --
    -- Wire key: @first_name@.
    -- Omitted from an encoded request when it is @Nothing@.
    first_name :: Maybe Text
  , -- | Optional. Last name of the other party in a private chat
    --
    -- Wire key: @last_name@.
    -- Omitted from an encoded request when it is @Nothing@.
    last_name :: Maybe Text
  , -- | Optional. True, if the supergroup chat is a forum (has topics enabled)
    --
    -- Wire key: @is_forum@.
    -- Omitted from an encoded request when it is @False@.
    is_forum :: Bool
  , -- | Optional. True, if the chat is the direct messages chat of a channel
    --
    -- Wire key: @is_direct_messages@.
    -- Omitted from an encoded request when it is @False@.
    is_direct_messages :: Bool
  , -- | Identifier of the accent color for the chat name and backgrounds of the chat photo, reply header, and link preview. See accent colors for more details.
    --
    -- Wire key: @accent_color_id@.
    accent_color_id :: Int64
  , -- | The maximum number of reactions that can be set on a message in the chat
    --
    -- Wire key: @max_reaction_count@.
    max_reaction_count :: Int64
  , -- | Optional. Chat photo
    --
    -- Wire key: @photo@.
    -- Omitted from an encoded request when it is @Nothing@.
    photo :: Maybe ChatPhoto
  , -- | Optional. If non-empty, the list of all active chat usernames; for private chats, supergroups and channels
    --
    -- Wire key: @active_usernames@.
    -- Omitted from an encoded request when it is @Nothing@.
    active_usernames :: Maybe [Text]
  , -- | Optional. For private chats, the date of birth of the user
    --
    -- Wire key: @birthdate@.
    -- Omitted from an encoded request when it is @Nothing@.
    birthdate :: Maybe Birthdate
  , -- | Optional. For private chats with business accounts, the intro of the business
    --
    -- Wire key: @business_intro@.
    -- Omitted from an encoded request when it is @Nothing@.
    business_intro :: Maybe BusinessIntro
  , -- | Optional. For private chats with business accounts, the location of the business
    --
    -- Wire key: @business_location@.
    -- Omitted from an encoded request when it is @Nothing@.
    business_location :: Maybe BusinessLocation
  , -- | Optional. For private chats with business accounts, the opening hours of the business
    --
    -- Wire key: @business_opening_hours@.
    -- Omitted from an encoded request when it is @Nothing@.
    business_opening_hours :: Maybe BusinessOpeningHours
  , -- | Optional. For private chats, the personal channel of the user
    --
    -- Wire key: @personal_chat@.
    -- Omitted from an encoded request when it is @Nothing@.
    personal_chat :: Maybe Chat
  , -- | Optional. Information about the corresponding channel chat; for direct messages chats only
    --
    -- Wire key: @parent_chat@.
    -- Omitted from an encoded request when it is @Nothing@.
    parent_chat :: Maybe Chat
  , -- | Optional. List of available reactions allowed in the chat. If omitted, then all emoji reactions are allowed.
    --
    -- Wire key: @available_reactions@.
    -- Omitted from an encoded request when it is @Nothing@.
    available_reactions :: Maybe [ReactionType]
  , -- | Optional. Custom emoji identifier of the emoji chosen by the chat for the reply header and link preview background
    --
    -- Wire key: @background_custom_emoji_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    background_custom_emoji_id :: Maybe Text
  , -- | Optional. Identifier of the accent color for the chat\'s profile background. See profile accent colors for more details.
    --
    -- Wire key: @profile_accent_color_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    profile_accent_color_id :: Maybe Int64
  , -- | Optional. Custom emoji identifier of the emoji chosen by the chat for its profile background
    --
    -- Wire key: @profile_background_custom_emoji_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    profile_background_custom_emoji_id :: Maybe Text
  , -- | Optional. Custom emoji identifier of the emoji status of the chat or the other party in a private chat
    --
    -- Wire key: @emoji_status_custom_emoji_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    emoji_status_custom_emoji_id :: Maybe Text
  , -- | Optional. Expiration date of the emoji status of the chat or the other party in a private chat, in Unix time, if any
    --
    -- Wire key: @emoji_status_expiration_date@.
    -- Omitted from an encoded request when it is @Nothing@.
    emoji_status_expiration_date :: Maybe Int64
  , -- | Optional. Bio of the other party in a private chat
    --
    -- Wire key: @bio@.
    -- Omitted from an encoded request when it is @Nothing@.
    bio :: Maybe Text
  , -- | Optional. True, if privacy settings of the other party in the private chat allows to use tg:\/\/user?id=\<user_id\> links only in chats with the user
    --
    -- Wire key: @has_private_forwards@.
    -- Omitted from an encoded request when it is @False@.
    has_private_forwards :: Bool
  , -- | Optional. True, if the privacy settings of the other party restrict sending voice and video note messages in the private chat
    --
    -- Wire key: @has_restricted_voice_and_video_messages@.
    -- Omitted from an encoded request when it is @False@.
    has_restricted_voice_and_video_messages :: Bool
  , -- | Optional. True, if users need to join the supergroup before they can send messages
    --
    -- Wire key: @join_to_send_messages@.
    -- Omitted from an encoded request when it is @False@.
    join_to_send_messages :: Bool
  , -- | Optional. True, if all users directly joining the supergroup without using an invite link need to be approved by supergroup administrators
    --
    -- Wire key: @join_by_request@.
    -- Omitted from an encoded request when it is @False@.
    join_by_request :: Bool
  , -- | Optional. Description, for groups, supergroups and channel chats
    --
    -- Wire key: @description@.
    -- Omitted from an encoded request when it is @Nothing@.
    description :: Maybe Text
  , -- | Optional. Primary invite link, for groups, supergroups and channel chats
    --
    -- Wire key: @invite_link@.
    -- Omitted from an encoded request when it is @Nothing@.
    invite_link :: Maybe Text
  , -- | Optional. The most recent pinned message (by sending date)
    --
    -- Wire key: @pinned_message@.
    -- Omitted from an encoded request when it is @Nothing@.
    pinned_message :: Maybe Message
  , -- | Optional. Default chat member permissions, for groups and supergroups
    --
    -- Wire key: @permissions@.
    -- Omitted from an encoded request when it is @Nothing@.
    permissions :: Maybe ChatPermissions
  , -- | Information about types of gifts that are accepted by the chat or by the corresponding user for private chats
    --
    -- Wire key: @accepted_gift_types@.
    accepted_gift_types :: AcceptedGiftTypes
  , -- | Optional. True, if paid media messages can be sent or forwarded to the channel chat. The field is available only for channel chats.
    --
    -- Wire key: @can_send_paid_media@.
    -- Omitted from an encoded request when it is @False@.
    can_send_paid_media :: Bool
  , -- | Optional. For supergroups, the minimum allowed delay between consecutive messages sent by each unprivileged user; in seconds
    --
    -- Wire key: @slow_mode_delay@.
    -- Omitted from an encoded request when it is @Nothing@.
    slow_mode_delay :: Maybe Int64
  , -- | Optional. For supergroups, the minimum number of boosts that a non-administrator user needs to add in order to ignore slow mode and chat permissions
    --
    -- Wire key: @unrestrict_boost_count@.
    -- Omitted from an encoded request when it is @Nothing@.
    unrestrict_boost_count :: Maybe Int64
  , -- | Optional. The time after which all messages sent to the chat will be automatically deleted; in seconds
    --
    -- Wire key: @message_auto_delete_time@.
    -- Omitted from an encoded request when it is @Nothing@.
    message_auto_delete_time :: Maybe Int64
  , -- | Optional. True, if aggressive anti-spam checks are enabled in the supergroup. The field is only available to chat administrators.
    --
    -- Wire key: @has_aggressive_anti_spam_enabled@.
    -- Omitted from an encoded request when it is @False@.
    has_aggressive_anti_spam_enabled :: Bool
  , -- | Optional. True, if non-administrators can only get the list of bots and administrators in the chat
    --
    -- Wire key: @has_hidden_members@.
    -- Omitted from an encoded request when it is @False@.
    has_hidden_members :: Bool
  , -- | Optional. True, if messages from the chat can\'t be forwarded to other chats
    --
    -- Wire key: @has_protected_content@.
    -- Omitted from an encoded request when it is @False@.
    has_protected_content :: Bool
  , -- | Optional. True, if new chat members will have access to old messages; available only to chat administrators
    --
    -- Wire key: @has_visible_history@.
    -- Omitted from an encoded request when it is @False@.
    has_visible_history :: Bool
  , -- | Optional. For supergroups, name of the group sticker set
    --
    -- Wire key: @sticker_set_name@.
    -- Omitted from an encoded request when it is @Nothing@.
    sticker_set_name :: Maybe Text
  , -- | Optional. True, if the bot can change the group sticker set
    --
    -- Wire key: @can_set_sticker_set@.
    -- Omitted from an encoded request when it is @False@.
    can_set_sticker_set :: Bool
  , -- | Optional. For supergroups, the name of the group\'s custom emoji sticker set. Custom emoji from this set can be used by all users and bots in the group.
    --
    -- Wire key: @custom_emoji_sticker_set_name@.
    -- Omitted from an encoded request when it is @Nothing@.
    custom_emoji_sticker_set_name :: Maybe Text
  , -- | Optional. Unique identifier for the linked chat, i.e. the discussion group identifier for a channel and vice versa; for supergroups and channel chats. This identifier may be greater than 32 bits and some programming languages may have difficulty\/silent defects in interpreting it. But it is smaller than 52 bits, so a signed 64 bit integer or double-precision float type are safe for storing this identifier.
    --
    -- Wire key: @linked_chat_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    linked_chat_id :: Maybe Int64
  , -- | Optional. For supergroups, the location to which the supergroup is connected
    --
    -- Wire key: @location@.
    -- Omitted from an encoded request when it is @Nothing@.
    location :: Maybe ChatLocation
  , -- | Optional. For private chats, the rating of the user if any
    --
    -- Wire key: @rating@.
    -- Omitted from an encoded request when it is @Nothing@.
    rating :: Maybe UserRating
  , -- | Optional. For private chats, the first audio added to the profile of the user
    --
    -- Wire key: @first_profile_audio@.
    -- Omitted from an encoded request when it is @Nothing@.
    first_profile_audio :: Maybe Audio
  , -- | Optional. The color scheme based on a unique gift that must be used for the chat\'s name, message replies and link previews
    --
    -- Wire key: @unique_gift_colors@.
    -- Omitted from an encoded request when it is @Nothing@.
    unique_gift_colors :: Maybe UniqueGiftColors
  , -- | Optional. The number of Telegram Stars a general user has to pay to send a message to the chat
    --
    -- Wire key: @paid_message_star_count@.
    -- Omitted from an encoded request when it is @Nothing@.
    paid_message_star_count :: Maybe Int64
  , -- | Optional. The bot that processes join request queries in the chat. The field is only available to chat administrators.
    --
    -- Wire key: @guard_bot@.
    -- Omitted from an encoded request when it is @Nothing@.
    guard_bot :: Maybe User
  , -- | Optional. The Community to which the chat belongs
    --
    -- Wire key: @community@.
    -- Omitted from an encoded request when it is @Nothing@.
    community :: Maybe Community
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ChatFullInfo' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkChatFullInfo :: Int64 -> Text -> Int64 -> Int64 -> AcceptedGiftTypes -> ChatFullInfo
mkChatFullInfo arg0 arg1 arg2 arg3 arg4 =
  MkChatFullInfo
    { id = arg0
    , type_ = arg1
    , title = Nothing
    , username = Nothing
    , first_name = Nothing
    , last_name = Nothing
    , is_forum = False
    , is_direct_messages = False
    , accent_color_id = arg2
    , max_reaction_count = arg3
    , photo = Nothing
    , active_usernames = Nothing
    , birthdate = Nothing
    , business_intro = Nothing
    , business_location = Nothing
    , business_opening_hours = Nothing
    , personal_chat = Nothing
    , parent_chat = Nothing
    , available_reactions = Nothing
    , background_custom_emoji_id = Nothing
    , profile_accent_color_id = Nothing
    , profile_background_custom_emoji_id = Nothing
    , emoji_status_custom_emoji_id = Nothing
    , emoji_status_expiration_date = Nothing
    , bio = Nothing
    , has_private_forwards = False
    , has_restricted_voice_and_video_messages = False
    , join_to_send_messages = False
    , join_by_request = False
    , description = Nothing
    , invite_link = Nothing
    , pinned_message = Nothing
    , permissions = Nothing
    , accepted_gift_types = arg4
    , can_send_paid_media = False
    , slow_mode_delay = Nothing
    , unrestrict_boost_count = Nothing
    , message_auto_delete_time = Nothing
    , has_aggressive_anti_spam_enabled = False
    , has_hidden_members = False
    , has_protected_content = False
    , has_visible_history = False
    , sticker_set_name = Nothing
    , can_set_sticker_set = False
    , custom_emoji_sticker_set_name = Nothing
    , linked_chat_id = Nothing
    , location = Nothing
    , rating = Nothing
    , first_profile_audio = Nothing
    , unique_gift_colors = Nothing
    , paid_message_star_count = Nothing
    , guard_bot = Nothing
    , community = Nothing
    }

instance FromJSON ChatFullInfo where
  parseJSON = withObject "ChatFullInfo" $ \obj ->
    do
      field_0 <- requiredWith obj "id" parseInt64
      field_1 <- requiredWith obj "type" parseJSON
      field_2 <- optionalWith obj "title" parseJSON
      field_3 <- optionalWith obj "username" parseJSON
      field_4 <- optionalWith obj "first_name" parseJSON
      field_5 <- optionalWith obj "last_name" parseJSON
      field_6 <- optionalTrueFlag obj "is_forum"
      field_7 <- optionalTrueFlag obj "is_direct_messages"
      field_8 <- requiredWith obj "accent_color_id" parseInt64
      field_9 <- requiredWith obj "max_reaction_count" parseInt64
      field_10 <- optionalWith obj "photo" parseJSON
      field_11 <- optionalWith obj "active_usernames" (parseList parseJSON)
      field_12 <- optionalWith obj "birthdate" parseJSON
      field_13 <- optionalWith obj "business_intro" parseJSON
      field_14 <- optionalWith obj "business_location" parseJSON
      field_15 <- optionalWith obj "business_opening_hours" parseJSON
      field_16 <- optionalWith obj "personal_chat" parseJSON
      field_17 <- optionalWith obj "parent_chat" parseJSON
      field_18 <- optionalWith obj "available_reactions" (parseList parseJSON)
      field_19 <- optionalWith obj "background_custom_emoji_id" parseJSON
      field_20 <- optionalWith obj "profile_accent_color_id" parseInt64
      field_21 <- optionalWith obj "profile_background_custom_emoji_id" parseJSON
      field_22 <- optionalWith obj "emoji_status_custom_emoji_id" parseJSON
      field_23 <- optionalWith obj "emoji_status_expiration_date" parseInt64
      field_24 <- optionalWith obj "bio" parseJSON
      field_25 <- optionalTrueFlag obj "has_private_forwards"
      field_26 <- optionalTrueFlag obj "has_restricted_voice_and_video_messages"
      field_27 <- optionalTrueFlag obj "join_to_send_messages"
      field_28 <- optionalTrueFlag obj "join_by_request"
      field_29 <- optionalWith obj "description" parseJSON
      field_30 <- optionalWith obj "invite_link" parseJSON
      field_31 <- optionalWith obj "pinned_message" parseJSON
      field_32 <- optionalWith obj "permissions" parseJSON
      field_33 <- requiredWith obj "accepted_gift_types" parseJSON
      field_34 <- optionalTrueFlag obj "can_send_paid_media"
      field_35 <- optionalWith obj "slow_mode_delay" parseInt64
      field_36 <- optionalWith obj "unrestrict_boost_count" parseInt64
      field_37 <- optionalWith obj "message_auto_delete_time" parseInt64
      field_38 <- optionalTrueFlag obj "has_aggressive_anti_spam_enabled"
      field_39 <- optionalTrueFlag obj "has_hidden_members"
      field_40 <- optionalTrueFlag obj "has_protected_content"
      field_41 <- optionalTrueFlag obj "has_visible_history"
      field_42 <- optionalWith obj "sticker_set_name" parseJSON
      field_43 <- optionalTrueFlag obj "can_set_sticker_set"
      field_44 <- optionalWith obj "custom_emoji_sticker_set_name" parseJSON
      field_45 <- optionalWith obj "linked_chat_id" parseInt64
      field_46 <- optionalWith obj "location" parseJSON
      field_47 <- optionalWith obj "rating" parseJSON
      field_48 <- optionalWith obj "first_profile_audio" parseJSON
      field_49 <- optionalWith obj "unique_gift_colors" parseJSON
      field_50 <- optionalWith obj "paid_message_star_count" parseInt64
      field_51 <- optionalWith obj "guard_bot" parseJSON
      field_52 <- optionalWith obj "community" parseJSON
      pure
        MkChatFullInfo
          { id = field_0
          , type_ = field_1
          , title = field_2
          , username = field_3
          , first_name = field_4
          , last_name = field_5
          , is_forum = field_6
          , is_direct_messages = field_7
          , accent_color_id = field_8
          , max_reaction_count = field_9
          , photo = field_10
          , active_usernames = field_11
          , birthdate = field_12
          , business_intro = field_13
          , business_location = field_14
          , business_opening_hours = field_15
          , personal_chat = field_16
          , parent_chat = field_17
          , available_reactions = field_18
          , background_custom_emoji_id = field_19
          , profile_accent_color_id = field_20
          , profile_background_custom_emoji_id = field_21
          , emoji_status_custom_emoji_id = field_22
          , emoji_status_expiration_date = field_23
          , bio = field_24
          , has_private_forwards = field_25
          , has_restricted_voice_and_video_messages = field_26
          , join_to_send_messages = field_27
          , join_by_request = field_28
          , description = field_29
          , invite_link = field_30
          , pinned_message = field_31
          , permissions = field_32
          , accepted_gift_types = field_33
          , can_send_paid_media = field_34
          , slow_mode_delay = field_35
          , unrestrict_boost_count = field_36
          , message_auto_delete_time = field_37
          , has_aggressive_anti_spam_enabled = field_38
          , has_hidden_members = field_39
          , has_protected_content = field_40
          , has_visible_history = field_41
          , sticker_set_name = field_42
          , can_set_sticker_set = field_43
          , custom_emoji_sticker_set_name = field_44
          , linked_chat_id = field_45
          , location = field_46
          , rating = field_47
          , first_profile_audio = field_48
          , unique_gift_colors = field_49
          , paid_message_star_count = field_50
          , guard_bot = field_51
          , community = field_52
          }

instance ToJSON ChatFullInfo where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "id" x.id
          , jsonField "type" x.type_
          , jsonOptional "title" x.title
          , jsonOptional "username" x.username
          , jsonOptional "first_name" x.first_name
          , jsonOptional "last_name" x.last_name
          , jsonFlag "is_forum" x.is_forum
          , jsonFlag "is_direct_messages" x.is_direct_messages
          , jsonField "accent_color_id" x.accent_color_id
          , jsonField "max_reaction_count" x.max_reaction_count
          , jsonOptional "photo" x.photo
          , jsonOptional "active_usernames" x.active_usernames
          , jsonOptional "birthdate" x.birthdate
          , jsonOptional "business_intro" x.business_intro
          , jsonOptional "business_location" x.business_location
          , jsonOptional "business_opening_hours" x.business_opening_hours
          , jsonOptional "personal_chat" x.personal_chat
          , jsonOptional "parent_chat" x.parent_chat
          , jsonOptional "available_reactions" x.available_reactions
          , jsonOptional "background_custom_emoji_id" x.background_custom_emoji_id
          , jsonOptional "profile_accent_color_id" x.profile_accent_color_id
          , jsonOptional "profile_background_custom_emoji_id" x.profile_background_custom_emoji_id
          , jsonOptional "emoji_status_custom_emoji_id" x.emoji_status_custom_emoji_id
          , jsonOptional "emoji_status_expiration_date" x.emoji_status_expiration_date
          , jsonOptional "bio" x.bio
          , jsonFlag "has_private_forwards" x.has_private_forwards
          , jsonFlag "has_restricted_voice_and_video_messages" x.has_restricted_voice_and_video_messages
          , jsonFlag "join_to_send_messages" x.join_to_send_messages
          , jsonFlag "join_by_request" x.join_by_request
          , jsonOptional "description" x.description
          , jsonOptional "invite_link" x.invite_link
          , jsonOptional "pinned_message" x.pinned_message
          , jsonOptional "permissions" x.permissions
          , jsonField "accepted_gift_types" x.accepted_gift_types
          , jsonFlag "can_send_paid_media" x.can_send_paid_media
          , jsonOptional "slow_mode_delay" x.slow_mode_delay
          , jsonOptional "unrestrict_boost_count" x.unrestrict_boost_count
          , jsonOptional "message_auto_delete_time" x.message_auto_delete_time
          , jsonFlag "has_aggressive_anti_spam_enabled" x.has_aggressive_anti_spam_enabled
          , jsonFlag "has_hidden_members" x.has_hidden_members
          , jsonFlag "has_protected_content" x.has_protected_content
          , jsonFlag "has_visible_history" x.has_visible_history
          , jsonOptional "sticker_set_name" x.sticker_set_name
          , jsonFlag "can_set_sticker_set" x.can_set_sticker_set
          , jsonOptional "custom_emoji_sticker_set_name" x.custom_emoji_sticker_set_name
          , jsonOptional "linked_chat_id" x.linked_chat_id
          , jsonOptional "location" x.location
          , jsonOptional "rating" x.rating
          , jsonOptional "first_profile_audio" x.first_profile_audio
          , jsonOptional "unique_gift_colors" x.unique_gift_colors
          , jsonOptional "paid_message_star_count" x.paid_message_star_count
          , jsonOptional "guard_bot" x.guard_bot
          , jsonOptional "community" x.community
          ]
      )
  toEncoding = toEncoding . toJSON
