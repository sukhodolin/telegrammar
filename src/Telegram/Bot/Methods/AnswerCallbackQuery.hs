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
module Telegram.Bot.Methods.AnswerCallbackQuery
  ( AnswerCallbackQuery (..)
  , mkAnswerCallbackQuery
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned, plannedMaybe)

-- | Use this method to send answers to callback queries sent from inline keyboards. The answer will be displayed to the user as a notification at the top of the chat screen or as an alert. On success, True is returned.
--
-- Wire method spelling: @answerCallbackQuery@.
--
-- Source: <https://core.telegram.org/bots/api#answercallbackquery>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data AnswerCallbackQuery = MkAnswerCallbackQuery
  { -- | Unique identifier for the query to be answered
    --
    -- Wire key: @callback_query_id@.
    callback_query_id :: Text
  , -- | Text of the notification. If not specified, nothing will be shown to the user, 0-200 characters.
    --
    -- Wire key: @text@.
    -- Omitted from an encoded request when it is @Nothing@.
    text :: Maybe Text
  , -- | If True, an alert will be shown by the client instead of a notification at the top of the chat screen. Defaults to False.
    --
    -- Wire key: @show_alert@.
    -- Omitted from an encoded request when it is @Nothing@.
    show_alert :: Maybe Bool
  , -- | URL that will be opened by the user\'s client. If you have created a Game and accepted the conditions via \@BotFather, specify the URL that opens your game - note that this will only work if the query comes from a callback_game button. Otherwise, you may use links like t.me\/your_bot?start=XXXX that open your bot with a parameter.
    --
    -- Wire key: @url@.
    -- Omitted from an encoded request when it is @Nothing@.
    url :: Maybe Text
  , -- | The maximum amount of time in seconds that the result of the callback query may be cached client-side. Defaults to 0.
    --
    -- Wire key: @cache_time@.
    -- Omitted from an encoded request when it is @Nothing@.
    cache_time :: Maybe Int64
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'AnswerCallbackQuery' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkAnswerCallbackQuery :: Text -> AnswerCallbackQuery
mkAnswerCallbackQuery arg0 =
  MkAnswerCallbackQuery
    { callback_query_id = arg0
    , text = Nothing
    , show_alert = Nothing
    , url = Nothing
    , cache_time = Nothing
    , extra = mempty
    }

instance Method AnswerCallbackQuery where
  type Result AnswerCallbackQuery = TrueValue
  methodName _ = "answerCallbackQuery"
  planRequest x =
    planRequestBody
      "answerCallbackQuery"
      [ "callback_query_id"
      , "text"
      , "show_alert"
      , "url"
      , "cache_time"
      ]
      ( concat
          [ planned "callback_query_id" (encodeJson x.callback_query_id)
          , plannedMaybe "text" x.text encodeJson
          , plannedMaybe "show_alert" x.show_alert encodeJson
          , plannedMaybe "url" x.url encodeJson
          , plannedMaybe "cache_time" x.cache_time encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
