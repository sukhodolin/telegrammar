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
module Telegram.Bot.Internal.Group.BusinessMessagesDeleted
  ( BusinessMessagesDeleted (..)
  , mkBusinessMessagesDeleted
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.Chat (Chat)
import Telegram.Bot.Support (jsonField, jsonObject, parseInt64, parseList, requiredWith)

-- | This object is received when messages are deleted from a connected business account.
--
-- Source: <https://core.telegram.org/bots/api#businessmessagesdeleted>.
-- Codec directions: decoded from responses, encoded into requests.
data BusinessMessagesDeleted = MkBusinessMessagesDeleted
  { -- | Unique identifier of the business connection
    --
    -- Wire key: @business_connection_id@.
    business_connection_id :: Text
  , -- | Information about a chat in the business account. The bot may not have access to the chat or the corresponding user.
    --
    -- Wire key: @chat@.
    chat :: Chat
  , -- | The list of identifiers of deleted messages in the chat of the business account
    --
    -- Wire key: @message_ids@.
    message_ids :: [Int64]
  }
  deriving stock (Eq, Show)

-- | Initialize a 'BusinessMessagesDeleted' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkBusinessMessagesDeleted :: Text -> Chat -> [Int64] -> BusinessMessagesDeleted
mkBusinessMessagesDeleted arg0 arg1 arg2 =
  MkBusinessMessagesDeleted
    { business_connection_id = arg0
    , chat = arg1
    , message_ids = arg2
    }

instance FromJSON BusinessMessagesDeleted where
  parseJSON = withObject "BusinessMessagesDeleted" $ \obj ->
    do
      field_0 <- requiredWith obj "business_connection_id" parseJSON
      field_1 <- requiredWith obj "chat" parseJSON
      field_2 <- requiredWith obj "message_ids" (parseList parseInt64)
      pure
        MkBusinessMessagesDeleted
          { business_connection_id = field_0
          , chat = field_1
          , message_ids = field_2
          }

instance ToJSON BusinessMessagesDeleted where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "business_connection_id" x.business_connection_id
          , jsonField "chat" x.chat
          , jsonField "message_ids" x.message_ids
          ]
      )
  toEncoding = toEncoding . toJSON
