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
module Telegram.Bot.Internal.Group.InputRichMessage
  ( InputRichMessage (..)
  , mkInputRichMessage
  , planInputRichMessage
  ) where

import Data.Text (Text)
import Telegram.Bot.Internal.Group.InputRichBlock (InputRichBlock, planInputRichBlock)
import Telegram.Bot.Internal.Group.InputRichMessageMedia (InputRichMessageMedia, planInputRichMessageMedia)
import Telegram.Bot.Support (FieldPlanner, encodeJson, planList, planRecord, plannedMaybe)

-- | Describes a rich message to be sent. Exactly one of the fields html, markdown, or blocks must be used.
--
-- Source: <https://core.telegram.org/bots/api#inputrichmessage>.
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
data InputRichMessage = MkInputRichMessage
  { -- | Optional. Content of the rich message to send described as a list of blocks
    --
    -- Wire key: @blocks@.
    -- Omitted from an encoded request when it is @Nothing@.
    blocks :: Maybe [InputRichBlock]
  , -- | Optional. Content of the rich message to send described using HTML formatting. See rich message formatting options for more details. Use media field to specify the media used in the message.
    --
    -- Wire key: @html@.
    -- Omitted from an encoded request when it is @Nothing@.
    html :: Maybe Text
  , -- | Optional. Content of the rich message to send described using Markdown formatting. See rich message formatting options for more details. Use media field to specify the media used in the message.
    --
    -- Wire key: @markdown@.
    -- Omitted from an encoded request when it is @Nothing@.
    markdown :: Maybe Text
  , -- | Optional. List of media that are specified in the markdown or html fields using tg:\/\/photo?id=, tg:\/\/video?id=, tg:\/\/document?id=, and tg:\/\/audio?id= links
    --
    -- Wire key: @media@.
    -- Omitted from an encoded request when it is @Nothing@.
    media :: Maybe [InputRichMessageMedia]
  , -- | Optional. Pass True if the rich message must be shown right-to-left
    --
    -- Wire key: @is_rtl@.
    -- Omitted from an encoded request when it is @Nothing@.
    is_rtl :: Maybe Bool
  , -- | Optional. Pass True to skip automatic detection of entities (e.g., URLs, email addresses, username mentions, hashtags, cashtags, bot commands, or phone numbers) in the text
    --
    -- Wire key: @skip_entity_detection@.
    -- Omitted from an encoded request when it is @Nothing@.
    skip_entity_detection :: Maybe Bool
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InputRichMessage' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputRichMessage :: InputRichMessage
mkInputRichMessage =
  MkInputRichMessage
    { blocks = Nothing
    , html = Nothing
    , markdown = Nothing
    , media = Nothing
    , is_rtl = Nothing
    , skip_entity_detection = Nothing
    }

-- | Plan a 'InputRichMessage' as part of an outgoing request.
--
-- The traversal is checked: it validates every file source against
-- the capabilities its occurrence permits and allocates one
-- attachment part per upload, in source field order.
planInputRichMessage :: InputRichMessage -> FieldPlanner
planInputRichMessage x =
  planRecord
    ( concat
        [ plannedMaybe "blocks" x.blocks (planList planInputRichBlock)
        , plannedMaybe "html" x.html encodeJson
        , plannedMaybe "markdown" x.markdown encodeJson
        , plannedMaybe "media" x.media (planList planInputRichMessageMedia)
        , plannedMaybe "is_rtl" x.is_rtl encodeJson
        , plannedMaybe "skip_entity_detection" x.skip_entity_detection encodeJson
        ]
    )
