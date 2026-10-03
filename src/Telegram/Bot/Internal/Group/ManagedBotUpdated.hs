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
module Telegram.Bot.Internal.Group.ManagedBotUpdated
  ( ManagedBotUpdated (..)
  , mkManagedBotUpdated
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Support (jsonField, jsonObject, requiredWith)

-- | This object contains information about the creation, token update, or owner update of a bot that is managed by the current bot.
--
-- Source: <https://core.telegram.org/bots/api#managedbotupdated>.
-- Codec directions: decoded from responses, encoded into requests.
data ManagedBotUpdated = MkManagedBotUpdated
  { -- | User that created the bot
    --
    -- Wire key: @user@.
    user :: User
  , -- | Information about the bot. Token of the bot can be fetched using the method getManagedBotToken.
    --
    -- Wire key: @bot@.
    bot :: User
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ManagedBotUpdated' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkManagedBotUpdated :: User -> User -> ManagedBotUpdated
mkManagedBotUpdated arg0 arg1 =
  MkManagedBotUpdated
    { user = arg0
    , bot = arg1
    }

instance FromJSON ManagedBotUpdated where
  parseJSON = withObject "ManagedBotUpdated" $ \obj ->
    do
      field_0 <- requiredWith obj "user" parseJSON
      field_1 <- requiredWith obj "bot" parseJSON
      pure
        MkManagedBotUpdated
          { user = field_0
          , bot = field_1
          }

instance ToJSON ManagedBotUpdated where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "user" x.user
          , jsonField "bot" x.bot
          ]
      )
  toEncoding = toEncoding . toJSON
