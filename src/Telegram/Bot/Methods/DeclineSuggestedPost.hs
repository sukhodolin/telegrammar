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
module Telegram.Bot.Methods.DeclineSuggestedPost
  ( DeclineSuggestedPost (..)
  , mkDeclineSuggestedPost
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned, plannedMaybe)

-- | Use this method to decline a suggested post in a direct messages chat. The bot must have the \'can_manage_direct_messages\' administrator right in the corresponding channel chat. Returns True on success.
--
-- Wire method spelling: @declineSuggestedPost@.
--
-- Source: <https://core.telegram.org/bots/api#declinesuggestedpost>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data DeclineSuggestedPost = MkDeclineSuggestedPost
  { -- | Unique identifier for the target direct messages chat
    --
    -- Wire key: @chat_id@.
    chat_id :: Int64
  , -- | Identifier of a suggested post message to decline
    --
    -- Wire key: @message_id@.
    message_id :: Int64
  , -- | Comment for the creator of the suggested post; 0-128 characters
    --
    -- Wire key: @comment@.
    -- Omitted from an encoded request when it is @Nothing@.
    comment :: Maybe Text
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'DeclineSuggestedPost' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkDeclineSuggestedPost :: Int64 -> Int64 -> DeclineSuggestedPost
mkDeclineSuggestedPost arg0 arg1 =
  MkDeclineSuggestedPost
    { chat_id = arg0
    , message_id = arg1
    , comment = Nothing
    , extra = mempty
    }

instance Method DeclineSuggestedPost where
  type Result DeclineSuggestedPost = TrueValue
  methodName _ = "declineSuggestedPost"
  planRequest x =
    planRequestBody
      "declineSuggestedPost"
      [ "chat_id"
      , "message_id"
      , "comment"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          , planned "message_id" (encodeJson x.message_id)
          , plannedMaybe "comment" x.comment encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
