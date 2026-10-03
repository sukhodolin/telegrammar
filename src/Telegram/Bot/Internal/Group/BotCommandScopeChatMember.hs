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
module Telegram.Bot.Internal.Group.BotCommandScopeChatMember
  ( BotCommandScopeChatMember (..)
  , mkBotCommandScopeChatMember
  ) where

import Data.Aeson (ToJSON (..), Value (..))
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (jsonField, jsonLiteral, jsonObject)

-- | Represents the scope of bot commands, covering a specific member of a group or supergroup chat.
--
-- Source: <https://core.telegram.org/bots/api#botcommandscopechatmember>.
-- Codec directions: encoded into requests.
--
-- Supplied constants: @type@ = @"chat_member"@.
data BotCommandScopeChatMember = MkBotCommandScopeChatMember
  { -- | Unique identifier for the target chat or username of the target supergroup in the format \@username. Channel direct messages chats and channel chats aren\'t supported.
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | Unique identifier of the target user
    --
    -- Wire key: @user_id@.
    user_id :: Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'BotCommandScopeChatMember' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkBotCommandScopeChatMember :: IntegerOrString -> Int64 -> BotCommandScopeChatMember
mkBotCommandScopeChatMember arg0 arg1 =
  MkBotCommandScopeChatMember
    { chat_id = arg0
    , user_id = arg1
    }

instance ToJSON BotCommandScopeChatMember where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "chat_member")
          , jsonField "chat_id" x.chat_id
          , jsonField "user_id" x.user_id
          ]
      )
  toEncoding = toEncoding . toJSON
