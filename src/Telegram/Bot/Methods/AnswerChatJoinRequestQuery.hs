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
module Telegram.Bot.Methods.AnswerChatJoinRequestQuery
  ( AnswerChatJoinRequestQuery (..)
  , mkAnswerChatJoinRequestQuery
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Text (Text)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned)

-- | Use this method to process a received chat join request query. Returns True on success.
--
-- Wire method spelling: @answerChatJoinRequestQuery@.
--
-- Source: <https://core.telegram.org/bots/api#answerchatjoinrequestquery>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data AnswerChatJoinRequestQuery = MkAnswerChatJoinRequestQuery
  { -- | Unique identifier of the join request query
    --
    -- Wire key: @chat_join_request_query_id@.
    chat_join_request_query_id :: Text
  , -- | Result of the query. Must be either \"approve\" to allow the user to join the chat, \"decline\" to disallow the user to join the chat, or \"queue\" to leave the decision to other administrators.
    --
    -- Wire key: @result@.
    result :: Text
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'AnswerChatJoinRequestQuery' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkAnswerChatJoinRequestQuery :: Text -> Text -> AnswerChatJoinRequestQuery
mkAnswerChatJoinRequestQuery arg0 arg1 =
  MkAnswerChatJoinRequestQuery
    { chat_join_request_query_id = arg0
    , result = arg1
    , extra = mempty
    }

instance Method AnswerChatJoinRequestQuery where
  type Result AnswerChatJoinRequestQuery = TrueValue
  methodName _ = "answerChatJoinRequestQuery"
  planRequest x =
    planRequestBody
      "answerChatJoinRequestQuery"
      [ "chat_join_request_query_id"
      , "result"
      ]
      ( concat
          [ planned "chat_join_request_query_id" (encodeJson x.chat_join_request_query_id)
          , planned "result" (encodeJson x.result)
          ]
      )
      x.extra
  parseResult _ = parseJSON
