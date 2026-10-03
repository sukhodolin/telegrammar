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
module Telegram.Bot.Methods.EditEphemeralMessageReplyMarkup
  ( EditEphemeralMessageReplyMarkup (..)
  , mkEditEphemeralMessageReplyMarkup
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.InlineKeyboardMarkup (InlineKeyboardMarkup)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned, plannedMaybe)

-- | Use this method to edit only the reply markup of an ephemeral message. Note that it is not guaranteed that the user will receive the message edit event, especially if they are offline. On success, True is returned.
--
-- Wire method spelling: @editEphemeralMessageReplyMarkup@.
--
-- Source: <https://core.telegram.org/bots/api#editephemeralmessagereplymarkup>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data EditEphemeralMessageReplyMarkup = MkEditEphemeralMessageReplyMarkup
  { -- | Unique identifier for the target chat or username of the target supergroup in the format \@username
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | Identifier of the user who received the message
    --
    -- Wire key: @receiver_user_id@.
    receiver_user_id :: Int64
  , -- | Identifier of the ephemeral message to edit
    --
    -- Wire key: @ephemeral_message_id@.
    ephemeral_message_id :: Int64
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

-- | Initialize a 'EditEphemeralMessageReplyMarkup' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkEditEphemeralMessageReplyMarkup :: IntegerOrString -> Int64 -> Int64 -> EditEphemeralMessageReplyMarkup
mkEditEphemeralMessageReplyMarkup arg0 arg1 arg2 =
  MkEditEphemeralMessageReplyMarkup
    { chat_id = arg0
    , receiver_user_id = arg1
    , ephemeral_message_id = arg2
    , reply_markup = Nothing
    , extra = mempty
    }

instance Method EditEphemeralMessageReplyMarkup where
  type Result EditEphemeralMessageReplyMarkup = TrueValue
  methodName _ = "editEphemeralMessageReplyMarkup"
  planRequest x =
    planRequestBody
      "editEphemeralMessageReplyMarkup"
      [ "chat_id"
      , "receiver_user_id"
      , "ephemeral_message_id"
      , "reply_markup"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          , planned "receiver_user_id" (encodeJson x.receiver_user_id)
          , planned "ephemeral_message_id" (encodeJson x.ephemeral_message_id)
          , plannedMaybe "reply_markup" x.reply_markup encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
