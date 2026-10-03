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
module Telegram.Bot.Internal.Group.StoryArea
  ( StoryArea (..)
  , mkStoryArea
  ) where

import Data.Aeson (ToJSON (..))
import Telegram.Bot.Internal.Group.StoryAreaPosition (StoryAreaPosition)
import Telegram.Bot.Internal.Group.StoryAreaType (StoryAreaType)
import Telegram.Bot.Support (jsonField, jsonObject)

-- | Describes a clickable area on a story media.
--
-- Source: <https://core.telegram.org/bots/api#storyarea>.
-- Codec directions: encoded into requests.
data StoryArea = MkStoryArea
  { -- | Position of the area
    --
    -- Wire key: @position@.
    position :: StoryAreaPosition
  , -- | Type of the area
    --
    -- Wire key: @type@.
    type_ :: StoryAreaType
  }
  deriving stock (Eq, Show)

-- | Initialize a 'StoryArea' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkStoryArea :: StoryAreaPosition -> StoryAreaType -> StoryArea
mkStoryArea arg0 arg1 =
  MkStoryArea
    { position = arg0
    , type_ = arg1
    }

instance ToJSON StoryArea where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "position" x.position
          , jsonField "type" x.type_
          ]
      )
  toEncoding = toEncoding . toJSON
