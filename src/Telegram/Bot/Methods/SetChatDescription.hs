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
module Telegram.Bot.Methods.SetChatDescription
  ( SetChatDescription (..)
  , mkSetChatDescription
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned, plannedMaybe)

-- | Use this method to change the description of a group, a supergroup or a channel. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns True on success.
--
-- Wire method spelling: @setChatDescription@.
--
-- Source: <https://core.telegram.org/bots/api#setchatdescription>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SetChatDescription = MkSetChatDescription
  { -- | Unique identifier for the target chat or username of the target channel in the format \@username
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | New chat description, 0-255 characters
    --
    -- Wire key: @description@.
    -- Omitted from an encoded request when it is @Nothing@.
    description :: Maybe Text
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SetChatDescription' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSetChatDescription :: IntegerOrString -> SetChatDescription
mkSetChatDescription arg0 =
  MkSetChatDescription
    { chat_id = arg0
    , description = Nothing
    , extra = mempty
    }

instance Method SetChatDescription where
  type Result SetChatDescription = TrueValue
  methodName _ = "setChatDescription"
  planRequest x =
    planRequestBody
      "setChatDescription"
      [ "chat_id"
      , "description"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          , plannedMaybe "description" x.description encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
