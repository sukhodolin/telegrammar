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
module Telegram.Bot.Methods.GetChat
  ( GetChat (..)
  , mkGetChat
  ) where

import Data.Aeson (FromJSON (..), Object)
import Telegram.Bot.Internal.Group.ChatFullInfo (ChatFullInfo)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (Method (..), encodeJson, planRequestBody, planned)

-- | Use this method to get up-to-date information about the chat. Returns a ChatFullInfo object on success.
--
-- Wire method spelling: @getChat@.
--
-- Source: <https://core.telegram.org/bots/api#getchat>.
-- Result: @ChatFullInfo@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data GetChat = MkGetChat
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

-- | Initialize a 'GetChat' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkGetChat :: IntegerOrString -> GetChat
mkGetChat arg0 =
  MkGetChat
    { chat_id = arg0
    , extra = mempty
    }

instance Method GetChat where
  type Result GetChat = ChatFullInfo
  methodName _ = "getChat"
  planRequest x =
    planRequestBody
      "getChat"
      [ "chat_id"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          ]
      )
      x.extra
  parseResult _ = parseJSON
