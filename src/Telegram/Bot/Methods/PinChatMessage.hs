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
module Telegram.Bot.Methods.PinChatMessage
  ( PinChatMessage (..)
  , mkPinChatMessage
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned, plannedMaybe)

-- | Use this method to add a message to the list of pinned messages in a chat. In private chats and channel direct messages chats, all non-service messages can be pinned. Conversely, the bot must be an administrator with the \'can_pin_messages\' right or the \'can_edit_messages\' right to pin messages in groups and channels respectively. Returns True on success.
--
-- Wire method spelling: @pinChatMessage@.
--
-- Source: <https://core.telegram.org/bots/api#pinchatmessage>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data PinChatMessage = MkPinChatMessage
  { -- | Unique identifier of the business connection on behalf of which the message will be pinned
    --
    -- Wire key: @business_connection_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    business_connection_id :: Maybe Text
  , -- | Unique identifier for the target chat or username of the target channel in the format \@username
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | Identifier of a message to pin
    --
    -- Wire key: @message_id@.
    message_id :: Int64
  , -- | Pass True if it is not necessary to send a notification to all chat members about the new pinned message. Notifications are always disabled in channels and private chats.
    --
    -- Wire key: @disable_notification@.
    -- Omitted from an encoded request when it is @Nothing@.
    disable_notification :: Maybe Bool
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'PinChatMessage' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkPinChatMessage :: IntegerOrString -> Int64 -> PinChatMessage
mkPinChatMessage arg0 arg1 =
  MkPinChatMessage
    { business_connection_id = Nothing
    , chat_id = arg0
    , message_id = arg1
    , disable_notification = Nothing
    , extra = mempty
    }

instance Method PinChatMessage where
  type Result PinChatMessage = TrueValue
  methodName _ = "pinChatMessage"
  planRequest x =
    planRequestBody
      "pinChatMessage"
      [ "business_connection_id"
      , "chat_id"
      , "message_id"
      , "disable_notification"
      ]
      ( concat
          [ plannedMaybe "business_connection_id" x.business_connection_id encodeJson
          , planned "chat_id" (encodeJson x.chat_id)
          , planned "message_id" (encodeJson x.message_id)
          , plannedMaybe "disable_notification" x.disable_notification encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
