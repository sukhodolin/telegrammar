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
module Telegram.Bot.Methods.AnswerInlineQuery
  ( AnswerInlineQuery (..)
  , mkAnswerInlineQuery
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.InlineQueryResult (InlineQueryResult, planInlineQueryResult)
import Telegram.Bot.Internal.Group.InlineQueryResultsButton (InlineQueryResultsButton)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planList, planRequestBody, planned, plannedMaybe, validateArrayCount, withValidation)

-- | Use this method to send answers to an inline query. On success, True is returned.
-- No more than 50 results per query are allowed.
--
-- Wire method spelling: @answerInlineQuery@.
--
-- Source: <https://core.telegram.org/bots/api#answerinlinequery>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data AnswerInlineQuery = MkAnswerInlineQuery
  { -- | Unique identifier for the answered query
    --
    -- Wire key: @inline_query_id@.
    inline_query_id :: Text
  , -- | A JSON-serialized Array of results for the inline query
    --
    -- Wire key: @results@.
    -- Checked when planning a request: at most 50 element(s).
    results :: [InlineQueryResult]
  , -- | The maximum amount of time in seconds that the result of the inline query may be cached on the server. Defaults to 300.
    --
    -- Wire key: @cache_time@.
    -- Omitted from an encoded request when it is @Nothing@.
    cache_time :: Maybe Int64
  , -- | Pass True if results may be cached on the server side only for the user that sent the query. By default, results may be returned to any user who sends the same query.
    --
    -- Wire key: @is_personal@.
    -- Omitted from an encoded request when it is @Nothing@.
    is_personal :: Maybe Bool
  , -- | Pass the offset that a client should send in the next query with the same text to receive more results. Pass an empty string if there are no more results or if you don\'t support pagination. Offset length can\'t exceed 64 bytes.
    --
    -- Wire key: @next_offset@.
    -- Omitted from an encoded request when it is @Nothing@.
    next_offset :: Maybe Text
  , -- | A JSON-serialized object describing a button to be shown above inline query results
    --
    -- Wire key: @button@.
    -- Omitted from an encoded request when it is @Nothing@.
    button :: Maybe InlineQueryResultsButton
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'AnswerInlineQuery' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkAnswerInlineQuery :: Text -> [InlineQueryResult] -> AnswerInlineQuery
mkAnswerInlineQuery arg0 arg1 =
  MkAnswerInlineQuery
    { inline_query_id = arg0
    , results = arg1
    , cache_time = Nothing
    , is_personal = Nothing
    , next_offset = Nothing
    , button = Nothing
    , extra = mempty
    }

instance Method AnswerInlineQuery where
  type Result AnswerInlineQuery = TrueValue
  methodName _ = "answerInlineQuery"
  planRequest x =
    planRequestBody
      "answerInlineQuery"
      [ "inline_query_id"
      , "results"
      , "cache_time"
      , "is_personal"
      , "next_offset"
      , "button"
      ]
      ( concat
          [ planned "inline_query_id" (encodeJson x.inline_query_id)
          , planned "results" (withValidation (\loc_ -> validateArrayCount Nothing (Just 50) loc_ x.results) ((planList planInlineQueryResult) x.results))
          , plannedMaybe "cache_time" x.cache_time encodeJson
          , plannedMaybe "is_personal" x.is_personal encodeJson
          , plannedMaybe "next_offset" x.next_offset encodeJson
          , plannedMaybe "button" x.button encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
