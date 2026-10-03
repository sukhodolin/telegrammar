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
module Telegram.Bot.Internal.Group.ChatShared
  ( ChatShared (..)
  , mkChatShared
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.PhotoSize (PhotoSize)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseInt64, parseList, requiredWith)

-- | This object contains information about a chat that was shared with the bot using a KeyboardButtonRequestChat button.
--
-- Source: <https://core.telegram.org/bots/api#chatshared>.
-- Codec directions: decoded from responses, encoded into requests.
data ChatShared = MkChatShared
  { -- | Identifier of the request
    --
    -- Wire key: @request_id@.
    request_id :: Int64
  , -- | Identifier of the shared chat. This number may have more than 32 significant bits and some programming languages may have difficulty\/silent defects in interpreting it. But it has at most 52 significant bits, so a 64-bit integer or double-precision float type are safe for storing this identifier. The bot may not have access to the chat and could be unable to use this identifier, unless the chat is already known to the bot by some other means.
    --
    -- Wire key: @chat_id@.
    chat_id :: Int64
  , -- | Optional. Title of the chat, if the title was requested by the bot
    --
    -- Wire key: @title@.
    -- Omitted from an encoded request when it is @Nothing@.
    title :: Maybe Text
  , -- | Optional. Username of the chat, if the username was requested by the bot and available
    --
    -- Wire key: @username@.
    -- Omitted from an encoded request when it is @Nothing@.
    username :: Maybe Text
  , -- | Optional. Available sizes of the chat photo, if the photo was requested by the bot
    --
    -- Wire key: @photo@.
    -- Omitted from an encoded request when it is @Nothing@.
    photo :: Maybe [PhotoSize]
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ChatShared' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkChatShared :: Int64 -> Int64 -> ChatShared
mkChatShared arg0 arg1 =
  MkChatShared
    { request_id = arg0
    , chat_id = arg1
    , title = Nothing
    , username = Nothing
    , photo = Nothing
    }

instance FromJSON ChatShared where
  parseJSON = withObject "ChatShared" $ \obj ->
    do
      field_0 <- requiredWith obj "request_id" parseInt64
      field_1 <- requiredWith obj "chat_id" parseInt64
      field_2 <- optionalWith obj "title" parseJSON
      field_3 <- optionalWith obj "username" parseJSON
      field_4 <- optionalWith obj "photo" (parseList parseJSON)
      pure
        MkChatShared
          { request_id = field_0
          , chat_id = field_1
          , title = field_2
          , username = field_3
          , photo = field_4
          }

instance ToJSON ChatShared where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "request_id" x.request_id
          , jsonField "chat_id" x.chat_id
          , jsonOptional "title" x.title
          , jsonOptional "username" x.username
          , jsonOptional "photo" x.photo
          ]
      )
  toEncoding = toEncoding . toJSON
