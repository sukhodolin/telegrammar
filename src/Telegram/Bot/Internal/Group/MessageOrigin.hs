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
module Telegram.Bot.Internal.Group.MessageOrigin
  ( MessageOrigin (..)
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Telegram.Bot.Internal.Group.MessageOriginChannel (MessageOriginChannel)
import Telegram.Bot.Internal.Group.MessageOriginChat (MessageOriginChat)
import Telegram.Bot.Internal.Group.MessageOriginHiddenUser (MessageOriginHiddenUser)
import Telegram.Bot.Internal.Group.MessageOriginUser (MessageOriginUser)
import Telegram.Bot.Support (tagField)

-- | This object describes the origin of a message. It can be one of
-- \- MessageOriginUser
-- \- MessageOriginHiddenUser
-- \- MessageOriginChat
-- \- MessageOriginChannel
--
-- Source: <https://core.telegram.org/bots/api#messageorigin>.
-- Codec directions: decoded from responses, encoded into requests.
data MessageOrigin
  = MessageOriginViaMessageOriginChannel MessageOriginChannel
  | MessageOriginViaMessageOriginChat MessageOriginChat
  | MessageOriginViaMessageOriginHiddenUser MessageOriginHiddenUser
  | MessageOriginViaMessageOriginUser MessageOriginUser
  | -- | A value this decoder does not recognize, preserved verbatim so
    -- the raw payload survives the boundary.
    MessageOriginUnknown Value
  deriving stock (Eq, Show)

instance FromJSON MessageOrigin where
  parseJSON = withObject "MessageOrigin" $ \obj -> do
    tag_ <- tagField obj "type"
    case tag_ of
      "channel" ->
        MessageOriginViaMessageOriginChannel <$> parseJSON (Object obj)
      "chat" ->
        MessageOriginViaMessageOriginChat <$> parseJSON (Object obj)
      "hidden_user" ->
        MessageOriginViaMessageOriginHiddenUser <$> parseJSON (Object obj)
      "user" ->
        MessageOriginViaMessageOriginUser <$> parseJSON (Object obj)
      _ -> pure (MessageOriginUnknown (Object obj))

instance ToJSON MessageOrigin where
  toJSON = \case
    MessageOriginViaMessageOriginChannel member_ -> toJSON member_
    MessageOriginViaMessageOriginChat member_ -> toJSON member_
    MessageOriginViaMessageOriginHiddenUser member_ -> toJSON member_
    MessageOriginViaMessageOriginUser member_ -> toJSON member_
    MessageOriginUnknown raw_ -> raw_
  toEncoding = toEncoding . toJSON
