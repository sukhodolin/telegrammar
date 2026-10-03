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
module Telegram.Bot.Internal.Group.PaidMediaPhoto
  ( PaidMediaPhoto (..)
  , mkPaidMediaPhoto
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Telegram.Bot.Internal.Group.PhotoSize (PhotoSize)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonLiteral, jsonObject, parseList, requiredWith)

-- | The paid media is a photo.
--
-- Source: <https://core.telegram.org/bots/api#paidmediaphoto>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"photo"@.
data PaidMediaPhoto = MkPaidMediaPhoto
  { -- | The photo
    --
    -- Wire key: @photo@.
    photo :: [PhotoSize]
  }
  deriving stock (Eq, Show)

-- | Initialize a 'PaidMediaPhoto' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkPaidMediaPhoto :: [PhotoSize] -> PaidMediaPhoto
mkPaidMediaPhoto arg0 =
  MkPaidMediaPhoto
    { photo = arg0
    }

instance FromJSON PaidMediaPhoto where
  parseJSON = withObject "PaidMediaPhoto" $ \obj ->
    do
      checkStringConstant obj "type" "photo"
      field_1 <- requiredWith obj "photo" (parseList parseJSON)
      pure
        MkPaidMediaPhoto
          { photo = field_1
          }

instance ToJSON PaidMediaPhoto where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "photo")
          , jsonField "photo" x.photo
          ]
      )
  toEncoding = toEncoding . toJSON
