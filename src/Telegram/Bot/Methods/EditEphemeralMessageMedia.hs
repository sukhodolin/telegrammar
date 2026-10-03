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
module Telegram.Bot.Methods.EditEphemeralMessageMedia
  ( EditEphemeralMessageMedia (..)
  , mkEditEphemeralMessageMedia
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.InlineKeyboardMarkup (InlineKeyboardMarkup)
import Telegram.Bot.Internal.Group.InputMedia (InputMedia, planInputMedia)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned, plannedMaybe)

-- | Use this method to edit the media of an ephemeral message. Note that it is not guaranteed that the user will receive the message edit event, especially if they are offline. On success, True is returned.
--
-- Wire method spelling: @editEphemeralMessageMedia@.
--
-- Source: <https://core.telegram.org/bots/api#editephemeralmessagemedia>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data EditEphemeralMessageMedia = MkEditEphemeralMessageMedia
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
  , -- | A JSON-serialized object for the new media content of the message
    --
    -- Wire key: @media@.
    media :: InputMedia
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

-- | Initialize a 'EditEphemeralMessageMedia' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkEditEphemeralMessageMedia :: IntegerOrString -> Int64 -> Int64 -> InputMedia -> EditEphemeralMessageMedia
mkEditEphemeralMessageMedia arg0 arg1 arg2 arg3 =
  MkEditEphemeralMessageMedia
    { chat_id = arg0
    , receiver_user_id = arg1
    , ephemeral_message_id = arg2
    , media = arg3
    , reply_markup = Nothing
    , extra = mempty
    }

instance Method EditEphemeralMessageMedia where
  type Result EditEphemeralMessageMedia = TrueValue
  methodName _ = "editEphemeralMessageMedia"
  planRequest x =
    planRequestBody
      "editEphemeralMessageMedia"
      [ "chat_id"
      , "receiver_user_id"
      , "ephemeral_message_id"
      , "media"
      , "reply_markup"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          , planned "receiver_user_id" (encodeJson x.receiver_user_id)
          , planned "ephemeral_message_id" (encodeJson x.ephemeral_message_id)
          , planned "media" (planInputMedia x.media)
          , plannedMaybe "reply_markup" x.reply_markup encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
