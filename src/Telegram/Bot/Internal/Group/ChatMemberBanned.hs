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
module Telegram.Bot.Internal.Group.ChatMemberBanned
  ( ChatMemberBanned (..)
  , mkChatMemberBanned
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonLiteral, jsonObject, parseInt64, requiredWith)

-- | Represents a chat member that was banned in the chat and can\'t return to the chat or view chat messages.
--
-- Source: <https://core.telegram.org/bots/api#chatmemberbanned>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @status@ = @"kicked"@.
data ChatMemberBanned = MkChatMemberBanned
  { -- | Information about the user
    --
    -- Wire key: @user@.
    user :: User
  , -- | Date when restrictions will be lifted for this user; Unix time. If 0, then the user is banned forever.
    --
    -- Wire key: @until_date@.
    until_date :: Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ChatMemberBanned' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkChatMemberBanned :: User -> Int64 -> ChatMemberBanned
mkChatMemberBanned arg0 arg1 =
  MkChatMemberBanned
    { user = arg0
    , until_date = arg1
    }

instance FromJSON ChatMemberBanned where
  parseJSON = withObject "ChatMemberBanned" $ \obj ->
    do
      checkStringConstant obj "status" "kicked"
      field_1 <- requiredWith obj "user" parseJSON
      field_2 <- requiredWith obj "until_date" parseInt64
      pure
        MkChatMemberBanned
          { user = field_1
          , until_date = field_2
          }

instance ToJSON ChatMemberBanned where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "status" (String "kicked")
          , jsonField "user" x.user
          , jsonField "until_date" x.until_date
          ]
      )
  toEncoding = toEncoding . toJSON
