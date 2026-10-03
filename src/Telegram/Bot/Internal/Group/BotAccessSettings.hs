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
module Telegram.Bot.Internal.Group.BotAccessSettings
  ( BotAccessSettings (..)
  , mkBotAccessSettings
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseList, requiredWith)

-- | This object describes the access settings of a bot.
--
-- Source: <https://core.telegram.org/bots/api#botaccesssettings>.
-- Codec directions: decoded from responses, encoded into requests.
data BotAccessSettings = MkBotAccessSettings
  { -- | True, if only selected users can access the bot. The bot\'s owner can always access it.
    --
    -- Wire key: @is_access_restricted@.
    is_access_restricted :: Bool
  , -- | Optional. The list of other users who have access to the bot if the access is restricted
    --
    -- Wire key: @added_users@.
    -- Omitted from an encoded request when it is @Nothing@.
    added_users :: Maybe [User]
  }
  deriving stock (Eq, Show)

-- | Initialize a 'BotAccessSettings' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkBotAccessSettings :: Bool -> BotAccessSettings
mkBotAccessSettings arg0 =
  MkBotAccessSettings
    { is_access_restricted = arg0
    , added_users = Nothing
    }

instance FromJSON BotAccessSettings where
  parseJSON = withObject "BotAccessSettings" $ \obj ->
    do
      field_0 <- requiredWith obj "is_access_restricted" parseJSON
      field_1 <- optionalWith obj "added_users" (parseList parseJSON)
      pure
        MkBotAccessSettings
          { is_access_restricted = field_0
          , added_users = field_1
          }

instance ToJSON BotAccessSettings where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "is_access_restricted" x.is_access_restricted
          , jsonOptional "added_users" x.added_users
          ]
      )
  toEncoding = toEncoding . toJSON
