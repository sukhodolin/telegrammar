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
module Telegram.Bot.Methods.ApproveSuggestedPost
  ( ApproveSuggestedPost (..)
  , mkApproveSuggestedPost
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned, plannedMaybe)

-- | Use this method to approve a suggested post in a direct messages chat. The bot must have the \'can_post_messages\' administrator right in the corresponding channel chat. Returns True on success.
--
-- Wire method spelling: @approveSuggestedPost@.
--
-- Source: <https://core.telegram.org/bots/api#approvesuggestedpost>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data ApproveSuggestedPost = MkApproveSuggestedPost
  { -- | Unique identifier for the target direct messages chat
    --
    -- Wire key: @chat_id@.
    chat_id :: Int64
  , -- | Identifier of a suggested post message to approve
    --
    -- Wire key: @message_id@.
    message_id :: Int64
  , -- | Point in time (Unix timestamp) when the post is expected to be published; omit if the date has already been specified when the suggested post was created. If specified, then the date must be not more than 2678400 seconds (30 days) in the future.
    --
    -- Wire key: @send_date@.
    -- Omitted from an encoded request when it is @Nothing@.
    send_date :: Maybe Int64
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ApproveSuggestedPost' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkApproveSuggestedPost :: Int64 -> Int64 -> ApproveSuggestedPost
mkApproveSuggestedPost arg0 arg1 =
  MkApproveSuggestedPost
    { chat_id = arg0
    , message_id = arg1
    , send_date = Nothing
    , extra = mempty
    }

instance Method ApproveSuggestedPost where
  type Result ApproveSuggestedPost = TrueValue
  methodName _ = "approveSuggestedPost"
  planRequest x =
    planRequestBody
      "approveSuggestedPost"
      [ "chat_id"
      , "message_id"
      , "send_date"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          , planned "message_id" (encodeJson x.message_id)
          , plannedMaybe "send_date" x.send_date encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
