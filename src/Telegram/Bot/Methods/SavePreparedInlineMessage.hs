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
module Telegram.Bot.Methods.SavePreparedInlineMessage
  ( SavePreparedInlineMessage (..)
  , mkSavePreparedInlineMessage
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.InlineQueryResult (InlineQueryResult, planInlineQueryResult)
import Telegram.Bot.Internal.Group.PreparedInlineMessage (PreparedInlineMessage)
import Telegram.Bot.Support (Method (..), encodeJson, planRequestBody, planned, plannedMaybe)

-- | Stores a message that can be sent by a user of a Mini App. Returns a PreparedInlineMessage object.
--
-- Wire method spelling: @savePreparedInlineMessage@.
--
-- Source: <https://core.telegram.org/bots/api#savepreparedinlinemessage>.
-- Result: @PreparedInlineMessage@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SavePreparedInlineMessage = MkSavePreparedInlineMessage
  { -- | Unique identifier of the target user that can use the prepared message
    --
    -- Wire key: @user_id@.
    user_id :: Int64
  , -- | A JSON-serialized object describing the message to be sent
    --
    -- Wire key: @result@.
    result :: InlineQueryResult
  , -- | Pass True if the message can be sent to private chats with users
    --
    -- Wire key: @allow_user_chats@.
    -- Omitted from an encoded request when it is @Nothing@.
    allow_user_chats :: Maybe Bool
  , -- | Pass True if the message can be sent to private chats with bots
    --
    -- Wire key: @allow_bot_chats@.
    -- Omitted from an encoded request when it is @Nothing@.
    allow_bot_chats :: Maybe Bool
  , -- | Pass True if the message can be sent to group and supergroup chats
    --
    -- Wire key: @allow_group_chats@.
    -- Omitted from an encoded request when it is @Nothing@.
    allow_group_chats :: Maybe Bool
  , -- | Pass True if the message can be sent to channel chats
    --
    -- Wire key: @allow_channel_chats@.
    -- Omitted from an encoded request when it is @Nothing@.
    allow_channel_chats :: Maybe Bool
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SavePreparedInlineMessage' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSavePreparedInlineMessage :: Int64 -> InlineQueryResult -> SavePreparedInlineMessage
mkSavePreparedInlineMessage arg0 arg1 =
  MkSavePreparedInlineMessage
    { user_id = arg0
    , result = arg1
    , allow_user_chats = Nothing
    , allow_bot_chats = Nothing
    , allow_group_chats = Nothing
    , allow_channel_chats = Nothing
    , extra = mempty
    }

instance Method SavePreparedInlineMessage where
  type Result SavePreparedInlineMessage = PreparedInlineMessage
  methodName _ = "savePreparedInlineMessage"
  planRequest x =
    planRequestBody
      "savePreparedInlineMessage"
      [ "user_id"
      , "result"
      , "allow_user_chats"
      , "allow_bot_chats"
      , "allow_group_chats"
      , "allow_channel_chats"
      ]
      ( concat
          [ planned "user_id" (encodeJson x.user_id)
          , planned "result" (planInlineQueryResult x.result)
          , plannedMaybe "allow_user_chats" x.allow_user_chats encodeJson
          , plannedMaybe "allow_bot_chats" x.allow_bot_chats encodeJson
          , plannedMaybe "allow_group_chats" x.allow_group_chats encodeJson
          , plannedMaybe "allow_channel_chats" x.allow_channel_chats encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
