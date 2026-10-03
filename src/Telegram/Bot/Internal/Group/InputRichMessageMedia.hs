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
module Telegram.Bot.Internal.Group.InputRichMessageMedia
  ( InputRichMessageMedia (..)
  , mkInputRichMessageMedia
  , planInputRichMessageMedia
  ) where

import Data.Text (Text)
import Telegram.Bot.Internal.Group.RichMessageMedia (RichMessageMedia, planRichMessageMedia)
import Telegram.Bot.Support (FieldPlanner, encodeJson, planRecord, planned)

-- | Describes a media element embedded in an outgoing rich message.
--
-- Source: <https://core.telegram.org/bots/api#inputrichmessagemedia>.
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
data InputRichMessageMedia = MkInputRichMessageMedia
  { -- | Unique identifier of the media used in a tg:\/\/photo?id=, tg:\/\/video?id=, tg:\/\/document?id=, or tg:\/\/audio?id= link. 1-64 characters, only A-Z, a-z, 0-9, _ and - are allowed.
    --
    -- Wire key: @id@.
    id :: Text
  , -- | The media to be sent. Everything except the media itself and its properties is ignored.
    --
    -- Wire key: @media@.
    media :: RichMessageMedia
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InputRichMessageMedia' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputRichMessageMedia :: Text -> RichMessageMedia -> InputRichMessageMedia
mkInputRichMessageMedia arg0 arg1 =
  MkInputRichMessageMedia
    { id = arg0
    , media = arg1
    }

-- | Plan a 'InputRichMessageMedia' as part of an outgoing request.
--
-- The traversal is checked: it validates every file source against
-- the capabilities its occurrence permits and allocates one
-- attachment part per upload, in source field order.
planInputRichMessageMedia :: InputRichMessageMedia -> FieldPlanner
planInputRichMessageMedia x =
  planRecord
    ( concat
        [ planned "id" (encodeJson x.id)
        , planned "media" (planRichMessageMedia x.media)
        ]
    )
