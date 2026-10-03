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
module Telegram.Bot.Internal.Group.EncryptedCredentials
  ( EncryptedCredentials (..)
  , mkEncryptedCredentials
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonObject, requiredWith)

-- | Describes data required for decrypting and authenticating EncryptedPassportElement. See the Telegram Passport Documentation for a complete description of the data decryption and authentication processes.
--
-- Source: <https://core.telegram.org/bots/api#encryptedcredentials>.
-- Codec directions: decoded from responses, encoded into requests.
data EncryptedCredentials = MkEncryptedCredentials
  { -- | Base64-encoded encrypted JSON-serialized data with unique user\'s payload, data hashes and secrets required for EncryptedPassportElement decryption and authentication
    --
    -- Wire key: @data@.
    data_ :: Text
  , -- | Base64-encoded data hash for data authentication
    --
    -- Wire key: @hash@.
    hash :: Text
  , -- | Base64-encoded secret, encrypted with the bot\'s public RSA key, required for data decryption
    --
    -- Wire key: @secret@.
    secret :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'EncryptedCredentials' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkEncryptedCredentials :: Text -> Text -> Text -> EncryptedCredentials
mkEncryptedCredentials arg0 arg1 arg2 =
  MkEncryptedCredentials
    { data_ = arg0
    , hash = arg1
    , secret = arg2
    }

instance FromJSON EncryptedCredentials where
  parseJSON = withObject "EncryptedCredentials" $ \obj ->
    do
      field_0 <- requiredWith obj "data" parseJSON
      field_1 <- requiredWith obj "hash" parseJSON
      field_2 <- requiredWith obj "secret" parseJSON
      pure
        MkEncryptedCredentials
          { data_ = field_0
          , hash = field_1
          , secret = field_2
          }

instance ToJSON EncryptedCredentials where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "data" x.data_
          , jsonField "hash" x.hash
          , jsonField "secret" x.secret
          ]
      )
  toEncoding = toEncoding . toJSON
