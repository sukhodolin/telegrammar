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
module Telegram.Bot.Internal.Group.InputPollOptionMedia
  ( InputPollOptionMedia (..)
  , planInputPollOptionMedia
  ) where

import Data.Aeson (Value)
import Telegram.Bot.Internal.Group.InputMediaAnimation (InputMediaAnimation, planInputMediaAnimation)
import Telegram.Bot.Internal.Group.InputMediaLink (InputMediaLink)
import Telegram.Bot.Internal.Group.InputMediaLivePhoto (InputMediaLivePhoto, planInputMediaLivePhoto)
import Telegram.Bot.Internal.Group.InputMediaLocation (InputMediaLocation)
import Telegram.Bot.Internal.Group.InputMediaPhoto (InputMediaPhoto, planInputMediaPhoto)
import Telegram.Bot.Internal.Group.InputMediaSticker (InputMediaSticker, planInputMediaSticker)
import Telegram.Bot.Internal.Group.InputMediaVenue (InputMediaVenue)
import Telegram.Bot.Internal.Group.InputMediaVideo (InputMediaVideo, planInputMediaVideo)
import Telegram.Bot.Support (FieldPlanner, encodeJson, plainValue, planMember)

-- | This object represents the content of a poll option to be sent. It should be one of
-- \- InputMediaAnimation
-- \- InputMediaLink
-- \- InputMediaLivePhoto
-- \- InputMediaLocation
-- \- InputMediaPhoto
-- \- InputMediaSticker
-- \- InputMediaVenue
-- \- InputMediaVideo
--
-- Source: <https://core.telegram.org/bots/api#inputpolloptionmedia>.
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
data InputPollOptionMedia
  = InputPollOptionMediaViaInputMediaAnimation InputMediaAnimation
  | InputPollOptionMediaViaInputMediaLink InputMediaLink
  | InputPollOptionMediaViaInputMediaLivePhoto InputMediaLivePhoto
  | InputPollOptionMediaViaInputMediaLocation InputMediaLocation
  | InputPollOptionMediaViaInputMediaPhoto InputMediaPhoto
  | InputPollOptionMediaViaInputMediaSticker InputMediaSticker
  | InputPollOptionMediaViaInputMediaVenue InputMediaVenue
  | InputPollOptionMediaViaInputMediaVideo InputMediaVideo
  | -- | A value this decoder does not recognize, preserved verbatim so
    -- the raw payload survives the boundary.
    InputPollOptionMediaUnknown Value
  deriving stock (Eq, Show)

-- | Plan the selected member of a 'InputPollOptionMedia'.
--
-- An unrecognized value is emitted verbatim; it is an explicit raw
-- escape hatch and allocates no attachment.
planInputPollOptionMedia :: InputPollOptionMedia -> FieldPlanner
planInputPollOptionMedia = \case
  InputPollOptionMediaViaInputMediaAnimation member_ -> planMember (planInputMediaAnimation member_)
  InputPollOptionMediaViaInputMediaLink member_ -> planMember (encodeJson member_)
  InputPollOptionMediaViaInputMediaLivePhoto member_ -> planMember (planInputMediaLivePhoto member_)
  InputPollOptionMediaViaInputMediaLocation member_ -> planMember (encodeJson member_)
  InputPollOptionMediaViaInputMediaPhoto member_ -> planMember (planInputMediaPhoto member_)
  InputPollOptionMediaViaInputMediaSticker member_ -> planMember (planInputMediaSticker member_)
  InputPollOptionMediaViaInputMediaVenue member_ -> planMember (encodeJson member_)
  InputPollOptionMediaViaInputMediaVideo member_ -> planMember (planInputMediaVideo member_)
  InputPollOptionMediaUnknown raw_ -> planMember (plainValue raw_)
