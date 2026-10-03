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
module Telegram.Bot.Internal.Group.WriteAccessAllowed
  ( WriteAccessAllowed (..)
  , mkWriteAccessAllowed
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Support (jsonObject, jsonOptional, optionalWith)

-- | This object represents a service message about a user allowing a bot to write messages after adding it to the attachment menu, launching a Web App from a link, or accepting an explicit request from a Web App sent by the method requestWriteAccess.
--
-- Source: <https://core.telegram.org/bots/api#writeaccessallowed>.
-- Codec directions: decoded from responses, encoded into requests.
data WriteAccessAllowed = MkWriteAccessAllowed
  { -- | Optional. True, if the access was granted after the user accepted an explicit request from a Web App sent by the method requestWriteAccess
    --
    -- Wire key: @from_request@.
    -- Omitted from an encoded request when it is @Nothing@.
    from_request :: Maybe Bool
  , -- | Optional. Name of the Web App, if the access was granted when the Web App was launched from a link
    --
    -- Wire key: @web_app_name@.
    -- Omitted from an encoded request when it is @Nothing@.
    web_app_name :: Maybe Text
  , -- | Optional. True, if the access was granted when the bot was added to the attachment or side menu
    --
    -- Wire key: @from_attachment_menu@.
    -- Omitted from an encoded request when it is @Nothing@.
    from_attachment_menu :: Maybe Bool
  }
  deriving stock (Eq, Show)

-- | Initialize a 'WriteAccessAllowed' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkWriteAccessAllowed :: WriteAccessAllowed
mkWriteAccessAllowed =
  MkWriteAccessAllowed
    { from_request = Nothing
    , web_app_name = Nothing
    , from_attachment_menu = Nothing
    }

instance FromJSON WriteAccessAllowed where
  parseJSON = withObject "WriteAccessAllowed" $ \obj ->
    do
      field_0 <- optionalWith obj "from_request" parseJSON
      field_1 <- optionalWith obj "web_app_name" parseJSON
      field_2 <- optionalWith obj "from_attachment_menu" parseJSON
      pure
        MkWriteAccessAllowed
          { from_request = field_0
          , web_app_name = field_1
          , from_attachment_menu = field_2
          }

instance ToJSON WriteAccessAllowed where
  toJSON x =
    jsonObject
      ( concat
          [ jsonOptional "from_request" x.from_request
          , jsonOptional "web_app_name" x.web_app_name
          , jsonOptional "from_attachment_menu" x.from_attachment_menu
          ]
      )
  toEncoding = toEncoding . toJSON
