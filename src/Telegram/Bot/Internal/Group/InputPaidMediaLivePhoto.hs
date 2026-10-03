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
module Telegram.Bot.Internal.Group.InputPaidMediaLivePhoto
  ( InputPaidMediaLivePhoto (..)
  , mkInputPaidMediaLivePhoto
  , planInputPaidMediaLivePhoto
  ) where

import Data.Aeson (Value (..))
import Telegram.Bot.Support (FieldPlanner, FileCapability (..), InputFile, filePolicy, planFileValue, planRecord, planned, plannedLiteral)

-- | The paid media to send is a live photo.
--
-- Source: <https://core.telegram.org/bots/api#inputpaidmedialivephoto>.
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
--
-- Supplied constants: @type@ = @"live_photo"@.
data InputPaidMediaLivePhoto = MkInputPaidMediaLivePhoto
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
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InputPaidMediaLivePhoto' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputPaidMediaLivePhoto :: InputFile -> InputFile -> InputPaidMediaLivePhoto
mkInputPaidMediaLivePhoto arg0 arg1 =
  MkInputPaidMediaLivePhoto
    { media = arg0
    , photo = arg1
    }

-- | Plan a 'InputPaidMediaLivePhoto' as part of an outgoing request.
--
-- The traversal is checked: it validates every file source against
-- the capabilities its occurrence permits and allocates one
-- attachment part per upload, in source field order.
planInputPaidMediaLivePhoto :: InputPaidMediaLivePhoto -> FieldPlanner
planInputPaidMediaLivePhoto x =
  planRecord
    ( concat
        [ plannedLiteral "type" (String "live_photo")
        , planned "media" ((planFileValue (filePolicy [ExistingFileCapability, UploadCapability])) x.media)
        , planned "photo" ((planFileValue (filePolicy [ExistingFileCapability, UploadCapability])) x.photo)
        ]
    )
