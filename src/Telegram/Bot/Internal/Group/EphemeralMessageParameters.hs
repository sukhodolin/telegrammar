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
module Telegram.Bot.Internal.Group.EphemeralMessageParameters
  ( EphemeralMessageParameters (..)
  , mkEphemeralMessageParameters
  ) where

import Data.Aeson (ToJSON (..))
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional)

-- | Source: <https://core.telegram.org/bots/api#ephemeralmessageparameters>.
-- Codec directions: encoded into requests.
data EphemeralMessageParameters = MkEphemeralMessageParameters
  { -- | Identifier of the user who will receive the message. It is not guaranteed that the user will receive the message, especially if they are offline. See here for more details.
    --
    -- Wire key: @receiver_user_id@.
    receiver_user_id :: Int64
  , -- | Optional. Identifier of the callback query which triggered the message, if any
    --
    -- Wire key: @callback_query_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    callback_query_id :: Maybe Text
  , -- | Optional. Pass True if the ephemeral message must be shown in place of the original message. Must be False for callback queries from ephemeral messages, which must be edited using regular editEphemeralMessage... methods.
    --
    -- Wire key: @replace_callback_query_message@.
    -- Omitted from an encoded request when it is @Nothing@.
    replace_callback_query_message :: Maybe Bool
  }
  deriving stock (Eq, Show)

-- | Initialize a 'EphemeralMessageParameters' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkEphemeralMessageParameters :: Int64 -> EphemeralMessageParameters
mkEphemeralMessageParameters arg0 =
  MkEphemeralMessageParameters
    { receiver_user_id = arg0
    , callback_query_id = Nothing
    , replace_callback_query_message = Nothing
    }

instance ToJSON EphemeralMessageParameters where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "receiver_user_id" x.receiver_user_id
          , jsonOptional "callback_query_id" x.callback_query_id
          , jsonOptional "replace_callback_query_message" x.replace_callback_query_message
          ]
      )
  toEncoding = toEncoding . toJSON
