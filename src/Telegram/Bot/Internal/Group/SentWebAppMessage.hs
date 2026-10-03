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
module Telegram.Bot.Internal.Group.SentWebAppMessage
  ( SentWebAppMessage (..)
  , mkSentWebAppMessage
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Support (jsonObject, jsonOptional, optionalWith)

-- | Describes an inline message sent by a Web App on behalf of a user.
--
-- Source: <https://core.telegram.org/bots/api#sentwebappmessage>.
-- Codec directions: decoded from responses, encoded into requests.
data SentWebAppMessage = MkSentWebAppMessage
  { -- | Optional. Identifier of the sent inline message. Available only if there is an inline keyboard attached to the message.
    --
    -- Wire key: @inline_message_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    inline_message_id :: Maybe Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SentWebAppMessage' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSentWebAppMessage :: SentWebAppMessage
mkSentWebAppMessage =
  MkSentWebAppMessage
    { inline_message_id = Nothing
    }

instance FromJSON SentWebAppMessage where
  parseJSON = withObject "SentWebAppMessage" $ \obj ->
    do
      field_0 <- optionalWith obj "inline_message_id" parseJSON
      pure
        MkSentWebAppMessage
          { inline_message_id = field_0
          }

instance ToJSON SentWebAppMessage where
  toJSON x =
    jsonObject
      ( concat
          [ jsonOptional "inline_message_id" x.inline_message_id
          ]
      )
  toEncoding = toEncoding . toJSON
