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
module Telegram.Bot.Internal.Group.MediaGroupItem
  ( MediaGroupItem (..)
  , memberNameOfMediaGroupItem
  , planMediaGroupItem
  ) where

import Data.Aeson (Value)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.InputMediaAudio (InputMediaAudio, planInputMediaAudio)
import Telegram.Bot.Internal.Group.InputMediaDocument (InputMediaDocument, planInputMediaDocument)
import Telegram.Bot.Internal.Group.InputMediaLivePhoto (InputMediaLivePhoto, planInputMediaLivePhoto)
import Telegram.Bot.Internal.Group.InputMediaPhoto (InputMediaPhoto, planInputMediaPhoto)
import Telegram.Bot.Internal.Group.InputMediaVideo (InputMediaVideo, planInputMediaVideo)
import Telegram.Bot.Support (FieldPlanner, plainValue, planMember)

-- | A shared anonymous choice, interned by its resolved semantic identity.
--
-- Every occurrence with this exact member set, strategy, and resolved
-- members uses this one public type. Key digest:
-- @591c632998c21fbf@.
--
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
data MediaGroupItem
  = MediaGroupItemViaInputMediaAudio InputMediaAudio
  | MediaGroupItemViaInputMediaDocument InputMediaDocument
  | MediaGroupItemViaInputMediaLivePhoto InputMediaLivePhoto
  | MediaGroupItemViaInputMediaPhoto InputMediaPhoto
  | MediaGroupItemViaInputMediaVideo InputMediaVideo
  | -- | A value this decoder does not recognize, preserved verbatim so
    -- the raw payload survives the boundary.
    MediaGroupItemUnknown Value
  deriving stock (Eq, Show)

-- | Plan the selected member of a 'MediaGroupItem'.
--
-- An unrecognized value is emitted verbatim; it is an explicit raw
-- escape hatch and allocates no attachment.
planMediaGroupItem :: MediaGroupItem -> FieldPlanner
planMediaGroupItem = \case
  MediaGroupItemViaInputMediaAudio member_ -> planMember (planInputMediaAudio member_)
  MediaGroupItemViaInputMediaDocument member_ -> planMember (planInputMediaDocument member_)
  MediaGroupItemViaInputMediaLivePhoto member_ -> planMember (planInputMediaLivePhoto member_)
  MediaGroupItemViaInputMediaPhoto member_ -> planMember (planInputMediaPhoto member_)
  MediaGroupItemViaInputMediaVideo member_ -> planMember (planInputMediaVideo member_)
  MediaGroupItemUnknown raw_ -> planMember (plainValue raw_)

-- | The source member name of a 'MediaGroupItem' value.
--
-- A documented homogeneity constraint on an array of this type
-- compares these names.
memberNameOfMediaGroupItem :: MediaGroupItem -> Text
memberNameOfMediaGroupItem = \case
  MediaGroupItemViaInputMediaAudio _ -> "InputMediaAudio"
  MediaGroupItemViaInputMediaDocument _ -> "InputMediaDocument"
  MediaGroupItemViaInputMediaLivePhoto _ -> "InputMediaLivePhoto"
  MediaGroupItemViaInputMediaPhoto _ -> "InputMediaPhoto"
  MediaGroupItemViaInputMediaVideo _ -> "InputMediaVideo"
  MediaGroupItemUnknown _ -> "unknown"
