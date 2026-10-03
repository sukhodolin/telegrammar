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
module Telegram.Bot.Internal.Group.Update
  ( Update (..)
  , mkUpdate
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.BotSubscriptionUpdated (BotSubscriptionUpdated)
import Telegram.Bot.Internal.Group.BusinessConnection (BusinessConnection)
import Telegram.Bot.Internal.Group.BusinessMessagesDeleted (BusinessMessagesDeleted)
import Telegram.Bot.Internal.Group.CallbackQuery (CallbackQuery)
import Telegram.Bot.Internal.Group.ChatBoostRemoved (ChatBoostRemoved)
import Telegram.Bot.Internal.Group.ChatBoostUpdated (ChatBoostUpdated)
import Telegram.Bot.Internal.Group.ChatJoinRequest (ChatJoinRequest)
import Telegram.Bot.Internal.Group.ChatMemberUpdated (ChatMemberUpdated)
import Telegram.Bot.Internal.Group.ChecklistTasksAdded (Message)
import Telegram.Bot.Internal.Group.ChosenInlineResult (ChosenInlineResult)
import Telegram.Bot.Internal.Group.InlineQuery (InlineQuery)
import Telegram.Bot.Internal.Group.ManagedBotUpdated (ManagedBotUpdated)
import Telegram.Bot.Internal.Group.MessageGenerationStopped (MessageGenerationStopped)
import Telegram.Bot.Internal.Group.MessageReactionCountUpdated (MessageReactionCountUpdated)
import Telegram.Bot.Internal.Group.MessageReactionUpdated (MessageReactionUpdated)
import Telegram.Bot.Internal.Group.PaidMediaPurchased (PaidMediaPurchased)
import Telegram.Bot.Internal.Group.Poll (Poll)
import Telegram.Bot.Internal.Group.PollAnswer (PollAnswer)
import Telegram.Bot.Internal.Group.PreCheckoutQuery (PreCheckoutQuery)
import Telegram.Bot.Internal.Group.ShippingQuery (ShippingQuery)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseInt64, requiredWith)

