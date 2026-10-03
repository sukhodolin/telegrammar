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
module Telegram.Bot.Internal.Group.MessageId
  ( MessageId (..)
  , mkMessageId
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Support (jsonField, jsonObject, parseInt64, requiredWith)

-- | This object represents a unique message identifier.
--
-- Source: <https://core.telegram.org/bots/api#messageid>.
-- Codec directions: decoded from responses, encoded into requests.
data MessageId = MkMessageId
  { -- | Unique message identifier. In specific instances (e.g., message containing a video sent to a big chat), the server might automatically schedule a message instead of sending it immediately. In such cases, this field will be 0 and the relevant message will be unusable until it is actually sent.
    --
    -- Wire key: @message_id@.
    message_id :: Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'MessageId' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkMessageId :: Int64 -> MessageId
mkMessageId arg0 =
  MkMessageId
    { message_id = arg0
    }

instance FromJSON MessageId where
  parseJSON = withObject "MessageId" $ \obj ->
    do
      field_0 <- requiredWith obj "message_id" parseInt64
      pure
        MkMessageId
          { message_id = field_0
          }

instance ToJSON MessageId where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "message_id" x.message_id
          ]
      )
  toEncoding = toEncoding . toJSON
