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
module Telegram.Bot.Methods.ReadBusinessMessage
  ( ReadBusinessMessage (..)
  , mkReadBusinessMessage
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned)

-- | Marks incoming message as read on behalf of a business account. Requires the can_read_messages business bot right. Returns True on success.
--
-- Wire method spelling: @readBusinessMessage@.
--
-- Source: <https://core.telegram.org/bots/api#readbusinessmessage>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data ReadBusinessMessage = MkReadBusinessMessage
  { -- | Unique identifier of the business connection on behalf of which to read the message
    --
    -- Wire key: @business_connection_id@.
    business_connection_id :: Text
  , -- | Unique identifier of the chat in which the message was received. The chat must have been active in the last 24 hours.
    --
    -- Wire key: @chat_id@.
    chat_id :: Int64
  , -- | Unique identifier of the message to mark as read
    --
    -- Wire key: @message_id@.
    message_id :: Int64
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ReadBusinessMessage' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkReadBusinessMessage :: Text -> Int64 -> Int64 -> ReadBusinessMessage
mkReadBusinessMessage arg0 arg1 arg2 =
  MkReadBusinessMessage
    { business_connection_id = arg0
    , chat_id = arg1
    , message_id = arg2
    , extra = mempty
    }

instance Method ReadBusinessMessage where
  type Result ReadBusinessMessage = TrueValue
  methodName _ = "readBusinessMessage"
  planRequest x =
    planRequestBody
      "readBusinessMessage"
      [ "business_connection_id"
      , "chat_id"
      , "message_id"
      ]
      ( concat
          [ planned "business_connection_id" (encodeJson x.business_connection_id)
          , planned "chat_id" (encodeJson x.chat_id)
          , planned "message_id" (encodeJson x.message_id)
          ]
      )
      x.extra
  parseResult _ = parseJSON
