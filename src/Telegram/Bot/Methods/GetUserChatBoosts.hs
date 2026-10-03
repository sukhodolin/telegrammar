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
module Telegram.Bot.Methods.GetUserChatBoosts
  ( GetUserChatBoosts (..)
  , mkGetUserChatBoosts
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Internal.Group.UserChatBoosts (UserChatBoosts)
import Telegram.Bot.Support (Method (..), encodeJson, planRequestBody, planned)

-- | Use this method to get the list of boosts added to a chat by a user. Requires administrator rights in the chat. Returns a UserChatBoosts object.
--
-- Wire method spelling: @getUserChatBoosts@.
--
-- Source: <https://core.telegram.org/bots/api#getuserchatboosts>.
-- Result: @UserChatBoosts@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data GetUserChatBoosts = MkGetUserChatBoosts
  { -- | Unique identifier for the chat or username of the channel in the format \@username
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | Unique identifier of the target user
    --
    -- Wire key: @user_id@.
    user_id :: Int64
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'GetUserChatBoosts' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkGetUserChatBoosts :: IntegerOrString -> Int64 -> GetUserChatBoosts
mkGetUserChatBoosts arg0 arg1 =
  MkGetUserChatBoosts
    { chat_id = arg0
    , user_id = arg1
    , extra = mempty
    }

instance Method GetUserChatBoosts where
  type Result GetUserChatBoosts = UserChatBoosts
  methodName _ = "getUserChatBoosts"
  planRequest x =
    planRequestBody
      "getUserChatBoosts"
      [ "chat_id"
      , "user_id"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          , planned "user_id" (encodeJson x.user_id)
          ]
      )
      x.extra
  parseResult _ = parseJSON
