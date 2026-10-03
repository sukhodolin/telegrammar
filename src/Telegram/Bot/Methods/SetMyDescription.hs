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
module Telegram.Bot.Methods.SetMyDescription
  ( SetMyDescription (..)
  , mkSetMyDescription
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Text (Text)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, plannedMaybe)

-- | Use this method to change the bot\'s description, which is shown in the chat with the bot if the chat is empty. Returns True on success.
--
-- Wire method spelling: @setMyDescription@.
--
-- Source: <https://core.telegram.org/bots/api#setmydescription>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SetMyDescription = MkSetMyDescription
  { -- | New bot description; 0-512 characters. Pass an empty string to remove the dedicated description for the given language.
    --
    -- Wire key: @description@.
    -- Omitted from an encoded request when it is @Nothing@.
    description :: Maybe Text
  , -- | A two-letter ISO 639-1 language code. If empty, the description will be applied to all users for whose language there is no dedicated description.
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

-- | Initialize a 'SetMyDescription' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSetMyDescription :: SetMyDescription
mkSetMyDescription =
  MkSetMyDescription
    { description = Nothing
    , language_code = Nothing
    , extra = mempty
    }

instance Method SetMyDescription where
  type Result SetMyDescription = TrueValue
  methodName _ = "setMyDescription"
  planRequest x =
    planRequestBody
      "setMyDescription"
      [ "description"
      , "language_code"
      ]
      ( concat
          [ plannedMaybe "description" x.description encodeJson
          , plannedMaybe "language_code" x.language_code encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
