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
module Telegram.Bot.Methods.DeleteEphemeralMessage
  ( DeleteEphemeralMessage (..)
  , mkDeleteEphemeralMessage
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned)

-- | Use this method to delete an ephemeral message. Note that it is not guaranteed that the user will receive the message deletion event, especially if they are offline. Returns True on success.
--
-- Wire method spelling: @deleteEphemeralMessage@.
--
-- Source: <https://core.telegram.org/bots/api#deleteephemeralmessage>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data DeleteEphemeralMessage = MkDeleteEphemeralMessage
  { -- | Unique identifier for the target chat or username of the target supergroup in the format \@username
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | Identifier of the user who received the message
    --
    -- Wire key: @receiver_user_id@.
    receiver_user_id :: Int64
  , -- | Identifier of the ephemeral message to delete
    --
    -- Wire key: @ephemeral_message_id@.
    ephemeral_message_id :: Int64
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'DeleteEphemeralMessage' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkDeleteEphemeralMessage :: IntegerOrString -> Int64 -> Int64 -> DeleteEphemeralMessage
mkDeleteEphemeralMessage arg0 arg1 arg2 =
  MkDeleteEphemeralMessage
    { chat_id = arg0
    , receiver_user_id = arg1
    , ephemeral_message_id = arg2
    , extra = mempty
    }

instance Method DeleteEphemeralMessage where
  type Result DeleteEphemeralMessage = TrueValue
  methodName _ = "deleteEphemeralMessage"
  planRequest x =
    planRequestBody
      "deleteEphemeralMessage"
      [ "chat_id"
      , "receiver_user_id"
      , "ephemeral_message_id"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          , planned "receiver_user_id" (encodeJson x.receiver_user_id)
          , planned "ephemeral_message_id" (encodeJson x.ephemeral_message_id)
          ]
      )
      x.extra
  parseResult _ = parseJSON
