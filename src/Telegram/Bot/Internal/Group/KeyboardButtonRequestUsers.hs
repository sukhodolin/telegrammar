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
module Telegram.Bot.Internal.Group.KeyboardButtonRequestUsers
  ( KeyboardButtonRequestUsers (..)
  , mkKeyboardButtonRequestUsers
  ) where

import Data.Aeson (ToJSON (..))
import Data.Int (Int64)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional)

-- | This object defines the criteria used to request suitable users. Information about the selected users will be shared with the bot when the corresponding button is pressed. More about requesting users: https:\/\/core.telegram.org\/bots\/features\#chat-and-user-selection
--
-- Source: <https://core.telegram.org/bots/api#keyboardbuttonrequestusers>.
-- Codec directions: encoded into requests.
data KeyboardButtonRequestUsers = MkKeyboardButtonRequestUsers
  { -- | Signed 32-bit identifier of the request that will be received back in the UsersShared object. Must be unique within the message.
    --
    -- Wire key: @request_id@.
    request_id :: Int64
  , -- | Optional. Pass True to request bots, pass False to request regular users. If not specified, no additional restrictions are applied.
    --
    -- Wire key: @user_is_bot@.
    -- Omitted from an encoded request when it is @Nothing@.
    user_is_bot :: Maybe Bool
  , -- | Optional. Pass True to request premium users, pass False to request non-premium users. If not specified, no additional restrictions are applied.
    --
    -- Wire key: @user_is_premium@.
    -- Omitted from an encoded request when it is @Nothing@.
    user_is_premium :: Maybe Bool
  , -- | Optional. The maximum number of users to be selected; 1-10. Defaults to 1.
    --
    -- Wire key: @max_quantity@.
    -- Omitted from an encoded request when it is @Nothing@.
    max_quantity :: Maybe Int64
  , -- | Optional. Pass True to request the users\' first and last names
    --
    -- Wire key: @request_name@.
    -- Omitted from an encoded request when it is @Nothing@.
    request_name :: Maybe Bool
  , -- | Optional. Pass True to request the users\' usernames
    --
    -- Wire key: @request_username@.
    -- Omitted from an encoded request when it is @Nothing@.
    request_username :: Maybe Bool
  , -- | Optional. Pass True to request the users\' photos
    --
    -- Wire key: @request_photo@.
    -- Omitted from an encoded request when it is @Nothing@.
    request_photo :: Maybe Bool
  }
  deriving stock (Eq, Show)

-- | Initialize a 'KeyboardButtonRequestUsers' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkKeyboardButtonRequestUsers :: Int64 -> KeyboardButtonRequestUsers
mkKeyboardButtonRequestUsers arg0 =
  MkKeyboardButtonRequestUsers
    { request_id = arg0
    , user_is_bot = Nothing
    , user_is_premium = Nothing
    , max_quantity = Nothing
    , request_name = Nothing
    , request_username = Nothing
    , request_photo = Nothing
    }

instance ToJSON KeyboardButtonRequestUsers where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "request_id" x.request_id
          , jsonOptional "user_is_bot" x.user_is_bot
          , jsonOptional "user_is_premium" x.user_is_premium
          , jsonOptional "max_quantity" x.max_quantity
          , jsonOptional "request_name" x.request_name
          , jsonOptional "request_username" x.request_username
          , jsonOptional "request_photo" x.request_photo
          ]
      )
  toEncoding = toEncoding . toJSON
