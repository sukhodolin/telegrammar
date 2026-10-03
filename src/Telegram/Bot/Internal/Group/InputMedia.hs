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
module Telegram.Bot.Internal.Group.InputMedia
  ( InputMedia (..)
  , planInputMedia
  ) where

import Data.Aeson (Value)
import Telegram.Bot.Internal.Group.InputMediaAnimation (InputMediaAnimation, planInputMediaAnimation)
import Telegram.Bot.Internal.Group.InputMediaAudio (InputMediaAudio, planInputMediaAudio)
import Telegram.Bot.Internal.Group.InputMediaDocument (InputMediaDocument, planInputMediaDocument)
import Telegram.Bot.Internal.Group.InputMediaLivePhoto (InputMediaLivePhoto, planInputMediaLivePhoto)
import Telegram.Bot.Internal.Group.InputMediaPhoto (InputMediaPhoto, planInputMediaPhoto)
import Telegram.Bot.Internal.Group.InputMediaVideo (InputMediaVideo, planInputMediaVideo)
import Telegram.Bot.Support (FieldPlanner, plainValue, planMember)

-- | This object represents the content of a media message to be sent. It should be one of
-- \- InputMediaAnimation
-- \- InputMediaAudio
-- \- InputMediaDocument
-- \- InputMediaLivePhoto
-- \- InputMediaPhoto
-- \- InputMediaVideo
--
-- Source: <https://core.telegram.org/bots/api#inputmedia>.
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
data InputMedia
  = InputMediaViaInputMediaAnimation InputMediaAnimation
  | InputMediaViaInputMediaAudio InputMediaAudio
  | InputMediaViaInputMediaDocument InputMediaDocument
  | InputMediaViaInputMediaLivePhoto InputMediaLivePhoto
  | InputMediaViaInputMediaPhoto InputMediaPhoto
  | InputMediaViaInputMediaVideo InputMediaVideo
  | -- | A value this decoder does not recognize, preserved verbatim so
    -- the raw payload survives the boundary.
    InputMediaUnknown Value
  deriving stock (Eq, Show)

-- | Plan the selected member of a 'InputMedia'.
--
-- An unrecognized value is emitted verbatim; it is an explicit raw
-- escape hatch and allocates no attachment.
planInputMedia :: InputMedia -> FieldPlanner
planInputMedia = \case
  InputMediaViaInputMediaAnimation member_ -> planMember (planInputMediaAnimation member_)
  InputMediaViaInputMediaAudio member_ -> planMember (planInputMediaAudio member_)
  InputMediaViaInputMediaDocument member_ -> planMember (planInputMediaDocument member_)
  InputMediaViaInputMediaLivePhoto member_ -> planMember (planInputMediaLivePhoto member_)
  InputMediaViaInputMediaPhoto member_ -> planMember (planInputMediaPhoto member_)
  InputMediaViaInputMediaVideo member_ -> planMember (planInputMediaVideo member_)
  InputMediaUnknown raw_ -> planMember (plainValue raw_)
