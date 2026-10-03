{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE OverloadedStrings #-}

-- | Internal: one dependency component of the type graph.
--
-- This module is an implementation detail of the generated package. Its
-- declarations are re-exported by the aggregate types façade, which is
-- where consumers import them from. The module name is a deterministic
-- identifier taken from the component's smallest declaration name, not a
-- semantic family name, and it can change when the source graph changes.
--
-- Generated. Do not edit.
module Telegram.Bot.Internal.Group.ReplyKeyboardRemove
  ( ReplyKeyboardRemove (..)
  , mkReplyKeyboardRemove
  ) where

import Data.Aeson (ToJSON (..), Value (..))
import Telegram.Bot.Support (jsonLiteral, jsonObject, jsonOptional)

-- | Upon receiving a message with this object, Telegram clients will remove the current custom keyboard and display the default letter-keyboard. By default, custom keyboards are displayed until a new keyboard is sent by a bot. An exception is made for one-time keyboards that are hidden immediately after the user presses a button (see ReplyKeyboardMarkup). Not supported in channels and for messages sent on behalf of a business account.
--
-- Source: <https://core.telegram.org/bots/api#replykeyboardremove>.
-- Codec directions: encoded into requests.
--
-- Supplied constants: @remove_keyboard@ = @true@.
data ReplyKeyboardRemove = MkReplyKeyboardRemove
  { -- | Optional. Use this parameter if you want to remove the keyboard for specific users only. Targets: 1) users that are \@mentioned in the text of the Message object; 2) if the bot\'s message is a reply to a message in the same chat and forum topic, sender of the original message. Example: A user votes in a poll, bot returns confirmation message in reply to the vote and removes the keyboard for that user, while still showing the keyboard with poll options to users who haven\'t voted yet.
    --
    -- Wire key: @selective@.
    -- Omitted from an encoded request when it is @Nothing@.
    selective :: Maybe Bool
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ReplyKeyboardRemove' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkReplyKeyboardRemove :: ReplyKeyboardRemove
mkReplyKeyboardRemove =
  MkReplyKeyboardRemove
    { selective = Nothing
    }

instance ToJSON ReplyKeyboardRemove where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "remove_keyboard" (Bool True)
          , jsonOptional "selective" x.selective
          ]
      )
  toEncoding = toEncoding . toJSON
