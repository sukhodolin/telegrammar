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
module Telegram.Bot.Methods.SetChatAdministratorCustomTitle
  ( SetChatAdministratorCustomTitle (..)
  , mkSetChatAdministratorCustomTitle
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned)

-- | Use this method to set a custom title for an administrator in a supergroup promoted by the bot. Returns True on success.
--
-- Wire method spelling: @setChatAdministratorCustomTitle@.
--
-- Source: <https://core.telegram.org/bots/api#setchatadministratorcustomtitle>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SetChatAdministratorCustomTitle = MkSetChatAdministratorCustomTitle
  { -- | Unique identifier for the target chat or username of the target supergroup in the format \@username
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | Unique identifier of the target user
    --
    -- Wire key: @user_id@.
    user_id :: Int64
  , -- | New custom title for the administrator; 0-16 characters, emoji are not allowed
    --
    -- Wire key: @custom_title@.
    custom_title :: Text
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SetChatAdministratorCustomTitle' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSetChatAdministratorCustomTitle :: IntegerOrString -> Int64 -> Text -> SetChatAdministratorCustomTitle
mkSetChatAdministratorCustomTitle arg0 arg1 arg2 =
  MkSetChatAdministratorCustomTitle
    { chat_id = arg0
    , user_id = arg1
    , custom_title = arg2
    , extra = mempty
    }

instance Method SetChatAdministratorCustomTitle where
  type Result SetChatAdministratorCustomTitle = TrueValue
  methodName _ = "setChatAdministratorCustomTitle"
  planRequest x =
    planRequestBody
      "setChatAdministratorCustomTitle"
      [ "chat_id"
      , "user_id"
      , "custom_title"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          , planned "user_id" (encodeJson x.user_id)
          , planned "custom_title" (encodeJson x.custom_title)
          ]
      )
      x.extra
  parseResult _ = parseJSON
