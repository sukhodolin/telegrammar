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
module Telegram.Bot.Internal.Group.InputChecklist
  ( InputChecklist (..)
  , mkInputChecklist
  , planInputChecklist
  ) where

import Data.Aeson (ToJSON (..))
import Data.Text (Text)
import Telegram.Bot.Internal.Group.InputChecklistTask (InputChecklistTask)
import Telegram.Bot.Internal.Group.MessageEntity (MessageEntity)
import Telegram.Bot.Support (FieldPlanner, encodeJson, jsonField, jsonObject, jsonOptional, planList, planRecord, planned, plannedMaybe, validateArrayCount, withValidation)

-- | Describes a checklist to create.
--
-- Source: <https://core.telegram.org/bots/api#inputchecklist>.
-- Codec directions: encoded into requests, planned into checked requests.
data InputChecklist = MkInputChecklist
  { -- | Title of the checklist; 1-255 characters after entities parsing
    --
    -- Wire key: @title@.
    title :: Text
  , -- | Optional. Mode for parsing entities in the title. See formatting options for more details.
    --
    -- Wire key: @parse_mode@.
    -- Omitted from an encoded request when it is @Nothing@.
    parse_mode :: Maybe Text
  , -- | Optional. List of special entities that appear in the title, which can be specified instead of parse_mode. Currently, only bold, italic, underline, strikethrough, spoiler, custom_emoji, and date_time entities are allowed.
    --
    -- Wire key: @title_entities@.
    -- Omitted from an encoded request when it is @Nothing@.
    title_entities :: Maybe [MessageEntity]
  , -- | List of 1-30 tasks in the checklist
    --
    -- Wire key: @tasks@.
    -- Checked when planning a request: 1 to 30 elements.
    tasks :: [InputChecklistTask]
  , -- | Optional. Pass True if other users can add tasks to the checklist
    --
    -- Wire key: @others_can_add_tasks@.
    -- Omitted from an encoded request when it is @Nothing@.
    others_can_add_tasks :: Maybe Bool
  , -- | Optional. Pass True if other users can mark tasks as done or not done in the checklist
    --
    -- Wire key: @others_can_mark_tasks_as_done@.
    -- Omitted from an encoded request when it is @Nothing@.
    others_can_mark_tasks_as_done :: Maybe Bool
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InputChecklist' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputChecklist :: Text -> [InputChecklistTask] -> InputChecklist
mkInputChecklist arg0 arg1 =
  MkInputChecklist
    { title = arg0
    , parse_mode = Nothing
    , title_entities = Nothing
    , tasks = arg1
    , others_can_add_tasks = Nothing
    , others_can_mark_tasks_as_done = Nothing
    }

instance ToJSON InputChecklist where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "title" x.title
          , jsonOptional "parse_mode" x.parse_mode
          , jsonOptional "title_entities" x.title_entities
          , jsonField "tasks" x.tasks
          , jsonOptional "others_can_add_tasks" x.others_can_add_tasks
          , jsonOptional "others_can_mark_tasks_as_done" x.others_can_mark_tasks_as_done
          ]
      )
  toEncoding = toEncoding . toJSON

-- | Plan a 'InputChecklist' as part of an outgoing request.
--
-- The traversal is checked: it validates every file source against
-- the capabilities its occurrence permits and allocates one
-- attachment part per upload, in source field order.
planInputChecklist :: InputChecklist -> FieldPlanner
planInputChecklist x =
  planRecord
    ( concat
        [ planned "title" (encodeJson x.title)
        , plannedMaybe "parse_mode" x.parse_mode encodeJson
        , plannedMaybe "title_entities" x.title_entities (planList encodeJson)
        , planned "tasks" (withValidation (\loc_ -> validateArrayCount (Just 1) (Just 30) loc_ x.tasks) ((planList encodeJson) x.tasks))
        , plannedMaybe "others_can_add_tasks" x.others_can_add_tasks encodeJson
        , plannedMaybe "others_can_mark_tasks_as_done" x.others_can_mark_tasks_as_done encodeJson
        ]
    )
