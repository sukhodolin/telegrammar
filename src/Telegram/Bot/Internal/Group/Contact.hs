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
module Telegram.Bot.Internal.Group.Contact
  ( Contact (..)
  , mkContact
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseInt64, requiredWith)

-- | This object represents a phone contact.
--
-- Source: <https://core.telegram.org/bots/api#contact>.
-- Codec directions: decoded from responses, encoded into requests.
data Contact = MkContact
  { -- | Contact\'s phone number
    --
    -- Wire key: @phone_number@.
    phone_number :: Text
  , -- | Contact\'s first name
    --
    -- Wire key: @first_name@.
    first_name :: Text
  , -- | Optional. Contact\'s last name
    --
    -- Wire key: @last_name@.
    -- Omitted from an encoded request when it is @Nothing@.
    last_name :: Maybe Text
  , -- | Optional. Contact\'s user identifier in Telegram. This number may have more than 32 significant bits and some programming languages may have difficulty\/silent defects in interpreting it. But it has at most 52 significant bits, so a 64-bit integer or double-precision float type are safe for storing this identifier.
    --
    -- Wire key: @user_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    user_id :: Maybe Int64
  , -- | Optional. Additional data about the contact in the form of a vCard
    --
    -- Wire key: @vcard@.
    -- Omitted from an encoded request when it is @Nothing@.
    vcard :: Maybe Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'Contact' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkContact :: Text -> Text -> Contact
mkContact arg0 arg1 =
  MkContact
    { phone_number = arg0
    , first_name = arg1
    , last_name = Nothing
    , user_id = Nothing
    , vcard = Nothing
    }

instance FromJSON Contact where
  parseJSON = withObject "Contact" $ \obj ->
    do
      field_0 <- requiredWith obj "phone_number" parseJSON
      field_1 <- requiredWith obj "first_name" parseJSON
      field_2 <- optionalWith obj "last_name" parseJSON
      field_3 <- optionalWith obj "user_id" parseInt64
      field_4 <- optionalWith obj "vcard" parseJSON
      pure
        MkContact
          { phone_number = field_0
          , first_name = field_1
          , last_name = field_2
          , user_id = field_3
          , vcard = field_4
          }

instance ToJSON Contact where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "phone_number" x.phone_number
          , jsonField "first_name" x.first_name
          , jsonOptional "last_name" x.last_name
          , jsonOptional "user_id" x.user_id
          , jsonOptional "vcard" x.vcard
          ]
      )
  toEncoding = toEncoding . toJSON
