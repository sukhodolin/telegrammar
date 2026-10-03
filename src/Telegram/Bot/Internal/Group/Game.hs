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
module Telegram.Bot.Internal.Group.Game
  ( Game (..)
  , mkGame
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.Animation (Animation)
import Telegram.Bot.Internal.Group.MessageEntity (MessageEntity)
import Telegram.Bot.Internal.Group.PhotoSize (PhotoSize)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseList, requiredWith)

-- | This object represents a game. Use BotFather to create and edit games, their short names will act as unique identifiers.
--
-- Source: <https://core.telegram.org/bots/api#game>.
-- Codec directions: decoded from responses, encoded into requests.
data Game = MkGame
  { -- | Title of the game
    --
    -- Wire key: @title@.
    title :: Text
  , -- | Description of the game
    --
    -- Wire key: @description@.
    description :: Text
  , -- | Photo that will be displayed in the game message in chats
    --
    -- Wire key: @photo@.
    photo :: [PhotoSize]
  , -- | Optional. Brief description of the game or high scores included in the game message. Can be automatically edited to include current high scores for the game when the bot calls setGameScore, or manually edited using editMessageText. 0-4096 characters.
    --
    -- Wire key: @text@.
    -- Omitted from an encoded request when it is @Nothing@.
    text :: Maybe Text
  , -- | Optional. Special entities that appear in text, such as usernames, URLs, bot commands, etc.
    --
    -- Wire key: @text_entities@.
    -- Omitted from an encoded request when it is @Nothing@.
    text_entities :: Maybe [MessageEntity]
  , -- | Optional. Animation that will be displayed in the game message in chats. Upload via BotFather.
    --
    -- Wire key: @animation@.
    -- Omitted from an encoded request when it is @Nothing@.
    animation :: Maybe Animation
  }
  deriving stock (Eq, Show)

-- | Initialize a 'Game' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkGame :: Text -> Text -> [PhotoSize] -> Game
mkGame arg0 arg1 arg2 =
  MkGame
    { title = arg0
    , description = arg1
    , photo = arg2
    , text = Nothing
    , text_entities = Nothing
    , animation = Nothing
    }

instance FromJSON Game where
  parseJSON = withObject "Game" $ \obj ->
    do
      field_0 <- requiredWith obj "title" parseJSON
      field_1 <- requiredWith obj "description" parseJSON
      field_2 <- requiredWith obj "photo" (parseList parseJSON)
      field_3 <- optionalWith obj "text" parseJSON
      field_4 <- optionalWith obj "text_entities" (parseList parseJSON)
      field_5 <- optionalWith obj "animation" parseJSON
      pure
        MkGame
          { title = field_0
          , description = field_1
          , photo = field_2
          , text = field_3
          , text_entities = field_4
          , animation = field_5
          }

instance ToJSON Game where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "title" x.title
          , jsonField "description" x.description
          , jsonField "photo" x.photo
          , jsonOptional "text" x.text
          , jsonOptional "text_entities" x.text_entities
          , jsonOptional "animation" x.animation
          ]
      )
  toEncoding = toEncoding . toJSON
