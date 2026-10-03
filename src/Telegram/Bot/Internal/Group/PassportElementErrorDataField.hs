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
module Telegram.Bot.Internal.Group.PassportElementErrorDataField
  ( PassportElementErrorDataField (..)
  , mkPassportElementErrorDataField
  ) where

import Data.Aeson (ToJSON (..), Value (..))
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonLiteral, jsonObject)

-- | Represents an issue in one of the data fields that was provided by the user. The error is considered resolved when the field\'s value changes.
--
-- Source: <https://core.telegram.org/bots/api#passportelementerrordatafield>.
-- Codec directions: encoded into requests.
--
-- Supplied constants: @source@ = @"data"@.
data PassportElementErrorDataField = MkPassportElementErrorDataField
  { -- | The section of the user\'s Telegram Passport which has the error, one of \"personal_details\", \"passport\", \"driver_license\", \"identity_card\", \"internal_passport\", \"address\"
    --
    -- Wire key: @type@.
    type_ :: Text
  , -- | Name of the data field which has the error
    --
    -- Wire key: @field_name@.
    field_name :: Text
  , -- | Base64-encoded data hash
    --
    -- Wire key: @data_hash@.
    data_hash :: Text
  , -- | Error message
    --
    -- Wire key: @message@.
    message :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'PassportElementErrorDataField' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkPassportElementErrorDataField :: Text -> Text -> Text -> Text -> PassportElementErrorDataField
mkPassportElementErrorDataField arg0 arg1 arg2 arg3 =
  MkPassportElementErrorDataField
    { type_ = arg0
    , field_name = arg1
    , data_hash = arg2
    , message = arg3
    }

instance ToJSON PassportElementErrorDataField where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "source" (String "data")
          , jsonField "type" x.type_
          , jsonField "field_name" x.field_name
          , jsonField "data_hash" x.data_hash
          , jsonField "message" x.message
          ]
      )
  toEncoding = toEncoding . toJSON
