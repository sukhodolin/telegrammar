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
module Telegram.Bot.Methods.AnswerGuestQuery
  ( AnswerGuestQuery (..)
  , mkAnswerGuestQuery
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.InlineQueryResult (InlineQueryResult, planInlineQueryResult)
import Telegram.Bot.Internal.Group.SentGuestMessage (SentGuestMessage)
import Telegram.Bot.Support (Method (..), encodeJson, planRequestBody, planned)

-- | Use this method to reply to a received guest message. On success, a SentGuestMessage object is returned.
--
-- Wire method spelling: @answerGuestQuery@.
--
-- Source: <https://core.telegram.org/bots/api#answerguestquery>.
-- Result: @SentGuestMessage@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data AnswerGuestQuery = MkAnswerGuestQuery
  { -- | Unique identifier for the query to be answered
    --
    -- Wire key: @guest_query_id@.
    guest_query_id :: Text
  , -- | A JSON-serialized object describing the message to be sent
    --
    -- Wire key: @result@.
    result :: InlineQueryResult
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'AnswerGuestQuery' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkAnswerGuestQuery :: Text -> InlineQueryResult -> AnswerGuestQuery
mkAnswerGuestQuery arg0 arg1 =
  MkAnswerGuestQuery
    { guest_query_id = arg0
    , result = arg1
    , extra = mempty
    }

instance Method AnswerGuestQuery where
  type Result AnswerGuestQuery = SentGuestMessage
  methodName _ = "answerGuestQuery"
  planRequest x =
    planRequestBody
      "answerGuestQuery"
      [ "guest_query_id"
      , "result"
      ]
      ( concat
          [ planned "guest_query_id" (encodeJson x.guest_query_id)
          , planned "result" (planInlineQueryResult x.result)
          ]
      )
      x.extra
  parseResult _ = parseJSON
