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
module Telegram.Bot.Internal.Group.LinkPreviewOptions
  ( LinkPreviewOptions (..)
  , mkLinkPreviewOptions
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Support (jsonObject, jsonOptional, optionalWith)

-- | Describes the options used for link preview generation.
--
-- Source: <https://core.telegram.org/bots/api#linkpreviewoptions>.
-- Codec directions: decoded from responses, encoded into requests.
data LinkPreviewOptions = MkLinkPreviewOptions
  { -- | Optional. True, if the link preview is disabled
    --
    -- Wire key: @is_disabled@.
    -- Omitted from an encoded request when it is @Nothing@.
    is_disabled :: Maybe Bool
  , -- | Optional. URL to use for the link preview. If empty, then the first URL found in the message text will be used.
    --
    -- Wire key: @url@.
    -- Omitted from an encoded request when it is @Nothing@.
    url :: Maybe Text
  , -- | Optional. True, if the media in the link preview is supposed to be shrunk; ignored if the URL isn\'t explicitly specified or media size change isn\'t supported for the preview
    --
    -- Wire key: @prefer_small_media@.
    -- Omitted from an encoded request when it is @Nothing@.
    prefer_small_media :: Maybe Bool
  , -- | Optional. True, if the media in the link preview is supposed to be enlarged; ignored if the URL isn\'t explicitly specified or media size change isn\'t supported for the preview
    --
    -- Wire key: @prefer_large_media@.
    -- Omitted from an encoded request when it is @Nothing@.
    prefer_large_media :: Maybe Bool
  , -- | Optional. True, if the link preview must be shown above the message text; otherwise, the link preview will be shown below the message text
    --
    -- Wire key: @show_above_text@.
    -- Omitted from an encoded request when it is @Nothing@.
    show_above_text :: Maybe Bool
  }
  deriving stock (Eq, Show)

-- | Initialize a 'LinkPreviewOptions' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkLinkPreviewOptions :: LinkPreviewOptions
mkLinkPreviewOptions =
  MkLinkPreviewOptions
    { is_disabled = Nothing
    , url = Nothing
    , prefer_small_media = Nothing
    , prefer_large_media = Nothing
    , show_above_text = Nothing
    }

instance FromJSON LinkPreviewOptions where
  parseJSON = withObject "LinkPreviewOptions" $ \obj ->
    do
      field_0 <- optionalWith obj "is_disabled" parseJSON
      field_1 <- optionalWith obj "url" parseJSON
      field_2 <- optionalWith obj "prefer_small_media" parseJSON
      field_3 <- optionalWith obj "prefer_large_media" parseJSON
      field_4 <- optionalWith obj "show_above_text" parseJSON
      pure
        MkLinkPreviewOptions
          { is_disabled = field_0
          , url = field_1
          , prefer_small_media = field_2
          , prefer_large_media = field_3
          , show_above_text = field_4
          }

instance ToJSON LinkPreviewOptions where
  toJSON x =
    jsonObject
      ( concat
          [ jsonOptional "is_disabled" x.is_disabled
          , jsonOptional "url" x.url
          , jsonOptional "prefer_small_media" x.prefer_small_media
          , jsonOptional "prefer_large_media" x.prefer_large_media
          , jsonOptional "show_above_text" x.show_above_text
          ]
      )
  toEncoding = toEncoding . toJSON
