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
module Telegram.Bot.Internal.Group.InputRichBlockButtons
  ( InputRichBlockButtons (..)
  , mkInputRichBlockButtons
  , planInputRichBlockButtons
  ) where

import Data.Aeson (ToJSON (..), Value (..))
import Data.Text (Text)
import Telegram.Bot.Internal.Group.RichMessageButton (RichMessageButton)
import Telegram.Bot.Support (FieldPlanner, encodeJson, jsonField, jsonLiteral, jsonObject, jsonOptional, planList, planRecord, planned, plannedLiteral, plannedMaybe, validateArrayCount, withValidation)

-- | A block containing a list of buttons that are shown in one row, corresponding to the custom HTML tag \<tg-button-row\>.
--
-- Source: <https://core.telegram.org/bots/api#inputrichblockbuttons>.
-- Codec directions: encoded into requests, planned into checked requests.
--
-- Supplied constants: @type@ = @"buttons"@.
data InputRichBlockButtons = MkInputRichBlockButtons
  { -- | List of 1-8 buttons to send
    --
    -- Wire key: @buttons@.
    -- Checked when planning a request: 1 to 8 elements.
    buttons :: [RichMessageButton]
  , -- | Optional. Horizontal alignment of the buttons. Currently, must be one of \"left\", \"center\", or \"right\".
    --
    -- Wire key: @align@.
    -- Omitted from an encoded request when it is @Nothing@.
    align :: Maybe Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InputRichBlockButtons' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputRichBlockButtons :: [RichMessageButton] -> InputRichBlockButtons
mkInputRichBlockButtons arg0 =
  MkInputRichBlockButtons
    { buttons = arg0
    , align = Nothing
    }

instance ToJSON InputRichBlockButtons where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "buttons")
          , jsonField "buttons" x.buttons
          , jsonOptional "align" x.align
          ]
      )
  toEncoding = toEncoding . toJSON

-- | Plan a 'InputRichBlockButtons' as part of an outgoing request.
--
-- The traversal is checked: it validates every file source against
-- the capabilities its occurrence permits and allocates one
-- attachment part per upload, in source field order.
planInputRichBlockButtons :: InputRichBlockButtons -> FieldPlanner
planInputRichBlockButtons x =
  planRecord
    ( concat
        [ plannedLiteral "type" (String "buttons")
        , planned "buttons" (withValidation (\loc_ -> validateArrayCount (Just 1) (Just 8) loc_ x.buttons) ((planList encodeJson) x.buttons))
        , plannedMaybe "align" x.align encodeJson
        ]
    )
