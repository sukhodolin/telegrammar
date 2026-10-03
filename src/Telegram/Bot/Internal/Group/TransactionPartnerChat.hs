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
module Telegram.Bot.Internal.Group.TransactionPartnerChat
  ( TransactionPartnerChat (..)
  , mkTransactionPartnerChat
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Telegram.Bot.Internal.Group.Chat (Chat)
import Telegram.Bot.Internal.Group.Gift (Gift)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonLiteral, jsonObject, jsonOptional, optionalWith, requiredWith)

-- | Describes a transaction with a chat.
--
-- Source: <https://core.telegram.org/bots/api#transactionpartnerchat>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"chat"@.
data TransactionPartnerChat = MkTransactionPartnerChat
  { -- | Information about the chat
    --
    -- Wire key: @chat@.
    chat :: Chat
  , -- | Optional. The gift sent to the chat by the bot
    --
    -- Wire key: @gift@.
    -- Omitted from an encoded request when it is @Nothing@.
    gift :: Maybe Gift
  }
  deriving stock (Eq, Show)

-- | Initialize a 'TransactionPartnerChat' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkTransactionPartnerChat :: Chat -> TransactionPartnerChat
mkTransactionPartnerChat arg0 =
  MkTransactionPartnerChat
    { chat = arg0
    , gift = Nothing
    }

instance FromJSON TransactionPartnerChat where
  parseJSON = withObject "TransactionPartnerChat" $ \obj ->
    do
      checkStringConstant obj "type" "chat"
      field_1 <- requiredWith obj "chat" parseJSON
      field_2 <- optionalWith obj "gift" parseJSON
      pure
        MkTransactionPartnerChat
          { chat = field_1
          , gift = field_2
          }

instance ToJSON TransactionPartnerChat where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "chat")
          , jsonField "chat" x.chat
          , jsonOptional "gift" x.gift
          ]
      )
  toEncoding = toEncoding . toJSON
