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
module Telegram.Bot.Internal.Group.StoryAreaType
  ( StoryAreaType (..)
  ) where

import Data.Aeson (ToJSON (..), Value)
import Telegram.Bot.Internal.Group.StoryAreaTypeLink (StoryAreaTypeLink)
import Telegram.Bot.Internal.Group.StoryAreaTypeLocation (StoryAreaTypeLocation)
import Telegram.Bot.Internal.Group.StoryAreaTypeSuggestedReaction (StoryAreaTypeSuggestedReaction)
import Telegram.Bot.Internal.Group.StoryAreaTypeUniqueGift (StoryAreaTypeUniqueGift)
import Telegram.Bot.Internal.Group.StoryAreaTypeWeather (StoryAreaTypeWeather)

-- | Describes the type of a clickable area on a story. Currently, it can be one of
-- \- StoryAreaTypeLocation
-- \- StoryAreaTypeSuggestedReaction
-- \- StoryAreaTypeLink
-- \- StoryAreaTypeWeather
-- \- StoryAreaTypeUniqueGift
--
-- Source: <https://core.telegram.org/bots/api#storyareatype>.
-- Codec directions: encoded into requests.
data StoryAreaType
  = StoryAreaTypeViaStoryAreaTypeLink StoryAreaTypeLink
  | StoryAreaTypeViaStoryAreaTypeLocation StoryAreaTypeLocation
  | StoryAreaTypeViaStoryAreaTypeSuggestedReaction StoryAreaTypeSuggestedReaction
  | StoryAreaTypeViaStoryAreaTypeUniqueGift StoryAreaTypeUniqueGift
  | StoryAreaTypeViaStoryAreaTypeWeather StoryAreaTypeWeather
  | -- | A value this decoder does not recognize, preserved verbatim so
    -- the raw payload survives the boundary.
    StoryAreaTypeUnknown Value
  deriving stock (Eq, Show)

instance ToJSON StoryAreaType where
  toJSON = \case
    StoryAreaTypeViaStoryAreaTypeLink member_ -> toJSON member_
    StoryAreaTypeViaStoryAreaTypeLocation member_ -> toJSON member_
    StoryAreaTypeViaStoryAreaTypeSuggestedReaction member_ -> toJSON member_
    StoryAreaTypeViaStoryAreaTypeUniqueGift member_ -> toJSON member_
    StoryAreaTypeViaStoryAreaTypeWeather member_ -> toJSON member_
    StoryAreaTypeUnknown raw_ -> raw_
  toEncoding = toEncoding . toJSON
