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
module Telegram.Bot.Internal.Group.RichBlockAudio
  ( RichBlockAudio (..)
  , mkRichBlockAudio
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Telegram.Bot.Internal.Group.Audio (Audio)
import Telegram.Bot.Internal.Group.RichBlockCaption (RichBlockCaption)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonLiteral, jsonObject, jsonOptional, optionalWith, requiredWith)

-- | A block with a music file, corresponding to the HTML tag \<audio\>.
--
-- Source: <https://core.telegram.org/bots/api#richblockaudio>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"audio"@.
data RichBlockAudio = MkRichBlockAudio
  { -- | The audio
    --
    -- Wire key: @audio@.
    audio :: Audio
  , -- | Optional. Caption of the block
    --
    -- Wire key: @caption@.
    -- Omitted from an encoded request when it is @Nothing@.
    caption :: Maybe RichBlockCaption
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichBlockAudio' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichBlockAudio :: Audio -> RichBlockAudio
mkRichBlockAudio arg0 =
  MkRichBlockAudio
    { audio = arg0
    , caption = Nothing
    }

instance FromJSON RichBlockAudio where
  parseJSON = withObject "RichBlockAudio" $ \obj ->
    do
      checkStringConstant obj "type" "audio"
      field_1 <- requiredWith obj "audio" parseJSON
      field_2 <- optionalWith obj "caption" parseJSON
      pure
        MkRichBlockAudio
          { audio = field_1
          , caption = field_2
          }

instance ToJSON RichBlockAudio where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "audio")
          , jsonField "audio" x.audio
          , jsonOptional "caption" x.caption
          ]
      )
  toEncoding = toEncoding . toJSON
