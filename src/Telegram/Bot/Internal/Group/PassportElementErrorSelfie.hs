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
module Telegram.Bot.Internal.Group.PassportElementErrorSelfie
  ( PassportElementErrorSelfie (..)
  , mkPassportElementErrorSelfie
  ) where

import Data.Aeson (ToJSON (..), Value (..))
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonLiteral, jsonObject)

-- | Represents an issue with the selfie with a document. The error is considered resolved when the file with the selfie changes.
--
-- Source: <https://core.telegram.org/bots/api#passportelementerrorselfie>.
-- Codec directions: encoded into requests.
--
-- Supplied constants: @source@ = @"selfie"@.
data PassportElementErrorSelfie = MkPassportElementErrorSelfie
  { -- | The section of the user\'s Telegram Passport which has the issue, one of \"passport\", \"driver_license\", \"identity_card\", \"internal_passport\"
    --
    -- Wire key: @type@.
    type_ :: Text
  , -- | Base64-encoded hash of the file with the selfie
    --
    -- Wire key: @file_hash@.
    file_hash :: Text
  , -- | Error message
    --
    -- Wire key: @message@.
    message :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'PassportElementErrorSelfie' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkPassportElementErrorSelfie :: Text -> Text -> Text -> PassportElementErrorSelfie
mkPassportElementErrorSelfie arg0 arg1 arg2 =
  MkPassportElementErrorSelfie
    { type_ = arg0
    , file_hash = arg1
    , message = arg2
    }

instance ToJSON PassportElementErrorSelfie where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "source" (String "selfie")
          , jsonField "type" x.type_
          , jsonField "file_hash" x.file_hash
          , jsonField "message" x.message
          ]
      )
  toEncoding = toEncoding . toJSON
