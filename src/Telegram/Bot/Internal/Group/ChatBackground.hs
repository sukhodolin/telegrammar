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
module Telegram.Bot.Internal.Group.ChatBackground
  ( ChatBackground (..)
  , mkChatBackground
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Telegram.Bot.Internal.Group.BackgroundType (BackgroundType)
import Telegram.Bot.Support (jsonField, jsonObject, requiredWith)

-- | This object represents a chat background.
--
-- Source: <https://core.telegram.org/bots/api#chatbackground>.
-- Codec directions: decoded from responses, encoded into requests.
data ChatBackground = MkChatBackground
  { -- | Type of the background
    --
    -- Wire key: @type@.
    type_ :: BackgroundType
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ChatBackground' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkChatBackground :: BackgroundType -> ChatBackground
mkChatBackground arg0 =
  MkChatBackground
    { type_ = arg0
    }

instance FromJSON ChatBackground where
  parseJSON = withObject "ChatBackground" $ \obj ->
    do
      field_0 <- requiredWith obj "type" parseJSON
      pure
        MkChatBackground
          { type_ = field_0
          }

instance ToJSON ChatBackground where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "type" x.type_
          ]
      )
  toEncoding = toEncoding . toJSON
