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
module Telegram.Bot.Internal.Group.PaidMediaLivePhoto
  ( PaidMediaLivePhoto (..)
  , mkPaidMediaLivePhoto
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Telegram.Bot.Internal.Group.LivePhoto (LivePhoto)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonLiteral, jsonObject, requiredWith)

-- | The paid media is a live photo.
--
-- Source: <https://core.telegram.org/bots/api#paidmedialivephoto>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"live_photo"@.
data PaidMediaLivePhoto = MkPaidMediaLivePhoto
  { -- | The photo
    --
    -- Wire key: @live_photo@.
    live_photo :: LivePhoto
  }
  deriving stock (Eq, Show)

-- | Initialize a 'PaidMediaLivePhoto' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkPaidMediaLivePhoto :: LivePhoto -> PaidMediaLivePhoto
mkPaidMediaLivePhoto arg0 =
  MkPaidMediaLivePhoto
    { live_photo = arg0
    }

instance FromJSON PaidMediaLivePhoto where
  parseJSON = withObject "PaidMediaLivePhoto" $ \obj ->
    do
      checkStringConstant obj "type" "live_photo"
      field_1 <- requiredWith obj "live_photo" parseJSON
      pure
        MkPaidMediaLivePhoto
          { live_photo = field_1
          }

instance ToJSON PaidMediaLivePhoto where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "live_photo")
          , jsonField "live_photo" x.live_photo
          ]
      )
  toEncoding = toEncoding . toJSON
