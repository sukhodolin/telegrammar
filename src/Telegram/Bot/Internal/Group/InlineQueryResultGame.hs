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
module Telegram.Bot.Internal.Group.InlineQueryResultGame
  ( InlineQueryResultGame (..)
  , mkInlineQueryResultGame
  ) where

import Data.Aeson (ToJSON (..), Value (..))
import Data.Text (Text)
import Telegram.Bot.Internal.Group.InlineKeyboardMarkup (InlineKeyboardMarkup)
import Telegram.Bot.Support (jsonField, jsonLiteral, jsonObject, jsonOptional)

-- | Represents a Game.
--
-- Source: <https://core.telegram.org/bots/api#inlinequeryresultgame>.
-- Codec directions: encoded into requests.
--
-- Supplied constants: @type@ = @"game"@.
data InlineQueryResultGame = MkInlineQueryResultGame
  { -- | Unique identifier for this result, 1-64 bytes
    --
    -- Wire key: @id@.
    id :: Text
  , -- | Short name of the game
    --
    -- Wire key: @game_short_name@.
    game_short_name :: Text
  , -- | Optional. Inline keyboard attached to the message
    --
    -- Wire key: @reply_markup@.
    -- Omitted from an encoded request when it is @Nothing@.
    reply_markup :: Maybe InlineKeyboardMarkup
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InlineQueryResultGame' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInlineQueryResultGame :: Text -> Text -> InlineQueryResultGame
mkInlineQueryResultGame arg0 arg1 =
  MkInlineQueryResultGame
    { id = arg0
    , game_short_name = arg1
    , reply_markup = Nothing
    }

instance ToJSON InlineQueryResultGame where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "game")
          , jsonField "id" x.id
          , jsonField "game_short_name" x.game_short_name
          , jsonOptional "reply_markup" x.reply_markup
          ]
      )
  toEncoding = toEncoding . toJSON
