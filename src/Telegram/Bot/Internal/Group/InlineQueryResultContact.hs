{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE OverloadedStrings #-}

-- | Internal: one dependency component of the type graph.
--
-- This module is an implementation detail of the generated package. Its
-- declarations are re-exported by the aggregate types façade, which is
-- where consumers import them from. The module name is a deterministic
-- identifier taken from the component's smallest declaration name, not a
-- semantic family name, and it can change when the source graph changes.
--
-- Generated. Do not edit.
module Telegram.Bot.Internal.Group.InlineQueryResultContact
  ( InlineQueryResultContact (..)
  , mkInlineQueryResultContact
  , planInlineQueryResultContact
  ) where

import Data.Aeson (Value (..))
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.InlineKeyboardMarkup (InlineKeyboardMarkup)
import Telegram.Bot.Internal.Group.InputMessageContent (InputMessageContent, planInputMessageContent)
import Telegram.Bot.Support (FieldPlanner, encodeJson, planRecord, planned, plannedLiteral, plannedMaybe)

-- | Represents a contact with a phone number. By default, this contact will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the contact.
--
-- Source: <https://core.telegram.org/bots/api#inlinequeryresultcontact>.
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
--
-- Supplied constants: @type@ = @"contact"@.
data InlineQueryResultContact = MkInlineQueryResultContact
  { -- | Unique identifier for this result, 1-64 Bytes
    --
    -- Wire key: @id@.
    id :: Text
  , -- | Contact\'s phone number
    --
    -- Wire key: @phone_number@.
    phone_number :: Text
  , -- | Contact\'s first name
    --
    -- Wire key: @first_name@.
    first_name :: Text
  , -- | Optional. Contact\'s last name
    --
    -- Wire key: @last_name@.
    -- Omitted from an encoded request when it is @Nothing@.
    last_name :: Maybe Text
  , -- | Optional. Additional data about the contact in the form of a vCard, 0-2048 bytes
    --
    -- Wire key: @vcard@.
    -- Omitted from an encoded request when it is @Nothing@.
    vcard :: Maybe Text
  , -- | Optional. Inline keyboard attached to the message
    --
    -- Wire key: @reply_markup@.
    -- Omitted from an encoded request when it is @Nothing@.
    reply_markup :: Maybe InlineKeyboardMarkup
  , -- | Optional. Content of the message to be sent instead of the contact
    --
    -- Wire key: @input_message_content@.
    -- Omitted from an encoded request when it is @Nothing@.
    input_message_content :: Maybe InputMessageContent
  , -- | Optional. Url of the thumbnail for the result
    --
    -- Wire key: @thumbnail_url@.
    -- Omitted from an encoded request when it is @Nothing@.
    thumbnail_url :: Maybe Text
  , -- | Optional. Thumbnail width
    --
    -- Wire key: @thumbnail_width@.
    -- Omitted from an encoded request when it is @Nothing@.
    thumbnail_width :: Maybe Int64
  , -- | Optional. Thumbnail height
    --
    -- Wire key: @thumbnail_height@.
    -- Omitted from an encoded request when it is @Nothing@.
    thumbnail_height :: Maybe Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InlineQueryResultContact' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInlineQueryResultContact :: Text -> Text -> Text -> InlineQueryResultContact
mkInlineQueryResultContact arg0 arg1 arg2 =
  MkInlineQueryResultContact
    { id = arg0
    , phone_number = arg1
    , first_name = arg2
    , last_name = Nothing
    , vcard = Nothing
    , reply_markup = Nothing
    , input_message_content = Nothing
    , thumbnail_url = Nothing
    , thumbnail_width = Nothing
    , thumbnail_height = Nothing
    }

-- | Plan a 'InlineQueryResultContact' as part of an outgoing request.
--
-- The traversal is checked: it validates every file source against
-- the capabilities its occurrence permits and allocates one
-- attachment part per upload, in source field order.
planInlineQueryResultContact :: InlineQueryResultContact -> FieldPlanner
planInlineQueryResultContact x =
  planRecord
    ( concat
        [ plannedLiteral "type" (String "contact")
        , planned "id" (encodeJson x.id)
        , planned "phone_number" (encodeJson x.phone_number)
        , planned "first_name" (encodeJson x.first_name)
        , plannedMaybe "last_name" x.last_name encodeJson
        , plannedMaybe "vcard" x.vcard encodeJson
        , plannedMaybe "reply_markup" x.reply_markup encodeJson
        , plannedMaybe "input_message_content" x.input_message_content planInputMessageContent
        , plannedMaybe "thumbnail_url" x.thumbnail_url encodeJson
        , plannedMaybe "thumbnail_width" x.thumbnail_width encodeJson
        , plannedMaybe "thumbnail_height" x.thumbnail_height encodeJson
        ]
    )
