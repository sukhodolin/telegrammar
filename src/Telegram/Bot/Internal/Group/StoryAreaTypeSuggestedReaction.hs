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
module Telegram.Bot.Internal.Group.StoryAreaTypeSuggestedReaction
  ( StoryAreaTypeSuggestedReaction (..)
  , mkStoryAreaTypeSuggestedReaction
  ) where

import Data.Aeson (ToJSON (..), Value (..))
import Telegram.Bot.Internal.Group.ReactionType (ReactionType)
import Telegram.Bot.Support (jsonField, jsonLiteral, jsonObject, jsonOptional)

-- | Describes a story area pointing to a suggested reaction. Currently, a story can have up to 5 suggested reaction areas.
--
-- Source: <https://core.telegram.org/bots/api#storyareatypesuggestedreaction>.
-- Codec directions: encoded into requests.
--
-- Supplied constants: @type@ = @"suggested_reaction"@.
data StoryAreaTypeSuggestedReaction = MkStoryAreaTypeSuggestedReaction
  { -- | Type of the reaction
    --
    -- Wire key: @reaction_type@.
    reaction_type :: ReactionType
  , -- | Optional. Pass True if the reaction area has a dark background
    --
    -- Wire key: @is_dark@.
    -- Omitted from an encoded request when it is @Nothing@.
    is_dark :: Maybe Bool
  , -- | Optional. Pass True if reaction area corner is flipped
    --
    -- Wire key: @is_flipped@.
    -- Omitted from an encoded request when it is @Nothing@.
    is_flipped :: Maybe Bool
  }
  deriving stock (Eq, Show)

-- | Initialize a 'StoryAreaTypeSuggestedReaction' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkStoryAreaTypeSuggestedReaction :: ReactionType -> StoryAreaTypeSuggestedReaction
mkStoryAreaTypeSuggestedReaction arg0 =
  MkStoryAreaTypeSuggestedReaction
    { reaction_type = arg0
    , is_dark = Nothing
    , is_flipped = Nothing
    }

instance ToJSON StoryAreaTypeSuggestedReaction where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "suggested_reaction")
          , jsonField "reaction_type" x.reaction_type
          , jsonOptional "is_dark" x.is_dark
          , jsonOptional "is_flipped" x.is_flipped
          ]
      )
  toEncoding = toEncoding . toJSON
