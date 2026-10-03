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
module Telegram.Bot.Internal.Group.PaidMediaPreview
  ( PaidMediaPreview (..)
  , mkPaidMediaPreview
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Support (checkStringConstant, jsonLiteral, jsonObject, jsonOptional, optionalWith, parseInt64)

-- | The paid media isn\'t available before the payment.
--
-- Source: <https://core.telegram.org/bots/api#paidmediapreview>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"preview"@.
data PaidMediaPreview = MkPaidMediaPreview
  { -- | Optional. Media width as defined by the sender
    --
    -- Wire key: @width@.
    -- Omitted from an encoded request when it is @Nothing@.
    width :: Maybe Int64
  , -- | Optional. Media height as defined by the sender
    --
    -- Wire key: @height@.
    -- Omitted from an encoded request when it is @Nothing@.
    height :: Maybe Int64
  , -- | Optional. Duration of the media in seconds as defined by the sender
    --
    -- Wire key: @duration@.
    -- Omitted from an encoded request when it is @Nothing@.
    duration :: Maybe Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'PaidMediaPreview' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkPaidMediaPreview :: PaidMediaPreview
mkPaidMediaPreview =
  MkPaidMediaPreview
    { width = Nothing
    , height = Nothing
    , duration = Nothing
    }

instance FromJSON PaidMediaPreview where
  parseJSON = withObject "PaidMediaPreview" $ \obj ->
    do
      checkStringConstant obj "type" "preview"
      field_1 <- optionalWith obj "width" parseInt64
      field_2 <- optionalWith obj "height" parseInt64
      field_3 <- optionalWith obj "duration" parseInt64
      pure
        MkPaidMediaPreview
          { width = field_1
          , height = field_2
          , duration = field_3
          }

instance ToJSON PaidMediaPreview where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "preview")
          , jsonOptional "width" x.width
          , jsonOptional "height" x.height
          , jsonOptional "duration" x.duration
          ]
      )
  toEncoding = toEncoding . toJSON
