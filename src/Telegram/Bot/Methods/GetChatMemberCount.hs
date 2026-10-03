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
module Telegram.Bot.Methods.GetChatMemberCount
  ( GetChatMemberCount (..)
  , mkGetChatMemberCount
  ) where

import Data.Aeson (Object)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (Method (..), encodeJson, parseInt64, planRequestBody, planned)

-- | Use this method to get the number of members in a chat. Returns Integer on success.
--
-- Wire method spelling: @getChatMemberCount@.
--
-- Source: <https://core.telegram.org/bots/api#getchatmembercount>.
-- Result: @Int64@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data GetChatMemberCount = MkGetChatMemberCount
  { -- | Unique identifier for the target chat or username of the target supergroup or channel in the format \@username
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'GetChatMemberCount' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkGetChatMemberCount :: IntegerOrString -> GetChatMemberCount
mkGetChatMemberCount arg0 =
  MkGetChatMemberCount
    { chat_id = arg0
    , extra = mempty
    }

instance Method GetChatMemberCount where
  type Result GetChatMemberCount = Int64
  methodName _ = "getChatMemberCount"
  planRequest x =
    planRequestBody
      "getChatMemberCount"
      [ "chat_id"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          ]
      )
      x.extra
  parseResult _ = parseInt64
