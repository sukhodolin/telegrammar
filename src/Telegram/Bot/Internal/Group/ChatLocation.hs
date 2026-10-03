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
module Telegram.Bot.Internal.Group.ChatLocation
  ( ChatLocation (..)
  , mkChatLocation
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.Location (Location)
import Telegram.Bot.Support (jsonField, jsonObject, requiredWith)

-- | Represents a location to which a chat is connected.
--
-- Source: <https://core.telegram.org/bots/api#chatlocation>.
-- Codec directions: decoded from responses, encoded into requests.
data ChatLocation = MkChatLocation
  { -- | The location to which the supergroup is connected. Can\'t be a live location.
    --
    -- Wire key: @location@.
    location :: Location
  , -- | Location address; 1-64 characters, as defined by the chat owner
    --
    -- Wire key: @address@.
    address :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ChatLocation' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkChatLocation :: Location -> Text -> ChatLocation
mkChatLocation arg0 arg1 =
  MkChatLocation
    { location = arg0
    , address = arg1
    }

instance FromJSON ChatLocation where
  parseJSON = withObject "ChatLocation" $ \obj ->
    do
      field_0 <- requiredWith obj "location" parseJSON
      field_1 <- requiredWith obj "address" parseJSON
      pure
        MkChatLocation
          { location = field_0
          , address = field_1
          }

instance ToJSON ChatLocation where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "location" x.location
          , jsonField "address" x.address
          ]
      )
  toEncoding = toEncoding . toJSON
