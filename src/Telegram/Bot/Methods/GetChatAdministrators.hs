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
module Telegram.Bot.Methods.GetChatAdministrators
  ( GetChatAdministrators (..)
  , mkGetChatAdministrators
  ) where

import Data.Aeson (FromJSON (..), Object)
import Telegram.Bot.Internal.Group.ChatMember (ChatMember)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (Method (..), encodeJson, parseList, planRequestBody, planned, plannedMaybe)

-- | Use this method to get a list of administrators in a chat. Returns an Array of ChatMember objects.
--
-- Wire method spelling: @getChatAdministrators@.
--
-- Source: <https://core.telegram.org/bots/api#getchatadministrators>.
-- Result: @[ChatMember]@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data GetChatAdministrators = MkGetChatAdministrators
  { -- | Unique identifier for the target chat or username of the target supergroup or channel in the format \@username
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | Pass True to additionally receive all bots that are administrators of the chat. By default, bots other than the current bot are omitted.
    --
    -- Wire key: @return_bots@.
    -- Omitted from an encoded request when it is @Nothing@.
    return_bots :: Maybe Bool
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'GetChatAdministrators' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkGetChatAdministrators :: IntegerOrString -> GetChatAdministrators
mkGetChatAdministrators arg0 =
  MkGetChatAdministrators
    { chat_id = arg0
    , return_bots = Nothing
    , extra = mempty
    }

instance Method GetChatAdministrators where
  type Result GetChatAdministrators = [ChatMember]
  methodName _ = "getChatAdministrators"
  planRequest x =
    planRequestBody
      "getChatAdministrators"
      [ "chat_id"
      , "return_bots"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          , plannedMaybe "return_bots" x.return_bots encodeJson
          ]
      )
      x.extra
  parseResult _ = (parseList parseJSON)
