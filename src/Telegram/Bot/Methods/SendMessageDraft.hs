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
module Telegram.Bot.Methods.SendMessageDraft
  ( SendMessageDraft (..)
  , mkSendMessageDraft
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.MessageEntity (MessageEntity)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planList, planRequestBody, planned, plannedMaybe)

-- | Use this method to stream a partial message to a user while the message is being generated. Note that the streamed draft is ephemeral and acts as a temporary 30-second preview - once the output is finalized, you must call sendMessage with the complete message to persist it in the user\'s chat. Returns True on success.
--
-- Wire method spelling: @sendMessageDraft@.
--
-- Source: <https://core.telegram.org/bots/api#sendmessagedraft>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SendMessageDraft = MkSendMessageDraft
  { -- | Unique identifier for the target private chat
    --
    -- Wire key: @chat_id@.
    chat_id :: Int64
  , -- | Unique identifier for the target message thread
    --
    -- Wire key: @message_thread_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    message_thread_id :: Maybe Int64
  , -- | Unique identifier of the message draft; must be non-zero. Changes to drafts with the same identifier are animated. Otherwise, the draft is replaced without animation.
    --
    -- Wire key: @draft_id@.
    draft_id :: Int64
  , -- | Text of the message to be sent, 0-4096 characters after entities parsing. Pass an empty text to show a \"Thinking...\" placeholder.
    --
    -- Wire key: @text@.
    -- Omitted from an encoded request when it is @Nothing@.
    text :: Maybe Text
  , -- | Mode for parsing entities in the message text. See formatting options for more details.
    --
    -- Wire key: @parse_mode@.
    -- Omitted from an encoded request when it is @Nothing@.
    parse_mode :: Maybe Text
  , -- | A JSON-serialized list of special entities that appear in message text, which can be specified instead of parse_mode
    --
    -- Wire key: @entities@.
    -- Omitted from an encoded request when it is @Nothing@.
    entities :: Maybe [MessageEntity]
  , -- | Pass True to show the user a button to stop further drafts. The bot will receive an Update \"stopped_message_generation\" if the user presses the button.
    --
    -- Wire key: @can_stop@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_stop :: Maybe Bool
  , -- | Pass True to keep the draft in the chat when the button is pressed. The draft will still disappear after a short time or if the bot sends a message. To fully preserve the partial draft, the bot should send it as a new message.
    --
    -- Wire key: @keep_on_stop@.
    -- Omitted from an encoded request when it is @Nothing@.
    keep_on_stop :: Maybe Bool
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SendMessageDraft' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSendMessageDraft :: Int64 -> Int64 -> SendMessageDraft
mkSendMessageDraft arg0 arg1 =
  MkSendMessageDraft
    { chat_id = arg0
    , message_thread_id = Nothing
    , draft_id = arg1
    , text = Nothing
    , parse_mode = Nothing
    , entities = Nothing
    , can_stop = Nothing
    , keep_on_stop = Nothing
    , extra = mempty
    }

instance Method SendMessageDraft where
  type Result SendMessageDraft = TrueValue
  methodName _ = "sendMessageDraft"
  planRequest x =
    planRequestBody
      "sendMessageDraft"
      [ "chat_id"
      , "message_thread_id"
      , "draft_id"
      , "text"
      , "parse_mode"
      , "entities"
      , "can_stop"
      , "keep_on_stop"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          , plannedMaybe "message_thread_id" x.message_thread_id encodeJson
          , planned "draft_id" (encodeJson x.draft_id)
          , plannedMaybe "text" x.text encodeJson
          , plannedMaybe "parse_mode" x.parse_mode encodeJson
          , plannedMaybe "entities" x.entities (planList encodeJson)
          , plannedMaybe "can_stop" x.can_stop encodeJson
          , plannedMaybe "keep_on_stop" x.keep_on_stop encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
