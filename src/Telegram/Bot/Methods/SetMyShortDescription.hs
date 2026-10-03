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
module Telegram.Bot.Methods.SetMyShortDescription
  ( SetMyShortDescription (..)
  , mkSetMyShortDescription
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Text (Text)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, plannedMaybe)

-- | Use this method to change the bot\'s short description, which is shown on the bot\'s profile page and is sent together with the link when users share the bot. Returns True on success.
--
-- Wire method spelling: @setMyShortDescription@.
--
-- Source: <https://core.telegram.org/bots/api#setmyshortdescription>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SetMyShortDescription = MkSetMyShortDescription
  { -- | New short description for the bot; 0-120 characters. Pass an empty string to remove the dedicated short description for the given language.
    --
    -- Wire key: @short_description@.
    -- Omitted from an encoded request when it is @Nothing@.
    short_description :: Maybe Text
  , -- | A two-letter ISO 639-1 language code. If empty, the short description will be applied to all users for whose language there is no dedicated short description.
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

-- | Initialize a 'SetMyShortDescription' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSetMyShortDescription :: SetMyShortDescription
mkSetMyShortDescription =
  MkSetMyShortDescription
    { short_description = Nothing
    , language_code = Nothing
    , extra = mempty
    }

instance Method SetMyShortDescription where
  type Result SetMyShortDescription = TrueValue
  methodName _ = "setMyShortDescription"
  planRequest x =
    planRequestBody
      "setMyShortDescription"
      [ "short_description"
      , "language_code"
      ]
      ( concat
          [ plannedMaybe "short_description" x.short_description encodeJson
          , plannedMaybe "language_code" x.language_code encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
