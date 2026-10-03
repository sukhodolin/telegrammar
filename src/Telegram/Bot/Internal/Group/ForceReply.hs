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
module Telegram.Bot.Internal.Group.ForceReply
  ( ForceReply (..)
  , mkForceReply
  ) where

import Data.Aeson (ToJSON (..), Value (..))
import Data.Text (Text)
import Telegram.Bot.Support (jsonLiteral, jsonObject, jsonOptional)

-- | Upon receiving a message with this object, Telegram clients will display a reply interface to the user (act as if the user has selected the bot\'s message and tapped \'Reply\'). This can be extremely useful if you want to create user-friendly step-by-step interfaces without having to sacrifice privacy mode. Not supported in channels and for messages sent on behalf of a user account.
--
-- Source: <https://core.telegram.org/bots/api#forcereply>.
-- Codec directions: encoded into requests.
--
-- Supplied constants: @force_reply@ = @true@.
data ForceReply = MkForceReply
  { -- | Optional. The placeholder to be shown in the input field when the reply is active; 1-64 characters
    --
    -- Wire key: @input_field_placeholder@.
    -- Omitted from an encoded request when it is @Nothing@.
    input_field_placeholder :: Maybe Text
  , -- | Optional. Use this parameter if you want to force reply from specific users only. Targets: 1) users that are \@mentioned in the text of the Message object; 2) if the bot\'s message is a reply to a message in the same chat and forum topic, sender of the original message.
    --
    -- Wire key: @selective@.
    -- Omitted from an encoded request when it is @Nothing@.
    selective :: Maybe Bool
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ForceReply' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkForceReply :: ForceReply
mkForceReply =
  MkForceReply
    { input_field_placeholder = Nothing
    , selective = Nothing
    }

instance ToJSON ForceReply where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "force_reply" (Bool True)
          , jsonOptional "input_field_placeholder" x.input_field_placeholder
          , jsonOptional "selective" x.selective
          ]
      )
  toEncoding = toEncoding . toJSON
