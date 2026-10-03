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
module Telegram.Bot.Internal.Group.PaidMediaVideo
  ( PaidMediaVideo (..)
  , mkPaidMediaVideo
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Telegram.Bot.Internal.Group.Video (Video)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonLiteral, jsonObject, requiredWith)

-- | The paid media is a video.
--
-- Source: <https://core.telegram.org/bots/api#paidmediavideo>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"video"@.
data PaidMediaVideo = MkPaidMediaVideo
  { -- | The video
    --
    -- Wire key: @video@.
    video :: Video
  }
  deriving stock (Eq, Show)

-- | Initialize a 'PaidMediaVideo' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkPaidMediaVideo :: Video -> PaidMediaVideo
mkPaidMediaVideo arg0 =
  MkPaidMediaVideo
    { video = arg0
    }

instance FromJSON PaidMediaVideo where
  parseJSON = withObject "PaidMediaVideo" $ \obj ->
    do
      checkStringConstant obj "type" "video"
      field_1 <- requiredWith obj "video" parseJSON
      pure
        MkPaidMediaVideo
          { video = field_1
          }

instance ToJSON PaidMediaVideo where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "video")
          , jsonField "video" x.video
          ]
      )
  toEncoding = toEncoding . toJSON
