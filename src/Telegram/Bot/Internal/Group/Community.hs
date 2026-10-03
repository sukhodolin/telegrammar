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
module Telegram.Bot.Internal.Group.Community
  ( Community (..)
  , mkCommunity
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonObject, parseInt64, requiredWith)

-- | Represents a community (a group of chats).
--
-- Source: <https://core.telegram.org/bots/api#community>.
-- Codec directions: decoded from responses, encoded into requests.
data Community = MkCommunity
  { -- | Unique identifier for this community. This number may have more than 32 significant bits and some programming languages may have difficulty\/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this identifier.
    --
    -- Wire key: @id@.
    id :: Int64
  , -- | Name of the community
    --
    -- Wire key: @name@.
    name :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'Community' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkCommunity :: Int64 -> Text -> Community
mkCommunity arg0 arg1 =
  MkCommunity
    { id = arg0
    , name = arg1
    }

instance FromJSON Community where
  parseJSON = withObject "Community" $ \obj ->
    do
      field_0 <- requiredWith obj "id" parseInt64
      field_1 <- requiredWith obj "name" parseJSON
      pure
        MkCommunity
          { id = field_0
          , name = field_1
          }

instance ToJSON Community where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "id" x.id
          , jsonField "name" x.name
          ]
      )
  toEncoding = toEncoding . toJSON
