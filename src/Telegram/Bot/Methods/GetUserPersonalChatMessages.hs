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
module Telegram.Bot.Methods.GetUserPersonalChatMessages
  ( GetUserPersonalChatMessages (..)
  , mkGetUserPersonalChatMessages
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.ChecklistTasksAdded (Message)
import Telegram.Bot.Support (Method (..), encodeJson, parseList, planRequestBody, planned)

-- | Use this method to get the last messages from the personal chat (i.e., the chat currently added to their profile) of a given user. On success, an Array of Message objects is returned.
--
-- Wire method spelling: @getUserPersonalChatMessages@.
--
-- Source: <https://core.telegram.org/bots/api#getuserpersonalchatmessages>.
-- Result: @[Message]@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data GetUserPersonalChatMessages = MkGetUserPersonalChatMessages
  { -- | Unique identifier for the target user
    --
    -- Wire key: @user_id@.
    user_id :: Int64
  , -- | The maximum number of messages to return; 1-20
    --
    -- Wire key: @limit@.
    limit :: Int64
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'GetUserPersonalChatMessages' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkGetUserPersonalChatMessages :: Int64 -> Int64 -> GetUserPersonalChatMessages
mkGetUserPersonalChatMessages arg0 arg1 =
  MkGetUserPersonalChatMessages
    { user_id = arg0
    , limit = arg1
    , extra = mempty
    }

instance Method GetUserPersonalChatMessages where
  type Result GetUserPersonalChatMessages = [Message]
  methodName _ = "getUserPersonalChatMessages"
  planRequest x =
    planRequestBody
      "getUserPersonalChatMessages"
      [ "user_id"
      , "limit"
      ]
      ( concat
          [ planned "user_id" (encodeJson x.user_id)
          , planned "limit" (encodeJson x.limit)
          ]
      )
      x.extra
  parseResult _ = (parseList parseJSON)
