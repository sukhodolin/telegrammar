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
module Telegram.Bot.Internal.Group.UsersShared
  ( UsersShared (..)
  , mkUsersShared
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.SharedUser (SharedUser)
import Telegram.Bot.Support (jsonField, jsonObject, parseInt64, parseList, requiredWith)

-- | This object contains information about the users whose identifiers were shared with the bot using a KeyboardButtonRequestUsers button.
--
-- Source: <https://core.telegram.org/bots/api#usersshared>.
-- Codec directions: decoded from responses, encoded into requests.
data UsersShared = MkUsersShared
  { -- | Identifier of the request
    --
    -- Wire key: @request_id@.
    request_id :: Int64
  , -- | Information about users shared with the bot
    --
    -- Wire key: @users@.
    users :: [SharedUser]
  }
  deriving stock (Eq, Show)

-- | Initialize a 'UsersShared' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkUsersShared :: Int64 -> [SharedUser] -> UsersShared
mkUsersShared arg0 arg1 =
  MkUsersShared
    { request_id = arg0
    , users = arg1
    }

instance FromJSON UsersShared where
  parseJSON = withObject "UsersShared" $ \obj ->
    do
      field_0 <- requiredWith obj "request_id" parseInt64
      field_1 <- requiredWith obj "users" (parseList parseJSON)
      pure
        MkUsersShared
          { request_id = field_0
          , users = field_1
          }

instance ToJSON UsersShared where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "request_id" x.request_id
          , jsonField "users" x.users
          ]
      )
  toEncoding = toEncoding . toJSON
