{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeFamilies #-}

-- | One method's request record, initializer, and result association.
--
-- Import this module qualified to update an optional parameter, which is
-- the supported idiom for a record whose field labels repeat across
-- methods.
--
-- Generated. Do not edit.
module Telegram.Bot.Methods.SetWebhook
  ( SetWebhook (..)
  , mkSetWebhook
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Support (FileCapability (..), InputFile, Method (..), TrueValue, encodeJson, filePolicy, planFileValue, planList, planRequestBody, planned, plannedMaybe)

-- | Use this method to specify a URL and receive incoming updates via an outgoing webhook. Whenever there is an update for the bot, we will send an HTTPS POST request to the specified URL, containing a JSON-serialized Update. In case of an unsuccessful request (a request with response HTTP status code different from 2XY), we will repeat the request and give up after a reasonable amount of attempts. Returns True on success.
-- If you\'d like to make sure that the webhook was set by you, you can specify secret data in the parameter secret_token. If specified, the request will contain a header \"X-Telegram-Bot-Api-Secret-Token\" with the secret token as content.
--
-- Wire method spelling: @setWebhook@.
--
-- Source: <https://core.telegram.org/bots/api#setwebhook>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SetWebhook = MkSetWebhook
  { -- | HTTPS URL to send updates to. Use an empty string to remove webhook integration.
    --
    -- Wire key: @url@.
    url :: Text
  , -- | Upload your public key certificate so that the root certificate in use can be checked. See our self-signed guide for details.
    --
    -- Wire key: @certificate@.
    -- Omitted from an encoded request when it is @Nothing@.
    -- File sources accepted here: @upload@.
    certificate :: Maybe InputFile
  , -- | The fixed IP address which will be used to send webhook requests instead of the IP address resolved through DNS
    --
    -- Wire key: @ip_address@.
    -- Omitted from an encoded request when it is @Nothing@.
    ip_address :: Maybe Text
  , -- | The maximum allowed number of simultaneous HTTPS connections to the webhook for update delivery, 1-100. Defaults to 40. Use lower values to limit the load on your bot\'s server, and higher values to increase your bot\'s throughput.
    --
    -- Wire key: @max_connections@.
    -- Omitted from an encoded request when it is @Nothing@.
    max_connections :: Maybe Int64
  , -- | A JSON-serialized list of the update types you want your bot to receive. For example, specify \[\"message\", \"edited_channel_post\", \"callback_query\"\] to only receive updates of these types. See Update for a complete list of available update types. Specify an empty list to receive all update types except chat_member, message_reaction, and message_reaction_count (default). If not specified, the previous setting will be used. Please note that this parameter doesn\'t affect updates created before the call to the setWebhook, so unwanted updates may be received for a short period of time.
    --
    -- Wire key: @allowed_updates@.
    -- Omitted from an encoded request when it is @Nothing@.
    allowed_updates :: Maybe [Text]
  , -- | Pass True to drop all pending updates
    --
    -- Wire key: @drop_pending_updates@.
    -- Omitted from an encoded request when it is @Nothing@.
    drop_pending_updates :: Maybe Bool
  , -- | A secret token to be sent in a header \"X-Telegram-Bot-Api-Secret-Token\" in every webhook request, 1-256 characters. Only characters A-Z, a-z, 0-9, _ and - are allowed. The header is useful to ensure that the request comes from a webhook set by you.
    --
    -- Wire key: @secret_token@.
    -- Omitted from an encoded request when it is @Nothing@.
    secret_token :: Maybe Text
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SetWebhook' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSetWebhook :: Text -> SetWebhook
mkSetWebhook arg0 =
  MkSetWebhook
    { url = arg0
    , certificate = Nothing
    , ip_address = Nothing
    , max_connections = Nothing
    , allowed_updates = Nothing
    , drop_pending_updates = Nothing
    , secret_token = Nothing
    , extra = mempty
    }

instance Method SetWebhook where
  type Result SetWebhook = TrueValue
  methodName _ = "setWebhook"
  planRequest x =
    planRequestBody
      "setWebhook"
      [ "url"
      , "certificate"
      , "ip_address"
      , "max_connections"
      , "allowed_updates"
      , "drop_pending_updates"
      , "secret_token"
      ]
      ( concat
          [ planned "url" (encodeJson x.url)
          , plannedMaybe "certificate" x.certificate (planFileValue (filePolicy [UploadCapability]))
          , plannedMaybe "ip_address" x.ip_address encodeJson
          , plannedMaybe "max_connections" x.max_connections encodeJson
          , plannedMaybe "allowed_updates" x.allowed_updates (planList encodeJson)
          , plannedMaybe "drop_pending_updates" x.drop_pending_updates encodeJson
          , plannedMaybe "secret_token" x.secret_token encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
