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
module Telegram.Bot.Methods.VerifyChat
  ( VerifyChat (..)
  , mkVerifyChat
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned, plannedMaybe)

-- | Verifies a chat on behalf of the organization which is represented by the bot. Returns True on success.
--
-- Wire method spelling: @verifyChat@.
--
-- Source: <https://core.telegram.org/bots/api#verifychat>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data VerifyChat = MkVerifyChat
  { -- | Unique identifier for the target chat or username of the target bot, supergroup or channel in the format \@username. Channel direct messages chats can\'t be verified.
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | Custom description for the verification; 0-70 characters. Must be empty if the organization isn\'t allowed to provide a custom verification description.
    --
    -- Wire key: @custom_description@.
    -- Omitted from an encoded request when it is @Nothing@.
    custom_description :: Maybe Text
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'VerifyChat' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkVerifyChat :: IntegerOrString -> VerifyChat
mkVerifyChat arg0 =
  MkVerifyChat
    { chat_id = arg0
    , custom_description = Nothing
    , extra = mempty
    }

instance Method VerifyChat where
  type Result VerifyChat = TrueValue
  methodName _ = "verifyChat"
  planRequest x =
    planRequestBody
      "verifyChat"
      [ "chat_id"
      , "custom_description"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          , plannedMaybe "custom_description" x.custom_description encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
