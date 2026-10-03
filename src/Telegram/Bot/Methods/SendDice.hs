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
module Telegram.Bot.Methods.SendDice
  ( SendDice (..)
  , mkSendDice
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.ChecklistTasksAdded (Message)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Internal.Group.ReplyMarkup (ReplyMarkup)
import Telegram.Bot.Internal.Group.ReplyParameters (ReplyParameters)
import Telegram.Bot.Internal.Group.SuggestedPostParameters (SuggestedPostParameters)
import Telegram.Bot.Support (Method (..), encodeJson, planRequestBody, planned, plannedMaybe)

-- | Use this method to send an animated emoji that will display a random value. On success, the sent Message is returned.
--
-- Wire method spelling: @sendDice@.
--
-- Source: <https://core.telegram.org/bots/api#senddice>.
-- Result: @Message@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SendDice = MkSendDice
  { -- | Unique identifier of the business connection on behalf of which the message will be sent
    --
    -- Wire key: @business_connection_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    business_connection_id :: Maybe Text
  , -- | Unique identifier for the target chat or username of the target bot, supergroup or channel in the format \@username
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | Unique identifier for the target message thread (topic) of a forum; for forum supergroups and private chats of bots with forum topic mode enabled only
    --
    -- Wire key: @message_thread_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    message_thread_id :: Maybe Int64
  , -- | Identifier of the direct messages topic to which the message will be sent; required if the message is sent to a direct messages chat
    --
    -- Wire key: @direct_messages_topic_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    direct_messages_topic_id :: Maybe Int64
  , -- | Emoji on which the dice throw animation is based. Currently, must be one of \"🎲\", \"🎯\", \"🏀\", \"⚽\", \"🎳\", or \"🎰\". Dice can have values 1-6 for \"🎲\", \"🎯\" and \"🎳\", values 1-5 for \"🏀\" and \"⚽\", and values 1-64 for \"🎰\". Defaults to \"🎲\".
    --
    -- Wire key: @emoji@.
    -- Omitted from an encoded request when it is @Nothing@.
    emoji :: Maybe Text
  , -- | Sends the message silently. Users will receive a notification with no sound.
    --
    -- Wire key: @disable_notification@.
    -- Omitted from an encoded request when it is @Nothing@.
    disable_notification :: Maybe Bool
  , -- | Protects the contents of the sent message from forwarding
    --
    -- Wire key: @protect_content@.
    -- Omitted from an encoded request when it is @Nothing@.
    protect_content :: Maybe Bool
  , -- | Pass True to allow up to 1000 messages per second, ignoring broadcasting limits for a fee of 0.1 Telegram Stars per message. The relevant Stars will be withdrawn from the bot\'s balance.
    --
    -- Wire key: @allow_paid_broadcast@.
    -- Omitted from an encoded request when it is @Nothing@.
    allow_paid_broadcast :: Maybe Bool
  , -- | Unique identifier of the message effect to be added to the message; for private chats only
    --
    -- Wire key: @message_effect_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    message_effect_id :: Maybe Text
  , -- | A JSON-serialized object containing the parameters of the suggested post to send; for direct messages chats only. If the message is sent as a reply to another suggested post, then that suggested post is automatically declined.
    --
    -- Wire key: @suggested_post_parameters@.
    -- Omitted from an encoded request when it is @Nothing@.
    suggested_post_parameters :: Maybe SuggestedPostParameters
  , -- | Description of the message to reply to
    --
    -- Wire key: @reply_parameters@.
    -- Omitted from an encoded request when it is @Nothing@.
    reply_parameters :: Maybe ReplyParameters
  , -- | Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove a reply keyboard or to force a reply from the user.
    --
    -- Wire key: @reply_markup@.
    -- Omitted from an encoded request when it is @Nothing@.
    reply_markup :: Maybe ReplyMarkup
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SendDice' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSendDice :: IntegerOrString -> SendDice
mkSendDice arg0 =
  MkSendDice
    { business_connection_id = Nothing
    , chat_id = arg0
    , message_thread_id = Nothing
    , direct_messages_topic_id = Nothing
    , emoji = Nothing
    , disable_notification = Nothing
    , protect_content = Nothing
    , allow_paid_broadcast = Nothing
    , message_effect_id = Nothing
    , suggested_post_parameters = Nothing
    , reply_parameters = Nothing
    , reply_markup = Nothing
    , extra = mempty
    }

instance Method SendDice where
  type Result SendDice = Message
  methodName _ = "sendDice"
  planRequest x =
    planRequestBody
      "sendDice"
      [ "business_connection_id"
      , "chat_id"
      , "message_thread_id"
      , "direct_messages_topic_id"
      , "emoji"
      , "disable_notification"
      , "protect_content"
      , "allow_paid_broadcast"
      , "message_effect_id"
      , "suggested_post_parameters"
      , "reply_parameters"
      , "reply_markup"
      ]
      ( concat
          [ plannedMaybe "business_connection_id" x.business_connection_id encodeJson
          , planned "chat_id" (encodeJson x.chat_id)
          , plannedMaybe "message_thread_id" x.message_thread_id encodeJson
          , plannedMaybe "direct_messages_topic_id" x.direct_messages_topic_id encodeJson
          , plannedMaybe "emoji" x.emoji encodeJson
          , plannedMaybe "disable_notification" x.disable_notification encodeJson
          , plannedMaybe "protect_content" x.protect_content encodeJson
          , plannedMaybe "allow_paid_broadcast" x.allow_paid_broadcast encodeJson
          , plannedMaybe "message_effect_id" x.message_effect_id encodeJson
          , plannedMaybe "suggested_post_parameters" x.suggested_post_parameters encodeJson
          , plannedMaybe "reply_parameters" x.reply_parameters encodeJson
          , plannedMaybe "reply_markup" x.reply_markup encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
