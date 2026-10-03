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
module Telegram.Bot.Internal.Group.SharedUser
  ( SharedUser (..)
  , mkSharedUser
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.PhotoSize (PhotoSize)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseInt64, parseList, requiredWith)

-- | This object contains information about a user that was shared with the bot using a KeyboardButtonRequestUsers button.
--
-- Source: <https://core.telegram.org/bots/api#shareduser>.
-- Codec directions: decoded from responses, encoded into requests.
data SharedUser = MkSharedUser
  { -- | Identifier of the shared user. This number may have more than 32 significant bits and some programming languages may have difficulty\/silent defects in interpreting it. But it has at most 52 significant bits, so 64-bit integers or double-precision float types are safe for storing these identifiers. The bot may not have access to the user and could be unable to use this identifier, unless the user is already known to the bot by some other means.
    --
    -- Wire key: @user_id@.
    user_id :: Int64
  , -- | Optional. First name of the user, if the name was requested by the bot
    --
    -- Wire key: @first_name@.
    -- Omitted from an encoded request when it is @Nothing@.
    first_name :: Maybe Text
  , -- | Optional. Last name of the user, if the name was requested by the bot
    --
    -- Wire key: @last_name@.
    -- Omitted from an encoded request when it is @Nothing@.
    last_name :: Maybe Text
  , -- | Optional. Username of the user, if the username was requested by the bot
    --
    -- Wire key: @username@.
    -- Omitted from an encoded request when it is @Nothing@.
    username :: Maybe Text
  , -- | Optional. Available sizes of the chat photo, if the photo was requested by the bot
    --
    -- Wire key: @photo@.
    -- Omitted from an encoded request when it is @Nothing@.
    photo :: Maybe [PhotoSize]
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SharedUser' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSharedUser :: Int64 -> SharedUser
mkSharedUser arg0 =
  MkSharedUser
    { user_id = arg0
    , first_name = Nothing
    , last_name = Nothing
    , username = Nothing
    , photo = Nothing
    }

instance FromJSON SharedUser where
  parseJSON = withObject "SharedUser" $ \obj ->
    do
      field_0 <- requiredWith obj "user_id" parseInt64
      field_1 <- optionalWith obj "first_name" parseJSON
      field_2 <- optionalWith obj "last_name" parseJSON
      field_3 <- optionalWith obj "username" parseJSON
      field_4 <- optionalWith obj "photo" (parseList parseJSON)
      pure
        MkSharedUser
          { user_id = field_0
          , first_name = field_1
          , last_name = field_2
          , username = field_3
          , photo = field_4
          }

instance ToJSON SharedUser where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "user_id" x.user_id
          , jsonOptional "first_name" x.first_name
          , jsonOptional "last_name" x.last_name
          , jsonOptional "username" x.username
          , jsonOptional "photo" x.photo
          ]
      )
  toEncoding = toEncoding . toJSON
