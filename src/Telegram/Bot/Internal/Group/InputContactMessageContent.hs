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
module Telegram.Bot.Internal.Group.InputContactMessageContent
  ( InputContactMessageContent (..)
  , mkInputContactMessageContent
  ) where

import Data.Aeson (ToJSON (..))
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional)

-- | Represents the content of a contact message to be sent as the result of an inline query.
--
-- Source: <https://core.telegram.org/bots/api#inputcontactmessagecontent>.
-- Codec directions: encoded into requests.
data InputContactMessageContent = MkInputContactMessageContent
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
  , -- | Optional. Additional data about the contact in the form of a vCard, 0-2048 bytes
    --
    -- Wire key: @vcard@.
    -- Omitted from an encoded request when it is @Nothing@.
    vcard :: Maybe Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InputContactMessageContent' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputContactMessageContent :: Text -> Text -> InputContactMessageContent
mkInputContactMessageContent arg0 arg1 =
  MkInputContactMessageContent
    { phone_number = arg0
    , first_name = arg1
    , last_name = Nothing
    , vcard = Nothing
    }

instance ToJSON InputContactMessageContent where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "phone_number" x.phone_number
          , jsonField "first_name" x.first_name
          , jsonOptional "last_name" x.last_name
          , jsonOptional "vcard" x.vcard
          ]
      )
  toEncoding = toEncoding . toJSON
