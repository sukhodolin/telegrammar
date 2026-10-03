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
module Telegram.Bot.Internal.Group.InputPollMedia
  ( InputPollMedia (..)
  , planInputPollMedia
  ) where

import Data.Aeson (Value)
import Telegram.Bot.Internal.Group.InputMediaAnimation (InputMediaAnimation, planInputMediaAnimation)
import Telegram.Bot.Internal.Group.InputMediaAudio (InputMediaAudio, planInputMediaAudio)
import Telegram.Bot.Internal.Group.InputMediaDocument (InputMediaDocument, planInputMediaDocument)
import Telegram.Bot.Internal.Group.InputMediaLivePhoto (InputMediaLivePhoto, planInputMediaLivePhoto)
import Telegram.Bot.Internal.Group.InputMediaLocation (InputMediaLocation)
import Telegram.Bot.Internal.Group.InputMediaPhoto (InputMediaPhoto, planInputMediaPhoto)
import Telegram.Bot.Internal.Group.InputMediaVenue (InputMediaVenue)
import Telegram.Bot.Internal.Group.InputMediaVideo (InputMediaVideo, planInputMediaVideo)
import Telegram.Bot.Support (FieldPlanner, encodeJson, plainValue, planMember)

-- | This object represents the content of a poll description or a quiz explanation to be sent. It should be one of
-- \- InputMediaAnimation
-- \- InputMediaAudio
-- \- InputMediaDocument
-- \- InputMediaLivePhoto
-- \- InputMediaLocation
-- \- InputMediaPhoto
-- \- InputMediaVenue
-- \- InputMediaVideo
--
-- Source: <https://core.telegram.org/bots/api#inputpollmedia>.
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
data InputPollMedia
  = InputPollMediaViaInputMediaAnimation InputMediaAnimation
  | InputPollMediaViaInputMediaAudio InputMediaAudio
  | InputPollMediaViaInputMediaDocument InputMediaDocument
  | InputPollMediaViaInputMediaLivePhoto InputMediaLivePhoto
  | InputPollMediaViaInputMediaLocation InputMediaLocation
  | InputPollMediaViaInputMediaPhoto InputMediaPhoto
  | InputPollMediaViaInputMediaVenue InputMediaVenue
  | InputPollMediaViaInputMediaVideo InputMediaVideo
  | -- | A value this decoder does not recognize, preserved verbatim so
    -- the raw payload survives the boundary.
    InputPollMediaUnknown Value
  deriving stock (Eq, Show)

-- | Plan the selected member of a 'InputPollMedia'.
--
-- An unrecognized value is emitted verbatim; it is an explicit raw
-- escape hatch and allocates no attachment.
planInputPollMedia :: InputPollMedia -> FieldPlanner
planInputPollMedia = \case
  InputPollMediaViaInputMediaAnimation member_ -> planMember (planInputMediaAnimation member_)
  InputPollMediaViaInputMediaAudio member_ -> planMember (planInputMediaAudio member_)
  InputPollMediaViaInputMediaDocument member_ -> planMember (planInputMediaDocument member_)
  InputPollMediaViaInputMediaLivePhoto member_ -> planMember (planInputMediaLivePhoto member_)
  InputPollMediaViaInputMediaLocation member_ -> planMember (encodeJson member_)
  InputPollMediaViaInputMediaPhoto member_ -> planMember (planInputMediaPhoto member_)
  InputPollMediaViaInputMediaVenue member_ -> planMember (encodeJson member_)
  InputPollMediaViaInputMediaVideo member_ -> planMember (planInputMediaVideo member_)
  InputPollMediaUnknown raw_ -> planMember (plainValue raw_)
