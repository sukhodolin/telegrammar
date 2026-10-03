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
module Telegram.Bot.Internal.Group.ChatBoostSourcePremium
  ( ChatBoostSourcePremium (..)
  , mkChatBoostSourcePremium
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonLiteral, jsonObject, requiredWith)

-- | The boost was obtained by subscribing to Telegram Premium or by gifting a Telegram Premium subscription to another user.
--
-- Source: <https://core.telegram.org/bots/api#chatboostsourcepremium>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @source@ = @"premium"@.
data ChatBoostSourcePremium = MkChatBoostSourcePremium
  { -- | User that boosted the chat
    --
    -- Wire key: @user@.
    user :: User
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ChatBoostSourcePremium' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkChatBoostSourcePremium :: User -> ChatBoostSourcePremium
mkChatBoostSourcePremium arg0 =
  MkChatBoostSourcePremium
    { user = arg0
    }

instance FromJSON ChatBoostSourcePremium where
  parseJSON = withObject "ChatBoostSourcePremium" $ \obj ->
    do
      checkStringConstant obj "source" "premium"
      field_1 <- requiredWith obj "user" parseJSON
      pure
        MkChatBoostSourcePremium
          { user = field_1
          }

instance ToJSON ChatBoostSourcePremium where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "source" (String "premium")
          , jsonField "user" x.user
          ]
      )
  toEncoding = toEncoding . toJSON
