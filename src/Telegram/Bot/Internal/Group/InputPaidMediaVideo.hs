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
module Telegram.Bot.Internal.Group.InputPaidMediaVideo
  ( InputPaidMediaVideo (..)
  , mkInputPaidMediaVideo
  , planInputPaidMediaVideo
  ) where

import Data.Aeson (Value (..))
import Data.Int (Int64)
import Telegram.Bot.Support (FieldPlanner, FileCapability (..), InputFile, encodeJson, filePolicy, planFileValue, planRecord, planned, plannedLiteral, plannedMaybe)

-- | The paid media to send is a video.
--
-- Source: <https://core.telegram.org/bots/api#inputpaidmediavideo>.
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
--
-- Supplied constants: @type@ = @"video"@.
data InputPaidMediaVideo = MkInputPaidMediaVideo
  { -- | File to send. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass \"attach:\/\/\<file_attach_name\>\" to upload a new one using multipart\/form-data under \<file_attach_name\> name. More information on Sending Files: https:\/\/core.telegram.org\/bots\/api\#sending-files
    --
    -- Wire key: @media@.
    -- File sources accepted here: @existing_file@, @http_url@, @upload@.
    media :: InputFile
  , -- | Optional. Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail\'s width and height should not exceed 320. Ignored if the file is not uploaded using multipart\/form-data. Thumbnails can\'t be reused and can be only uploaded as a new file, so you can pass \"attach:\/\/\<file_attach_name\>\" if the thumbnail was uploaded using multipart\/form-data under \<file_attach_name\>. More information on Sending Files: https:\/\/core.telegram.org\/bots\/api\#sending-files
    --
    -- Wire key: @thumbnail@.
    -- Omitted from an encoded request when it is @Nothing@.
    -- File sources accepted here: @upload@.
    thumbnail :: Maybe InputFile
  , -- | Optional. Cover for the video in the message. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass \"attach:\/\/\<file_attach_name\>\" to upload a new one using multipart\/form-data under \<file_attach_name\> name. More information on Sending Files: https:\/\/core.telegram.org\/bots\/api\#sending-files
    --
    -- Wire key: @cover@.
    -- Omitted from an encoded request when it is @Nothing@.
    -- File sources accepted here: @existing_file@, @http_url@, @upload@.
    cover :: Maybe InputFile
  , -- | Optional. Start timestamp for the video in the message
    --
    -- Wire key: @start_timestamp@.
    -- Omitted from an encoded request when it is @Nothing@.
    start_timestamp :: Maybe Int64
  , -- | Optional. Video width
    --
    -- Wire key: @width@.
    -- Omitted from an encoded request when it is @Nothing@.
    width :: Maybe Int64
  , -- | Optional. Video height
    --
    -- Wire key: @height@.
    -- Omitted from an encoded request when it is @Nothing@.
    height :: Maybe Int64
  , -- | Optional. Video duration in seconds
    --
    -- Wire key: @duration@.
    -- Omitted from an encoded request when it is @Nothing@.
    duration :: Maybe Int64
  , -- | Optional. Pass True if the uploaded video is suitable for streaming
    --
    -- Wire key: @supports_streaming@.
    -- Omitted from an encoded request when it is @Nothing@.
    supports_streaming :: Maybe Bool
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InputPaidMediaVideo' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputPaidMediaVideo :: InputFile -> InputPaidMediaVideo
mkInputPaidMediaVideo arg0 =
  MkInputPaidMediaVideo
    { media = arg0
    , thumbnail = Nothing
    , cover = Nothing
    , start_timestamp = Nothing
    , width = Nothing
    , height = Nothing
    , duration = Nothing
    , supports_streaming = Nothing
    }

-- | Plan a 'InputPaidMediaVideo' as part of an outgoing request.
--
-- The traversal is checked: it validates every file source against
-- the capabilities its occurrence permits and allocates one
-- attachment part per upload, in source field order.
planInputPaidMediaVideo :: InputPaidMediaVideo -> FieldPlanner
planInputPaidMediaVideo x =
  planRecord
    ( concat
        [ plannedLiteral "type" (String "video")
        , planned "media" ((planFileValue (filePolicy [ExistingFileCapability, HttpUrlCapability, UploadCapability])) x.media)
        , plannedMaybe "thumbnail" x.thumbnail (planFileValue (filePolicy [UploadCapability]))
        , plannedMaybe "cover" x.cover (planFileValue (filePolicy [ExistingFileCapability, HttpUrlCapability, UploadCapability]))
        , plannedMaybe "start_timestamp" x.start_timestamp encodeJson
        , plannedMaybe "width" x.width encodeJson
        , plannedMaybe "height" x.height encodeJson
        , plannedMaybe "duration" x.duration encodeJson
        , plannedMaybe "supports_streaming" x.supports_streaming encodeJson
        ]
    )
