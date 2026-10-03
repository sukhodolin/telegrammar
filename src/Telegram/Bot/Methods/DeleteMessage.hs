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
module Telegram.Bot.Methods.DeleteMessage
  ( DeleteMessage (..)
  , mkDeleteMessage
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned)

-- | Use this method to delete a message, including service messages, with the following limitations:
-- \- A message can only be deleted if it was sent less than 48 hours ago.
-- \- Service messages about a supergroup, channel, or forum topic creation can\'t be deleted.
-- \- A dice message in a private chat can only be deleted if it was sent more than 24 hours ago.
-- \- Bots can delete outgoing messages in private chats, groups, and supergroups.
-- \- Bots can delete incoming messages in private chats.
-- \- Bots granted can_post_messages permissions can delete outgoing messages in channels.
-- \- If the bot is an administrator of a group, it can delete any message there.
-- \- If the bot has can_delete_messages administrator right in a supergroup or a channel, it can delete any message there.
-- \- If the bot has can_manage_direct_messages administrator right in a channel, it can delete any message in the corresponding direct messages chat.
-- Returns True on success.
--
-- Wire method spelling: @deleteMessage@.
--
-- Source: <https://core.telegram.org/bots/api#deletemessage>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data DeleteMessage = MkDeleteMessage
  { -- | Unique identifier for the target chat or username of the target bot, supergroup or channel in the format \@username
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | Identifier of the message to delete
    --
    -- Wire key: @message_id@.
    message_id :: Int64
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'DeleteMessage' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkDeleteMessage :: IntegerOrString -> Int64 -> DeleteMessage
mkDeleteMessage arg0 arg1 =
  MkDeleteMessage
    { chat_id = arg0
    , message_id = arg1
    , extra = mempty
    }

instance Method DeleteMessage where
  type Result DeleteMessage = TrueValue
  methodName _ = "deleteMessage"
  planRequest x =
    planRequestBody
      "deleteMessage"
      [ "chat_id"
      , "message_id"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          , planned "message_id" (encodeJson x.message_id)
          ]
      )
      x.extra
  parseResult _ = parseJSON
