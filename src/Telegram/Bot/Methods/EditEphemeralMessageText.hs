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
module Telegram.Bot.Methods.EditEphemeralMessageText
  ( EditEphemeralMessageText (..)
  , mkEditEphemeralMessageText
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.InlineKeyboardMarkup (InlineKeyboardMarkup)
import Telegram.Bot.Internal.Group.InputRichMessage (InputRichMessage, planInputRichMessage)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Internal.Group.LinkPreviewOptions (LinkPreviewOptions)
import Telegram.Bot.Internal.Group.MessageEntity (MessageEntity)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planList, planRequestBody, planned, plannedMaybe)

-- | Use this method to edit an ephemeral text or rich message. Note that it is not guaranteed that the user will receive the message edit event, especially if they are offline. On success, True is returned.
--
-- Wire method spelling: @editEphemeralMessageText@.
--
-- Source: <https://core.telegram.org/bots/api#editephemeralmessagetext>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data EditEphemeralMessageText = MkEditEphemeralMessageText
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
  , -- | New text of the message, 1-4096 characters after entity parsing; required if rich_message isn\'t specified
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
  , -- | New rich content of the message; required if text isn\'t specified
    --
    -- Wire key: @rich_message@.
    -- Omitted from an encoded request when it is @Nothing@.
    rich_message :: Maybe InputRichMessage
  , -- | Link preview generation options for the message
    --
    -- Wire key: @link_preview_options@.
    -- Omitted from an encoded request when it is @Nothing@.
    link_preview_options :: Maybe LinkPreviewOptions
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

-- | Initialize a 'EditEphemeralMessageText' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkEditEphemeralMessageText :: IntegerOrString -> Int64 -> Int64 -> EditEphemeralMessageText
mkEditEphemeralMessageText arg0 arg1 arg2 =
  MkEditEphemeralMessageText
    { chat_id = arg0
    , receiver_user_id = arg1
    , ephemeral_message_id = arg2
    , text = Nothing
    , parse_mode = Nothing
    , entities = Nothing
    , rich_message = Nothing
    , link_preview_options = Nothing
    , reply_markup = Nothing
    , extra = mempty
    }

instance Method EditEphemeralMessageText where
  type Result EditEphemeralMessageText = TrueValue
  methodName _ = "editEphemeralMessageText"
  planRequest x =
    planRequestBody
      "editEphemeralMessageText"
      [ "chat_id"
      , "receiver_user_id"
      , "ephemeral_message_id"
      , "text"
      , "parse_mode"
      , "entities"
      , "rich_message"
      , "link_preview_options"
      , "reply_markup"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          , planned "receiver_user_id" (encodeJson x.receiver_user_id)
          , planned "ephemeral_message_id" (encodeJson x.ephemeral_message_id)
          , plannedMaybe "text" x.text encodeJson
          , plannedMaybe "parse_mode" x.parse_mode encodeJson
          , plannedMaybe "entities" x.entities (planList encodeJson)
          , plannedMaybe "rich_message" x.rich_message planInputRichMessage
          , plannedMaybe "link_preview_options" x.link_preview_options encodeJson
          , plannedMaybe "reply_markup" x.reply_markup encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
