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
module Telegram.Bot.Internal.Group.InputRichBlockPhoto
  ( InputRichBlockPhoto (..)
  , mkInputRichBlockPhoto
  , planInputRichBlockPhoto
  ) where

import Data.Aeson (Value (..))
import Telegram.Bot.Internal.Group.InputMediaPhoto (InputMediaPhoto, planInputMediaPhoto)
import Telegram.Bot.Internal.Group.RichBlockCaption (RichBlockCaption)
import Telegram.Bot.Support (FieldPlanner, encodeJson, planRecord, planned, plannedLiteral, plannedMaybe)

-- | A block with a photo, corresponding to the HTML tag \<img\>.
--
-- Source: <https://core.telegram.org/bots/api#inputrichblockphoto>.
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
--
-- Supplied constants: @type@ = @"photo"@.
data InputRichBlockPhoto = MkInputRichBlockPhoto
  { -- | The photo. Caption is ignored.
    --
    -- Wire key: @photo@.
    photo :: InputMediaPhoto
  , -- | Optional. Caption of the block
    --
    -- Wire key: @caption@.
    -- Omitted from an encoded request when it is @Nothing@.
    caption :: Maybe RichBlockCaption
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InputRichBlockPhoto' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputRichBlockPhoto :: InputMediaPhoto -> InputRichBlockPhoto
mkInputRichBlockPhoto arg0 =
  MkInputRichBlockPhoto
    { photo = arg0
    , caption = Nothing
    }

-- | Plan a 'InputRichBlockPhoto' as part of an outgoing request.
--
-- The traversal is checked: it validates every file source against
-- the capabilities its occurrence permits and allocates one
-- attachment part per upload, in source field order.
planInputRichBlockPhoto :: InputRichBlockPhoto -> FieldPlanner
planInputRichBlockPhoto x =
  planRecord
    ( concat
        [ plannedLiteral "type" (String "photo")
        , planned "photo" (planInputMediaPhoto x.photo)
        , plannedMaybe "caption" x.caption encodeJson
        ]
    )
