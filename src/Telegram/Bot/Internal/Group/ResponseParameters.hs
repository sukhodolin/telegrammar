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
module Telegram.Bot.Internal.Group.ResponseParameters
  ( ResponseParameters (..)
  , mkResponseParameters
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Support (jsonObject, jsonOptional, optionalWith, parseInt64)

-- | Describes why a request was unsuccessful.
--
-- Source: <https://core.telegram.org/bots/api#responseparameters>.
-- Codec directions: decoded from responses, encoded into requests.
data ResponseParameters = MkResponseParameters
  { -- | Optional. The group has been migrated to a supergroup with the specified identifier. This number may have more than 32 significant bits and some programming languages may have difficulty\/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this identifier.
    --
    -- Wire key: @migrate_to_chat_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    migrate_to_chat_id :: Maybe Int64
  , -- | Optional. In case of exceeding flood control, the number of seconds left to wait before the request can be repeated
    --
    -- Wire key: @retry_after@.
    -- Omitted from an encoded request when it is @Nothing@.
    retry_after :: Maybe Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ResponseParameters' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkResponseParameters :: ResponseParameters
mkResponseParameters =
  MkResponseParameters
    { migrate_to_chat_id = Nothing
    , retry_after = Nothing
    }

instance FromJSON ResponseParameters where
  parseJSON = withObject "ResponseParameters" $ \obj ->
    do
      field_0 <- optionalWith obj "migrate_to_chat_id" parseInt64
      field_1 <- optionalWith obj "retry_after" parseInt64
      pure
        MkResponseParameters
          { migrate_to_chat_id = field_0
          , retry_after = field_1
          }

instance ToJSON ResponseParameters where
  toJSON x =
    jsonObject
      ( concat
          [ jsonOptional "migrate_to_chat_id" x.migrate_to_chat_id
          , jsonOptional "retry_after" x.retry_after
          ]
      )
  toEncoding = toEncoding . toJSON
