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
module Telegram.Bot.Internal.Group.ChecklistTask
  ( ChecklistTask (..)
  , mkChecklistTask
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.Chat (Chat)
import Telegram.Bot.Internal.Group.MessageEntity (MessageEntity)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseInt64, parseList, requiredWith)

-- | Describes a task in a checklist.
--
-- Source: <https://core.telegram.org/bots/api#checklisttask>.
-- Codec directions: decoded from responses, encoded into requests.
data ChecklistTask = MkChecklistTask
  { -- | Unique identifier of the task
    --
    -- Wire key: @id@.
    id :: Int64
  , -- | Text of the task
    --
    -- Wire key: @text@.
    text :: Text
  , -- | Optional. Special entities that appear in the task text
    --
    -- Wire key: @text_entities@.
    -- Omitted from an encoded request when it is @Nothing@.
    text_entities :: Maybe [MessageEntity]
  , -- | Optional. User that completed the task; omitted if the task wasn\'t completed by a user
    --
    -- Wire key: @completed_by_user@.
    -- Omitted from an encoded request when it is @Nothing@.
    completed_by_user :: Maybe User
  , -- | Optional. Chat that completed the task; omitted if the task wasn\'t completed by a chat
    --
    -- Wire key: @completed_by_chat@.
    -- Omitted from an encoded request when it is @Nothing@.
    completed_by_chat :: Maybe Chat
  , -- | Optional. Point in time (Unix timestamp) when the task was completed; 0 if the task wasn\'t completed
    --
    -- Wire key: @completion_date@.
    -- Omitted from an encoded request when it is @Nothing@.
    completion_date :: Maybe Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ChecklistTask' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkChecklistTask :: Int64 -> Text -> ChecklistTask
mkChecklistTask arg0 arg1 =
  MkChecklistTask
    { id = arg0
    , text = arg1
    , text_entities = Nothing
    , completed_by_user = Nothing
    , completed_by_chat = Nothing
    , completion_date = Nothing
    }

instance FromJSON ChecklistTask where
  parseJSON = withObject "ChecklistTask" $ \obj ->
    do
      field_0 <- requiredWith obj "id" parseInt64
      field_1 <- requiredWith obj "text" parseJSON
      field_2 <- optionalWith obj "text_entities" (parseList parseJSON)
      field_3 <- optionalWith obj "completed_by_user" parseJSON
      field_4 <- optionalWith obj "completed_by_chat" parseJSON
      field_5 <- optionalWith obj "completion_date" parseInt64
      pure
        MkChecklistTask
          { id = field_0
          , text = field_1
          , text_entities = field_2
          , completed_by_user = field_3
          , completed_by_chat = field_4
          , completion_date = field_5
          }

instance ToJSON ChecklistTask where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "id" x.id
          , jsonField "text" x.text
          , jsonOptional "text_entities" x.text_entities
          , jsonOptional "completed_by_user" x.completed_by_user
          , jsonOptional "completed_by_chat" x.completed_by_chat
          , jsonOptional "completion_date" x.completion_date
          ]
      )
  toEncoding = toEncoding . toJSON
