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
module Telegram.Bot.Methods.SetChatMenuButton
  ( SetChatMenuButton (..)
  , mkSetChatMenuButton
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.MenuButton (MenuButton)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, plannedMaybe)

-- | Use this method to change the bot\'s menu button in a private chat, or the default menu button. Returns True on success.
--
-- Wire method spelling: @setChatMenuButton@.
--
-- Source: <https://core.telegram.org/bots/api#setchatmenubutton>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SetChatMenuButton = MkSetChatMenuButton
  { -- | Unique identifier for the target private chat. If not specified, the bot\'s default menu button will be changed.
    --
    -- Wire key: @chat_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    chat_id :: Maybe Int64
  , -- | A JSON-serialized object for the bot\'s new menu button. Defaults to MenuButtonDefault.
    --
    -- Wire key: @menu_button@.
    -- Omitted from an encoded request when it is @Nothing@.
    menu_button :: Maybe MenuButton
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SetChatMenuButton' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSetChatMenuButton :: SetChatMenuButton
mkSetChatMenuButton =
  MkSetChatMenuButton
    { chat_id = Nothing
    , menu_button = Nothing
    , extra = mempty
    }

instance Method SetChatMenuButton where
  type Result SetChatMenuButton = TrueValue
  methodName _ = "setChatMenuButton"
  planRequest x =
    planRequestBody
      "setChatMenuButton"
      [ "chat_id"
      , "menu_button"
      ]
      ( concat
          [ plannedMaybe "chat_id" x.chat_id encodeJson
          , plannedMaybe "menu_button" x.menu_button encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
