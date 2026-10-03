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
module Telegram.Bot.Methods.SendChecklist
  ( SendChecklist (..)
  , mkSendChecklist
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.ChecklistTasksAdded (Message)
import Telegram.Bot.Internal.Group.InlineKeyboardMarkup (InlineKeyboardMarkup)
import Telegram.Bot.Internal.Group.InputChecklist (InputChecklist, planInputChecklist)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Internal.Group.ReplyParameters (ReplyParameters)
import Telegram.Bot.Support (Method (..), encodeJson, planRequestBody, planned, plannedMaybe)

-- | Use this method to send a checklist on behalf of a connected business account. On success, the sent Message is returned.
--
-- Wire method spelling: @sendChecklist@.
--
-- Source: <https://core.telegram.org/bots/api#sendchecklist>.
-- Result: @Message@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SendChecklist = MkSendChecklist
  { -- | Unique identifier of the business connection on behalf of which the message will be sent
    --
    -- Wire key: @business_connection_id@.
    business_connection_id :: Text
  , -- | Unique identifier for the target chat or username of the target bot in the format \@username
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | A JSON-serialized object for the checklist to send
    --
    -- Wire key: @checklist@.
    checklist :: InputChecklist
  , -- | Sends the message silently. Users will receive a notification with no sound.
    --
    -- Wire key: @disable_notification@.
    -- Omitted from an encoded request when it is @Nothing@.
    disable_notification :: Maybe Bool
  , -- | Protects the contents of the sent message from forwarding and saving
    --
    -- Wire key: @protect_content@.
    -- Omitted from an encoded request when it is @Nothing@.
    protect_content :: Maybe Bool
  , -- | Unique identifier of the message effect to be added to the message
    --
    -- Wire key: @message_effect_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    message_effect_id :: Maybe Text
  , -- | A JSON-serialized object for description of the message to reply to
    --
    -- Wire key: @reply_parameters@.
    -- Omitted from an encoded request when it is @Nothing@.
    reply_parameters :: Maybe ReplyParameters
  , -- | A JSON-serialized object for an inline keyboard
    --
    -- Wire key: @reply_markup@.
    -- Omitted from an encoded request when it is @Nothing@.
    reply_markup :: Maybe InlineKeyboardMarkup
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SendChecklist' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSendChecklist :: Text -> IntegerOrString -> InputChecklist -> SendChecklist
mkSendChecklist arg0 arg1 arg2 =
  MkSendChecklist
    { business_connection_id = arg0
    , chat_id = arg1
    , checklist = arg2
    , disable_notification = Nothing
    , protect_content = Nothing
    , message_effect_id = Nothing
    , reply_parameters = Nothing
    , reply_markup = Nothing
    , extra = mempty
    }

instance Method SendChecklist where
  type Result SendChecklist = Message
  methodName _ = "sendChecklist"
  planRequest x =
    planRequestBody
      "sendChecklist"
      [ "business_connection_id"
      , "chat_id"
      , "checklist"
      , "disable_notification"
      , "protect_content"
      , "message_effect_id"
      , "reply_parameters"
      , "reply_markup"
      ]
      ( concat
          [ planned "business_connection_id" (encodeJson x.business_connection_id)
          , planned "chat_id" (encodeJson x.chat_id)
          , planned "checklist" (planInputChecklist x.checklist)
          , plannedMaybe "disable_notification" x.disable_notification encodeJson
          , plannedMaybe "protect_content" x.protect_content encodeJson
          , plannedMaybe "message_effect_id" x.message_effect_id encodeJson
          , plannedMaybe "reply_parameters" x.reply_parameters encodeJson
          , plannedMaybe "reply_markup" x.reply_markup encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
