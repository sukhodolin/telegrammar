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
module Telegram.Bot.Internal.Group.PassportElementErrorUnspecified
  ( PassportElementErrorUnspecified (..)
  , mkPassportElementErrorUnspecified
  ) where

import Data.Aeson (ToJSON (..), Value (..))
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonLiteral, jsonObject)

-- | Represents an issue in an unspecified place. The error is considered resolved when new data is added.
--
-- Source: <https://core.telegram.org/bots/api#passportelementerrorunspecified>.
-- Codec directions: encoded into requests.
--
-- Supplied constants: @source@ = @"unspecified"@.
data PassportElementErrorUnspecified = MkPassportElementErrorUnspecified
  { -- | Type of element of the user\'s Telegram Passport which has the issue
    --
    -- Wire key: @type@.
    type_ :: Text
  , -- | Base64-encoded element hash
    --
    -- Wire key: @element_hash@.
    element_hash :: Text
  , -- | Error message
    --
    -- Wire key: @message@.
    message :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'PassportElementErrorUnspecified' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkPassportElementErrorUnspecified :: Text -> Text -> Text -> PassportElementErrorUnspecified
mkPassportElementErrorUnspecified arg0 arg1 arg2 =
  MkPassportElementErrorUnspecified
    { type_ = arg0
    , element_hash = arg1
    , message = arg2
    }

instance ToJSON PassportElementErrorUnspecified where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "source" (String "unspecified")
          , jsonField "type" x.type_
          , jsonField "element_hash" x.element_hash
          , jsonField "message" x.message
          ]
      )
  toEncoding = toEncoding . toJSON
