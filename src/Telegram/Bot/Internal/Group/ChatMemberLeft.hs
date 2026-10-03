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
module Telegram.Bot.Internal.Group.ChatMemberLeft
  ( ChatMemberLeft (..)
  , mkChatMemberLeft
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonLiteral, jsonObject, requiredWith)

-- | Represents a chat member that isn\'t currently a member of the chat, but may join it themselves.
--
-- Source: <https://core.telegram.org/bots/api#chatmemberleft>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @status@ = @"left"@.
data ChatMemberLeft = MkChatMemberLeft
  { -- | Information about the user
    --
    -- Wire key: @user@.
    user :: User
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ChatMemberLeft' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkChatMemberLeft :: User -> ChatMemberLeft
mkChatMemberLeft arg0 =
  MkChatMemberLeft
    { user = arg0
    }

instance FromJSON ChatMemberLeft where
  parseJSON = withObject "ChatMemberLeft" $ \obj ->
    do
      checkStringConstant obj "status" "left"
      field_1 <- requiredWith obj "user" parseJSON
      pure
        MkChatMemberLeft
          { user = field_1
          }

instance ToJSON ChatMemberLeft where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "status" (String "left")
          , jsonField "user" x.user
          ]
      )
  toEncoding = toEncoding . toJSON
