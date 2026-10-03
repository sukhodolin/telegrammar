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
module Telegram.Bot.Internal.Group.RichBlockFooter
  ( RichBlockFooter (..)
  , mkRichBlockFooter
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Telegram.Bot.Internal.Group.RichMessageButton (RichText)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonLiteral, jsonObject, requiredWith)

-- | A footer, corresponding to the HTML tag \<footer\>.
--
-- Source: <https://core.telegram.org/bots/api#richblockfooter>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"footer"@.
data RichBlockFooter = MkRichBlockFooter
  { -- | Text of the block
    --
    -- Wire key: @text@.
    text :: RichText
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichBlockFooter' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichBlockFooter :: RichText -> RichBlockFooter
mkRichBlockFooter arg0 =
  MkRichBlockFooter
    { text = arg0
    }

instance FromJSON RichBlockFooter where
  parseJSON = withObject "RichBlockFooter" $ \obj ->
    do
      checkStringConstant obj "type" "footer"
      field_1 <- requiredWith obj "text" parseJSON
      pure
        MkRichBlockFooter
          { text = field_1
          }

instance ToJSON RichBlockFooter where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "footer")
          , jsonField "text" x.text
          ]
      )
  toEncoding = toEncoding . toJSON
