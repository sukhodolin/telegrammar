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
module Telegram.Bot.Internal.Group.InputProfilePhotoStatic
  ( InputProfilePhotoStatic (..)
  , mkInputProfilePhotoStatic
  , planInputProfilePhotoStatic
  ) where

import Data.Aeson (Value (..))
import Telegram.Bot.Support (FieldPlanner, FileCapability (..), InputFile, filePolicy, planFileValue, planRecord, planned, plannedLiteral)

-- | A static profile photo in the .JPG format.
--
-- Source: <https://core.telegram.org/bots/api#inputprofilephotostatic>.
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
--
-- Supplied constants: @type@ = @"static"@.
data InputProfilePhotoStatic = MkInputProfilePhotoStatic
  { -- | The static profile photo. Profile photos can\'t be reused and can only be uploaded as a new file, so you can pass \"attach:\/\/\<file_attach_name\>\" if the photo was uploaded using multipart\/form-data under \<file_attach_name\>. More information on Sending Files: https:\/\/core.telegram.org\/bots\/api\#sending-files
    --
    -- Wire key: @photo@.
    -- File sources accepted here: @upload@.
    photo :: InputFile
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InputProfilePhotoStatic' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputProfilePhotoStatic :: InputFile -> InputProfilePhotoStatic
mkInputProfilePhotoStatic arg0 =
  MkInputProfilePhotoStatic
    { photo = arg0
    }

-- | Plan a 'InputProfilePhotoStatic' as part of an outgoing request.
--
-- The traversal is checked: it validates every file source against
-- the capabilities its occurrence permits and allocates one
-- attachment part per upload, in source field order.
planInputProfilePhotoStatic :: InputProfilePhotoStatic -> FieldPlanner
planInputProfilePhotoStatic x =
  planRecord
    ( concat
        [ plannedLiteral "type" (String "static")
        , planned "photo" ((planFileValue (filePolicy [UploadCapability])) x.photo)
        ]
    )
