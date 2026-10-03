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
module Telegram.Bot.Internal.Group.InputRichBlockFooter
  ( InputRichBlockFooter (..)
  , mkInputRichBlockFooter
  ) where

import Data.Aeson (ToJSON (..), Value (..))
import Telegram.Bot.Internal.Group.RichMessageButton (RichText)
import Telegram.Bot.Support (jsonField, jsonLiteral, jsonObject)

-- | A footer, corresponding to the HTML tag \<footer\>.
--
-- Source: <https://core.telegram.org/bots/api#inputrichblockfooter>.
-- Codec directions: encoded into requests.
--
-- Supplied constants: @type@ = @"footer"@.
data InputRichBlockFooter = MkInputRichBlockFooter
  { -- | Text of the block
    --
    -- Wire key: @text@.
    text :: RichText
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InputRichBlockFooter' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputRichBlockFooter :: RichText -> InputRichBlockFooter
mkInputRichBlockFooter arg0 =
  MkInputRichBlockFooter
    { text = arg0
    }

instance ToJSON InputRichBlockFooter where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "footer")
          , jsonField "text" x.text
          ]
      )
  toEncoding = toEncoding . toJSON
