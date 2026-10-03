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
module Telegram.Bot.Internal.Group.InputProfilePhotoAnimated
  ( InputProfilePhotoAnimated (..)
  , mkInputProfilePhotoAnimated
  , planInputProfilePhotoAnimated
  ) where

import Data.Aeson (Value (..))
import Data.Scientific (Scientific)
import Telegram.Bot.Support (FieldPlanner, FileCapability (..), InputFile, encodeJson, filePolicy, planFileValue, planRecord, planned, plannedLiteral, plannedMaybe)

-- | An animated profile photo in the MPEG4 format.
--
-- Source: <https://core.telegram.org/bots/api#inputprofilephotoanimated>.
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
--
-- Supplied constants: @type@ = @"animated"@.
data InputProfilePhotoAnimated = MkInputProfilePhotoAnimated
  { -- | The animated profile photo. Profile photos can\'t be reused and can only be uploaded as a new file, so you can pass \"attach:\/\/\<file_attach_name\>\" if the photo was uploaded using multipart\/form-data under \<file_attach_name\>. More information on Sending Files: https:\/\/core.telegram.org\/bots\/api\#sending-files
    --
    -- Wire key: @animation@.
    -- File sources accepted here: @upload@.
    animation :: InputFile
  , -- | Optional. Timestamp in seconds of the frame that will be used as the static profile photo. Defaults to 0.0.
    --
    -- Wire key: @main_frame_timestamp@.
    -- Omitted from an encoded request when it is @Nothing@.
    main_frame_timestamp :: Maybe Scientific
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InputProfilePhotoAnimated' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputProfilePhotoAnimated :: InputFile -> InputProfilePhotoAnimated
mkInputProfilePhotoAnimated arg0 =
  MkInputProfilePhotoAnimated
    { animation = arg0
    , main_frame_timestamp = Nothing
    }

-- | Plan a 'InputProfilePhotoAnimated' as part of an outgoing request.
--
-- The traversal is checked: it validates every file source against
-- the capabilities its occurrence permits and allocates one
-- attachment part per upload, in source field order.
planInputProfilePhotoAnimated :: InputProfilePhotoAnimated -> FieldPlanner
planInputProfilePhotoAnimated x =
  planRecord
    ( concat
        [ plannedLiteral "type" (String "animated")
        , planned "animation" ((planFileValue (filePolicy [UploadCapability])) x.animation)
        , plannedMaybe "main_frame_timestamp" x.main_frame_timestamp encodeJson
        ]
    )
