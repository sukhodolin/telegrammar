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
module Telegram.Bot.Internal.Group.ChatOwnerChanged
  ( ChatOwnerChanged (..)
  , mkChatOwnerChanged
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Support (jsonField, jsonObject, requiredWith)

-- | Describes a service message about an ownership change in the chat.
--
-- Source: <https://core.telegram.org/bots/api#chatownerchanged>.
-- Codec directions: decoded from responses, encoded into requests.
data ChatOwnerChanged = MkChatOwnerChanged
  { -- | The new owner of the chat
    --
    -- Wire key: @new_owner@.
    new_owner :: User
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ChatOwnerChanged' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkChatOwnerChanged :: User -> ChatOwnerChanged
mkChatOwnerChanged arg0 =
  MkChatOwnerChanged
    { new_owner = arg0
    }

instance FromJSON ChatOwnerChanged where
  parseJSON = withObject "ChatOwnerChanged" $ \obj ->
    do
      field_0 <- requiredWith obj "new_owner" parseJSON
      pure
        MkChatOwnerChanged
          { new_owner = field_0
          }

instance ToJSON ChatOwnerChanged where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "new_owner" x.new_owner
          ]
      )
  toEncoding = toEncoding . toJSON
