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
module Telegram.Bot.Internal.Group.MessageOriginUser
  ( MessageOriginUser (..)
  , mkMessageOriginUser
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonLiteral, jsonObject, parseInt64, requiredWith)

-- | The message was originally sent by a known user.
--
-- Source: <https://core.telegram.org/bots/api#messageoriginuser>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"user"@.
data MessageOriginUser = MkMessageOriginUser
  { -- | Date the message was sent originally in Unix time
    --
    -- Wire key: @date@.
    date :: Int64
  , -- | User that sent the message originally
    --
    -- Wire key: @sender_user@.
    sender_user :: User
  }
  deriving stock (Eq, Show)

-- | Initialize a 'MessageOriginUser' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkMessageOriginUser :: Int64 -> User -> MessageOriginUser
mkMessageOriginUser arg0 arg1 =
  MkMessageOriginUser
    { date = arg0
    , sender_user = arg1
    }

instance FromJSON MessageOriginUser where
  parseJSON = withObject "MessageOriginUser" $ \obj ->
    do
      checkStringConstant obj "type" "user"
      field_1 <- requiredWith obj "date" parseInt64
      field_2 <- requiredWith obj "sender_user" parseJSON
      pure
        MkMessageOriginUser
          { date = field_1
          , sender_user = field_2
          }

instance ToJSON MessageOriginUser where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "user")
          , jsonField "date" x.date
          , jsonField "sender_user" x.sender_user
          ]
      )
  toEncoding = toEncoding . toJSON
