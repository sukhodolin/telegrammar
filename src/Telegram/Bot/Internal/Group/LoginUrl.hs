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
module Telegram.Bot.Internal.Group.LoginUrl
  ( LoginUrl (..)
  , mkLoginUrl
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, requiredWith)

-- | This object represents a parameter of the inline keyboard button used to automatically authorize a user. It serves as a great replacement for the Telegram Login Widget when the user is coming from Telegram. All the user needs to do is tap\/click a button and confirm that they want to log in:
--
-- Source: <https://core.telegram.org/bots/api#loginurl>.
-- Codec directions: decoded from responses, encoded into requests.
data LoginUrl = MkLoginUrl
  { -- | An HTTPS URL to be opened with user authorization data added to the query string when the button is pressed. If the user refuses to provide authorization data, the original URL without information about the user will be opened. The data added is the same as described in Receiving authorization data. NOTE: You must always check the hash of the received data to verify the authentication and the integrity of the data as described in Checking authorization.
    --
    -- Wire key: @url@.
    url :: Text
  , -- | Optional. New text of the button in forwarded messages
    --
    -- Wire key: @forward_text@.
    -- Omitted from an encoded request when it is @Nothing@.
    forward_text :: Maybe Text
  , -- | Optional. Username of a bot, which will be used for user authorization; not supported in RichMessageButton. See Setting up a bot for more details. If not specified, the current bot\'s username will be assumed. The url\'s domain must be the same as the domain linked with the bot. See Linking your domain to the bot for more details.
    --
    -- Wire key: @bot_username@.
    -- Omitted from an encoded request when it is @Nothing@.
    bot_username :: Maybe Text
  , -- | Optional. Pass True to request the permission for your bot to send messages to the user
    --
    -- Wire key: @request_write_access@.
    -- Omitted from an encoded request when it is @Nothing@.
    request_write_access :: Maybe Bool
  }
  deriving stock (Eq, Show)

-- | Initialize a 'LoginUrl' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkLoginUrl :: Text -> LoginUrl
mkLoginUrl arg0 =
  MkLoginUrl
    { url = arg0
    , forward_text = Nothing
    , bot_username = Nothing
    , request_write_access = Nothing
    }

instance FromJSON LoginUrl where
  parseJSON = withObject "LoginUrl" $ \obj ->
    do
      field_0 <- requiredWith obj "url" parseJSON
      field_1 <- optionalWith obj "forward_text" parseJSON
      field_2 <- optionalWith obj "bot_username" parseJSON
      field_3 <- optionalWith obj "request_write_access" parseJSON
      pure
        MkLoginUrl
          { url = field_0
          , forward_text = field_1
          , bot_username = field_2
          , request_write_access = field_3
          }

instance ToJSON LoginUrl where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "url" x.url
          , jsonOptional "forward_text" x.forward_text
          , jsonOptional "bot_username" x.bot_username
          , jsonOptional "request_write_access" x.request_write_access
          ]
      )
  toEncoding = toEncoding . toJSON
