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
module Telegram.Bot.Internal.Group.User
  ( User (..)
  , mkUser
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonFlag, jsonObject, jsonOptional, optionalTrueFlag, optionalWith, parseInt64, requiredWith)

-- | This object represents a Telegram user or bot.
--
-- Source: <https://core.telegram.org/bots/api#user>.
-- Codec directions: decoded from responses, encoded into requests.
data User = MkUser
  { -- | Unique identifier for this user or bot. This number may have more than 32 significant bits and some programming languages may have difficulty\/silent defects in interpreting it. But it has at most 52 significant bits, so a 64-bit integer or double-precision float type are safe for storing this identifier.
    --
    -- Wire key: @id@.
    id :: Int64
  , -- | True, if this user is a bot
    --
    -- Wire key: @is_bot@.
    is_bot :: Bool
  , -- | User\'s or bot\'s first name
    --
    -- Wire key: @first_name@.
    first_name :: Text
  , -- | Optional. User\'s or bot\'s last name
    --
    -- Wire key: @last_name@.
    -- Omitted from an encoded request when it is @Nothing@.
    last_name :: Maybe Text
  , -- | Optional. User\'s or bot\'s username
    --
    -- Wire key: @username@.
    -- Omitted from an encoded request when it is @Nothing@.
    username :: Maybe Text
  , -- | Optional. IETF language tag of the user\'s language
    --
    -- Wire key: @language_code@.
    -- Omitted from an encoded request when it is @Nothing@.
    language_code :: Maybe Text
  , -- | Optional. True, if this user is a Telegram Premium user
    --
    -- Wire key: @is_premium@.
    -- Omitted from an encoded request when it is @False@.
    is_premium :: Bool
  , -- | Optional. True, if this user added the bot to the attachment menu
    --
    -- Wire key: @added_to_attachment_menu@.
    -- Omitted from an encoded request when it is @False@.
    added_to_attachment_menu :: Bool
  , -- | Optional. True, if the bot can be invited to groups. Returned only in getMe.
    --
    -- Wire key: @can_join_groups@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_join_groups :: Maybe Bool
  , -- | Optional. True, if privacy mode is disabled for the bot. Returned only in getMe.
    --
    -- Wire key: @can_read_all_group_messages@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_read_all_group_messages :: Maybe Bool
  , -- | Optional. True, if the bot supports guest queries from chats it is not a member of. Returned only in getMe.
    --
    -- Wire key: @supports_guest_queries@.
    -- Omitted from an encoded request when it is @Nothing@.
    supports_guest_queries :: Maybe Bool
  , -- | Optional. True, if the bot supports inline queries. Returned only in getMe.
    --
    -- Wire key: @supports_inline_queries@.
    -- Omitted from an encoded request when it is @Nothing@.
    supports_inline_queries :: Maybe Bool
  , -- | Optional. True, if the bot can be connected to a user account to manage it. Returned only in getMe.
    --
    -- Wire key: @can_connect_to_business@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_connect_to_business :: Maybe Bool
  , -- | Optional. True, if the bot has a main Web App. Returned only in getMe.
    --
    -- Wire key: @has_main_web_app@.
    -- Omitted from an encoded request when it is @Nothing@.
    has_main_web_app :: Maybe Bool
  , -- | Optional. True, if the bot has forum topic mode enabled in private chats. Returned only in getMe.
    --
    -- Wire key: @has_topics_enabled@.
    -- Omitted from an encoded request when it is @Nothing@.
    has_topics_enabled :: Maybe Bool
  , -- | Optional. True, if the bot allows users to create and delete topics in private chats. Returned only in getMe.
    --
    -- Wire key: @allows_users_to_create_topics@.
    -- Omitted from an encoded request when it is @Nothing@.
    allows_users_to_create_topics :: Maybe Bool
  , -- | Optional. True, if other bots can be created to be controlled by the bot. Returned only in getMe.
    --
    -- Wire key: @can_manage_bots@.
    -- Omitted from an encoded request when it is @Nothing@.
    can_manage_bots :: Maybe Bool
  , -- | Optional. True, if the bot supports join request queries and can be assigned to process them. Returned only in getMe.
    --
    -- Wire key: @supports_join_request_queries@.
    -- Omitted from an encoded request when it is @Nothing@.
    supports_join_request_queries :: Maybe Bool
  }
  deriving stock (Eq, Show)

