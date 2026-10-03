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
module Telegram.Bot.Internal.Group.ManagedBotCreated
  ( ManagedBotCreated (..)
  , mkManagedBotCreated
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Support (jsonField, jsonObject, requiredWith)

-- | This object contains information about the bot that was created to be managed by the current bot.
--
-- Source: <https://core.telegram.org/bots/api#managedbotcreated>.
-- Codec directions: decoded from responses, encoded into requests.
data ManagedBotCreated = MkManagedBotCreated
  { -- | Information about the bot. The bot\'s token can be fetched using the method getManagedBotToken.
    --
    -- Wire key: @bot@.
    bot :: User
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ManagedBotCreated' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkManagedBotCreated :: User -> ManagedBotCreated
mkManagedBotCreated arg0 =
  MkManagedBotCreated
    { bot = arg0
    }

instance FromJSON ManagedBotCreated where
  parseJSON = withObject "ManagedBotCreated" $ \obj ->
    do
      field_0 <- requiredWith obj "bot" parseJSON
      pure
        MkManagedBotCreated
          { bot = field_0
          }

instance ToJSON ManagedBotCreated where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "bot" x.bot
          ]
      )
  toEncoding = toEncoding . toJSON
