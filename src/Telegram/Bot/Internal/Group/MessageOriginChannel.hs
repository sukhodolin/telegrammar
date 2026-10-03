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
module Telegram.Bot.Internal.Group.MessageOriginChannel
  ( MessageOriginChannel (..)
  , mkMessageOriginChannel
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.Chat (Chat)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonLiteral, jsonObject, jsonOptional, optionalWith, parseInt64, requiredWith)

-- | The message was originally sent to a channel chat.
--
-- Source: <https://core.telegram.org/bots/api#messageoriginchannel>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"channel"@.
data MessageOriginChannel = MkMessageOriginChannel
  { -- | Date the message was sent originally in Unix time
    --
    -- Wire key: @date@.
    date :: Int64
  , -- | Channel chat to which the message was originally sent
    --
    -- Wire key: @chat@.
    chat :: Chat
  , -- | Unique message identifier inside the chat
    --
    -- Wire key: @message_id@.
    message_id :: Int64
  , -- | Optional. Signature of the original post author
    --
    -- Wire key: @author_signature@.
    -- Omitted from an encoded request when it is @Nothing@.
    author_signature :: Maybe Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'MessageOriginChannel' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkMessageOriginChannel :: Int64 -> Chat -> Int64 -> MessageOriginChannel
mkMessageOriginChannel arg0 arg1 arg2 =
  MkMessageOriginChannel
    { date = arg0
    , chat = arg1
    , message_id = arg2
    , author_signature = Nothing
    }

instance FromJSON MessageOriginChannel where
  parseJSON = withObject "MessageOriginChannel" $ \obj ->
    do
      checkStringConstant obj "type" "channel"
      field_1 <- requiredWith obj "date" parseInt64
      field_2 <- requiredWith obj "chat" parseJSON
      field_3 <- requiredWith obj "message_id" parseInt64
      field_4 <- optionalWith obj "author_signature" parseJSON
      pure
        MkMessageOriginChannel
          { date = field_1
          , chat = field_2
          , message_id = field_3
          , author_signature = field_4
          }

instance ToJSON MessageOriginChannel where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "channel")
          , jsonField "date" x.date
          , jsonField "chat" x.chat
          , jsonField "message_id" x.message_id
          , jsonOptional "author_signature" x.author_signature
          ]
      )
  toEncoding = toEncoding . toJSON
