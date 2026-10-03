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
module Telegram.Bot.Methods.SendRichMessageDraft
  ( SendRichMessageDraft (..)
  , mkSendRichMessageDraft
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.InputRichMessage (InputRichMessage, planInputRichMessage)
import Telegram.Bot.Support (FileCapability (..), Method (..), TrueValue, encodeJson, planRequestBody, planned, plannedMaybe, restrictTo)

-- | Use this method to stream a partial rich message to a user while the message is being generated. Note that the streamed draft is ephemeral and acts as a temporary 30-second preview - once the output is finalized, you must call sendRichMessage with the complete message to persist it in the user\'s chat. Returns True on success.
--
-- Wire method spelling: @sendRichMessageDraft@.
--
-- Source: <https://core.telegram.org/bots/api#sendrichmessagedraft>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SendRichMessageDraft = MkSendRichMessageDraft
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
  , -- | The partial message to be streamed. Direct upload of new files and explicit upload of files by a URL isn\'t supported.
    --
    -- Wire key: @rich_message@.
    -- Always, the file sources reachable through this value are narrowed to @existing_file@.
    rich_message :: InputRichMessage
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

-- | Initialize a 'SendRichMessageDraft' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSendRichMessageDraft :: Int64 -> Int64 -> InputRichMessage -> SendRichMessageDraft
mkSendRichMessageDraft arg0 arg1 arg2 =
  MkSendRichMessageDraft
    { chat_id = arg0
    , message_thread_id = Nothing
    , draft_id = arg1
    , rich_message = arg2
    , can_stop = Nothing
    , keep_on_stop = Nothing
    , extra = mempty
    }

instance Method SendRichMessageDraft where
  type Result SendRichMessageDraft = TrueValue
  methodName _ = "sendRichMessageDraft"
  planRequest x =
    planRequestBody
      "sendRichMessageDraft"
      [ "chat_id"
      , "message_thread_id"
      , "draft_id"
      , "rich_message"
      , "can_stop"
      , "keep_on_stop"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          , plannedMaybe "message_thread_id" x.message_thread_id encodeJson
          , planned "draft_id" (encodeJson x.draft_id)
          , planned "rich_message" (restrictTo [ExistingFileCapability] (planInputRichMessage x.rich_message))
          , plannedMaybe "can_stop" x.can_stop encodeJson
          , plannedMaybe "keep_on_stop" x.keep_on_stop encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
