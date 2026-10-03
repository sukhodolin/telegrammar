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
module Telegram.Bot.Internal.Group.InputStoryContentVideo
  ( InputStoryContentVideo (..)
  , mkInputStoryContentVideo
  , planInputStoryContentVideo
  ) where

import Data.Aeson (Value (..))
import Data.Scientific (Scientific)
import Telegram.Bot.Support (FieldPlanner, FileCapability (..), InputFile, encodeJson, filePolicy, planFileValue, planRecord, planned, plannedLiteral, plannedMaybe)

-- | Describes a video to post as a story.
--
-- Source: <https://core.telegram.org/bots/api#inputstorycontentvideo>.
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
--
-- Supplied constants: @type@ = @"video"@.
data InputStoryContentVideo = MkInputStoryContentVideo
  { -- | The video to post as a story. The video must be of the size 720x1280, streamable, encoded with H.265 codec, with key frames added each second in the MPEG4 format, and must not exceed 30 MB. The video can\'t be reused and can only be uploaded as a new file, so you can pass \"attach:\/\/\<file_attach_name\>\" if the video was uploaded using multipart\/form-data under \<file_attach_name\>. More information on Sending Files: https:\/\/core.telegram.org\/bots\/api\#sending-files
    --
    -- Wire key: @video@.
    -- File sources accepted here: @upload@.
    video :: InputFile
  , -- | Optional. Precise duration of the video in seconds; 0-60
    --
    -- Wire key: @duration@.
    -- Omitted from an encoded request when it is @Nothing@.
    duration :: Maybe Scientific
  , -- | Optional. Timestamp in seconds of the frame that will be used as the static cover for the story. Defaults to 0.0.
    --
    -- Wire key: @cover_frame_timestamp@.
    -- Omitted from an encoded request when it is @Nothing@.
    cover_frame_timestamp :: Maybe Scientific
  , -- | Optional. Pass True if the video has no sound
    --
    -- Wire key: @is_animation@.
    -- Omitted from an encoded request when it is @Nothing@.
    is_animation :: Maybe Bool
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InputStoryContentVideo' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputStoryContentVideo :: InputFile -> InputStoryContentVideo
mkInputStoryContentVideo arg0 =
  MkInputStoryContentVideo
    { video = arg0
    , duration = Nothing
    , cover_frame_timestamp = Nothing
    , is_animation = Nothing
    }

-- | Plan a 'InputStoryContentVideo' as part of an outgoing request.
--
-- The traversal is checked: it validates every file source against
-- the capabilities its occurrence permits and allocates one
-- attachment part per upload, in source field order.
planInputStoryContentVideo :: InputStoryContentVideo -> FieldPlanner
planInputStoryContentVideo x =
  planRecord
    ( concat
        [ plannedLiteral "type" (String "video")
        , planned "video" ((planFileValue (filePolicy [UploadCapability])) x.video)
        , plannedMaybe "duration" x.duration encodeJson
        , plannedMaybe "cover_frame_timestamp" x.cover_frame_timestamp encodeJson
        , plannedMaybe "is_animation" x.is_animation encodeJson
        ]
    )