-- | This object represents an incoming update.
-- At most one of the optional fields can be present in any given update.
--
-- Source: <https://core.telegram.org/bots/api#update>.
-- Codec directions: decoded from responses, encoded into requests.
data Update = MkUpdate
  { -- | The update\'s unique identifier. Update identifiers start from a certain positive number and increase sequentially. This identifier becomes especially handy if you\'re using webhooks, since it allows you to ignore repeated updates or to restore the correct update sequence, should they get out of order. If there are no new updates for at least a week, then identifier of the next update will be chosen randomly instead of sequentially.
    --
    -- Wire key: @update_id@.
    update_id :: Int64
  , -- | Optional. New incoming message of any kind - text, photo, sticker, etc.
    --
    -- Wire key: @message@.
    -- Omitted from an encoded request when it is @Nothing@.
    message :: Maybe Message
  , -- | Optional. New version of a message that is known to the bot and was edited. This update may at times be triggered by changes to message fields that are either unavailable or not actively used by your bot.
    --
    -- Wire key: @edited_message@.
    -- Omitted from an encoded request when it is @Nothing@.
    edited_message :: Maybe Message
  , -- | Optional. New incoming channel post of any kind - text, photo, sticker, etc.
    --
    -- Wire key: @channel_post@.
    -- Omitted from an encoded request when it is @Nothing@.
    channel_post :: Maybe Message
  , -- | Optional. New version of a channel post that is known to the bot and was edited. This update may at times be triggered by changes to message fields that are either unavailable or not actively used by your bot.
    --
    -- Wire key: @edited_channel_post@.
    -- Omitted from an encoded request when it is @Nothing@.
    edited_channel_post :: Maybe Message
  , -- | Optional. The bot was connected to or disconnected from a business account, or a user edited an existing connection with the bot
    --
    -- Wire key: @business_connection@.
    -- Omitted from an encoded request when it is @Nothing@.
    business_connection :: Maybe BusinessConnection
  , -- | Optional. New message from a connected business account
    --
    -- Wire key: @business_message@.
    -- Omitted from an encoded request when it is @Nothing@.
    business_message :: Maybe Message
  , -- | Optional. New version of a message from a connected business account
    --
    -- Wire key: @edited_business_message@.
    -- Omitted from an encoded request when it is @Nothing@.
    edited_business_message :: Maybe Message
  , -- | Optional. Messages were deleted from a connected business account
    --
    -- Wire key: @deleted_business_messages@.
    -- Omitted from an encoded request when it is @Nothing@.
    deleted_business_messages :: Maybe BusinessMessagesDeleted
  , -- | Optional. New guest message. The bot can use the field Message.guest_query_id and the method answerGuestQuery to send a message in response.
    --
    -- Wire key: @guest_message@.
    -- Omitted from an encoded request when it is @Nothing@.
    guest_message :: Maybe Message
  , -- | Optional. A reaction to a message was changed by a user. The bot must be an administrator in the chat and must explicitly specify \"message_reaction\" in the list of allowed_updates to receive these updates. The update isn\'t received for reactions set by bots.
    --
    -- Wire key: @message_reaction@.
    -- Omitted from an encoded request when it is @Nothing@.
    message_reaction :: Maybe MessageReactionUpdated
  , -- | Optional. Reactions to a message with anonymous reactions were changed. The bot must be an administrator in the chat and must explicitly specify \"message_reaction_count\" in the list of allowed_updates to receive these updates. The updates are grouped and can be sent with delay up to a few minutes.
    --
    -- Wire key: @message_reaction_count@.
    -- Omitted from an encoded request when it is @Nothing@.
    message_reaction_count :: Maybe MessageReactionCountUpdated
  , -- | Optional. New incoming inline query
    --
    -- Wire key: @inline_query@.
    -- Omitted from an encoded request when it is @Nothing@.
    inline_query :: Maybe InlineQuery
  , -- | Optional. The result of an inline query that was chosen by a user and sent to their chat partner. Please see our documentation on the feedback collecting for details on how to enable these updates for your bot.
    --
    -- Wire key: @chosen_inline_result@.
    -- Omitted from an encoded request when it is @Nothing@.
    chosen_inline_result :: Maybe ChosenInlineResult
  , -- | Optional. New incoming callback query
    --
    -- Wire key: @callback_query@.
    -- Omitted from an encoded request when it is @Nothing@.
    callback_query :: Maybe CallbackQuery
  , -- | Optional. New incoming shipping query. Only for invoices with flexible price.
    --
    -- Wire key: @shipping_query@.
    -- Omitted from an encoded request when it is @Nothing@.
    shipping_query :: Maybe ShippingQuery
  , -- | Optional. New incoming pre-checkout query. Contains full information about checkout.
    --
    -- Wire key: @pre_checkout_query@.
    -- Omitted from an encoded request when it is @Nothing@.
    pre_checkout_query :: Maybe PreCheckoutQuery
  , -- | Optional. A user purchased paid media with a non-empty payload sent by the bot in a non-channel chat
    --
    -- Wire key: @purchased_paid_media@.
    -- Omitted from an encoded request when it is @Nothing@.
    purchased_paid_media :: Maybe PaidMediaPurchased
  , -- | Optional. New poll state. Bots receive only updates about manually stopped polls and polls, which are sent by the bot.
    --
    -- Wire key: @poll@.
    -- Omitted from an encoded request when it is @Nothing@.
    poll :: Maybe Poll
  , -- | Optional. A user changed their answer in a non-anonymous poll. Bots receive new votes only in polls that were sent by the bot itself.
    --
    -- Wire key: @poll_answer@.
    -- Omitted from an encoded request when it is @Nothing@.
    poll_answer :: Maybe PollAnswer
  , -- | Optional. The bot\'s chat member status was updated in a chat. For private chats, this update is received only when the bot is blocked or unblocked by the user.
    --
    -- Wire key: @my_chat_member@.
    -- Omitted from an encoded request when it is @Nothing@.
    my_chat_member :: Maybe ChatMemberUpdated
  , -- | Optional. A chat member\'s status was updated in a chat. The bot must be an administrator in the chat and must explicitly specify \"chat_member\" in the list of allowed_updates to receive these updates.
    --
    -- Wire key: @chat_member@.
    -- Omitted from an encoded request when it is @Nothing@.
    chat_member :: Maybe ChatMemberUpdated
  , -- | Optional. A request to join the chat has been sent. The bot must have the can_invite_users administrator right in the chat to receive these updates.
    --
    -- Wire key: @chat_join_request@.
    -- Omitted from an encoded request when it is @Nothing@.
    chat_join_request :: Maybe ChatJoinRequest
  , -- | Optional. A chat boost was added or changed. The bot must be an administrator in the chat to receive these updates.
    --
    -- Wire key: @chat_boost@.
    -- Omitted from an encoded request when it is @Nothing@.
    chat_boost :: Maybe ChatBoostUpdated
  , -- | Optional. A boost was removed from a chat. The bot must be an administrator in the chat to receive these updates.
    --
    -- Wire key: @removed_chat_boost@.
    -- Omitted from an encoded request when it is @Nothing@.
    removed_chat_boost :: Maybe ChatBoostRemoved
  , -- | Optional. A new bot was created to be managed by the bot, or token or owner of a managed bot was changed
    --
    -- Wire key: @managed_bot@.
    -- Omitted from an encoded request when it is @Nothing@.
    managed_bot :: Maybe ManagedBotUpdated
  , -- | Optional. User payment subscription has changed
    --
    -- Wire key: @subscription@.
    -- Omitted from an encoded request when it is @Nothing@.
    subscription :: Maybe BotSubscriptionUpdated
  , -- | Optional. A user asked the bot to stop the generation of a message
    --
    -- Wire key: @stopped_message_generation@.
    -- Omitted from an encoded request when it is @Nothing@.
    stopped_message_generation :: Maybe MessageGenerationStopped
  }
  deriving stock (Eq, Show)

