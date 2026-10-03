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
module Telegram.Bot.Internal.Group.StoryAreaTypeUniqueGift
  ( StoryAreaTypeUniqueGift (..)
  , mkStoryAreaTypeUniqueGift
  ) where

import Data.Aeson (ToJSON (..), Value (..))
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonLiteral, jsonObject)

-- | Describes a story area pointing to a unique gift. Currently, a story can have at most 1 unique gift area.
--
-- Source: <https://core.telegram.org/bots/api#storyareatypeuniquegift>.
-- Codec directions: encoded into requests.
--
-- Supplied constants: @type@ = @"unique_gift"@.
data StoryAreaTypeUniqueGift = MkStoryAreaTypeUniqueGift
  { -- | Unique name of the gift
    --
    -- Wire key: @name@.
    name :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'StoryAreaTypeUniqueGift' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkStoryAreaTypeUniqueGift :: Text -> StoryAreaTypeUniqueGift
mkStoryAreaTypeUniqueGift arg0 =
  MkStoryAreaTypeUniqueGift
    { name = arg0
    }

instance ToJSON StoryAreaTypeUniqueGift where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "unique_gift")
          , jsonField "name" x.name
          ]
      )
  toEncoding = toEncoding . toJSON
