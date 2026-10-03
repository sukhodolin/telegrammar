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
module Telegram.Bot.Internal.Group.InputStoryContent
  ( InputStoryContent (..)
  , planInputStoryContent
  ) where

import Data.Aeson (Value)
import Telegram.Bot.Internal.Group.InputStoryContentPhoto (InputStoryContentPhoto, planInputStoryContentPhoto)
import Telegram.Bot.Internal.Group.InputStoryContentVideo (InputStoryContentVideo, planInputStoryContentVideo)
import Telegram.Bot.Support (FieldPlanner, plainValue, planMember)

-- | This object describes the content of a story to post. Currently, it can be one of
-- \- InputStoryContentPhoto
-- \- InputStoryContentVideo
--
-- Source: <https://core.telegram.org/bots/api#inputstorycontent>.
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
data InputStoryContent
  = InputStoryContentViaInputStoryContentPhoto InputStoryContentPhoto
  | InputStoryContentViaInputStoryContentVideo InputStoryContentVideo
  | -- | A value this decoder does not recognize, preserved verbatim so
    -- the raw payload survives the boundary.
    InputStoryContentUnknown Value
  deriving stock (Eq, Show)

-- | Plan the selected member of a 'InputStoryContent'.
--
-- An unrecognized value is emitted verbatim; it is an explicit raw
-- escape hatch and allocates no attachment.
planInputStoryContent :: InputStoryContent -> FieldPlanner
planInputStoryContent = \case
  InputStoryContentViaInputStoryContentPhoto member_ -> planMember (planInputStoryContentPhoto member_)
  InputStoryContentViaInputStoryContentVideo member_ -> planMember (planInputStoryContentVideo member_)
  InputStoryContentUnknown raw_ -> planMember (plainValue raw_)
