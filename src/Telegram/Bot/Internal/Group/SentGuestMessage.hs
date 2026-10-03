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
module Telegram.Bot.Internal.Group.SentGuestMessage
  ( SentGuestMessage (..)
  , mkSentGuestMessage
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonObject, requiredWith)

-- | Describes an inline message sent by a guest bot.
--
-- Source: <https://core.telegram.org/bots/api#sentguestmessage>.
-- Codec directions: decoded from responses, encoded into requests.
data SentGuestMessage = MkSentGuestMessage
  { -- | Identifier of the sent inline message
    --
    -- Wire key: @inline_message_id@.
    inline_message_id :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SentGuestMessage' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSentGuestMessage :: Text -> SentGuestMessage
mkSentGuestMessage arg0 =
  MkSentGuestMessage
    { inline_message_id = arg0
    }

instance FromJSON SentGuestMessage where
  parseJSON = withObject "SentGuestMessage" $ \obj ->
    do
      field_0 <- requiredWith obj "inline_message_id" parseJSON
      pure
        MkSentGuestMessage
          { inline_message_id = field_0
          }

instance ToJSON SentGuestMessage where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "inline_message_id" x.inline_message_id
          ]
      )
  toEncoding = toEncoding . toJSON
