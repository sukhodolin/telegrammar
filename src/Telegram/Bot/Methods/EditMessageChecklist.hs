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
module Telegram.Bot.Methods.EditMessageChecklist
  ( EditMessageChecklist (..)
  , mkEditMessageChecklist
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.ChecklistTasksAdded (Message)
import Telegram.Bot.Internal.Group.InlineKeyboardMarkup (InlineKeyboardMarkup)
import Telegram.Bot.Internal.Group.InputChecklist (InputChecklist, planInputChecklist)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (Method (..), encodeJson, planRequestBody, planned, plannedMaybe)

-- | Use this method to edit a checklist on behalf of a connected business account. On success, the edited Message is returned.
--
-- Wire method spelling: @editMessageChecklist@.
--
-- Source: <https://core.telegram.org/bots/api#editmessagechecklist>.
-- Result: @Message@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data EditMessageChecklist = MkEditMessageChecklist
  { -- | Unique identifier of the business connection on behalf of which the message will be sent
    --
    -- Wire key: @business_connection_id@.
    business_connection_id :: Text
  , -- | Unique identifier for the target chat or username of the target bot in the format \@username
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | Unique identifier for the target message
    --
    -- Wire key: @message_id@.
    message_id :: Int64
  , -- | A JSON-serialized object for the new checklist
    --
    -- Wire key: @checklist@.
    checklist :: InputChecklist
  , -- | A JSON-serialized object for the new inline keyboard for the message
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

-- | Initialize a 'EditMessageChecklist' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkEditMessageChecklist :: Text -> IntegerOrString -> Int64 -> InputChecklist -> EditMessageChecklist
mkEditMessageChecklist arg0 arg1 arg2 arg3 =
  MkEditMessageChecklist
    { business_connection_id = arg0
    , chat_id = arg1
    , message_id = arg2
    , checklist = arg3
    , reply_markup = Nothing
    , extra = mempty
    }

instance Method EditMessageChecklist where
  type Result EditMessageChecklist = Message
  methodName _ = "editMessageChecklist"
  planRequest x =
    planRequestBody
      "editMessageChecklist"
      [ "business_connection_id"
      , "chat_id"
      , "message_id"
      , "checklist"
      , "reply_markup"
      ]
      ( concat
          [ planned "business_connection_id" (encodeJson x.business_connection_id)
          , planned "chat_id" (encodeJson x.chat_id)
          , planned "message_id" (encodeJson x.message_id)
          , planned "checklist" (planInputChecklist x.checklist)
          , plannedMaybe "reply_markup" x.reply_markup encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