-- | Initialize a 'Update' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkUpdate :: Int64 -> Update
mkUpdate arg0 =
  MkUpdate
    { update_id = arg0
    , message = Nothing
    , edited_message = Nothing
    , channel_post = Nothing
    , edited_channel_post = Nothing
    , business_connection = Nothing
    , business_message = Nothing
    , edited_business_message = Nothing
    , deleted_business_messages = Nothing
    , guest_message = Nothing
    , message_reaction = Nothing
    , message_reaction_count = Nothing
    , inline_query = Nothing
    , chosen_inline_result = Nothing
    , callback_query = Nothing
    , shipping_query = Nothing
    , pre_checkout_query = Nothing
    , purchased_paid_media = Nothing
    , poll = Nothing
    , poll_answer = Nothing
    , my_chat_member = Nothing
    , chat_member = Nothing
    , chat_join_request = Nothing
    , chat_boost = Nothing
    , removed_chat_boost = Nothing
    , managed_bot = Nothing
    , subscription = Nothing
    , stopped_message_generation = Nothing
    }

instance FromJSON Update where
  parseJSON = withObject "Update" $ \obj ->
    do
      field_0 <- requiredWith obj "update_id" parseInt64
      field_1 <- optionalWith obj "message" parseJSON
      field_2 <- optionalWith obj "edited_message" parseJSON
      field_3 <- optionalWith obj "channel_post" parseJSON
      field_4 <- optionalWith obj "edited_channel_post" parseJSON
      field_5 <- optionalWith obj "business_connection" parseJSON
      field_6 <- optionalWith obj "business_message" parseJSON
      field_7 <- optionalWith obj "edited_business_message" parseJSON
      field_8 <- optionalWith obj "deleted_business_messages" parseJSON
      field_9 <- optionalWith obj "guest_message" parseJSON
      field_10 <- optionalWith obj "message_reaction" parseJSON
      field_11 <- optionalWith obj "message_reaction_count" parseJSON
      field_12 <- optionalWith obj "inline_query" parseJSON
      field_13 <- optionalWith obj "chosen_inline_result" parseJSON
      field_14 <- optionalWith obj "callback_query" parseJSON
      field_15 <- optionalWith obj "shipping_query" parseJSON
      field_16 <- optionalWith obj "pre_checkout_query" parseJSON
      field_17 <- optionalWith obj "purchased_paid_media" parseJSON
      field_18 <- optionalWith obj "poll" parseJSON
      field_19 <- optionalWith obj "poll_answer" parseJSON
      field_20 <- optionalWith obj "my_chat_member" parseJSON
      field_21 <- optionalWith obj "chat_member" parseJSON
      field_22 <- optionalWith obj "chat_join_request" parseJSON
      field_23 <- optionalWith obj "chat_boost" parseJSON
      field_24 <- optionalWith obj "removed_chat_boost" parseJSON
      field_25 <- optionalWith obj "managed_bot" parseJSON
      field_26 <- optionalWith obj "subscription" parseJSON
      field_27 <- optionalWith obj "stopped_message_generation" parseJSON
      pure
        MkUpdate
          { update_id = field_0
          , message = field_1
          , edited_message = field_2
          , channel_post = field_3
          , edited_channel_post = field_4
          , business_connection = field_5
          , business_message = field_6
          , edited_business_message = field_7
          , deleted_business_messages = field_8
          , guest_message = field_9
          , message_reaction = field_10
          , message_reaction_count = field_11
          , inline_query = field_12
          , chosen_inline_result = field_13
          , callback_query = field_14
          , shipping_query = field_15
          , pre_checkout_query = field_16
          , purchased_paid_media = field_17
          , poll = field_18
          , poll_answer = field_19
          , my_chat_member = field_20
          , chat_member = field_21
          , chat_join_request = field_22
          , chat_boost = field_23
          , removed_chat_boost = field_24
          , managed_bot = field_25
          , subscription = field_26
          , stopped_message_generation = field_27
          }

