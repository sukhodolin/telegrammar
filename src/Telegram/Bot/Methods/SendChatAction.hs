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
module Telegram.Bot.Methods.SendChatAction
  ( SendChatAction (..)
  , mkSendChatAction
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned, plannedMaybe)

-- | Use this method when you need to tell the user that something is happening on the bot\'s side. The status is set for 5 seconds or less (when a message arrives from your bot, Telegram clients clear its typing status). Returns True on success.
-- We only recommend using this method when a response from the bot will take a noticeable amount of time to arrive.
--
-- Wire method spelling: @sendChatAction@.
--
-- Source: <https://core.telegram.org/bots/api#sendchataction>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SendChatAction = MkSendChatAction
  { -- | Unique identifier of the business connection on behalf of which the action will be sent
    --
    -- Wire key: @business_connection_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    business_connection_id :: Maybe Text
  , -- | Unique identifier for the target chat or username of the target bot or supergroup in the format \@username. Channel chats and channel direct messages chats aren\'t supported.
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | Unique identifier for the target message thread or topic of a forum; for supergroups and private chats of bots with forum topic mode enabled only
    --
    -- Wire key: @message_thread_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    message_thread_id :: Maybe Int64
  , -- | Type of action to broadcast. Choose one, depending on what the user is about to receive: typing for text messages, upload_photo for photos, record_video or upload_video for videos, record_voice or upload_voice for voice notes, upload_document for general files, choose_sticker for stickers, find_location for location data, record_video_note or upload_video_note for video notes.
    --
    -- Wire key: @action@.
    action :: Text
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SendChatAction' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSendChatAction :: IntegerOrString -> Text -> SendChatAction
mkSendChatAction arg0 arg1 =
  MkSendChatAction
    { business_connection_id = Nothing
    , chat_id = arg0
    , message_thread_id = Nothing
    , action = arg1
    , extra = mempty
    }

instance Method SendChatAction where
  type Result SendChatAction = TrueValue
  methodName _ = "sendChatAction"
  planRequest x =
    planRequestBody
      "sendChatAction"
      [ "business_connection_id"
      , "chat_id"
      , "message_thread_id"
      , "action"
      ]
      ( concat
          [ plannedMaybe "business_connection_id" x.business_connection_id encodeJson
          , planned "chat_id" (encodeJson x.chat_id)
          , plannedMaybe "message_thread_id" x.message_thread_id encodeJson
          , planned "action" (encodeJson x.action)
          ]
      )
      x.extra
  parseResult _ = parseJSON
