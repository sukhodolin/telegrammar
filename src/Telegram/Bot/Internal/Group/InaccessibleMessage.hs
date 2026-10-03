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
module Telegram.Bot.Internal.Group.InaccessibleMessage
  ( InaccessibleMessage (..)
  , mkInaccessibleMessage
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.Chat (Chat)
import Telegram.Bot.Support (checkIntegerConstant, jsonField, jsonLiteral, jsonObject, parseInt64, requiredWith)

-- | This object describes a message that was deleted or is otherwise inaccessible to the bot.
--
-- Source: <https://core.telegram.org/bots/api#inaccessiblemessage>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @date@ = @0@.
data InaccessibleMessage = MkInaccessibleMessage
  { -- | Chat the message belonged to
    --
    -- Wire key: @chat@.
    chat :: Chat
  , -- | Unique message identifier inside the chat
    --
    -- Wire key: @message_id@.
    message_id :: Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InaccessibleMessage' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInaccessibleMessage :: Chat -> Int64 -> InaccessibleMessage
mkInaccessibleMessage arg0 arg1 =
  MkInaccessibleMessage
    { chat = arg0
    , message_id = arg1
    }

instance FromJSON InaccessibleMessage where
  parseJSON = withObject "InaccessibleMessage" $ \obj ->
    do
      field_0 <- requiredWith obj "chat" parseJSON
      field_1 <- requiredWith obj "message_id" parseInt64
      checkIntegerConstant obj "date" 0
      pure
        MkInaccessibleMessage
          { chat = field_0
          , message_id = field_1
          }

instance ToJSON InaccessibleMessage where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "chat" x.chat
          , jsonField "message_id" x.message_id
          , jsonLiteral "date" (Number 0)
          ]
      )
  toEncoding = toEncoding . toJSON
