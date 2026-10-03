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
module Telegram.Bot.Internal.Group.StoryAreaPosition
  ( StoryAreaPosition (..)
  , mkStoryAreaPosition
  ) where

import Data.Aeson (ToJSON (..))
import Data.Scientific (Scientific)
import Telegram.Bot.Support (jsonField, jsonObject)

-- | Describes the position of a clickable area within a story.
--
-- Source: <https://core.telegram.org/bots/api#storyareaposition>.
-- Codec directions: encoded into requests.
data StoryAreaPosition = MkStoryAreaPosition
  { -- | The abscissa of the area\'s center, as a percentage of the media width
    --
    -- Wire key: @x_percentage@.
    x_percentage :: Scientific
  , -- | The ordinate of the area\'s center, as a percentage of the media height
    --
    -- Wire key: @y_percentage@.
    y_percentage :: Scientific
  , -- | The width of the area\'s rectangle, as a percentage of the media width
    --
    -- Wire key: @width_percentage@.
    width_percentage :: Scientific
  , -- | The height of the area\'s rectangle, as a percentage of the media height
    --
    -- Wire key: @height_percentage@.
    height_percentage :: Scientific
  , -- | The clockwise rotation angle of the rectangle, in degrees; 0-360
    --
    -- Wire key: @rotation_angle@.
    rotation_angle :: Scientific
  , -- | The radius of the rectangle corner rounding, as a percentage of the media width
    --
    -- Wire key: @corner_radius_percentage@.
    corner_radius_percentage :: Scientific
  }
  deriving stock (Eq, Show)

-- | Initialize a 'StoryAreaPosition' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkStoryAreaPosition :: Scientific -> Scientific -> Scientific -> Scientific -> Scientific -> Scientific -> StoryAreaPosition
mkStoryAreaPosition arg0 arg1 arg2 arg3 arg4 arg5 =
  MkStoryAreaPosition
    { x_percentage = arg0
    , y_percentage = arg1
    , width_percentage = arg2
    , height_percentage = arg3
    , rotation_angle = arg4
    , corner_radius_percentage = arg5
    }

instance ToJSON StoryAreaPosition where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "x_percentage" x.x_percentage
          , jsonField "y_percentage" x.y_percentage
          , jsonField "width_percentage" x.width_percentage
          , jsonField "height_percentage" x.height_percentage
          , jsonField "rotation_angle" x.rotation_angle
          , jsonField "corner_radius_percentage" x.corner_radius_percentage
          ]
      )
  toEncoding = toEncoding . toJSON
