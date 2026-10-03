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
module Telegram.Bot.Methods.AnswerPreCheckoutQuery
  ( AnswerPreCheckoutQuery (..)
  , mkAnswerPreCheckoutQuery
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Text (Text)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned, plannedMaybe)

-- | Once the user has confirmed their payment and shipping details, the Bot API sends the final confirmation in the form of an Update with the field pre_checkout_query. Use this method to respond to such pre-checkout queries. On success, True is returned. Note: The Bot API must receive an answer within 10 seconds after the pre-checkout query was sent.
--
-- Wire method spelling: @answerPreCheckoutQuery@.
--
-- Source: <https://core.telegram.org/bots/api#answerprecheckoutquery>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data AnswerPreCheckoutQuery = MkAnswerPreCheckoutQuery
  { -- | Unique identifier for the query to be answered
    --
    -- Wire key: @pre_checkout_query_id@.
    pre_checkout_query_id :: Text
  , -- | Specify True if everything is alright (goods are available, etc.) and the bot is ready to proceed with the order. Use False if there are any problems.
    --
    -- Wire key: @ok@.
    ok :: Bool
  , -- | Required if ok is False. Error message in human readable form that explains the reason for failure to proceed with the checkout (e.g. \"Sorry, somebody just bought the last of our amazing black T-shirts while you were busy filling out your payment details. Please choose a different color or garment!\"). Telegram will display this message to the user.
    --
    -- Wire key: @error_message@.
    -- Omitted from an encoded request when it is @Nothing@.
    error_message :: Maybe Text
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'AnswerPreCheckoutQuery' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkAnswerPreCheckoutQuery :: Text -> Bool -> AnswerPreCheckoutQuery
mkAnswerPreCheckoutQuery arg0 arg1 =
  MkAnswerPreCheckoutQuery
    { pre_checkout_query_id = arg0
    , ok = arg1
    , error_message = Nothing
    , extra = mempty
    }

instance Method AnswerPreCheckoutQuery where
  type Result AnswerPreCheckoutQuery = TrueValue
  methodName _ = "answerPreCheckoutQuery"
  planRequest x =
    planRequestBody
      "answerPreCheckoutQuery"
      [ "pre_checkout_query_id"
      , "ok"
      , "error_message"
      ]
      ( concat
          [ planned "pre_checkout_query_id" (encodeJson x.pre_checkout_query_id)
          , planned "ok" (encodeJson x.ok)
          , plannedMaybe "error_message" x.error_message encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
