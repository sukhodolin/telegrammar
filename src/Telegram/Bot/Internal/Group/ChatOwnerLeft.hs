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
module Telegram.Bot.Internal.Group.ChatOwnerLeft
  ( ChatOwnerLeft (..)
  , mkChatOwnerLeft
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Support (jsonObject, jsonOptional, optionalWith)

-- | Describes a service message about the chat owner leaving the chat.
--
-- Source: <https://core.telegram.org/bots/api#chatownerleft>.
-- Codec directions: decoded from responses, encoded into requests.
data ChatOwnerLeft = MkChatOwnerLeft
  { -- | Optional. The user who will become the new owner of the chat if the previous owner does not return to the chat
    --
    -- Wire key: @new_owner@.
    -- Omitted from an encoded request when it is @Nothing@.
    new_owner :: Maybe User
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ChatOwnerLeft' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkChatOwnerLeft :: ChatOwnerLeft
mkChatOwnerLeft =
  MkChatOwnerLeft
    { new_owner = Nothing
    }

instance FromJSON ChatOwnerLeft where
  parseJSON = withObject "ChatOwnerLeft" $ \obj ->
    do
      field_0 <- optionalWith obj "new_owner" parseJSON
      pure
        MkChatOwnerLeft
          { new_owner = field_0
          }

instance ToJSON ChatOwnerLeft where
  toJSON x =
    jsonObject
      ( concat
          [ jsonOptional "new_owner" x.new_owner
          ]
      )
  toEncoding = toEncoding . toJSON
