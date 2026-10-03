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
module Telegram.Bot.Methods.EditMessageText
  ( EditMessageText (..)
  , mkEditMessageText
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.InlineKeyboardMarkup (InlineKeyboardMarkup)
import Telegram.Bot.Internal.Group.InputRichMessage (InputRichMessage, planInputRichMessage)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Internal.Group.LinkPreviewOptions (LinkPreviewOptions)
import Telegram.Bot.Internal.Group.MessageEntity (MessageEntity)
import Telegram.Bot.Internal.Group.MessageOrTrue (MessageOrTrue)
import Telegram.Bot.Support (FileCapability (..), Method (..), encodeJson, isPresent, planList, planRequestBody, plannedMaybe, restrictWhen)

-- | Use this method to edit text, rich and game messages. On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned. Note that business messages that were not sent by the bot and do not contain an inline keyboard can only be edited within 48 hours from the time they were sent.
--
-- Wire method spelling: @editMessageText@.
--
-- Source: <https://core.telegram.org/bots/api#editmessagetext>.
-- Result: @MessageOrTrue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data EditMessageText = MkEditMessageText
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
  , -- | Link preview generation options for the message
    --
    -- Wire key: @link_preview_options@.
    -- Omitted from an encoded request when it is @Nothing@.
    link_preview_options :: Maybe LinkPreviewOptions
  , -- | New rich content of the message; required if text isn\'t specified. Direct upload of new files and explicit upload of files by a URL isn\'t supported when an inline message is edited.
    --
    -- Wire key: @rich_message@.
    -- Omitted from an encoded request when it is @Nothing@.
    -- When @inline_message_id@ is present, the file sources reachable through this value are narrowed to @existing_file@.
    rich_message :: Maybe InputRichMessage
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

-- | Initialize a 'EditMessageText' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkEditMessageText :: EditMessageText
mkEditMessageText =
  MkEditMessageText
    { business_connection_id = Nothing
    , chat_id = Nothing
    , message_id = Nothing
    , inline_message_id = Nothing
    , text = Nothing
    , parse_mode = Nothing
    , entities = Nothing
    , link_preview_options = Nothing
    , rich_message = Nothing
    , reply_markup = Nothing
    , extra = mempty
    }

instance Method EditMessageText where
  type Result EditMessageText = MessageOrTrue
  methodName _ = "editMessageText"
  planRequest x =
    planRequestBody
      "editMessageText"
      [ "business_connection_id"
      , "chat_id"
      , "message_id"
      , "inline_message_id"
      , "text"
      , "parse_mode"
      , "entities"
      , "link_preview_options"
      , "rich_message"
      , "reply_markup"
      ]
      ( concat
          [ plannedMaybe "business_connection_id" x.business_connection_id encodeJson
          , plannedMaybe "chat_id" x.chat_id encodeJson
          , plannedMaybe "message_id" x.message_id encodeJson
          , plannedMaybe "inline_message_id" x.inline_message_id encodeJson
          , plannedMaybe "text" x.text encodeJson
          , plannedMaybe "parse_mode" x.parse_mode encodeJson
          , plannedMaybe "entities" x.entities (planList encodeJson)
          , plannedMaybe "link_preview_options" x.link_preview_options encodeJson
          , plannedMaybe "rich_message" x.rich_message (\v_ -> restrictWhen (isPresent x.inline_message_id) [ExistingFileCapability] (planInputRichMessage v_))
          , plannedMaybe "reply_markup" x.reply_markup encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
