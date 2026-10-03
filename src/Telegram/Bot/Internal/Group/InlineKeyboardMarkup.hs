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
module Telegram.Bot.Internal.Group.InlineKeyboardMarkup
  ( InlineKeyboardMarkup (..)
  , mkInlineKeyboardMarkup
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Telegram.Bot.Internal.Group.InlineKeyboardButton (InlineKeyboardButton)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseList, requiredWith)

-- | This object represents an inline keyboard that appears right next to the message it belongs to.
--
-- Source: <https://core.telegram.org/bots/api#inlinekeyboardmarkup>.
-- Codec directions: decoded from responses, encoded into requests.
data InlineKeyboardMarkup = MkInlineKeyboardMarkup
  { -- | Array of button rows, each represented by an Array of InlineKeyboardButton objects
    --
    -- Wire key: @inline_keyboard@.
    inline_keyboard :: [[InlineKeyboardButton]]
  , -- | Optional. Pass True if the reply interface must be shown to the user, as if they had manually selected the bot\'s message and tapped \'Reply\'. The value of the field can\'t be changed when the inline keyboard is edited.
    --
    -- Wire key: @force_reply@.
    -- Omitted from an encoded request when it is @Nothing@.
    force_reply :: Maybe Bool
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InlineKeyboardMarkup' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInlineKeyboardMarkup :: [[InlineKeyboardButton]] -> InlineKeyboardMarkup
mkInlineKeyboardMarkup arg0 =
  MkInlineKeyboardMarkup
    { inline_keyboard = arg0
    , force_reply = Nothing
    }

instance FromJSON InlineKeyboardMarkup where
  parseJSON = withObject "InlineKeyboardMarkup" $ \obj ->
    do
      field_0 <- requiredWith obj "inline_keyboard" (parseList (parseList parseJSON))
      field_1 <- optionalWith obj "force_reply" parseJSON
      pure
        MkInlineKeyboardMarkup
          { inline_keyboard = field_0
          , force_reply = field_1
          }

instance ToJSON InlineKeyboardMarkup where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "inline_keyboard" x.inline_keyboard
          , jsonOptional "force_reply" x.force_reply
          ]
      )
  toEncoding = toEncoding . toJSON
