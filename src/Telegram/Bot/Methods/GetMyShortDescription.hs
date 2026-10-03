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
module Telegram.Bot.Methods.GetMyShortDescription
  ( GetMyShortDescription (..)
  , mkGetMyShortDescription
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.BotShortDescription (BotShortDescription)
import Telegram.Bot.Support (Method (..), encodeJson, planRequestBody, plannedMaybe)

-- | Use this method to get the current bot short description for the given user language. Returns BotShortDescription on success.
--
-- Wire method spelling: @getMyShortDescription@.
--
-- Source: <https://core.telegram.org/bots/api#getmyshortdescription>.
-- Result: @BotShortDescription@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data GetMyShortDescription = MkGetMyShortDescription
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

-- | Initialize a 'GetMyShortDescription' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkGetMyShortDescription :: GetMyShortDescription
mkGetMyShortDescription =
  MkGetMyShortDescription
    { language_code = Nothing
    , extra = mempty
    }

instance Method GetMyShortDescription where
  type Result GetMyShortDescription = BotShortDescription
  methodName _ = "getMyShortDescription"
  planRequest x =
    planRequestBody
      "getMyShortDescription"
      [ "language_code"
      ]
      ( concat
          [ plannedMaybe "language_code" x.language_code encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
