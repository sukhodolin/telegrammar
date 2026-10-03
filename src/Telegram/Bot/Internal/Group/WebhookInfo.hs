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
module Telegram.Bot.Internal.Group.WebhookInfo
  ( WebhookInfo (..)
  , mkWebhookInfo
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseInt64, parseList, requiredWith)

-- | Describes the current status of a webhook.
--
-- Source: <https://core.telegram.org/bots/api#webhookinfo>.
-- Codec directions: decoded from responses, encoded into requests.
data WebhookInfo = MkWebhookInfo
  { -- | Webhook URL, may be empty if webhook is not set up
    --
    -- Wire key: @url@.
    url :: Text
  , -- | True, if a custom certificate was provided for webhook certificate checks
    --
    -- Wire key: @has_custom_certificate@.
    has_custom_certificate :: Bool
  , -- | Number of updates awaiting delivery
    --
    -- Wire key: @pending_update_count@.
    pending_update_count :: Int64
  , -- | Optional. Currently used webhook IP address
    --
    -- Wire key: @ip_address@.
    -- Omitted from an encoded request when it is @Nothing@.
    ip_address :: Maybe Text
  , -- | Optional. Unix time for the most recent error that happened when trying to deliver an update via webhook
    --
    -- Wire key: @last_error_date@.
    -- Omitted from an encoded request when it is @Nothing@.
    last_error_date :: Maybe Int64
  , -- | Optional. Error message in human-readable format for the most recent error that happened when trying to deliver an update via webhook
    --
    -- Wire key: @last_error_message@.
    -- Omitted from an encoded request when it is @Nothing@.
    last_error_message :: Maybe Text
  , -- | Optional. Unix time of the most recent error that happened when trying to synchronize available updates with Telegram datacenters
    --
    -- Wire key: @last_synchronization_error_date@.
    -- Omitted from an encoded request when it is @Nothing@.
    last_synchronization_error_date :: Maybe Int64
  , -- | Optional. The maximum allowed number of simultaneous HTTPS connections to the webhook for update delivery
    --
    -- Wire key: @max_connections@.
    -- Omitted from an encoded request when it is @Nothing@.
    max_connections :: Maybe Int64
  , -- | Optional. A list of update types the bot is subscribed to. Defaults to all update types except chat_member, message_reaction, and message_reaction_count.
    --
    -- Wire key: @allowed_updates@.
    -- Omitted from an encoded request when it is @Nothing@.
    allowed_updates :: Maybe [Text]
  }
  deriving stock (Eq, Show)

-- | Initialize a 'WebhookInfo' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkWebhookInfo :: Text -> Bool -> Int64 -> WebhookInfo
mkWebhookInfo arg0 arg1 arg2 =
  MkWebhookInfo
    { url = arg0
    , has_custom_certificate = arg1
    , pending_update_count = arg2
    , ip_address = Nothing
    , last_error_date = Nothing
    , last_error_message = Nothing
    , last_synchronization_error_date = Nothing
    , max_connections = Nothing
    , allowed_updates = Nothing
    }

instance FromJSON WebhookInfo where
  parseJSON = withObject "WebhookInfo" $ \obj ->
    do
      field_0 <- requiredWith obj "url" parseJSON
      field_1 <- requiredWith obj "has_custom_certificate" parseJSON
      field_2 <- requiredWith obj "pending_update_count" parseInt64
      field_3 <- optionalWith obj "ip_address" parseJSON
      field_4 <- optionalWith obj "last_error_date" parseInt64
      field_5 <- optionalWith obj "last_error_message" parseJSON
      field_6 <- optionalWith obj "last_synchronization_error_date" parseInt64
      field_7 <- optionalWith obj "max_connections" parseInt64
      field_8 <- optionalWith obj "allowed_updates" (parseList parseJSON)
      pure
        MkWebhookInfo
          { url = field_0
          , has_custom_certificate = field_1
          , pending_update_count = field_2
          , ip_address = field_3
          , last_error_date = field_4
          , last_error_message = field_5
          , last_synchronization_error_date = field_6
          , max_connections = field_7
          , allowed_updates = field_8
          }

instance ToJSON WebhookInfo where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "url" x.url
          , jsonField "has_custom_certificate" x.has_custom_certificate
          , jsonField "pending_update_count" x.pending_update_count
          , jsonOptional "ip_address" x.ip_address
          , jsonOptional "last_error_date" x.last_error_date
          , jsonOptional "last_error_message" x.last_error_message
          , jsonOptional "last_synchronization_error_date" x.last_synchronization_error_date
          , jsonOptional "max_connections" x.max_connections
          , jsonOptional "allowed_updates" x.allowed_updates
          ]
      )
  toEncoding = toEncoding . toJSON
