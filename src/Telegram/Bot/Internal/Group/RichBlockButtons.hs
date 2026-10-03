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
module Telegram.Bot.Internal.Group.RichBlockButtons
  ( RichBlockButtons (..)
  , mkRichBlockButtons
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.RichMessageButton (RichMessageButton)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonLiteral, jsonObject, jsonOptional, optionalWith, parseList, requiredWith)

-- | A block containing a list of buttons that are shown in one row, corresponding to the custom HTML tag \<tg-button-row\>.
--
-- Source: <https://core.telegram.org/bots/api#richblockbuttons>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"buttons"@.
data RichBlockButtons = MkRichBlockButtons
  { -- | The buttons
    --
    -- Wire key: @buttons@.
    buttons :: [RichMessageButton]
  , -- | Optional. Horizontal alignment of the buttons. Currently, must be one of \"left\", \"center\", or \"right\".
    --
    -- Wire key: @align@.
    -- Omitted from an encoded request when it is @Nothing@.
    align :: Maybe Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichBlockButtons' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichBlockButtons :: [RichMessageButton] -> RichBlockButtons
mkRichBlockButtons arg0 =
  MkRichBlockButtons
    { buttons = arg0
    , align = Nothing
    }

instance FromJSON RichBlockButtons where
  parseJSON = withObject "RichBlockButtons" $ \obj ->
    do
      checkStringConstant obj "type" "buttons"
      field_1 <- requiredWith obj "buttons" (parseList parseJSON)
      field_2 <- optionalWith obj "align" parseJSON
      pure
        MkRichBlockButtons
          { buttons = field_1
          , align = field_2
          }

instance ToJSON RichBlockButtons where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "buttons")
          , jsonField "buttons" x.buttons
          , jsonOptional "align" x.align
          ]
      )
  toEncoding = toEncoding . toJSON
