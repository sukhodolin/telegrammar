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
module Telegram.Bot.Methods.SavePreparedKeyboardButton
  ( SavePreparedKeyboardButton (..)
  , mkSavePreparedKeyboardButton
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.KeyboardButton (KeyboardButton)
import Telegram.Bot.Internal.Group.PreparedKeyboardButton (PreparedKeyboardButton)
import Telegram.Bot.Support (Method (..), encodeJson, planRequestBody, planned)

-- | Stores a keyboard button that can be used by a user within a Mini App. Returns a PreparedKeyboardButton object.
--
-- Wire method spelling: @savePreparedKeyboardButton@.
--
-- Source: <https://core.telegram.org/bots/api#savepreparedkeyboardbutton>.
-- Result: @PreparedKeyboardButton@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SavePreparedKeyboardButton = MkSavePreparedKeyboardButton
  { -- | Unique identifier of the target user that can use the button
    --
    -- Wire key: @user_id@.
    user_id :: Int64
  , -- | A JSON-serialized object describing the button to be saved. The button must be of the type request_users, request_chat, or request_managed_bot.
    --
    -- Wire key: @button@.
    button :: KeyboardButton
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SavePreparedKeyboardButton' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSavePreparedKeyboardButton :: Int64 -> KeyboardButton -> SavePreparedKeyboardButton
mkSavePreparedKeyboardButton arg0 arg1 =
  MkSavePreparedKeyboardButton
    { user_id = arg0
    , button = arg1
    , extra = mempty
    }

instance Method SavePreparedKeyboardButton where
  type Result SavePreparedKeyboardButton = PreparedKeyboardButton
  methodName _ = "savePreparedKeyboardButton"
  planRequest x =
    planRequestBody
      "savePreparedKeyboardButton"
      [ "user_id"
      , "button"
      ]
      ( concat
          [ planned "user_id" (encodeJson x.user_id)
          , planned "button" (encodeJson x.button)
          ]
      )
      x.extra
  parseResult _ = parseJSON
