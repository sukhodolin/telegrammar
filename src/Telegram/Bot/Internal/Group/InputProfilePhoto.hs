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
module Telegram.Bot.Internal.Group.InputProfilePhoto
  ( InputProfilePhoto (..)
  , planInputProfilePhoto
  ) where

import Data.Aeson (Value)
import Telegram.Bot.Internal.Group.InputProfilePhotoAnimated (InputProfilePhotoAnimated, planInputProfilePhotoAnimated)
import Telegram.Bot.Internal.Group.InputProfilePhotoStatic (InputProfilePhotoStatic, planInputProfilePhotoStatic)
import Telegram.Bot.Support (FieldPlanner, plainValue, planMember)

-- | This object describes a profile photo to set. Currently, it can be one of
-- \- InputProfilePhotoStatic
-- \- InputProfilePhotoAnimated
--
-- Source: <https://core.telegram.org/bots/api#inputprofilephoto>.
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
data InputProfilePhoto
  = InputProfilePhotoViaInputProfilePhotoAnimated InputProfilePhotoAnimated
  | InputProfilePhotoViaInputProfilePhotoStatic InputProfilePhotoStatic
  | -- | A value this decoder does not recognize, preserved verbatim so
    -- the raw payload survives the boundary.
    InputProfilePhotoUnknown Value
  deriving stock (Eq, Show)

-- | Plan the selected member of a 'InputProfilePhoto'.
--
-- An unrecognized value is emitted verbatim; it is an explicit raw
-- escape hatch and allocates no attachment.
planInputProfilePhoto :: InputProfilePhoto -> FieldPlanner
planInputProfilePhoto = \case
  InputProfilePhotoViaInputProfilePhotoAnimated member_ -> planMember (planInputProfilePhotoAnimated member_)
  InputProfilePhotoViaInputProfilePhotoStatic member_ -> planMember (planInputProfilePhotoStatic member_)
  InputProfilePhotoUnknown raw_ -> planMember (plainValue raw_)