instance ToJSON Update where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "update_id" x.update_id
          , jsonOptional "message" x.message
          , jsonOptional "edited_message" x.edited_message
          , jsonOptional "channel_post" x.channel_post
          , jsonOptional "edited_channel_post" x.edited_channel_post
          , jsonOptional "business_connection" x.business_connection
          , jsonOptional "business_message" x.business_message
          , jsonOptional "edited_business_message" x.edited_business_message
          , jsonOptional "deleted_business_messages" x.deleted_business_messages
          , jsonOptional "guest_message" x.guest_message
          , jsonOptional "message_reaction" x.message_reaction
          , jsonOptional "message_reaction_count" x.message_reaction_count
          , jsonOptional "inline_query" x.inline_query
          , jsonOptional "chosen_inline_result" x.chosen_inline_result
          , jsonOptional "callback_query" x.callback_query
          , jsonOptional "shipping_query" x.shipping_query
          , jsonOptional "pre_checkout_query" x.pre_checkout_query
          , jsonOptional "purchased_paid_media" x.purchased_paid_media
          , jsonOptional "poll" x.poll
          , jsonOptional "poll_answer" x.poll_answer
          , jsonOptional "my_chat_member" x.my_chat_member
          , jsonOptional "chat_member" x.chat_member
          , jsonOptional "chat_join_request" x.chat_join_request
          , jsonOptional "chat_boost" x.chat_boost
          , jsonOptional "removed_chat_boost" x.removed_chat_boost
          , jsonOptional "managed_bot" x.managed_bot
          , jsonOptional "subscription" x.subscription
          , jsonOptional "stopped_message_generation" x.stopped_message_generation
          ]
      )
  toEncoding = toEncoding . toJSON
