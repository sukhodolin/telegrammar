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
module Telegram.Bot.Internal.Group.ChatBoostSource
  ( ChatBoostSource (..)
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Telegram.Bot.Internal.Group.ChatBoostSourceGiftCode (ChatBoostSourceGiftCode)
import Telegram.Bot.Internal.Group.ChatBoostSourceGiveaway (ChatBoostSourceGiveaway)
import Telegram.Bot.Internal.Group.ChatBoostSourcePremium (ChatBoostSourcePremium)
import Telegram.Bot.Support (tagField)

-- | This object describes the source of a chat boost. It can be one of
-- \- ChatBoostSourcePremium
-- \- ChatBoostSourceGiftCode
-- \- ChatBoostSourceGiveaway
--
-- Source: <https://core.telegram.org/bots/api#chatboostsource>.
-- Codec directions: decoded from responses, encoded into requests.
data ChatBoostSource
  = ChatBoostSourceViaChatBoostSourceGiftCode ChatBoostSourceGiftCode
  | ChatBoostSourceViaChatBoostSourceGiveaway ChatBoostSourceGiveaway
  | ChatBoostSourceViaChatBoostSourcePremium ChatBoostSourcePremium
  | -- | A value this decoder does not recognize, preserved verbatim so
    -- the raw payload survives the boundary.
    ChatBoostSourceUnknown Value
  deriving stock (Eq, Show)

instance FromJSON ChatBoostSource where
  parseJSON = withObject "ChatBoostSource" $ \obj -> do
    tag_ <- tagField obj "source"
    case tag_ of
      "gift_code" ->
        ChatBoostSourceViaChatBoostSourceGiftCode <$> parseJSON (Object obj)
      "giveaway" ->
        ChatBoostSourceViaChatBoostSourceGiveaway <$> parseJSON (Object obj)
      "premium" ->
        ChatBoostSourceViaChatBoostSourcePremium <$> parseJSON (Object obj)
      _ -> pure (ChatBoostSourceUnknown (Object obj))

instance ToJSON ChatBoostSource where
  toJSON = \case
    ChatBoostSourceViaChatBoostSourceGiftCode member_ -> toJSON member_
    ChatBoostSourceViaChatBoostSourceGiveaway member_ -> toJSON member_
    ChatBoostSourceViaChatBoostSourcePremium member_ -> toJSON member_
    ChatBoostSourceUnknown raw_ -> raw_
  toEncoding = toEncoding . toJSON
