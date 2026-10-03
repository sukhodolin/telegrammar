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
module Telegram.Bot.Internal.Group.InputChecklistTask
  ( InputChecklistTask (..)
  , mkInputChecklistTask
  ) where

import Data.Aeson (ToJSON (..))
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.MessageEntity (MessageEntity)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional)

-- | Describes a task to add to a checklist.
--
-- Source: <https://core.telegram.org/bots/api#inputchecklisttask>.
-- Codec directions: encoded into requests.
data InputChecklistTask = MkInputChecklistTask
  { -- | Unique identifier of the task; must be positive and unique among all task identifiers currently present in the checklist
    --
    -- Wire key: @id@.
    id :: Int64
  , -- | Text of the task; 1-100 characters after entities parsing
    --
    -- Wire key: @text@.
    text :: Text
  , -- | Optional. Mode for parsing entities in the text. See formatting options for more details.
    --
    -- Wire key: @parse_mode@.
    -- Omitted from an encoded request when it is @Nothing@.
    parse_mode :: Maybe Text
  , -- | Optional. List of special entities that appear in the text, which can be specified instead of parse_mode. Currently, only bold, italic, underline, strikethrough, spoiler, custom_emoji, and date_time entities are allowed.
    --
    -- Wire key: @text_entities@.
    -- Omitted from an encoded request when it is @Nothing@.
    text_entities :: Maybe [MessageEntity]
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InputChecklistTask' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputChecklistTask :: Int64 -> Text -> InputChecklistTask
mkInputChecklistTask arg0 arg1 =
  MkInputChecklistTask
    { id = arg0
    , text = arg1
    , parse_mode = Nothing
    , text_entities = Nothing
    }

instance ToJSON InputChecklistTask where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "id" x.id
          , jsonField "text" x.text
          , jsonOptional "parse_mode" x.parse_mode
          , jsonOptional "text_entities" x.text_entities
          ]
      )
  toEncoding = toEncoding . toJSON
