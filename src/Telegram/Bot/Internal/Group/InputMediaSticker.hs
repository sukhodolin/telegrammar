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
module Telegram.Bot.Internal.Group.InputMediaSticker
  ( InputMediaSticker (..)
  , mkInputMediaSticker
  , planInputMediaSticker
  ) where

import Data.Aeson (Value (..))
import Data.Text (Text)
import Telegram.Bot.Support (FieldPlanner, FileCapability (..), InputFile, encodeJson, filePolicy, planFileValue, planRecord, planned, plannedLiteral, plannedMaybe)

-- | Represents a sticker file to be sent.
--
-- Source: <https://core.telegram.org/bots/api#inputmediasticker>.
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
--
-- Supplied constants: @type@ = @"sticker"@.
data InputMediaSticker = MkInputMediaSticker
  { -- | File to send. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a .WEBP sticker from the Internet, or pass \"attach:\/\/\<file_attach_name\>\" to upload a new .WEBP, .TGS, or .WEBM sticker using multipart\/form-data under \<file_attach_name\> name. More information on Sending Files: https:\/\/core.telegram.org\/bots\/api\#sending-files
    --
    -- Wire key: @media@.
    -- File sources accepted here: @existing_file@, @http_url@, @upload@.
    media :: InputFile
  , -- | Optional. Emoji associated with the sticker; only for just uploaded stickers
    --
    -- Wire key: @emoji@.
    -- Omitted from an encoded request when it is @Nothing@.
    emoji :: Maybe Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InputMediaSticker' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputMediaSticker :: InputFile -> InputMediaSticker
mkInputMediaSticker arg0 =
  MkInputMediaSticker
    { media = arg0
    , emoji = Nothing
    }

-- | Plan a 'InputMediaSticker' as part of an outgoing request.
--
-- The traversal is checked: it validates every file source against
-- the capabilities its occurrence permits and allocates one
-- attachment part per upload, in source field order.
planInputMediaSticker :: InputMediaSticker -> FieldPlanner
planInputMediaSticker x =
  planRecord
    ( concat
        [ plannedLiteral "type" (String "sticker")
        , planned "media" ((planFileValue (filePolicy [ExistingFileCapability, HttpUrlCapability, UploadCapability])) x.media)
        , plannedMaybe "emoji" x.emoji encodeJson
        ]
    )
