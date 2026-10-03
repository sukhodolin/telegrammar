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
module Telegram.Bot.Internal.Group.ForumTopicEdited
  ( ForumTopicEdited (..)
  , mkForumTopicEdited
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Support (jsonObject, jsonOptional, optionalWith)

-- | This object represents a service message about an edited forum topic.
--
-- Source: <https://core.telegram.org/bots/api#forumtopicedited>.
-- Codec directions: decoded from responses, encoded into requests.
data ForumTopicEdited = MkForumTopicEdited
  { -- | Optional. New name of the topic, if it was edited
    --
    -- Wire key: @name@.
    -- Omitted from an encoded request when it is @Nothing@.
    name :: Maybe Text
  , -- | Optional. New identifier of the custom emoji shown as the topic icon, if it was edited; an empty string if the icon was removed
    --
    -- Wire key: @icon_custom_emoji_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    icon_custom_emoji_id :: Maybe Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ForumTopicEdited' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkForumTopicEdited :: ForumTopicEdited
mkForumTopicEdited =
  MkForumTopicEdited
    { name = Nothing
    , icon_custom_emoji_id = Nothing
    }

instance FromJSON ForumTopicEdited where
  parseJSON = withObject "ForumTopicEdited" $ \obj ->
    do
      field_0 <- optionalWith obj "name" parseJSON
      field_1 <- optionalWith obj "icon_custom_emoji_id" parseJSON
      pure
        MkForumTopicEdited
          { name = field_0
          , icon_custom_emoji_id = field_1
          }

instance ToJSON ForumTopicEdited where
  toJSON x =
    jsonObject
      ( concat
          [ jsonOptional "name" x.name
          , jsonOptional "icon_custom_emoji_id" x.icon_custom_emoji_id
          ]
      )
  toEncoding = toEncoding . toJSON
