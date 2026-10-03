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
module Telegram.Bot.Internal.Group.Chat
  ( Chat (..)
  , mkChat
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonFlag, jsonObject, jsonOptional, optionalTrueFlag, optionalWith, parseInt64, requiredWith)

-- | This object represents a chat.
--
-- Source: <https://core.telegram.org/bots/api#chat>.
-- Codec directions: decoded from responses, encoded into requests.
data Chat = MkChat
  { -- | Unique identifier for this chat. This number may have more than 32 significant bits and some programming languages may have difficulty\/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this identifier.
    --
    -- Wire key: @id@.
    id :: Int64
  , -- | Type of the chat, can be either \"private\", \"group\", \"supergroup\" or \"channel\"
    --
    -- Wire key: @type@.
    type_ :: Text
  , -- | Optional. Title, for supergroups, channels and group chats
    --
    -- Wire key: @title@.
    -- Omitted from an encoded request when it is @Nothing@.
    title :: Maybe Text
  , -- | Optional. Username, for private chats, supergroups and channels if available
    --
    -- Wire key: @username@.
    -- Omitted from an encoded request when it is @Nothing@.
    username :: Maybe Text
  , -- | Optional. First name of the other party in a private chat
    --
    -- Wire key: @first_name@.
    -- Omitted from an encoded request when it is @Nothing@.
    first_name :: Maybe Text
  , -- | Optional. Last name of the other party in a private chat
    --
    -- Wire key: @last_name@.
    -- Omitted from an encoded request when it is @Nothing@.
    last_name :: Maybe Text
  , -- | Optional. True, if the supergroup chat is a forum (has topics enabled)
    --
    -- Wire key: @is_forum@.
    -- Omitted from an encoded request when it is @False@.
    is_forum :: Bool
  , -- | Optional. True, if the chat is the direct messages chat of a channel
    --
    -- Wire key: @is_direct_messages@.
    -- Omitted from an encoded request when it is @False@.
    is_direct_messages :: Bool
  }
  deriving stock (Eq, Show)

-- | Initialize a 'Chat' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkChat :: Int64 -> Text -> Chat
mkChat arg0 arg1 =
  MkChat
    { id = arg0
    , type_ = arg1
    , title = Nothing
    , username = Nothing
    , first_name = Nothing
    , last_name = Nothing
    , is_forum = False
    , is_direct_messages = False
    }

instance FromJSON Chat where
  parseJSON = withObject "Chat" $ \obj ->
    do
      field_0 <- requiredWith obj "id" parseInt64
      field_1 <- requiredWith obj "type" parseJSON
      field_2 <- optionalWith obj "title" parseJSON
      field_3 <- optionalWith obj "username" parseJSON
      field_4 <- optionalWith obj "first_name" parseJSON
      field_5 <- optionalWith obj "last_name" parseJSON
      field_6 <- optionalTrueFlag obj "is_forum"
      field_7 <- optionalTrueFlag obj "is_direct_messages"
      pure
        MkChat
          { id = field_0
          , type_ = field_1
          , title = field_2
          , username = field_3
          , first_name = field_4
          , last_name = field_5
          , is_forum = field_6
          , is_direct_messages = field_7
          }

instance ToJSON Chat where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "id" x.id
          , jsonField "type" x.type_
          , jsonOptional "title" x.title
          , jsonOptional "username" x.username
          , jsonOptional "first_name" x.first_name
          , jsonOptional "last_name" x.last_name
          , jsonFlag "is_forum" x.is_forum
          , jsonFlag "is_direct_messages" x.is_direct_messages
          ]
      )
  toEncoding = toEncoding . toJSON
