{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeFamilies #-}

-- | One method's request record, initializer, and result association.
--
-- Import this module qualified to update an optional parameter, which is
-- the supported idiom for a record whose field labels repeat across
-- methods.
--
-- Generated. Do not edit.
module Telegram.Bot.Methods.UnbanChatSenderChat
  ( UnbanChatSenderChat (..)
  , mkUnbanChatSenderChat
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned)

-- | Use this method to unban a previously banned channel chat in a supergroup or channel. The bot must be an administrator for this to work and must have the appropriate administrator rights. Returns True on success.
--
-- Wire method spelling: @unbanChatSenderChat@.
--
-- Source: <https://core.telegram.org/bots/api#unbanchatsenderchat>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data UnbanChatSenderChat = MkUnbanChatSenderChat
  { -- | Unique identifier for the target chat or username of the target channel in the format \@username
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | Unique identifier of the target sender chat
    --
    -- Wire key: @sender_chat_id@.
    sender_chat_id :: Int64
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'UnbanChatSenderChat' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkUnbanChatSenderChat :: IntegerOrString -> Int64 -> UnbanChatSenderChat
mkUnbanChatSenderChat arg0 arg1 =
  MkUnbanChatSenderChat
    { chat_id = arg0
    , sender_chat_id = arg1
    , extra = mempty
    }

instance Method UnbanChatSenderChat where
  type Result UnbanChatSenderChat = TrueValue
  methodName _ = "unbanChatSenderChat"
  planRequest x =
    planRequestBody
      "unbanChatSenderChat"
      [ "chat_id"
      , "sender_chat_id"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          , planned "sender_chat_id" (encodeJson x.sender_chat_id)
          ]
      )
      x.extra
  parseResult _ = parseJSON
