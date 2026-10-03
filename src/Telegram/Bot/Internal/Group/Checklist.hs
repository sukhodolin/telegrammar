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
module Telegram.Bot.Internal.Group.Checklist
  ( Checklist (..)
  , mkChecklist
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.ChecklistTask (ChecklistTask)
import Telegram.Bot.Internal.Group.MessageEntity (MessageEntity)
import Telegram.Bot.Support (jsonField, jsonFlag, jsonObject, jsonOptional, optionalTrueFlag, optionalWith, parseList, requiredWith)

-- | Describes a checklist.
--
-- Source: <https://core.telegram.org/bots/api#checklist>.
-- Codec directions: decoded from responses, encoded into requests.
data Checklist = MkChecklist
  { -- | Title of the checklist
    --
    -- Wire key: @title@.
    title :: Text
  , -- | Optional. Special entities that appear in the checklist title
    --
    -- Wire key: @title_entities@.
    -- Omitted from an encoded request when it is @Nothing@.
    title_entities :: Maybe [MessageEntity]
  , -- | List of tasks in the checklist
    --
    -- Wire key: @tasks@.
    tasks :: [ChecklistTask]
  , -- | Optional. True, if users other than the creator of the list can add tasks to the list
    --
    -- Wire key: @others_can_add_tasks@.
    -- Omitted from an encoded request when it is @False@.
    others_can_add_tasks :: Bool
  , -- | Optional. True, if users other than the creator of the list can mark tasks as done or not done
    --
    -- Wire key: @others_can_mark_tasks_as_done@.
    -- Omitted from an encoded request when it is @False@.
    others_can_mark_tasks_as_done :: Bool
  }
  deriving stock (Eq, Show)

-- | Initialize a 'Checklist' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkChecklist :: Text -> [ChecklistTask] -> Checklist
mkChecklist arg0 arg1 =
  MkChecklist
    { title = arg0
    , title_entities = Nothing
    , tasks = arg1
    , others_can_add_tasks = False
    , others_can_mark_tasks_as_done = False
    }

instance FromJSON Checklist where
  parseJSON = withObject "Checklist" $ \obj ->
    do
      field_0 <- requiredWith obj "title" parseJSON
      field_1 <- optionalWith obj "title_entities" (parseList parseJSON)
      field_2 <- requiredWith obj "tasks" (parseList parseJSON)
      field_3 <- optionalTrueFlag obj "others_can_add_tasks"
      field_4 <- optionalTrueFlag obj "others_can_mark_tasks_as_done"
      pure
        MkChecklist
          { title = field_0
          , title_entities = field_1
          , tasks = field_2
          , others_can_add_tasks = field_3
          , others_can_mark_tasks_as_done = field_4
          }

instance ToJSON Checklist where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "title" x.title
          , jsonOptional "title_entities" x.title_entities
          , jsonField "tasks" x.tasks
          , jsonFlag "others_can_add_tasks" x.others_can_add_tasks
          , jsonFlag "others_can_mark_tasks_as_done" x.others_can_mark_tasks_as_done
          ]
      )
  toEncoding = toEncoding . toJSON
