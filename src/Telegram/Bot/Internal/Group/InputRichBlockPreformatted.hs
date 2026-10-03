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
module Telegram.Bot.Internal.Group.InputRichBlockPreformatted
  ( InputRichBlockPreformatted (..)
  , mkInputRichBlockPreformatted
  ) where

import Data.Aeson (ToJSON (..), Value (..))
import Data.Text (Text)
import Telegram.Bot.Internal.Group.RichMessageButton (RichText)
import Telegram.Bot.Support (jsonField, jsonLiteral, jsonObject, jsonOptional)

-- | A preformatted text block, corresponding to the nested HTML tags \<pre\> and \<code\>.
--
-- Source: <https://core.telegram.org/bots/api#inputrichblockpreformatted>.
-- Codec directions: encoded into requests.
--
-- Supplied constants: @type@ = @"pre"@.
data InputRichBlockPreformatted = MkInputRichBlockPreformatted
  { -- | Text of the block
    --
    -- Wire key: @text@.
    text :: RichText
  , -- | Optional. The programming language of the text
    --
    -- Wire key: @language@.
    -- Omitted from an encoded request when it is @Nothing@.
    language :: Maybe Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InputRichBlockPreformatted' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputRichBlockPreformatted :: RichText -> InputRichBlockPreformatted
mkInputRichBlockPreformatted arg0 =
  MkInputRichBlockPreformatted
    { text = arg0
    , language = Nothing
    }

instance ToJSON InputRichBlockPreformatted where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "pre")
          , jsonField "text" x.text
          , jsonOptional "language" x.language
          ]
      )
  toEncoding = toEncoding . toJSON
