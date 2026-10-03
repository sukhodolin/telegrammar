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
module Telegram.Bot.Internal.Group.Link
  ( Link (..)
  , mkLink
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonObject, requiredWith)

-- | Represents an HTTP link.
--
-- Source: <https://core.telegram.org/bots/api#link>.
-- Codec directions: decoded from responses, encoded into requests.
data Link = MkLink
  { -- | URL of the link
    --
    -- Wire key: @url@.
    url :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'Link' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkLink :: Text -> Link
mkLink arg0 =
  MkLink
    { url = arg0
    }

instance FromJSON Link where
  parseJSON = withObject "Link" $ \obj ->
    do
      field_0 <- requiredWith obj "url" parseJSON
      pure
        MkLink
          { url = field_0
          }

instance ToJSON Link where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "url" x.url
          ]
      )
  toEncoding = toEncoding . toJSON
