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
module Telegram.Bot.Methods.GetChatMenuButton
  ( GetChatMenuButton (..)
  , mkGetChatMenuButton
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.MenuButton (MenuButton)
import Telegram.Bot.Support (Method (..), encodeJson, planRequestBody, plannedMaybe)

-- | Use this method to get the current value of the bot\'s menu button in a private chat, or the default menu button. Returns MenuButton on success.
--
-- Wire method spelling: @getChatMenuButton@.
--
-- Source: <https://core.telegram.org/bots/api#getchatmenubutton>.
-- Result: @MenuButton@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data GetChatMenuButton = MkGetChatMenuButton
  { -- | Unique identifier for the target private chat. If not specified, the bot\'s default menu button will be returned.
    --
    -- Wire key: @chat_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    chat_id :: Maybe Int64
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'GetChatMenuButton' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkGetChatMenuButton :: GetChatMenuButton
mkGetChatMenuButton =
  MkGetChatMenuButton
    { chat_id = Nothing
    , extra = mempty
    }

instance Method GetChatMenuButton where
  type Result GetChatMenuButton = MenuButton
  methodName _ = "getChatMenuButton"
  planRequest x =
    planRequestBody
      "getChatMenuButton"
      [ "chat_id"
      ]
      ( concat
          [ plannedMaybe "chat_id" x.chat_id encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
