{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

-- | The resilient update boundary.
--
-- Ordinary decoding of an @Update@ is strict and lives with the type.
-- This module adds the field-by-field decoder a client uses when it wants
-- the usable parts of a partially undecodable update, together with the
-- payload sum those parts carry.
--
-- Generated. Do not edit.
module Telegram.Bot.Updates
  ( DecodeError (..)
  , DecodedUpdate (..)
  , InvalidUpdateEnvelope (..)
  , UpdatePart (..)
  , UpdatePayload (..)
  , decodeUpdateBatch
  , decodeUpdateValue
  ) where

import Data.Aeson (FromJSON (..), Value)
import Data.Text (Text)
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
import Telegram.Bot.Support (DecodeError (..), DecodedUpdate (..), InvalidUpdateEnvelope (..), UpdateFieldDecoder, UpdatePart (..), decodeUpdateBatchWith, decodeUpdateWith, parseAtField)

-- | One decoded payload of an update.
--
-- There is one constructor for each optional payload field of the source
-- @Update@ record, in source order. A payload that fails to decode keeps
-- its field name, its raw value and its error instead of becoming one of
-- these.
data UpdatePayload
  = -- | The @message@ payload.
    UpdatePayloadMessage Message
  | -- | The @edited_message@ payload.
    UpdatePayloadEditedMessage Message
  | -- | The @channel_post@ payload.
    UpdatePayloadChannelPost Message
  | -- | The @edited_channel_post@ payload.
    UpdatePayloadEditedChannelPost Message
  | -- | The @business_connection@ payload.
    UpdatePayloadBusinessConnection BusinessConnection
  | -- | The @business_message@ payload.
    UpdatePayloadBusinessMessage Message
  | -- | The @edited_business_message@ payload.
    UpdatePayloadEditedBusinessMessage Message
  | -- | The @deleted_business_messages@ payload.
    UpdatePayloadDeletedBusinessMessages BusinessMessagesDeleted
  | -- | The @guest_message@ payload.
    UpdatePayloadGuestMessage Message
  | -- | The @message_reaction@ payload.
    UpdatePayloadMessageReaction MessageReactionUpdated
  | -- | The @message_reaction_count@ payload.
    UpdatePayloadMessageReactionCount MessageReactionCountUpdated
  | -- | The @inline_query@ payload.
    UpdatePayloadInlineQuery InlineQuery
  | -- | The @chosen_inline_result@ payload.
    UpdatePayloadChosenInlineResult ChosenInlineResult
  | -- | The @callback_query@ payload.
    UpdatePayloadCallbackQuery CallbackQuery
  | -- | The @shipping_query@ payload.
    UpdatePayloadShippingQuery ShippingQuery
  | -- | The @pre_checkout_query@ payload.
    UpdatePayloadPreCheckoutQuery PreCheckoutQuery
  | -- | The @purchased_paid_media@ payload.
    UpdatePayloadPurchasedPaidMedia PaidMediaPurchased
  | -- | The @poll@ payload.
    UpdatePayloadPoll Poll
  | -- | The @poll_answer@ payload.
    UpdatePayloadPollAnswer PollAnswer
  | -- | The @my_chat_member@ payload.
    UpdatePayloadMyChatMember ChatMemberUpdated
  | -- | The @chat_member@ payload.
    UpdatePayloadChatMember ChatMemberUpdated
  | -- | The @chat_join_request@ payload.
    UpdatePayloadChatJoinRequest ChatJoinRequest
  | -- | The @chat_boost@ payload.
    UpdatePayloadChatBoost ChatBoostUpdated
  | -- | The @removed_chat_boost@ payload.
    UpdatePayloadRemovedChatBoost ChatBoostRemoved
  | -- | The @managed_bot@ payload.
    UpdatePayloadManagedBot ManagedBotUpdated
  | -- | The @subscription@ payload.
    UpdatePayloadSubscription BotSubscriptionUpdated
  | -- | The @stopped_message_generation@ payload.
    UpdatePayloadStoppedMessageGeneration MessageGenerationStopped
  deriving stock (Eq, Show)

-- | Decode one update, keeping every part that decodes.
--
-- The identifier is read as a checked @Int64@; an update whose identifier
-- is missing or unparseable produces an 'InvalidUpdateEnvelope' holding
-- the raw value, never a default and never a neighbour's identifier.
-- Every present known payload decodes independently, an explicit null
-- counts as absent, and every other key except @update_id@ is preserved
-- as an unknown part in sorted key order.
decodeUpdateValue :: Value -> Either InvalidUpdateEnvelope (DecodedUpdate UpdatePayload)
decodeUpdateValue = decodeUpdateWith updatePayloadDecoders

-- | Decode the success array of a @getUpdates@ result, preserving every
-- position, valid or not.
decodeUpdateBatch :: Value -> Either DecodeError [Either InvalidUpdateEnvelope (DecodedUpdate UpdatePayload)]
decodeUpdateBatch = decodeUpdateBatchWith updatePayloadDecoders

-- | The known payload fields, in source order, each decoded at its own
-- field so a failure reports the field it came from.
updatePayloadDecoders :: [(Text, UpdateFieldDecoder UpdatePayload)]
updatePayloadDecoders =
  [ ("message", parseAtField "message" (fmap UpdatePayloadMessage . parseJSON))
  , ("edited_message", parseAtField "edited_message" (fmap UpdatePayloadEditedMessage . parseJSON))
  , ("channel_post", parseAtField "channel_post" (fmap UpdatePayloadChannelPost . parseJSON))
  , ("edited_channel_post", parseAtField "edited_channel_post" (fmap UpdatePayloadEditedChannelPost . parseJSON))
  , ("business_connection", parseAtField "business_connection" (fmap UpdatePayloadBusinessConnection . parseJSON))
  , ("business_message", parseAtField "business_message" (fmap UpdatePayloadBusinessMessage . parseJSON))
  , ("edited_business_message", parseAtField "edited_business_message" (fmap UpdatePayloadEditedBusinessMessage . parseJSON))
  , ("deleted_business_messages", parseAtField "deleted_business_messages" (fmap UpdatePayloadDeletedBusinessMessages . parseJSON))
  , ("guest_message", parseAtField "guest_message" (fmap UpdatePayloadGuestMessage . parseJSON))
  , ("message_reaction", parseAtField "message_reaction" (fmap UpdatePayloadMessageReaction . parseJSON))
  , ("message_reaction_count", parseAtField "message_reaction_count" (fmap UpdatePayloadMessageReactionCount . parseJSON))
  , ("inline_query", parseAtField "inline_query" (fmap UpdatePayloadInlineQuery . parseJSON))
  , ("chosen_inline_result", parseAtField "chosen_inline_result" (fmap UpdatePayloadChosenInlineResult . parseJSON))
  , ("callback_query", parseAtField "callback_query" (fmap UpdatePayloadCallbackQuery . parseJSON))
  , ("shipping_query", parseAtField "shipping_query" (fmap UpdatePayloadShippingQuery . parseJSON))
  , ("pre_checkout_query", parseAtField "pre_checkout_query" (fmap UpdatePayloadPreCheckoutQuery . parseJSON))
  , ("purchased_paid_media", parseAtField "purchased_paid_media" (fmap UpdatePayloadPurchasedPaidMedia . parseJSON))
  , ("poll", parseAtField "poll" (fmap UpdatePayloadPoll . parseJSON))
  , ("poll_answer", parseAtField "poll_answer" (fmap UpdatePayloadPollAnswer . parseJSON))
  , ("my_chat_member", parseAtField "my_chat_member" (fmap UpdatePayloadMyChatMember . parseJSON))
  , ("chat_member", parseAtField "chat_member" (fmap UpdatePayloadChatMember . parseJSON))
  , ("chat_join_request", parseAtField "chat_join_request" (fmap UpdatePayloadChatJoinRequest . parseJSON))
  , ("chat_boost", parseAtField "chat_boost" (fmap UpdatePayloadChatBoost . parseJSON))
  , ("removed_chat_boost", parseAtField "removed_chat_boost" (fmap UpdatePayloadRemovedChatBoost . parseJSON))
  , ("managed_bot", parseAtField "managed_bot" (fmap UpdatePayloadManagedBot . parseJSON))
  , ("subscription", parseAtField "subscription" (fmap UpdatePayloadSubscription . parseJSON))
  , ("stopped_message_generation", parseAtField "stopped_message_generation" (fmap UpdatePayloadStoppedMessageGeneration . parseJSON))
  ]
