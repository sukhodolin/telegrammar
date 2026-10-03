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
module Telegram.Bot.Methods.UnpinAllChatMessages
  ( UnpinAllChatMessages (..)
  , mkUnpinAllChatMessages
  ) where

import Data.Aeson (FromJSON (..), Object)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned)

-- | Use this method to clear the list of pinned messages in a chat. In private chats and channel direct messages chats, no additional rights are required to unpin all pinned messages. Conversely, the bot must be an administrator with the \'can_pin_messages\' right or the \'can_edit_messages\' right to unpin all pinned messages in groups and channels respectively. Returns True on success.
--
-- Wire method spelling: @unpinAllChatMessages@.
--
-- Source: <https://core.telegram.org/bots/api#unpinallchatmessages>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data UnpinAllChatMessages = MkUnpinAllChatMessages
  { -- | Unique identifier for the target chat or username of the target channel in the format \@username
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'UnpinAllChatMessages' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkUnpinAllChatMessages :: IntegerOrString -> UnpinAllChatMessages
mkUnpinAllChatMessages arg0 =
  MkUnpinAllChatMessages
    { chat_id = arg0
    , extra = mempty
    }

instance Method UnpinAllChatMessages where
  type Result UnpinAllChatMessages = TrueValue
  methodName _ = "unpinAllChatMessages"
  planRequest x =
    planRequestBody
      "unpinAllChatMessages"
      [ "chat_id"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          ]
      )
      x.extra
  parseResult _ = parseJSON
