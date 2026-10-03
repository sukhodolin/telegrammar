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
module Telegram.Bot.Internal.Group.InputRichBlockMathematicalExpression
  ( InputRichBlockMathematicalExpression (..)
  , mkInputRichBlockMathematicalExpression
  ) where

import Data.Aeson (ToJSON (..), Value (..))
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonLiteral, jsonObject)

-- | A block with a mathematical expression in LaTeX format, corresponding to the custom HTML tag \<tg-math-block\>.
--
-- Source: <https://core.telegram.org/bots/api#inputrichblockmathematicalexpression>.
-- Codec directions: encoded into requests.
--
-- Supplied constants: @type@ = @"mathematical_expression"@.
data InputRichBlockMathematicalExpression = MkInputRichBlockMathematicalExpression
  { -- | The mathematical expression in LaTeX format
    --
    -- Wire key: @expression@.
    expression :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InputRichBlockMathematicalExpression' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputRichBlockMathematicalExpression :: Text -> InputRichBlockMathematicalExpression
mkInputRichBlockMathematicalExpression arg0 =
  MkInputRichBlockMathematicalExpression
    { expression = arg0
    }

instance ToJSON InputRichBlockMathematicalExpression where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "mathematical_expression")
          , jsonField "expression" x.expression
          ]
      )
  toEncoding = toEncoding . toJSON
