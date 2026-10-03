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
module Telegram.Bot.Internal.Group.ChatMember
  ( ChatMember (..)
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Telegram.Bot.Internal.Group.ChatMemberAdministrator (ChatMemberAdministrator)
import Telegram.Bot.Internal.Group.ChatMemberBanned (ChatMemberBanned)
import Telegram.Bot.Internal.Group.ChatMemberLeft (ChatMemberLeft)
import Telegram.Bot.Internal.Group.ChatMemberMember (ChatMemberMember)
import Telegram.Bot.Internal.Group.ChatMemberOwner (ChatMemberOwner)
import Telegram.Bot.Internal.Group.ChatMemberRestricted (ChatMemberRestricted)
import Telegram.Bot.Support (tagField)

-- | This object contains information about one member of a chat. Currently, the following 6 types of chat members are supported:
-- \- ChatMemberOwner
-- \- ChatMemberAdministrator
-- \- ChatMemberMember
-- \- ChatMemberRestricted
-- \- ChatMemberLeft
-- \- ChatMemberBanned
--
-- Source: <https://core.telegram.org/bots/api#chatmember>.
-- Codec directions: decoded from responses, encoded into requests.
data ChatMember
  = ChatMemberViaChatMemberAdministrator ChatMemberAdministrator
  | ChatMemberViaChatMemberBanned ChatMemberBanned
  | ChatMemberViaChatMemberLeft ChatMemberLeft
  | ChatMemberViaChatMemberMember ChatMemberMember
  | ChatMemberViaChatMemberOwner ChatMemberOwner
  | ChatMemberViaChatMemberRestricted ChatMemberRestricted
  | -- | A value this decoder does not recognize, preserved verbatim so
    -- the raw payload survives the boundary.
    ChatMemberUnknown Value
  deriving stock (Eq, Show)

instance FromJSON ChatMember where
  parseJSON = withObject "ChatMember" $ \obj -> do
    tag_ <- tagField obj "status"
    case tag_ of
      "administrator" ->
        ChatMemberViaChatMemberAdministrator <$> parseJSON (Object obj)
      "kicked" ->
        ChatMemberViaChatMemberBanned <$> parseJSON (Object obj)
      "left" ->
        ChatMemberViaChatMemberLeft <$> parseJSON (Object obj)
      "member" ->
        ChatMemberViaChatMemberMember <$> parseJSON (Object obj)
      "creator" ->
        ChatMemberViaChatMemberOwner <$> parseJSON (Object obj)
      "restricted" ->
        ChatMemberViaChatMemberRestricted <$> parseJSON (Object obj)
      _ -> pure (ChatMemberUnknown (Object obj))

instance ToJSON ChatMember where
  toJSON = \case
    ChatMemberViaChatMemberAdministrator member_ -> toJSON member_
    ChatMemberViaChatMemberBanned member_ -> toJSON member_
    ChatMemberViaChatMemberLeft member_ -> toJSON member_
    ChatMemberViaChatMemberMember member_ -> toJSON member_
    ChatMemberViaChatMemberOwner member_ -> toJSON member_
    ChatMemberViaChatMemberRestricted member_ -> toJSON member_
    ChatMemberUnknown raw_ -> raw_
  toEncoding = toEncoding . toJSON
