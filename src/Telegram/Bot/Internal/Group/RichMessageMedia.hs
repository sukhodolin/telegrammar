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
module Telegram.Bot.Internal.Group.RichMessageMedia
  ( RichMessageMedia (..)
  , planRichMessageMedia
  ) where

import Data.Aeson (Value)
import Telegram.Bot.Internal.Group.InputMediaAnimation (InputMediaAnimation, planInputMediaAnimation)
import Telegram.Bot.Internal.Group.InputMediaAudio (InputMediaAudio, planInputMediaAudio)
import Telegram.Bot.Internal.Group.InputMediaDocument (InputMediaDocument, planInputMediaDocument)
import Telegram.Bot.Internal.Group.InputMediaPhoto (InputMediaPhoto, planInputMediaPhoto)
import Telegram.Bot.Internal.Group.InputMediaVideo (InputMediaVideo, planInputMediaVideo)
import Telegram.Bot.Internal.Group.InputMediaVoiceNote (InputMediaVoiceNote, planInputMediaVoiceNote)
import Telegram.Bot.Support (FieldPlanner, plainValue, planMember)

-- | A shared anonymous choice, interned by its resolved semantic identity.
--
-- Every occurrence with this exact member set, strategy, and resolved
-- members uses this one public type. Key digest:
-- @fcff6e703323015d@.
--
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
data RichMessageMedia
  = RichMessageMediaViaInputMediaAnimation InputMediaAnimation
  | RichMessageMediaViaInputMediaAudio InputMediaAudio
  | RichMessageMediaViaInputMediaDocument InputMediaDocument
  | RichMessageMediaViaInputMediaPhoto InputMediaPhoto
  | RichMessageMediaViaInputMediaVideo InputMediaVideo
  | RichMessageMediaViaInputMediaVoiceNote InputMediaVoiceNote
  | -- | A value this decoder does not recognize, preserved verbatim so
    -- the raw payload survives the boundary.
    RichMessageMediaUnknown Value
  deriving stock (Eq, Show)

-- | Plan the selected member of a 'RichMessageMedia'.
--
-- An unrecognized value is emitted verbatim; it is an explicit raw
-- escape hatch and allocates no attachment.
planRichMessageMedia :: RichMessageMedia -> FieldPlanner
planRichMessageMedia = \case
  RichMessageMediaViaInputMediaAnimation member_ -> planMember (planInputMediaAnimation member_)
  RichMessageMediaViaInputMediaAudio member_ -> planMember (planInputMediaAudio member_)
  RichMessageMediaViaInputMediaDocument member_ -> planMember (planInputMediaDocument member_)
  RichMessageMediaViaInputMediaPhoto member_ -> planMember (planInputMediaPhoto member_)
  RichMessageMediaViaInputMediaVideo member_ -> planMember (planInputMediaVideo member_)
  RichMessageMediaViaInputMediaVoiceNote member_ -> planMember (planInputMediaVoiceNote member_)
  RichMessageMediaUnknown raw_ -> planMember (plainValue raw_)
