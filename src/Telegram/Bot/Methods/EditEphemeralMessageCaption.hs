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
module Telegram.Bot.Methods.EditEphemeralMessageCaption
  ( EditEphemeralMessageCaption (..)
  , mkEditEphemeralMessageCaption
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.InlineKeyboardMarkup (InlineKeyboardMarkup)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Internal.Group.MessageEntity (MessageEntity)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planList, planRequestBody, planned, plannedMaybe)

-- | Use this method to edit the caption of an ephemeral message. Note that it is not guaranteed that the user will receive the message edit event, especially if they are offline. On success, True is returned.
--
-- Wire method spelling: @editEphemeralMessageCaption@.
--
-- Source: <https://core.telegram.org/bots/api#editephemeralmessagecaption>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data EditEphemeralMessageCaption = MkEditEphemeralMessageCaption
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
  , -- | New caption of the message, 0-1024 characters after entities parsing
    --
    -- Wire key: @caption@.
    -- Omitted from an encoded request when it is @Nothing@.
    caption :: Maybe Text
  , -- | Mode for parsing entities in the message caption. See formatting options for more details.
    --
    -- Wire key: @parse_mode@.
    -- Omitted from an encoded request when it is @Nothing@.
    parse_mode :: Maybe Text
  , -- | A JSON-serialized list of special entities that appear in the caption, which can be specified instead of parse_mode
    --
    -- Wire key: @caption_entities@.
    -- Omitted from an encoded request when it is @Nothing@.
    caption_entities :: Maybe [MessageEntity]
  , -- | Pass True if the caption must be shown above the message media. Supported only for animation, photo and video messages.
    --
    -- Wire key: @show_caption_above_media@.
    -- Omitted from an encoded request when it is @Nothing@.
    show_caption_above_media :: Maybe Bool
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

-- | Initialize a 'EditEphemeralMessageCaption' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkEditEphemeralMessageCaption :: IntegerOrString -> Int64 -> Int64 -> EditEphemeralMessageCaption
mkEditEphemeralMessageCaption arg0 arg1 arg2 =
  MkEditEphemeralMessageCaption
    { chat_id = arg0
    , receiver_user_id = arg1
    , ephemeral_message_id = arg2
    , caption = Nothing
    , parse_mode = Nothing
    , caption_entities = Nothing
    , show_caption_above_media = Nothing
    , reply_markup = Nothing
    , extra = mempty
    }

instance Method EditEphemeralMessageCaption where
  type Result EditEphemeralMessageCaption = TrueValue
  methodName _ = "editEphemeralMessageCaption"
  planRequest x =
    planRequestBody
      "editEphemeralMessageCaption"
      [ "chat_id"
      , "receiver_user_id"
      , "ephemeral_message_id"
      , "caption"
      , "parse_mode"
      , "caption_entities"
      , "show_caption_above_media"
      , "reply_markup"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          , planned "receiver_user_id" (encodeJson x.receiver_user_id)
          , planned "ephemeral_message_id" (encodeJson x.ephemeral_message_id)
          , plannedMaybe "caption" x.caption encodeJson
          , plannedMaybe "parse_mode" x.parse_mode encodeJson
          , plannedMaybe "caption_entities" x.caption_entities (planList encodeJson)
          , plannedMaybe "show_caption_above_media" x.show_caption_above_media encodeJson
          , plannedMaybe "reply_markup" x.reply_markup encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
