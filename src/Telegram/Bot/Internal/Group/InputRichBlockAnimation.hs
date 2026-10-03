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
module Telegram.Bot.Internal.Group.InputRichBlockAnimation
  ( InputRichBlockAnimation (..)
  , mkInputRichBlockAnimation
  , planInputRichBlockAnimation
  ) where

import Data.Aeson (Value (..))
import Telegram.Bot.Internal.Group.InputMediaAnimation (InputMediaAnimation, planInputMediaAnimation)
import Telegram.Bot.Internal.Group.RichBlockCaption (RichBlockCaption)
import Telegram.Bot.Support (FieldPlanner, encodeJson, planRecord, planned, plannedLiteral, plannedMaybe)

-- | A block with an animation, corresponding to the HTML tag \<video\>.
--
-- Source: <https://core.telegram.org/bots/api#inputrichblockanimation>.
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
--
-- Supplied constants: @type@ = @"animation"@.
data InputRichBlockAnimation = MkInputRichBlockAnimation
  { -- | The animation. Caption is ignored.
    --
    -- Wire key: @animation@.
    animation :: InputMediaAnimation
  , -- | Optional. Caption of the block
    --
    -- Wire key: @caption@.
    -- Omitted from an encoded request when it is @Nothing@.
    caption :: Maybe RichBlockCaption
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InputRichBlockAnimation' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputRichBlockAnimation :: InputMediaAnimation -> InputRichBlockAnimation
mkInputRichBlockAnimation arg0 =
  MkInputRichBlockAnimation
    { animation = arg0
    , caption = Nothing
    }

-- | Plan a 'InputRichBlockAnimation' as part of an outgoing request.
--
-- The traversal is checked: it validates every file source against
-- the capabilities its occurrence permits and allocates one
-- attachment part per upload, in source field order.
planInputRichBlockAnimation :: InputRichBlockAnimation -> FieldPlanner
planInputRichBlockAnimation x =
  planRecord
    ( concat
        [ plannedLiteral "type" (String "animation")
        , planned "animation" (planInputMediaAnimation x.animation)
        , plannedMaybe "caption" x.caption encodeJson
        ]
    )
