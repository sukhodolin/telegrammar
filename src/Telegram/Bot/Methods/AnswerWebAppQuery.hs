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
module Telegram.Bot.Methods.AnswerWebAppQuery
  ( AnswerWebAppQuery (..)
  , mkAnswerWebAppQuery
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.InlineQueryResult (InlineQueryResult, planInlineQueryResult)
import Telegram.Bot.Internal.Group.SentWebAppMessage (SentWebAppMessage)
import Telegram.Bot.Support (Method (..), encodeJson, planRequestBody, planned)

-- | Use this method to set the result of an interaction with a Web App and send a corresponding message on behalf of the user to the chat from which the query originated. On success, a SentWebAppMessage object is returned.
--
-- Wire method spelling: @answerWebAppQuery@.
--
-- Source: <https://core.telegram.org/bots/api#answerwebappquery>.
-- Result: @SentWebAppMessage@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data AnswerWebAppQuery = MkAnswerWebAppQuery
  { -- | Unique identifier for the query to be answered
    --
    -- Wire key: @web_app_query_id@.
    web_app_query_id :: Text
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

-- | Initialize a 'AnswerWebAppQuery' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkAnswerWebAppQuery :: Text -> InlineQueryResult -> AnswerWebAppQuery
mkAnswerWebAppQuery arg0 arg1 =
  MkAnswerWebAppQuery
    { web_app_query_id = arg0
    , result = arg1
    , extra = mempty
    }

instance Method AnswerWebAppQuery where
  type Result AnswerWebAppQuery = SentWebAppMessage
  methodName _ = "answerWebAppQuery"
  planRequest x =
    planRequestBody
      "answerWebAppQuery"
      [ "web_app_query_id"
      , "result"
      ]
      ( concat
          [ planned "web_app_query_id" (encodeJson x.web_app_query_id)
          , planned "result" (planInlineQueryResult x.result)
          ]
      )
      x.extra
  parseResult _ = parseJSON
