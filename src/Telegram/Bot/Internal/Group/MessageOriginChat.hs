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
module Telegram.Bot.Internal.Group.MessageOriginChat
  ( MessageOriginChat (..)
  , mkMessageOriginChat
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.Chat (Chat)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonLiteral, jsonObject, jsonOptional, optionalWith, parseInt64, requiredWith)

-- | The message was originally sent on behalf of a chat to a group chat.
--
-- Source: <https://core.telegram.org/bots/api#messageoriginchat>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"chat"@.
data MessageOriginChat = MkMessageOriginChat
  { -- | Date the message was sent originally in Unix time
    --
    -- Wire key: @date@.
    date :: Int64
  , -- | Chat that sent the message originally
    --
    -- Wire key: @sender_chat@.
    sender_chat :: Chat
  , -- | Optional. For messages originally sent by an anonymous chat administrator, original message author signature
    --
    -- Wire key: @author_signature@.
    -- Omitted from an encoded request when it is @Nothing@.
    author_signature :: Maybe Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'MessageOriginChat' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkMessageOriginChat :: Int64 -> Chat -> MessageOriginChat
mkMessageOriginChat arg0 arg1 =
  MkMessageOriginChat
    { date = arg0
    , sender_chat = arg1
    , author_signature = Nothing
    }

instance FromJSON MessageOriginChat where
  parseJSON = withObject "MessageOriginChat" $ \obj ->
    do
      checkStringConstant obj "type" "chat"
      field_1 <- requiredWith obj "date" parseInt64
      field_2 <- requiredWith obj "sender_chat" parseJSON
      field_3 <- optionalWith obj "author_signature" parseJSON
      pure
        MkMessageOriginChat
          { date = field_1
          , sender_chat = field_2
          , author_signature = field_3
          }

instance ToJSON MessageOriginChat where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "chat")
          , jsonField "date" x.date
          , jsonField "sender_chat" x.sender_chat
          , jsonOptional "author_signature" x.author_signature
          ]
      )
  toEncoding = toEncoding . toJSON
