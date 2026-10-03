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
module Telegram.Bot.Internal.Group.BotCommandScope
  ( BotCommandScope (..)
  ) where

import Data.Aeson (ToJSON (..), Value)
import Telegram.Bot.Internal.Group.BotCommandScopeAllChatAdministrators (BotCommandScopeAllChatAdministrators)
import Telegram.Bot.Internal.Group.BotCommandScopeAllGroupChats (BotCommandScopeAllGroupChats)
import Telegram.Bot.Internal.Group.BotCommandScopeAllPrivateChats (BotCommandScopeAllPrivateChats)
import Telegram.Bot.Internal.Group.BotCommandScopeChat (BotCommandScopeChat)
import Telegram.Bot.Internal.Group.BotCommandScopeChatAdministrators (BotCommandScopeChatAdministrators)
import Telegram.Bot.Internal.Group.BotCommandScopeChatMember (BotCommandScopeChatMember)
import Telegram.Bot.Internal.Group.BotCommandScopeDefault (BotCommandScopeDefault)

-- | This object represents the scope to which bot commands are applied. Currently, the following 7 scopes are supported:
-- \- BotCommandScopeDefault
-- \- BotCommandScopeAllPrivateChats
-- \- BotCommandScopeAllGroupChats
-- \- BotCommandScopeAllChatAdministrators
-- \- BotCommandScopeChat
-- \- BotCommandScopeChatAdministrators
-- \- BotCommandScopeChatMember
--
-- Source: <https://core.telegram.org/bots/api#botcommandscope>.
-- Codec directions: encoded into requests.
data BotCommandScope
  = BotCommandScopeViaBotCommandScopeAllChatAdministrators BotCommandScopeAllChatAdministrators
  | BotCommandScopeViaBotCommandScopeAllGroupChats BotCommandScopeAllGroupChats
  | BotCommandScopeViaBotCommandScopeAllPrivateChats BotCommandScopeAllPrivateChats
  | BotCommandScopeViaBotCommandScopeChat BotCommandScopeChat
  | BotCommandScopeViaBotCommandScopeChatAdministrators BotCommandScopeChatAdministrators
  | BotCommandScopeViaBotCommandScopeChatMember BotCommandScopeChatMember
  | BotCommandScopeViaBotCommandScopeDefault BotCommandScopeDefault
  | -- | A value this decoder does not recognize, preserved verbatim so
    -- the raw payload survives the boundary.
    BotCommandScopeUnknown Value
  deriving stock (Eq, Show)

instance ToJSON BotCommandScope where
  toJSON = \case
    BotCommandScopeViaBotCommandScopeAllChatAdministrators member_ -> toJSON member_
    BotCommandScopeViaBotCommandScopeAllGroupChats member_ -> toJSON member_
    BotCommandScopeViaBotCommandScopeAllPrivateChats member_ -> toJSON member_
    BotCommandScopeViaBotCommandScopeChat member_ -> toJSON member_
    BotCommandScopeViaBotCommandScopeChatAdministrators member_ -> toJSON member_
    BotCommandScopeViaBotCommandScopeChatMember member_ -> toJSON member_
    BotCommandScopeViaBotCommandScopeDefault member_ -> toJSON member_
    BotCommandScopeUnknown raw_ -> raw_
  toEncoding = toEncoding . toJSON
