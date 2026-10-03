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
module Telegram.Bot.Methods.SetMyName
  ( SetMyName (..)
  , mkSetMyName
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Text (Text)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, plannedMaybe)

-- | Use this method to change the bot\'s name. Returns True on success.
--
-- Wire method spelling: @setMyName@.
--
-- Source: <https://core.telegram.org/bots/api#setmyname>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SetMyName = MkSetMyName
  { -- | New bot name; 0-64 characters. Pass an empty string to remove the dedicated name for the given language.
    --
    -- Wire key: @name@.
    -- Omitted from an encoded request when it is @Nothing@.
    name :: Maybe Text
  , -- | A two-letter ISO 639-1 language code. If empty, the name will be shown to all users for whose language there is no dedicated name.
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

-- | Initialize a 'SetMyName' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSetMyName :: SetMyName
mkSetMyName =
  MkSetMyName
    { name = Nothing
    , language_code = Nothing
    , extra = mempty
    }

instance Method SetMyName where
  type Result SetMyName = TrueValue
  methodName _ = "setMyName"
  planRequest x =
    planRequestBody
      "setMyName"
      [ "name"
      , "language_code"
      ]
      ( concat
          [ plannedMaybe "name" x.name encodeJson
          , plannedMaybe "language_code" x.language_code encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
