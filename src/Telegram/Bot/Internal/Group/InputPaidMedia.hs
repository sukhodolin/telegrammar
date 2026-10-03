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
module Telegram.Bot.Internal.Group.InputPaidMedia
  ( InputPaidMedia (..)
  , planInputPaidMedia
  ) where

import Data.Aeson (Value)
import Telegram.Bot.Internal.Group.InputPaidMediaLivePhoto (InputPaidMediaLivePhoto, planInputPaidMediaLivePhoto)
import Telegram.Bot.Internal.Group.InputPaidMediaPhoto (InputPaidMediaPhoto, planInputPaidMediaPhoto)
import Telegram.Bot.Internal.Group.InputPaidMediaVideo (InputPaidMediaVideo, planInputPaidMediaVideo)
import Telegram.Bot.Support (FieldPlanner, plainValue, planMember)

-- | This object describes the paid media to be sent. Currently, it can be one of
-- \- InputPaidMediaLivePhoto
-- \- InputPaidMediaPhoto
-- \- InputPaidMediaVideo
--
-- Source: <https://core.telegram.org/bots/api#inputpaidmedia>.
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
data InputPaidMedia
  = InputPaidMediaViaInputPaidMediaLivePhoto InputPaidMediaLivePhoto
  | InputPaidMediaViaInputPaidMediaPhoto InputPaidMediaPhoto
  | InputPaidMediaViaInputPaidMediaVideo InputPaidMediaVideo
  | -- | A value this decoder does not recognize, preserved verbatim so
    -- the raw payload survives the boundary.
    InputPaidMediaUnknown Value
  deriving stock (Eq, Show)

-- | Plan the selected member of a 'InputPaidMedia'.
--
-- An unrecognized value is emitted verbatim; it is an explicit raw
-- escape hatch and allocates no attachment.
planInputPaidMedia :: InputPaidMedia -> FieldPlanner
planInputPaidMedia = \case
  InputPaidMediaViaInputPaidMediaLivePhoto member_ -> planMember (planInputPaidMediaLivePhoto member_)
  InputPaidMediaViaInputPaidMediaPhoto member_ -> planMember (planInputPaidMediaPhoto member_)
  InputPaidMediaViaInputPaidMediaVideo member_ -> planMember (planInputPaidMediaVideo member_)
  InputPaidMediaUnknown raw_ -> planMember (plainValue raw_)
