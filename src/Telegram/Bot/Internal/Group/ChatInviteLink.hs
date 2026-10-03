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
module Telegram.Bot.Internal.Group.ChatInviteLink
  ( ChatInviteLink (..)
  , mkChatInviteLink
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseInt64, requiredWith)

-- | Represents an invite link for a chat.
--
-- Source: <https://core.telegram.org/bots/api#chatinvitelink>.
-- Codec directions: decoded from responses, encoded into requests.
data ChatInviteLink = MkChatInviteLink
  { -- | The invite link. If the link was created by another chat administrator, then the second part of the link will be replaced with \"...\".
    --
    -- Wire key: @invite_link@.
    invite_link :: Text
  , -- | Creator of the link
    --
    -- Wire key: @creator@.
    creator :: User
  , -- | True, if users joining the chat via the link need to be approved by chat administrators
    --
    -- Wire key: @creates_join_request@.
    creates_join_request :: Bool
  , -- | True, if the link is primary
    --
    -- Wire key: @is_primary@.
    is_primary :: Bool
  , -- | True, if the link is revoked
    --
    -- Wire key: @is_revoked@.
    is_revoked :: Bool
  , -- | Optional. Invite link name
    --
    -- Wire key: @name@.
    -- Omitted from an encoded request when it is @Nothing@.
    name :: Maybe Text
  , -- | Optional. Point in time (Unix timestamp) when the link will expire or has been expired
    --
    -- Wire key: @expire_date@.
    -- Omitted from an encoded request when it is @Nothing@.
    expire_date :: Maybe Int64
  , -- | Optional. The maximum number of users that can be members of the chat simultaneously after joining the chat via this invite link; 1-99999
    --
    -- Wire key: @member_limit@.
    -- Omitted from an encoded request when it is @Nothing@.
    member_limit :: Maybe Int64
  , -- | Optional. Number of pending join requests created using this link
    --
    -- Wire key: @pending_join_request_count@.
    -- Omitted from an encoded request when it is @Nothing@.
    pending_join_request_count :: Maybe Int64
  , -- | Optional. The number of seconds the subscription will be active for before the next payment
    --
    -- Wire key: @subscription_period@.
    -- Omitted from an encoded request when it is @Nothing@.
    subscription_period :: Maybe Int64
  , -- | Optional. The amount of Telegram Stars a user must pay initially and after each subsequent subscription period to be a member of the chat using the link
    --
    -- Wire key: @subscription_price@.
    -- Omitted from an encoded request when it is @Nothing@.
    subscription_price :: Maybe Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ChatInviteLink' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkChatInviteLink :: Text -> User -> Bool -> Bool -> Bool -> ChatInviteLink
mkChatInviteLink arg0 arg1 arg2 arg3 arg4 =
  MkChatInviteLink
    { invite_link = arg0
    , creator = arg1
    , creates_join_request = arg2
    , is_primary = arg3
    , is_revoked = arg4
    , name = Nothing
    , expire_date = Nothing
    , member_limit = Nothing
    , pending_join_request_count = Nothing
    , subscription_period = Nothing
    , subscription_price = Nothing
    }

instance FromJSON ChatInviteLink where
  parseJSON = withObject "ChatInviteLink" $ \obj ->
    do
      field_0 <- requiredWith obj "invite_link" parseJSON
      field_1 <- requiredWith obj "creator" parseJSON
      field_2 <- requiredWith obj "creates_join_request" parseJSON
      field_3 <- requiredWith obj "is_primary" parseJSON
      field_4 <- requiredWith obj "is_revoked" parseJSON
      field_5 <- optionalWith obj "name" parseJSON
      field_6 <- optionalWith obj "expire_date" parseInt64
      field_7 <- optionalWith obj "member_limit" parseInt64
      field_8 <- optionalWith obj "pending_join_request_count" parseInt64
      field_9 <- optionalWith obj "subscription_period" parseInt64
      field_10 <- optionalWith obj "subscription_price" parseInt64
      pure
        MkChatInviteLink
          { invite_link = field_0
          , creator = field_1
          , creates_join_request = field_2
          , is_primary = field_3
          , is_revoked = field_4
          , name = field_5
          , expire_date = field_6
          , member_limit = field_7
          , pending_join_request_count = field_8
          , subscription_period = field_9
          , subscription_price = field_10
          }

instance ToJSON ChatInviteLink where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "invite_link" x.invite_link
          , jsonField "creator" x.creator
          , jsonField "creates_join_request" x.creates_join_request
          , jsonField "is_primary" x.is_primary
          , jsonField "is_revoked" x.is_revoked
          , jsonOptional "name" x.name
          , jsonOptional "expire_date" x.expire_date
          , jsonOptional "member_limit" x.member_limit
          , jsonOptional "pending_join_request_count" x.pending_join_request_count
          , jsonOptional "subscription_period" x.subscription_period
          , jsonOptional "subscription_price" x.subscription_price
          ]
      )
  toEncoding = toEncoding . toJSON
