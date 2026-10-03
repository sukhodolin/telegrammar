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
module Telegram.Bot.Internal.Group.RichBlockVideo
  ( RichBlockVideo (..)
  , mkRichBlockVideo
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Telegram.Bot.Internal.Group.RichBlockCaption (RichBlockCaption)
import Telegram.Bot.Internal.Group.Video (Video)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonFlag, jsonLiteral, jsonObject, jsonOptional, optionalTrueFlag, optionalWith, requiredWith)

-- | A block with a video, corresponding to the HTML tag \<video\>.
--
-- Source: <https://core.telegram.org/bots/api#richblockvideo>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"video"@.
data RichBlockVideo = MkRichBlockVideo
  { -- | The video
    --
    -- Wire key: @video@.
    video :: Video
  , -- | Optional. True, if the media preview is covered by a spoiler animation
    --
    -- Wire key: @has_spoiler@.
    -- Omitted from an encoded request when it is @False@.
    has_spoiler :: Bool
  , -- | Optional. Caption of the block
    --
    -- Wire key: @caption@.
    -- Omitted from an encoded request when it is @Nothing@.
    caption :: Maybe RichBlockCaption
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichBlockVideo' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichBlockVideo :: Video -> RichBlockVideo
mkRichBlockVideo arg0 =
  MkRichBlockVideo
    { video = arg0
    , has_spoiler = False
    , caption = Nothing
    }

instance FromJSON RichBlockVideo where
  parseJSON = withObject "RichBlockVideo" $ \obj ->
    do
      checkStringConstant obj "type" "video"
      field_1 <- requiredWith obj "video" parseJSON
      field_2 <- optionalTrueFlag obj "has_spoiler"
      field_3 <- optionalWith obj "caption" parseJSON
      pure
        MkRichBlockVideo
          { video = field_1
          , has_spoiler = field_2
          , caption = field_3
          }

instance ToJSON RichBlockVideo where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "video")
          , jsonField "video" x.video
          , jsonFlag "has_spoiler" x.has_spoiler
          , jsonOptional "caption" x.caption
          ]
      )
  toEncoding = toEncoding . toJSON
