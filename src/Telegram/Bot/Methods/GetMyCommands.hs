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
module Telegram.Bot.Methods.GetMyCommands
  ( GetMyCommands (..)
  , mkGetMyCommands
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.BotCommand (BotCommand)
import Telegram.Bot.Internal.Group.BotCommandScope (BotCommandScope)
import Telegram.Bot.Support (Method (..), encodeJson, parseList, planRequestBody, plannedMaybe)

-- | Use this method to get the current list of the bot\'s commands for the given scope and user language. Returns an Array of BotCommand objects. If commands aren\'t set, an empty list is returned.
--
-- Wire method spelling: @getMyCommands@.
--
-- Source: <https://core.telegram.org/bots/api#getmycommands>.
-- Result: @[BotCommand]@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data GetMyCommands = MkGetMyCommands
  { -- | A JSON-serialized object, describing scope of users. Defaults to BotCommandScopeDefault.
    --
    -- Wire key: @scope@.
    -- Omitted from an encoded request when it is @Nothing@.
    scope :: Maybe BotCommandScope
  , -- | A two-letter ISO 639-1 language code or an empty string
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

-- | Initialize a 'GetMyCommands' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkGetMyCommands :: GetMyCommands
mkGetMyCommands =
  MkGetMyCommands
    { scope = Nothing
    , language_code = Nothing
    , extra = mempty
    }

instance Method GetMyCommands where
  type Result GetMyCommands = [BotCommand]
  methodName _ = "getMyCommands"
  planRequest x =
    planRequestBody
      "getMyCommands"
      [ "scope"
      , "language_code"
      ]
      ( concat
          [ plannedMaybe "scope" x.scope encodeJson
          , plannedMaybe "language_code" x.language_code encodeJson
          ]
      )
      x.extra
  parseResult _ = (parseList parseJSON)
