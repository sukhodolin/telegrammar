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
module Telegram.Bot.Internal.Group.InputRichBlockVideo
  ( InputRichBlockVideo (..)
  , mkInputRichBlockVideo
  , planInputRichBlockVideo
  ) where

import Data.Aeson (Value (..))
import Telegram.Bot.Internal.Group.InputMediaVideo (InputMediaVideo, planInputMediaVideo)
import Telegram.Bot.Internal.Group.RichBlockCaption (RichBlockCaption)
import Telegram.Bot.Support (FieldPlanner, encodeJson, planRecord, planned, plannedLiteral, plannedMaybe)

-- | A block with a video, corresponding to the HTML tag \<video\>.
--
-- Source: <https://core.telegram.org/bots/api#inputrichblockvideo>.
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
--
-- Supplied constants: @type@ = @"video"@.
data InputRichBlockVideo = MkInputRichBlockVideo
  { -- | The video. Caption is ignored.
    --
    -- Wire key: @video@.
    video :: InputMediaVideo
  , -- | Optional. Caption of the block
    --
    -- Wire key: @caption@.
    -- Omitted from an encoded request when it is @Nothing@.
    caption :: Maybe RichBlockCaption
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InputRichBlockVideo' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputRichBlockVideo :: InputMediaVideo -> InputRichBlockVideo
mkInputRichBlockVideo arg0 =
  MkInputRichBlockVideo
    { video = arg0
    , caption = Nothing
    }

-- | Plan a 'InputRichBlockVideo' as part of an outgoing request.
--
-- The traversal is checked: it validates every file source against
-- the capabilities its occurrence permits and allocates one
-- attachment part per upload, in source field order.
planInputRichBlockVideo :: InputRichBlockVideo -> FieldPlanner
planInputRichBlockVideo x =
  planRecord
    ( concat
        [ plannedLiteral "type" (String "video")
        , planned "video" (planInputMediaVideo x.video)
        , plannedMaybe "caption" x.caption encodeJson
        ]
    )
