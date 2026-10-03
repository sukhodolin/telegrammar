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
module Telegram.Bot.Internal.Group.InputTextMessageContent
  ( InputTextMessageContent (..)
  , mkInputTextMessageContent
  ) where

import Data.Aeson (ToJSON (..))
import Data.Text (Text)
import Telegram.Bot.Internal.Group.LinkPreviewOptions (LinkPreviewOptions)
import Telegram.Bot.Internal.Group.MessageEntity (MessageEntity)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional)

-- | Represents the content of a text message to be sent as the result of an inline query.
--
-- Source: <https://core.telegram.org/bots/api#inputtextmessagecontent>.
-- Codec directions: encoded into requests.
data InputTextMessageContent = MkInputTextMessageContent
  { -- | Text of the message to be sent, 1-4096 characters
    --
    -- Wire key: @message_text@.
    message_text :: Text
  , -- | Optional. Mode for parsing entities in the message text. See formatting options for more details.
    --
    -- Wire key: @parse_mode@.
    -- Omitted from an encoded request when it is @Nothing@.
    parse_mode :: Maybe Text
  , -- | Optional. List of special entities that appear in message text, which can be specified instead of parse_mode
    --
    -- Wire key: @entities@.
    -- Omitted from an encoded request when it is @Nothing@.
    entities :: Maybe [MessageEntity]
  , -- | Optional. Link preview generation options for the message
    --
    -- Wire key: @link_preview_options@.
    -- Omitted from an encoded request when it is @Nothing@.
    link_preview_options :: Maybe LinkPreviewOptions
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InputTextMessageContent' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputTextMessageContent :: Text -> InputTextMessageContent
mkInputTextMessageContent arg0 =
  MkInputTextMessageContent
    { message_text = arg0
    , parse_mode = Nothing
    , entities = Nothing
    , link_preview_options = Nothing
    }

instance ToJSON InputTextMessageContent where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "message_text" x.message_text
          , jsonOptional "parse_mode" x.parse_mode
          , jsonOptional "entities" x.entities
          , jsonOptional "link_preview_options" x.link_preview_options
          ]
      )
  toEncoding = toEncoding . toJSON
