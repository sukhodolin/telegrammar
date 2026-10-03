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
module Telegram.Bot.Methods.UnpinChatMessage
  ( UnpinChatMessage (..)
  , mkUnpinChatMessage
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned, plannedMaybe)

-- | Use this method to remove a message from the list of pinned messages in a chat. In private chats and channel direct messages chats, all messages can be unpinned. Conversely, the bot must be an administrator with the \'can_pin_messages\' right or the \'can_edit_messages\' right to unpin messages in groups and channels respectively. Returns True on success.
--
-- Wire method spelling: @unpinChatMessage@.
--
-- Source: <https://core.telegram.org/bots/api#unpinchatmessage>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data UnpinChatMessage = MkUnpinChatMessage
  { -- | Unique identifier of the business connection on behalf of which the message will be unpinned
    --
    -- Wire key: @business_connection_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    business_connection_id :: Maybe Text
  , -- | Unique identifier for the target chat or username of the target channel in the format \@username
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | Identifier of the message to unpin. Required if business_connection_id is specified. If not specified, the most recent pinned message (by sending date) will be unpinned.
    --
    -- Wire key: @message_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    message_id :: Maybe Int64
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'UnpinChatMessage' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkUnpinChatMessage :: IntegerOrString -> UnpinChatMessage
mkUnpinChatMessage arg0 =
  MkUnpinChatMessage
    { business_connection_id = Nothing
    , chat_id = arg0
    , message_id = Nothing
    , extra = mempty
    }

instance Method UnpinChatMessage where
  type Result UnpinChatMessage = TrueValue
  methodName _ = "unpinChatMessage"
  planRequest x =
    planRequestBody
      "unpinChatMessage"
      [ "business_connection_id"
      , "chat_id"
      , "message_id"
      ]
      ( concat
          [ plannedMaybe "business_connection_id" x.business_connection_id encodeJson
          , planned "chat_id" (encodeJson x.chat_id)
          , plannedMaybe "message_id" x.message_id encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
