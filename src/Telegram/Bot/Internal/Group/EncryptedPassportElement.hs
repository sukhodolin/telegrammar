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
module Telegram.Bot.Internal.Group.EncryptedPassportElement
  ( EncryptedPassportElement (..)
  , mkEncryptedPassportElement
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.PassportFile (PassportFile)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseList, requiredWith)

-- | Describes documents or other Telegram Passport elements shared with the bot by the user.
--
-- Source: <https://core.telegram.org/bots/api#encryptedpassportelement>.
-- Codec directions: decoded from responses, encoded into requests.
data EncryptedPassportElement = MkEncryptedPassportElement
  { -- | Element type. One of \"personal_details\", \"passport\", \"driver_license\", \"identity_card\", \"internal_passport\", \"address\", \"utility_bill\", \"bank_statement\", \"rental_agreement\", \"passport_registration\", \"temporary_registration\", \"phone_number\", \"email\".
    --
    -- Wire key: @type@.
    type_ :: Text
  , -- | Optional. Base64-encoded encrypted Telegram Passport element data provided by the user; available only for \"personal_details\", \"passport\", \"driver_license\", \"identity_card\", \"internal_passport\" and \"address\" types. Can be decrypted and verified using the accompanying EncryptedCredentials.
    --
    -- Wire key: @data@.
    -- Omitted from an encoded request when it is @Nothing@.
    data_ :: Maybe Text
  , -- | Optional. User\'s verified phone number; available only for \"phone_number\" type
    --
    -- Wire key: @phone_number@.
    -- Omitted from an encoded request when it is @Nothing@.
    phone_number :: Maybe Text
  , -- | Optional. User\'s verified email address; available only for \"email\" type
    --
    -- Wire key: @email@.
    -- Omitted from an encoded request when it is @Nothing@.
    email :: Maybe Text
  , -- | Optional. Array of encrypted files with documents provided by the user; available only for \"utility_bill\", \"bank_statement\", \"rental_agreement\", \"passport_registration\" and \"temporary_registration\" types. Files can be decrypted and verified using the accompanying EncryptedCredentials.
    --
    -- Wire key: @files@.
    -- Omitted from an encoded request when it is @Nothing@.
    files :: Maybe [PassportFile]
  , -- | Optional. Encrypted file with the front side of the document, provided by the user; available only for \"passport\", \"driver_license\", \"identity_card\" and \"internal_passport\". The file can be decrypted and verified using the accompanying EncryptedCredentials.
    --
    -- Wire key: @front_side@.
    -- Omitted from an encoded request when it is @Nothing@.
    front_side :: Maybe PassportFile
  , -- | Optional. Encrypted file with the reverse side of the document, provided by the user; available only for \"driver_license\" and \"identity_card\". The file can be decrypted and verified using the accompanying EncryptedCredentials.
    --
    -- Wire key: @reverse_side@.
    -- Omitted from an encoded request when it is @Nothing@.
    reverse_side :: Maybe PassportFile
  , -- | Optional. Encrypted file with the selfie of the user holding a document, provided by the user; available if requested for \"passport\", \"driver_license\", \"identity_card\" and \"internal_passport\". The file can be decrypted and verified using the accompanying EncryptedCredentials.
    --
    -- Wire key: @selfie@.
    -- Omitted from an encoded request when it is @Nothing@.
    selfie :: Maybe PassportFile
  , -- | Optional. Array of encrypted files with translated versions of documents provided by the user; available if requested for \"passport\", \"driver_license\", \"identity_card\", \"internal_passport\", \"utility_bill\", \"bank_statement\", \"rental_agreement\", \"passport_registration\" and \"temporary_registration\" types. Files can be decrypted and verified using the accompanying EncryptedCredentials.
    --
    -- Wire key: @translation@.
    -- Omitted from an encoded request when it is @Nothing@.
    translation :: Maybe [PassportFile]
  , -- | Base64-encoded element hash for using in PassportElementErrorUnspecified
    --
    -- Wire key: @hash@.
    hash :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'EncryptedPassportElement' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkEncryptedPassportElement :: Text -> Text -> EncryptedPassportElement
mkEncryptedPassportElement arg0 arg1 =
  MkEncryptedPassportElement
    { type_ = arg0
    , data_ = Nothing
    , phone_number = Nothing
    , email = Nothing
    , files = Nothing
    , front_side = Nothing
    , reverse_side = Nothing
    , selfie = Nothing
    , translation = Nothing
    , hash = arg1
    }

instance FromJSON EncryptedPassportElement where
  parseJSON = withObject "EncryptedPassportElement" $ \obj ->
    do
      field_0 <- requiredWith obj "type" parseJSON
      field_1 <- optionalWith obj "data" parseJSON
      field_2 <- optionalWith obj "phone_number" parseJSON
      field_3 <- optionalWith obj "email" parseJSON
      field_4 <- optionalWith obj "files" (parseList parseJSON)
      field_5 <- optionalWith obj "front_side" parseJSON
      field_6 <- optionalWith obj "reverse_side" parseJSON
      field_7 <- optionalWith obj "selfie" parseJSON
      field_8 <- optionalWith obj "translation" (parseList parseJSON)
      field_9 <- requiredWith obj "hash" parseJSON
      pure
        MkEncryptedPassportElement
          { type_ = field_0
          , data_ = field_1
          , phone_number = field_2
          , email = field_3
          , files = field_4
          , front_side = field_5
          , reverse_side = field_6
          , selfie = field_7
          , translation = field_8
          , hash = field_9
          }

instance ToJSON EncryptedPassportElement where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "type" x.type_
          , jsonOptional "data" x.data_
          , jsonOptional "phone_number" x.phone_number
          , jsonOptional "email" x.email
          , jsonOptional "files" x.files
          , jsonOptional "front_side" x.front_side
          , jsonOptional "reverse_side" x.reverse_side
          , jsonOptional "selfie" x.selfie
          , jsonOptional "translation" x.translation
          , jsonField "hash" x.hash
          ]
      )
  toEncoding = toEncoding . toJSON
