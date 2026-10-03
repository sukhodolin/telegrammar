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
module Telegram.Bot.Internal.Group.RichTextMathematicalExpression
  ( RichTextMathematicalExpression (..)
  , mkRichTextMathematicalExpression
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonLiteral, jsonObject, requiredWith)

-- | A mathematical expression.
--
-- Source: <https://core.telegram.org/bots/api#richtextmathematicalexpression>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"mathematical_expression"@.
data RichTextMathematicalExpression = MkRichTextMathematicalExpression
  { -- | The expression in LaTeX format
    --
    -- Wire key: @expression@.
    expression :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichTextMathematicalExpression' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichTextMathematicalExpression :: Text -> RichTextMathematicalExpression
mkRichTextMathematicalExpression arg0 =
  MkRichTextMathematicalExpression
    { expression = arg0
    }

instance FromJSON RichTextMathematicalExpression where
  parseJSON = withObject "RichTextMathematicalExpression" $ \obj ->
    do
      checkStringConstant obj "type" "mathematical_expression"
      field_1 <- requiredWith obj "expression" parseJSON
      pure
        MkRichTextMathematicalExpression
          { expression = field_1
          }

instance ToJSON RichTextMathematicalExpression where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "mathematical_expression")
          , jsonField "expression" x.expression
          ]
      )
  toEncoding = toEncoding . toJSON
