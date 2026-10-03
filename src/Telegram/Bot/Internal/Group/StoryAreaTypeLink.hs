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
module Telegram.Bot.Internal.Group.StoryAreaTypeLink
  ( StoryAreaTypeLink (..)
  , mkStoryAreaTypeLink
  ) where

import Data.Aeson (ToJSON (..), Value (..))
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonLiteral, jsonObject)

-- | Describes a story area pointing to an HTTP or tg:\/\/ link. Currently, a story can have up to 3 link areas.
--
-- Source: <https://core.telegram.org/bots/api#storyareatypelink>.
-- Codec directions: encoded into requests.
--
-- Supplied constants: @type@ = @"link"@.
data StoryAreaTypeLink = MkStoryAreaTypeLink
  { -- | HTTP or tg:\/\/ URL to be opened when the area is clicked
    --
    -- Wire key: @url@.
    url :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'StoryAreaTypeLink' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkStoryAreaTypeLink :: Text -> StoryAreaTypeLink
mkStoryAreaTypeLink arg0 =
  MkStoryAreaTypeLink
    { url = arg0
    }

instance ToJSON StoryAreaTypeLink where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "link")
          , jsonField "url" x.url
          ]
      )
  toEncoding = toEncoding . toJSON
