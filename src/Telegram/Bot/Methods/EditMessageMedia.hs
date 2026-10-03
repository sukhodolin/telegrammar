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
module Telegram.Bot.Methods.EditMessageMedia
  ( EditMessageMedia (..)
  , mkEditMessageMedia
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.InlineKeyboardMarkup (InlineKeyboardMarkup)
import Telegram.Bot.Internal.Group.InputMedia (InputMedia, planInputMedia)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Internal.Group.MessageOrTrue (MessageOrTrue)
import Telegram.Bot.Support (FileCapability (..), Method (..), encodeJson, isPresent, planRequestBody, planned, plannedMaybe, restrictWhen)

-- | Use this method to edit animation, audio, document, live photo, photo, or video messages, or to replace a text or a rich message with a media. If a message is part of a message album, then it can be edited only to an audio for audio albums, only to a document for document albums and to a photo, a live photo, or a video otherwise. When an inline message is edited, a new file can\'t be uploaded; use a previously uploaded file via its file_id or specify a URL. On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned. Note that business messages that were not sent by the bot and do not contain an inline keyboard can only be edited within 48 hours from the time they were sent.
--
-- Wire method spelling: @editMessageMedia@.
--
-- Source: <https://core.telegram.org/bots/api#editmessagemedia>.
-- Result: @MessageOrTrue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data EditMessageMedia = MkEditMessageMedia
  { -- | Unique identifier of the business connection on behalf of which the message to be edited was sent
    --
    -- Wire key: @business_connection_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    business_connection_id :: Maybe Text
  , -- | Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target bot, supergroup or channel in the format \@username.
    --
    -- Wire key: @chat_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    chat_id :: Maybe IntegerOrString
  , -- | Required if inline_message_id is not specified. Identifier of the message to edit.
    --
    -- Wire key: @message_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    message_id :: Maybe Int64
  , -- | Required if chat_id and message_id are not specified. Identifier of the inline message.
    --
    -- Wire key: @inline_message_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    inline_message_id :: Maybe Text
  , -- | A JSON-serialized object for the new media content of the message
    --
    -- Wire key: @media@.
    -- When @inline_message_id@ is present, the file sources reachable through this value are narrowed to @existing_file@, @http_url@.
    media :: InputMedia
  , -- | A JSON-serialized object for a new inline keyboard
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

-- | Initialize a 'EditMessageMedia' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkEditMessageMedia :: InputMedia -> EditMessageMedia
mkEditMessageMedia arg0 =
  MkEditMessageMedia
    { business_connection_id = Nothing
    , chat_id = Nothing
    , message_id = Nothing
    , inline_message_id = Nothing
    , media = arg0
    , reply_markup = Nothing
    , extra = mempty
    }

instance Method EditMessageMedia where
  type Result EditMessageMedia = MessageOrTrue
  methodName _ = "editMessageMedia"
  planRequest x =
    planRequestBody
      "editMessageMedia"
      [ "business_connection_id"
      , "chat_id"
      , "message_id"
      , "inline_message_id"
      , "media"
      , "reply_markup"
      ]
      ( concat
          [ plannedMaybe "business_connection_id" x.business_connection_id encodeJson
          , plannedMaybe "chat_id" x.chat_id encodeJson
          , plannedMaybe "message_id" x.message_id encodeJson
          , plannedMaybe "inline_message_id" x.inline_message_id encodeJson
          , planned "media" (restrictWhen (isPresent x.inline_message_id) [ExistingFileCapability, HttpUrlCapability] (planInputMedia x.media))
          , plannedMaybe "reply_markup" x.reply_markup encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
