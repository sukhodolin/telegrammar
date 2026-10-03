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
module Telegram.Bot.Internal.Group.KeyboardButtonPollType
  ( KeyboardButtonPollType (..)
  , mkKeyboardButtonPollType
  ) where

import Data.Aeson (ToJSON (..))
import Data.Text (Text)
import Telegram.Bot.Support (jsonObject, jsonOptional)

-- | This object represents type of a poll, which is allowed to be created and sent when the corresponding button is pressed.
--
-- Source: <https://core.telegram.org/bots/api#keyboardbuttonpolltype>.
-- Codec directions: encoded into requests.
data KeyboardButtonPollType = MkKeyboardButtonPollType
  { -- | Optional. If quiz is passed, the user will be allowed to create only polls in the quiz mode. If regular is passed, only regular polls will be allowed. Otherwise, the user will be allowed to create a poll of any type.
    --
    -- Wire key: @type@.
    -- Omitted from an encoded request when it is @Nothing@.
    type_ :: Maybe Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'KeyboardButtonPollType' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkKeyboardButtonPollType :: KeyboardButtonPollType
mkKeyboardButtonPollType =
  MkKeyboardButtonPollType
    { type_ = Nothing
    }

instance ToJSON KeyboardButtonPollType where
  toJSON x =
    jsonObject
      ( concat
          [ jsonOptional "type" x.type_
          ]
      )
  toEncoding = toEncoding . toJSON
