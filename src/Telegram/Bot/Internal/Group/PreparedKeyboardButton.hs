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
module Telegram.Bot.Internal.Group.PreparedKeyboardButton
  ( PreparedKeyboardButton (..)
  , mkPreparedKeyboardButton
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonObject, requiredWith)

-- | Describes a keyboard button to be used by a user of a Mini App.
--
-- Source: <https://core.telegram.org/bots/api#preparedkeyboardbutton>.
-- Codec directions: decoded from responses, encoded into requests.
data PreparedKeyboardButton = MkPreparedKeyboardButton
  { -- | Unique identifier of the keyboard button
    --
    -- Wire key: @id@.
    id :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'PreparedKeyboardButton' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkPreparedKeyboardButton :: Text -> PreparedKeyboardButton
mkPreparedKeyboardButton arg0 =
  MkPreparedKeyboardButton
    { id = arg0
    }

instance FromJSON PreparedKeyboardButton where
  parseJSON = withObject "PreparedKeyboardButton" $ \obj ->
    do
      field_0 <- requiredWith obj "id" parseJSON
      pure
        MkPreparedKeyboardButton
          { id = field_0
          }

instance ToJSON PreparedKeyboardButton where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "id" x.id
          ]
      )
  toEncoding = toEncoding . toJSON
