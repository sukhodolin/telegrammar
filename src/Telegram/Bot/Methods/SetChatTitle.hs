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
module Telegram.Bot.Methods.SetChatTitle
  ( SetChatTitle (..)
  , mkSetChatTitle
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned)

-- | Use this method to change the title of a chat. Titles can\'t be changed for private chats. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns True on success.
--
-- Wire method spelling: @setChatTitle@.
--
-- Source: <https://core.telegram.org/bots/api#setchattitle>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SetChatTitle = MkSetChatTitle
  { -- | Unique identifier for the target chat or username of the target channel in the format \@username
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | New chat title, 1-128 characters
    --
    -- Wire key: @title@.
    title :: Text
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SetChatTitle' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSetChatTitle :: IntegerOrString -> Text -> SetChatTitle
mkSetChatTitle arg0 arg1 =
  MkSetChatTitle
    { chat_id = arg0
    , title = arg1
    , extra = mempty
    }

instance Method SetChatTitle where
  type Result SetChatTitle = TrueValue
  methodName _ = "setChatTitle"
  planRequest x =
    planRequestBody
      "setChatTitle"
      [ "chat_id"
      , "title"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          , planned "title" (encodeJson x.title)
          ]
      )
      x.extra
  parseResult _ = parseJSON
