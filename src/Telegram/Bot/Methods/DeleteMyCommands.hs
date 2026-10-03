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
module Telegram.Bot.Methods.DeleteMyCommands
  ( DeleteMyCommands (..)
  , mkDeleteMyCommands
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.BotCommandScope (BotCommandScope)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, plannedMaybe)

-- | Use this method to delete the list of the bot\'s commands for the given scope and user language. After deletion, higher level commands will be shown to affected users. Returns True on success.
--
-- Wire method spelling: @deleteMyCommands@.
--
-- Source: <https://core.telegram.org/bots/api#deletemycommands>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data DeleteMyCommands = MkDeleteMyCommands
  { -- | A JSON-serialized object, describing scope of users for which the commands are relevant. Defaults to BotCommandScopeDefault.
    --
    -- Wire key: @scope@.
    -- Omitted from an encoded request when it is @Nothing@.
    scope :: Maybe BotCommandScope
  , -- | A two-letter ISO 639-1 language code. If empty, commands will be applied to all users from the given scope, for whose language there are no dedicated commands.
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

-- | Initialize a 'DeleteMyCommands' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkDeleteMyCommands :: DeleteMyCommands
mkDeleteMyCommands =
  MkDeleteMyCommands
    { scope = Nothing
    , language_code = Nothing
    , extra = mempty
    }

instance Method DeleteMyCommands where
  type Result DeleteMyCommands = TrueValue
  methodName _ = "deleteMyCommands"
  planRequest x =
    planRequestBody
      "deleteMyCommands"
      [ "scope"
      , "language_code"
      ]
      ( concat
          [ plannedMaybe "scope" x.scope encodeJson
          , plannedMaybe "language_code" x.language_code encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