-- | Initialize a 'User' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkUser :: Int64 -> Bool -> Text -> User
mkUser arg0 arg1 arg2 =
  MkUser
    { id = arg0
    , is_bot = arg1
    , first_name = arg2
    , last_name = Nothing
    , username = Nothing
    , language_code = Nothing
    , is_premium = False
    , added_to_attachment_menu = False
    , can_join_groups = Nothing
    , can_read_all_group_messages = Nothing
    , supports_guest_queries = Nothing
    , supports_inline_queries = Nothing
    , can_connect_to_business = Nothing
    , has_main_web_app = Nothing
    , has_topics_enabled = Nothing
    , allows_users_to_create_topics = Nothing
    , can_manage_bots = Nothing
    , supports_join_request_queries = Nothing
    }

instance FromJSON User where
  parseJSON = withObject "User" $ \obj ->
    do
      field_0 <- requiredWith obj "id" parseInt64
      field_1 <- requiredWith obj "is_bot" parseJSON
      field_2 <- requiredWith obj "first_name" parseJSON
      field_3 <- optionalWith obj "last_name" parseJSON
      field_4 <- optionalWith obj "username" parseJSON
      field_5 <- optionalWith obj "language_code" parseJSON
      field_6 <- optionalTrueFlag obj "is_premium"
      field_7 <- optionalTrueFlag obj "added_to_attachment_menu"
      field_8 <- optionalWith obj "can_join_groups" parseJSON
      field_9 <- optionalWith obj "can_read_all_group_messages" parseJSON
      field_10 <- optionalWith obj "supports_guest_queries" parseJSON
      field_11 <- optionalWith obj "supports_inline_queries" parseJSON
      field_12 <- optionalWith obj "can_connect_to_business" parseJSON
      field_13 <- optionalWith obj "has_main_web_app" parseJSON
      field_14 <- optionalWith obj "has_topics_enabled" parseJSON
      field_15 <- optionalWith obj "allows_users_to_create_topics" parseJSON
      field_16 <- optionalWith obj "can_manage_bots" parseJSON
      field_17 <- optionalWith obj "supports_join_request_queries" parseJSON
      pure
        MkUser
          { id = field_0
          , is_bot = field_1
          , first_name = field_2
          , last_name = field_3
          , username = field_4
          , language_code = field_5
          , is_premium = field_6
          , added_to_attachment_menu = field_7
          , can_join_groups = field_8
          , can_read_all_group_messages = field_9
          , supports_guest_queries = field_10
          , supports_inline_queries = field_11
          , can_connect_to_business = field_12
          , has_main_web_app = field_13
          , has_topics_enabled = field_14
          , allows_users_to_create_topics = field_15
          , can_manage_bots = field_16
          , supports_join_request_queries = field_17
          }

instance ToJSON User where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "id" x.id
          , jsonField "is_bot" x.is_bot
          , jsonField "first_name" x.first_name
          , jsonOptional "last_name" x.last_name
          , jsonOptional "username" x.username
          , jsonOptional "language_code" x.language_code
          , jsonFlag "is_premium" x.is_premium
          , jsonFlag "added_to_attachment_menu" x.added_to_attachment_menu
          , jsonOptional "can_join_groups" x.can_join_groups
          , jsonOptional "can_read_all_group_messages" x.can_read_all_group_messages
          , jsonOptional "supports_guest_queries" x.supports_guest_queries
          , jsonOptional "supports_inline_queries" x.supports_inline_queries
          , jsonOptional "can_connect_to_business" x.can_connect_to_business
          , jsonOptional "has_main_web_app" x.has_main_web_app
          , jsonOptional "has_topics_enabled" x.has_topics_enabled
          , jsonOptional "allows_users_to_create_topics" x.allows_users_to_create_topics
          , jsonOptional "can_manage_bots" x.can_manage_bots
          , jsonOptional "supports_join_request_queries" x.supports_join_request_queries
          ]
      )
  toEncoding = toEncoding . toJSON
