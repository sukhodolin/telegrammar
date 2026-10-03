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
module Telegram.Bot.Internal.Group.BusinessConnection
  ( BusinessConnection (..)
  , mkBusinessConnection
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.BusinessBotRights (BusinessBotRights)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseInt64, requiredWith)

-- | Describes the connection of the bot with a business account.
--
-- Source: <https://core.telegram.org/bots/api#businessconnection>.
-- Codec directions: decoded from responses, encoded into requests.
data BusinessConnection = MkBusinessConnection
  { -- | Unique identifier of the business connection
    --
    -- Wire key: @id@.
    id :: Text
  , -- | Business account user that created the business connection
    --
    -- Wire key: @user@.
    user :: User
  , -- | Identifier of a private chat with the user who created the business connection. This number may have more than 32 significant bits and some programming languages may have difficulty\/silent defects in interpreting it. But it has at most 52 significant bits, so a 64-bit integer or double-precision float type are safe for storing this identifier.
    --
    -- Wire key: @user_chat_id@.
    user_chat_id :: Int64
  , -- | Date the connection was established in Unix time
    --
    -- Wire key: @date@.
    date :: Int64
  , -- | Optional. Rights of the business bot
    --
    -- Wire key: @rights@.
    -- Omitted from an encoded request when it is @Nothing@.
    rights :: Maybe BusinessBotRights
  , -- | True, if the connection is active
    --
    -- Wire key: @is_enabled@.
    is_enabled :: Bool
  }
  deriving stock (Eq, Show)

-- | Initialize a 'BusinessConnection' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkBusinessConnection :: Text -> User -> Int64 -> Int64 -> Bool -> BusinessConnection
mkBusinessConnection arg0 arg1 arg2 arg3 arg4 =
  MkBusinessConnection
    { id = arg0
    , user = arg1
    , user_chat_id = arg2
    , date = arg3
    , rights = Nothing
    , is_enabled = arg4
    }

instance FromJSON BusinessConnection where
  parseJSON = withObject "BusinessConnection" $ \obj ->
    do
      field_0 <- requiredWith obj "id" parseJSON
      field_1 <- requiredWith obj "user" parseJSON
      field_2 <- requiredWith obj "user_chat_id" parseInt64
      field_3 <- requiredWith obj "date" parseInt64
      field_4 <- optionalWith obj "rights" parseJSON
      field_5 <- requiredWith obj "is_enabled" parseJSON
      pure
        MkBusinessConnection
          { id = field_0
          , user = field_1
          , user_chat_id = field_2
          , date = field_3
          , rights = field_4
          , is_enabled = field_5
          }

instance ToJSON BusinessConnection where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "id" x.id
          , jsonField "user" x.user
          , jsonField "user_chat_id" x.user_chat_id
          , jsonField "date" x.date
          , jsonOptional "rights" x.rights
          , jsonField "is_enabled" x.is_enabled
          ]
      )
  toEncoding = toEncoding . toJSON
