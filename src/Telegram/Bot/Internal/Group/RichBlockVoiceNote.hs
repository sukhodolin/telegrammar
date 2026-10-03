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
module Telegram.Bot.Internal.Group.RichBlockVoiceNote
  ( RichBlockVoiceNote (..)
  , mkRichBlockVoiceNote
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Telegram.Bot.Internal.Group.RichBlockCaption (RichBlockCaption)
import Telegram.Bot.Internal.Group.Voice (Voice)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonLiteral, jsonObject, jsonOptional, optionalWith, requiredWith)

-- | A block with a voice note, corresponding to the HTML tag \<audio\>.
--
-- Source: <https://core.telegram.org/bots/api#richblockvoicenote>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"voice_note"@.
data RichBlockVoiceNote = MkRichBlockVoiceNote
  { -- | The voice note
    --
    -- Wire key: @voice_note@.
    voice_note :: Voice
  , -- | Optional. Caption of the block
    --
    -- Wire key: @caption@.
    -- Omitted from an encoded request when it is @Nothing@.
    caption :: Maybe RichBlockCaption
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichBlockVoiceNote' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichBlockVoiceNote :: Voice -> RichBlockVoiceNote
mkRichBlockVoiceNote arg0 =
  MkRichBlockVoiceNote
    { voice_note = arg0
    , caption = Nothing
    }

instance FromJSON RichBlockVoiceNote where
  parseJSON = withObject "RichBlockVoiceNote" $ \obj ->
    do
      checkStringConstant obj "type" "voice_note"
      field_1 <- requiredWith obj "voice_note" parseJSON
      field_2 <- optionalWith obj "caption" parseJSON
      pure
        MkRichBlockVoiceNote
          { voice_note = field_1
          , caption = field_2
          }

instance ToJSON RichBlockVoiceNote where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "voice_note")
          , jsonField "voice_note" x.voice_note
          , jsonOptional "caption" x.caption
          ]
      )
  toEncoding = toEncoding . toJSON
