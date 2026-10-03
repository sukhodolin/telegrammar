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
module Telegram.Bot.Internal.Group.MessageAutoDeleteTimerChanged
  ( MessageAutoDeleteTimerChanged (..)
  , mkMessageAutoDeleteTimerChanged
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Support (jsonField, jsonObject, parseInt64, requiredWith)

-- | This object represents a service message about a change in auto-delete timer settings.
--
-- Source: <https://core.telegram.org/bots/api#messageautodeletetimerchanged>.
-- Codec directions: decoded from responses, encoded into requests.
data MessageAutoDeleteTimerChanged = MkMessageAutoDeleteTimerChanged
  { -- | New auto-delete time for messages in the chat; in seconds
    --
    -- Wire key: @message_auto_delete_time@.
    message_auto_delete_time :: Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'MessageAutoDeleteTimerChanged' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkMessageAutoDeleteTimerChanged :: Int64 -> MessageAutoDeleteTimerChanged
mkMessageAutoDeleteTimerChanged arg0 =
  MkMessageAutoDeleteTimerChanged
    { message_auto_delete_time = arg0
    }

instance FromJSON MessageAutoDeleteTimerChanged where
  parseJSON = withObject "MessageAutoDeleteTimerChanged" $ \obj ->
    do
      field_0 <- requiredWith obj "message_auto_delete_time" parseInt64
      pure
        MkMessageAutoDeleteTimerChanged
          { message_auto_delete_time = field_0
          }

instance ToJSON MessageAutoDeleteTimerChanged where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "message_auto_delete_time" x.message_auto_delete_time
          ]
      )
  toEncoding = toEncoding . toJSON
