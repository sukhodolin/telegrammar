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
module Telegram.Bot.Internal.Group.InputRichBlockVoiceNote
  ( InputRichBlockVoiceNote (..)
  , mkInputRichBlockVoiceNote
  , planInputRichBlockVoiceNote
  ) where

import Data.Aeson (Value (..))
import Telegram.Bot.Internal.Group.InputMediaVoiceNote (InputMediaVoiceNote, planInputMediaVoiceNote)
import Telegram.Bot.Internal.Group.RichBlockCaption (RichBlockCaption)
import Telegram.Bot.Support (FieldPlanner, encodeJson, planRecord, planned, plannedLiteral, plannedMaybe)

-- | A block with a voice note, corresponding to the HTML tag \<audio\>.
--
-- Source: <https://core.telegram.org/bots/api#inputrichblockvoicenote>.
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
--
-- Supplied constants: @type@ = @"voice_note"@.
data InputRichBlockVoiceNote = MkInputRichBlockVoiceNote
  { -- | The voice note. Caption is ignored.
    --
    -- Wire key: @voice_note@.
    voice_note :: InputMediaVoiceNote
  , -- | Optional. Caption of the block
    --
    -- Wire key: @caption@.
    -- Omitted from an encoded request when it is @Nothing@.
    caption :: Maybe RichBlockCaption
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InputRichBlockVoiceNote' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputRichBlockVoiceNote :: InputMediaVoiceNote -> InputRichBlockVoiceNote
mkInputRichBlockVoiceNote arg0 =
  MkInputRichBlockVoiceNote
    { voice_note = arg0
    , caption = Nothing
    }

-- | Plan a 'InputRichBlockVoiceNote' as part of an outgoing request.
--
-- The traversal is checked: it validates every file source against
-- the capabilities its occurrence permits and allocates one
-- attachment part per upload, in source field order.
planInputRichBlockVoiceNote :: InputRichBlockVoiceNote -> FieldPlanner
planInputRichBlockVoiceNote x =
  planRecord
    ( concat
        [ plannedLiteral "type" (String "voice_note")
        , planned "voice_note" (planInputMediaVoiceNote x.voice_note)
        , plannedMaybe "caption" x.caption encodeJson
        ]
    )
