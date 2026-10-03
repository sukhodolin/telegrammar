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
module Telegram.Bot.Methods.GetMyDescription
  ( GetMyDescription (..)
  , mkGetMyDescription
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.BotDescription (BotDescription)
import Telegram.Bot.Support (Method (..), encodeJson, planRequestBody, plannedMaybe)

-- | Use this method to get the current bot description for the given user language. Returns BotDescription on success.
--
-- Wire method spelling: @getMyDescription@.
--
-- Source: <https://core.telegram.org/bots/api#getmydescription>.
-- Result: @BotDescription@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data GetMyDescription = MkGetMyDescription
  { -- | A two-letter ISO 639-1 language code or an empty string
    --
    -- Wire key: @language_code@.
    -- Omitted from an encoded request when it is @Nothing@.
    language_code :: Maybe Text
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'GetMyDescription' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkGetMyDescription :: GetMyDescription
mkGetMyDescription =
  MkGetMyDescription
    { language_code = Nothing
    , extra = mempty
    }

instance Method GetMyDescription where
  type Result GetMyDescription = BotDescription
  methodName _ = "getMyDescription"
  planRequest x =
    planRequestBody
      "getMyDescription"
      [ "language_code"
      ]
      ( concat
          [ plannedMaybe "language_code" x.language_code encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
