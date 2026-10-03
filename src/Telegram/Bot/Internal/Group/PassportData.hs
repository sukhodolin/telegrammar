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
module Telegram.Bot.Internal.Group.PassportData
  ( PassportData (..)
  , mkPassportData
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Telegram.Bot.Internal.Group.EncryptedCredentials (EncryptedCredentials)
import Telegram.Bot.Internal.Group.EncryptedPassportElement (EncryptedPassportElement)
import Telegram.Bot.Support (jsonField, jsonObject, parseList, requiredWith)

-- | Describes Telegram Passport data shared with the bot by the user.
--
-- Source: <https://core.telegram.org/bots/api#passportdata>.
-- Codec directions: decoded from responses, encoded into requests.
data PassportData = MkPassportData
  { -- | Array with information about documents and other Telegram Passport elements that was shared with the bot
    --
    -- Wire key: @data@.
    data_ :: [EncryptedPassportElement]
  , -- | Encrypted credentials required to decrypt the data
    --
    -- Wire key: @credentials@.
    credentials :: EncryptedCredentials
  }
  deriving stock (Eq, Show)

-- | Initialize a 'PassportData' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkPassportData :: [EncryptedPassportElement] -> EncryptedCredentials -> PassportData
mkPassportData arg0 arg1 =
  MkPassportData
    { data_ = arg0
    , credentials = arg1
    }

instance FromJSON PassportData where
  parseJSON = withObject "PassportData" $ \obj ->
    do
      field_0 <- requiredWith obj "data" (parseList parseJSON)
      field_1 <- requiredWith obj "credentials" parseJSON
      pure
        MkPassportData
          { data_ = field_0
          , credentials = field_1
          }

instance ToJSON PassportData where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "data" x.data_
          , jsonField "credentials" x.credentials
          ]
      )
  toEncoding = toEncoding . toJSON
