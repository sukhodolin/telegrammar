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
module Telegram.Bot.Internal.Group.InputPollOption
  ( InputPollOption (..)
  , mkInputPollOption
  , planInputPollOption
  ) where

import Data.Text (Text)
import Telegram.Bot.Internal.Group.InputPollOptionMedia (InputPollOptionMedia, planInputPollOptionMedia)
import Telegram.Bot.Internal.Group.MessageEntity (MessageEntity)
import Telegram.Bot.Support (FieldPlanner, encodeJson, planList, planRecord, planned, plannedMaybe)

-- | This object contains information about one answer option in a poll to be sent.
--
-- Source: <https://core.telegram.org/bots/api#inputpolloption>.
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
data InputPollOption = MkInputPollOption
  { -- | Option text, 1-100 characters
    --
    -- Wire key: @text@.
    text :: Text
  , -- | Optional. Mode for parsing entities in the text. See formatting options for more details. Currently, only custom emoji entities are allowed.
    --
    -- Wire key: @text_parse_mode@.
    -- Omitted from an encoded request when it is @Nothing@.
    text_parse_mode :: Maybe Text
  , -- | Optional. A JSON-serialized list of special entities that appear in the poll option text. It can be specified instead of text_parse_mode.
    --
    -- Wire key: @text_entities@.
    -- Omitted from an encoded request when it is @Nothing@.
    text_entities :: Maybe [MessageEntity]
  , -- | Optional. Media added to the poll option
    --
    -- Wire key: @media@.
    -- Omitted from an encoded request when it is @Nothing@.
    media :: Maybe InputPollOptionMedia
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InputPollOption' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputPollOption :: Text -> InputPollOption
mkInputPollOption arg0 =
  MkInputPollOption
    { text = arg0
    , text_parse_mode = Nothing
    , text_entities = Nothing
    , media = Nothing
    }

-- | Plan a 'InputPollOption' as part of an outgoing request.
--
-- The traversal is checked: it validates every file source against
-- the capabilities its occurrence permits and allocates one
-- attachment part per upload, in source field order.
planInputPollOption :: InputPollOption -> FieldPlanner
planInputPollOption x =
  planRecord
    ( concat
        [ planned "text" (encodeJson x.text)
        , plannedMaybe "text_parse_mode" x.text_parse_mode encodeJson
        , plannedMaybe "text_entities" x.text_entities (planList encodeJson)
        , plannedMaybe "media" x.media planInputPollOptionMedia
        ]
    )
