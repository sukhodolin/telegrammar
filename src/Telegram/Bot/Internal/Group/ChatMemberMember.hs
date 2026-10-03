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
module Telegram.Bot.Internal.Group.ChatMemberMember
  ( ChatMemberMember (..)
  , mkChatMemberMember
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonLiteral, jsonObject, jsonOptional, optionalWith, parseInt64, requiredWith)

-- | Represents a chat member that has no additional privileges or restrictions.
--
-- Source: <https://core.telegram.org/bots/api#chatmembermember>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @status@ = @"member"@.
data ChatMemberMember = MkChatMemberMember
  { -- | Optional. Tag of the member
    --
    -- Wire key: @tag@.
    -- Omitted from an encoded request when it is @Nothing@.
    tag :: Maybe Text
  , -- | Information about the user
    --
    -- Wire key: @user@.
    user :: User
  , -- | Optional. Date when the user\'s subscription will expire; Unix time
    --
    -- Wire key: @until_date@.
    -- Omitted from an encoded request when it is @Nothing@.
    until_date :: Maybe Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ChatMemberMember' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkChatMemberMember :: User -> ChatMemberMember
mkChatMemberMember arg0 =
  MkChatMemberMember
    { tag = Nothing
    , user = arg0
    , until_date = Nothing
    }

instance FromJSON ChatMemberMember where
  parseJSON = withObject "ChatMemberMember" $ \obj ->
    do
      checkStringConstant obj "status" "member"
      field_1 <- optionalWith obj "tag" parseJSON
      field_2 <- requiredWith obj "user" parseJSON
      field_3 <- optionalWith obj "until_date" parseInt64
      pure
        MkChatMemberMember
          { tag = field_1
          , user = field_2
          , until_date = field_3
          }

instance ToJSON ChatMemberMember where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "status" (String "member")
          , jsonOptional "tag" x.tag
          , jsonField "user" x.user
          , jsonOptional "until_date" x.until_date
          ]
      )
  toEncoding = toEncoding . toJSON
