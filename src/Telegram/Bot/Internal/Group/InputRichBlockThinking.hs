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
module Telegram.Bot.Internal.Group.InputRichBlockThinking
  ( InputRichBlockThinking (..)
  , mkInputRichBlockThinking
  ) where

import Data.Aeson (ToJSON (..), Value (..))
import Telegram.Bot.Internal.Group.RichMessageButton (RichText)
import Telegram.Bot.Support (jsonField, jsonLiteral, jsonObject)

-- | A block with a \"Thinking...\" placeholder, corresponding to the custom HTML tag \<tg-thinking\>. The block may be used only in sendRichMessageDraft, therefore it can\'t be received in messages. See https:\/\/t.me\/addemoji\/AIActions for examples of custom emoji that are recommended for usage in the block.
--
-- Source: <https://core.telegram.org/bots/api#inputrichblockthinking>.
-- Codec directions: encoded into requests.
--
-- Supplied constants: @type@ = @"thinking"@.
data InputRichBlockThinking = MkInputRichBlockThinking
  { -- | Text of the block. See https:\/\/t.me\/addemoji\/AIActions for examples of custom emoji that are recommended for usage in the block.
    --
    -- Wire key: @text@.
    text :: RichText
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InputRichBlockThinking' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputRichBlockThinking :: RichText -> InputRichBlockThinking
mkInputRichBlockThinking arg0 =
  MkInputRichBlockThinking
    { text = arg0
    }

instance ToJSON InputRichBlockThinking where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "thinking")
          , jsonField "text" x.text
          ]
      )
  toEncoding = toEncoding . toJSON
