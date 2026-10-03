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
module Telegram.Bot.Internal.Group.InputSticker
  ( InputSticker (..)
  , mkInputSticker
  , planInputSticker
  ) where

import Data.Text (Text)
import Telegram.Bot.Internal.Group.MaskPosition (MaskPosition)
import Telegram.Bot.Support (FieldPlanner, FileCapability (..), InputFile, encodeJson, filePolicy, planFileValue, planList, planRecord, planned, plannedMaybe, validateArrayCount, withValidation)

-- | This object describes a sticker to be added to a sticker set.
--
-- Source: <https://core.telegram.org/bots/api#inputsticker>.
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
data InputSticker = MkInputSticker
  { -- | The added sticker. Pass a file_id as a String to send a file that already exists on the Telegram servers, pass an HTTP URL as a String for Telegram to get a file from the Internet, or pass \"attach:\/\/\<file_attach_name\>\" to upload a new file using multipart\/form-data under \<file_attach_name\> name. Animated and video stickers can\'t be uploaded via HTTP URL. More information on Sending Files: https:\/\/core.telegram.org\/bots\/api\#sending-files
    --
    -- Wire key: @sticker@.
    -- File sources accepted here: @existing_file@, @http_url@, @upload@.
    sticker :: InputFile
  , -- | Format of the added sticker, must be one of \"static\" for a .WEBP or .PNG image, \"animated\" for a .TGS animation, \"video\" for a .WEBM video
    --
    -- Wire key: @format@.
    format :: Text
  , -- | List of 1-20 emoji associated with the sticker
    --
    -- Wire key: @emoji_list@.
    -- Checked when planning a request: 1 to 20 elements.
    emoji_list :: [Text]
  , -- | Optional. Position where the mask should be placed on faces. For \"mask\" stickers only.
    --
    -- Wire key: @mask_position@.
    -- Omitted from an encoded request when it is @Nothing@.
    mask_position :: Maybe MaskPosition
  , -- | Optional. List of 0-20 search keywords for the sticker with total length of up to 64 characters. For \"regular\" and \"custom_emoji\" stickers only.
    --
    -- Wire key: @keywords@.
    -- Omitted from an encoded request when it is @Nothing@.
    -- Checked when planning a request: at most 20 element(s).
    keywords :: Maybe [Text]
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InputSticker' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputSticker :: InputFile -> Text -> [Text] -> InputSticker
mkInputSticker arg0 arg1 arg2 =
  MkInputSticker
    { sticker = arg0
    , format = arg1
    , emoji_list = arg2
    , mask_position = Nothing
    , keywords = Nothing
    }

-- | Plan a 'InputSticker' as part of an outgoing request.
--
-- The traversal is checked: it validates every file source against
-- the capabilities its occurrence permits and allocates one
-- attachment part per upload, in source field order.
planInputSticker :: InputSticker -> FieldPlanner
planInputSticker x =
  planRecord
    ( concat
        [ planned "sticker" ((planFileValue (filePolicy [ExistingFileCapability, HttpUrlCapability, UploadCapability])) x.sticker)
        , planned "format" (encodeJson x.format)
        , planned "emoji_list" (withValidation (\loc_ -> validateArrayCount (Just 1) (Just 20) loc_ x.emoji_list) ((planList encodeJson) x.emoji_list))
        , plannedMaybe "mask_position" x.mask_position encodeJson
        , plannedMaybe "keywords" x.keywords (\v_ -> withValidation (\loc_ -> validateArrayCount Nothing (Just 20) loc_ v_) ((planList encodeJson) v_))
        ]
    )
