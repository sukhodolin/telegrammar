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
module Telegram.Bot.Methods.AnswerShippingQuery
  ( AnswerShippingQuery (..)
  , mkAnswerShippingQuery
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.ShippingOption (ShippingOption)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planList, planRequestBody, planned, plannedMaybe)

-- | If you sent an invoice requesting a shipping address and the parameter is_flexible was specified, the Bot API will send an Update with a shipping_query field to the bot. Use this method to reply to shipping queries. On success, True is returned.
--
-- Wire method spelling: @answerShippingQuery@.
--
-- Source: <https://core.telegram.org/bots/api#answershippingquery>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data AnswerShippingQuery = MkAnswerShippingQuery
  { -- | Unique identifier for the query to be answered
    --
    -- Wire key: @shipping_query_id@.
    shipping_query_id :: Text
  , -- | Pass True if delivery to the specified address is possible and False if there are any problems (for example, if delivery to the specified address is not possible)
    --
    -- Wire key: @ok@.
    ok :: Bool
  , -- | Required if ok is True. A JSON-serialized Array of available shipping options.
    --
    -- Wire key: @shipping_options@.
    -- Omitted from an encoded request when it is @Nothing@.
    shipping_options :: Maybe [ShippingOption]
  , -- | Required if ok is False. Error message in human readable form that explains why it is impossible to complete the order (e.g. \"Sorry, delivery to your desired address is unavailable\"). Telegram will display this message to the user.
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

-- | Initialize a 'AnswerShippingQuery' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkAnswerShippingQuery :: Text -> Bool -> AnswerShippingQuery
mkAnswerShippingQuery arg0 arg1 =
  MkAnswerShippingQuery
    { shipping_query_id = arg0
    , ok = arg1
    , shipping_options = Nothing
    , error_message = Nothing
    , extra = mempty
    }

instance Method AnswerShippingQuery where
  type Result AnswerShippingQuery = TrueValue
  methodName _ = "answerShippingQuery"
  planRequest x =
    planRequestBody
      "answerShippingQuery"
      [ "shipping_query_id"
      , "ok"
      , "shipping_options"
      , "error_message"
      ]
      ( concat
          [ planned "shipping_query_id" (encodeJson x.shipping_query_id)
          , planned "ok" (encodeJson x.ok)
          , plannedMaybe "shipping_options" x.shipping_options (planList encodeJson)
          , plannedMaybe "error_message" x.error_message encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
