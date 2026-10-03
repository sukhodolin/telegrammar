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
module Telegram.Bot.Internal.Group.ChatBoostSourceGiftCode
  ( ChatBoostSourceGiftCode (..)
  , mkChatBoostSourceGiftCode
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonLiteral, jsonObject, requiredWith)

-- | The boost was obtained by the creation of Telegram Premium gift codes to boost a chat. Each such code boosts the chat 4 times for the duration of the corresponding Telegram Premium subscription.
--
-- Source: <https://core.telegram.org/bots/api#chatboostsourcegiftcode>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @source@ = @"gift_code"@.
data ChatBoostSourceGiftCode = MkChatBoostSourceGiftCode
  { -- | User for which the gift code was created
    --
    -- Wire key: @user@.
    user :: User
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ChatBoostSourceGiftCode' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkChatBoostSourceGiftCode :: User -> ChatBoostSourceGiftCode
mkChatBoostSourceGiftCode arg0 =
  MkChatBoostSourceGiftCode
    { user = arg0
    }

instance FromJSON ChatBoostSourceGiftCode where
  parseJSON = withObject "ChatBoostSourceGiftCode" $ \obj ->
    do
      checkStringConstant obj "source" "gift_code"
      field_1 <- requiredWith obj "user" parseJSON
      pure
        MkChatBoostSourceGiftCode
          { user = field_1
          }

instance ToJSON ChatBoostSourceGiftCode where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "source" (String "gift_code")
          , jsonField "user" x.user
          ]
      )
  toEncoding = toEncoding . toJSON
