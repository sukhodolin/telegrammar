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
module Telegram.Bot.Internal.Group.Story
  ( Story (..)
  , mkStory
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.Chat (Chat)
import Telegram.Bot.Support (jsonField, jsonObject, parseInt64, requiredWith)

-- | This object represents a story.
--
-- Source: <https://core.telegram.org/bots/api#story>.
-- Codec directions: decoded from responses, encoded into requests.
data Story = MkStory
  { -- | Chat that posted the story
    --
    -- Wire key: @chat@.
    chat :: Chat
  , -- | Unique identifier for the story in the chat
    --
    -- Wire key: @id@.
    id :: Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'Story' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkStory :: Chat -> Int64 -> Story
mkStory arg0 arg1 =
  MkStory
    { chat = arg0
    , id = arg1
    }

instance FromJSON Story where
  parseJSON = withObject "Story" $ \obj ->
    do
      field_0 <- requiredWith obj "chat" parseJSON
      field_1 <- requiredWith obj "id" parseInt64
      pure
        MkStory
          { chat = field_0
          , id = field_1
          }

instance ToJSON Story where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "chat" x.chat
          , jsonField "id" x.id
          ]
      )
  toEncoding = toEncoding . toJSON
