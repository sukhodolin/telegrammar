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
module Telegram.Bot.Internal.Group.PassportElementErrorTranslationFiles
  ( PassportElementErrorTranslationFiles (..)
  , mkPassportElementErrorTranslationFiles
  ) where

import Data.Aeson (ToJSON (..), Value (..))
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonLiteral, jsonObject)

-- | Represents an issue with the translated version of a document. The error is considered resolved when a file with the document translation change.
--
-- Source: <https://core.telegram.org/bots/api#passportelementerrortranslationfiles>.
-- Codec directions: encoded into requests.
--
-- Supplied constants: @source@ = @"translation_files"@.
data PassportElementErrorTranslationFiles = MkPassportElementErrorTranslationFiles
  { -- | Type of element of the user\'s Telegram Passport which has the issue, one of \"passport\", \"driver_license\", \"identity_card\", \"internal_passport\", \"utility_bill\", \"bank_statement\", \"rental_agreement\", \"passport_registration\", \"temporary_registration\"
    --
    -- Wire key: @type@.
    type_ :: Text
  , -- | List of base64-encoded file hashes
    --
    -- Wire key: @file_hashes@.
    file_hashes :: [Text]
  , -- | Error message
    --
    -- Wire key: @message@.
    message :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'PassportElementErrorTranslationFiles' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkPassportElementErrorTranslationFiles :: Text -> [Text] -> Text -> PassportElementErrorTranslationFiles
mkPassportElementErrorTranslationFiles arg0 arg1 arg2 =
  MkPassportElementErrorTranslationFiles
    { type_ = arg0
    , file_hashes = arg1
    , message = arg2
    }

instance ToJSON PassportElementErrorTranslationFiles where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "source" (String "translation_files")
          , jsonField "type" x.type_
          , jsonField "file_hashes" x.file_hashes
          , jsonField "message" x.message
          ]
      )
  toEncoding = toEncoding . toJSON
