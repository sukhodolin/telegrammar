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
module Telegram.Bot.Internal.Group.InputRichMessageContent
  ( InputRichMessageContent (..)
  , mkInputRichMessageContent
  , planInputRichMessageContent
  ) where

import Telegram.Bot.Internal.Group.InputRichMessage (InputRichMessage, planInputRichMessage)
import Telegram.Bot.Support (FieldPlanner, FileCapability (..), planRecord, planned, restrictTo)

-- | Represents the content of a rich message to be sent as the result of an inline query.
--
-- Source: <https://core.telegram.org/bots/api#inputrichmessagecontent>.
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
data InputRichMessageContent = MkInputRichMessageContent
  { -- | The message to be sent. Only previously uploaded files may be used in the message.
    --
    -- Wire key: @rich_message@.
    -- Always, the file sources reachable through this value are narrowed to @existing_file@.
    rich_message :: InputRichMessage
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InputRichMessageContent' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputRichMessageContent :: InputRichMessage -> InputRichMessageContent
mkInputRichMessageContent arg0 =
  MkInputRichMessageContent
    { rich_message = arg0
    }

-- | Plan a 'InputRichMessageContent' as part of an outgoing request.
--
-- The traversal is checked: it validates every file source against
-- the capabilities its occurrence permits and allocates one
-- attachment part per upload, in source field order.
planInputRichMessageContent :: InputRichMessageContent -> FieldPlanner
planInputRichMessageContent x =
  planRecord
    ( concat
        [ planned "rich_message" (restrictTo [ExistingFileCapability] (planInputRichMessage x.rich_message))
        ]
    )
