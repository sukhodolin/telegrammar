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
module Telegram.Bot.Internal.Group.KeyboardButtonRequestManagedBot
  ( KeyboardButtonRequestManagedBot (..)
  , mkKeyboardButtonRequestManagedBot
  ) where

import Data.Aeson (ToJSON (..))
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional)

-- | This object defines the parameters for the creation of a managed bot. Information about the created bot will be shared with the bot using the update managed_bot and a Message with the field managed_bot_created.
--
-- Source: <https://core.telegram.org/bots/api#keyboardbuttonrequestmanagedbot>.
-- Codec directions: encoded into requests.
data KeyboardButtonRequestManagedBot = MkKeyboardButtonRequestManagedBot
  { -- | Signed 32-bit identifier of the request. Must be unique within the message.
    --
    -- Wire key: @request_id@.
    request_id :: Int64
  , -- | Optional. Suggested name for the bot
    --
    -- Wire key: @suggested_name@.
    -- Omitted from an encoded request when it is @Nothing@.
    suggested_name :: Maybe Text
  , -- | Optional. Suggested username for the bot
    --
    -- Wire key: @suggested_username@.
    -- Omitted from an encoded request when it is @Nothing@.
    suggested_username :: Maybe Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'KeyboardButtonRequestManagedBot' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkKeyboardButtonRequestManagedBot :: Int64 -> KeyboardButtonRequestManagedBot
mkKeyboardButtonRequestManagedBot arg0 =
  MkKeyboardButtonRequestManagedBot
    { request_id = arg0
    , suggested_name = Nothing
    , suggested_username = Nothing
    }

instance ToJSON KeyboardButtonRequestManagedBot where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "request_id" x.request_id
          , jsonOptional "suggested_name" x.suggested_name
          , jsonOptional "suggested_username" x.suggested_username
          ]
      )
  toEncoding = toEncoding . toJSON
