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
module Telegram.Bot.Internal.Group.ChatMemberOwner
  ( ChatMemberOwner (..)
  , mkChatMemberOwner
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonLiteral, jsonObject, jsonOptional, optionalWith, requiredWith)

-- | Represents a chat member that owns the chat and has all administrator privileges.
--
-- Source: <https://core.telegram.org/bots/api#chatmemberowner>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @status@ = @"creator"@.
data ChatMemberOwner = MkChatMemberOwner
  { -- | Information about the user
    --
    -- Wire key: @user@.
    user :: User
  , -- | True, if the user\'s presence in the chat is hidden
    --
    -- Wire key: @is_anonymous@.
    is_anonymous :: Bool
  , -- | Optional. Custom title for this user
    --
    -- Wire key: @custom_title@.
    -- Omitted from an encoded request when it is @Nothing@.
    custom_title :: Maybe Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ChatMemberOwner' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkChatMemberOwner :: User -> Bool -> ChatMemberOwner
mkChatMemberOwner arg0 arg1 =
  MkChatMemberOwner
    { user = arg0
    , is_anonymous = arg1
    , custom_title = Nothing
    }

instance FromJSON ChatMemberOwner where
  parseJSON = withObject "ChatMemberOwner" $ \obj ->
    do
      checkStringConstant obj "status" "creator"
      field_1 <- requiredWith obj "user" parseJSON
      field_2 <- requiredWith obj "is_anonymous" parseJSON
      field_3 <- optionalWith obj "custom_title" parseJSON
      pure
        MkChatMemberOwner
          { user = field_1
          , is_anonymous = field_2
          , custom_title = field_3
          }

instance ToJSON ChatMemberOwner where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "status" (String "creator")
          , jsonField "user" x.user
          , jsonField "is_anonymous" x.is_anonymous
          , jsonOptional "custom_title" x.custom_title
          ]
      )
  toEncoding = toEncoding . toJSON
