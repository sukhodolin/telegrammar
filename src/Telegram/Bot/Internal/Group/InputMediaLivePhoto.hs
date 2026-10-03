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
module Telegram.Bot.Internal.Group.InputMediaLivePhoto
  ( InputMediaLivePhoto (..)
  , mkInputMediaLivePhoto
  , planInputMediaLivePhoto
  ) where

import Data.Aeson (Value (..))
import Data.Text (Text)
import Telegram.Bot.Internal.Group.MessageEntity (MessageEntity)
import Telegram.Bot.Support (FieldPlanner, FileCapability (..), InputFile, encodeJson, filePolicy, planFileValue, planList, planRecord, planned, plannedLiteral, plannedMaybe)

-- | Represents a live photo to be sent.
--
-- Source: <https://core.telegram.org/bots/api#inputmedialivephoto>.
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
--
-- Supplied constants: @type@ = @"live_photo"@.
data InputMediaLivePhoto = MkInputMediaLivePhoto
  { -- | Video of the live photo to send. Pass a file_id to send a file that exists on the Telegram servers (recommended) or pass \"attach:\/\/\<file_attach_name\>\" to upload a new one using multipart\/form-data under \<file_attach_name\> name. More information on Sending Files: https:\/\/core.telegram.org\/bots\/api\#sending-files. Sending live photos by a URL is currently unsupported.
    --
    -- Wire key: @media@.
    -- File sources accepted here: @existing_file@, @upload@.
    media :: InputFile
  , -- | The static photo to send. Pass a file_id to send a file that exists on the Telegram servers (recommended) or pass \"attach:\/\/\<file_attach_name\>\" to upload a new one using multipart\/form-data under \<file_attach_name\> name. More information on Sending Files: https:\/\/core.telegram.org\/bots\/api\#sending-files. Sending live photos by a URL is currently unsupported.
    --
    -- Wire key: @photo@.
    -- File sources accepted here: @existing_file@, @upload@.
    photo :: InputFile
  , -- | Optional. Caption of the live photo to be sent, 0-1024 characters after entities parsing
    --
    -- Wire key: @caption@.
    -- Omitted from an encoded request when it is @Nothing@.
    caption :: Maybe Text
  , -- | Optional. Mode for parsing entities in the live photo caption. See formatting options for more details.
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
  , -- | Optional. Pass True if the live photo needs to be covered with a spoiler animation
    --
    -- Wire key: @has_spoiler@.
    -- Omitted from an encoded request when it is @Nothing@.
    has_spoiler :: Maybe Bool
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InputMediaLivePhoto' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputMediaLivePhoto :: InputFile -> InputFile -> InputMediaLivePhoto
mkInputMediaLivePhoto arg0 arg1 =
  MkInputMediaLivePhoto
    { media = arg0
    , photo = arg1
    , caption = Nothing
    , parse_mode = Nothing
    , caption_entities = Nothing
    , show_caption_above_media = Nothing
    , has_spoiler = Nothing
    }

-- | Plan a 'InputMediaLivePhoto' as part of an outgoing request.
--
-- The traversal is checked: it validates every file source against
-- the capabilities its occurrence permits and allocates one
-- attachment part per upload, in source field order.
planInputMediaLivePhoto :: InputMediaLivePhoto -> FieldPlanner
planInputMediaLivePhoto x =
  planRecord
    ( concat
        [ plannedLiteral "type" (String "live_photo")
        , planned "media" ((planFileValue (filePolicy [ExistingFileCapability, UploadCapability])) x.media)
        , planned "photo" ((planFileValue (filePolicy [ExistingFileCapability, UploadCapability])) x.photo)
        , plannedMaybe "caption" x.caption encodeJson
        , plannedMaybe "parse_mode" x.parse_mode encodeJson
        , plannedMaybe "caption_entities" x.caption_entities (planList encodeJson)
        , plannedMaybe "show_caption_above_media" x.show_caption_above_media encodeJson
        , plannedMaybe "has_spoiler" x.has_spoiler encodeJson
        ]
    )
