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
module Telegram.Bot.Internal.Group.InputMediaAnimation
  ( InputMediaAnimation (..)
  , mkInputMediaAnimation
  , planInputMediaAnimation
  ) where

import Data.Aeson (Value (..))
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.MessageEntity (MessageEntity)
import Telegram.Bot.Support (FieldPlanner, FileCapability (..), InputFile, encodeJson, filePolicy, planFileValue, planList, planRecord, planned, plannedLiteral, plannedMaybe)

-- | Represents an animation file (GIF or H.264\/MPEG-4 AVC video without sound) to be sent.
--
-- Source: <https://core.telegram.org/bots/api#inputmediaanimation>.
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
--
-- Supplied constants: @type@ = @"animation"@.
data InputMediaAnimation = MkInputMediaAnimation
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
  , -- | Optional. Caption of the animation to be sent, 0-1024 characters after entities parsing
    --
    -- Wire key: @caption@.
    -- Omitted from an encoded request when it is @Nothing@.
    caption :: Maybe Text
  , -- | Optional. Mode for parsing entities in the animation caption. See formatting options for more details.
    --
    -- Wire key: @parse_mode@.
    -- Omitted from an encoded request when it is @Nothing@.
    parse_mode :: Maybe Text
  , -- | Optional. List of special entities that appear in the caption, which can be specified instead of parse_mode
    --
    -- Wire key: @caption_entities@.
    -- Omitted from an encoded request when it is @Nothing@.
    caption_entities :: Maybe [MessageEntity]
  , -- | Optional. Pass True if the caption must be shown above the message media
    --
    -- Wire key: @show_caption_above_media@.
    -- Omitted from an encoded request when it is @Nothing@.
    show_caption_above_media :: Maybe Bool
  , -- | Optional. Animation width
    --
    -- Wire key: @width@.
    -- Omitted from an encoded request when it is @Nothing@.
    width :: Maybe Int64
  , -- | Optional. Animation height
    --
    -- Wire key: @height@.
    -- Omitted from an encoded request when it is @Nothing@.
    height :: Maybe Int64
  , -- | Optional. Animation duration in seconds
    --
    -- Wire key: @duration@.
    -- Omitted from an encoded request when it is @Nothing@.
    duration :: Maybe Int64
  , -- | Optional. Pass True if the animation needs to be covered with a spoiler animation
    --
    -- Wire key: @has_spoiler@.
    -- Omitted from an encoded request when it is @Nothing@.
    has_spoiler :: Maybe Bool
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InputMediaAnimation' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputMediaAnimation :: InputFile -> InputMediaAnimation
mkInputMediaAnimation arg0 =
  MkInputMediaAnimation
    { media = arg0
    , thumbnail = Nothing
    , caption = Nothing
    , parse_mode = Nothing
    , caption_entities = Nothing
    , show_caption_above_media = Nothing
    , width = Nothing
    , height = Nothing
    , duration = Nothing
    , has_spoiler = Nothing
    }

-- | Plan a 'InputMediaAnimation' as part of an outgoing request.
--
-- The traversal is checked: it validates every file source against
-- the capabilities its occurrence permits and allocates one
-- attachment part per upload, in source field order.
planInputMediaAnimation :: InputMediaAnimation -> FieldPlanner
planInputMediaAnimation x =
  planRecord
    ( concat
        [ plannedLiteral "type" (String "animation")
        , planned "media" ((planFileValue (filePolicy [ExistingFileCapability, HttpUrlCapability, UploadCapability])) x.media)
        , plannedMaybe "thumbnail" x.thumbnail (planFileValue (filePolicy [UploadCapability]))
        , plannedMaybe "caption" x.caption encodeJson
        , plannedMaybe "parse_mode" x.parse_mode encodeJson
        , plannedMaybe "caption_entities" x.caption_entities (planList encodeJson)
        , plannedMaybe "show_caption_above_media" x.show_caption_above_media encodeJson
        , plannedMaybe "width" x.width encodeJson
        , plannedMaybe "height" x.height encodeJson
        , plannedMaybe "duration" x.duration encodeJson
        , plannedMaybe "has_spoiler" x.has_spoiler encodeJson
        ]
    )
