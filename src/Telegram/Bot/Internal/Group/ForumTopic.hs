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
module Telegram.Bot.Internal.Group.ForumTopic
  ( ForumTopic (..)
  , mkForumTopic
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonFlag, jsonObject, jsonOptional, optionalTrueFlag, optionalWith, parseInt64, requiredWith)

-- | This object represents a forum topic.
--
-- Source: <https://core.telegram.org/bots/api#forumtopic>.
-- Codec directions: decoded from responses, encoded into requests.
data ForumTopic = MkForumTopic
  { -- | Unique identifier of the forum topic
    --
    -- Wire key: @message_thread_id@.
    message_thread_id :: Int64
  , -- | Name of the topic
    --
    -- Wire key: @name@.
    name :: Text
  , -- | Color of the topic icon in RGB format
    --
    -- Wire key: @icon_color@.
    icon_color :: Int64
  , -- | Optional. Unique identifier of the custom emoji shown as the topic icon
    --
    -- Wire key: @icon_custom_emoji_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    icon_custom_emoji_id :: Maybe Text
  , -- | Optional. True, if the name of the topic wasn\'t specified explicitly by its creator and likely needs to be changed by the bot
    --
    -- Wire key: @is_name_implicit@.
    -- Omitted from an encoded request when it is @False@.
    is_name_implicit :: Bool
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ForumTopic' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkForumTopic :: Int64 -> Text -> Int64 -> ForumTopic
mkForumTopic arg0 arg1 arg2 =
  MkForumTopic
    { message_thread_id = arg0
    , name = arg1
    , icon_color = arg2
    , icon_custom_emoji_id = Nothing
    , is_name_implicit = False
    }

instance FromJSON ForumTopic where
  parseJSON = withObject "ForumTopic" $ \obj ->
    do
      field_0 <- requiredWith obj "message_thread_id" parseInt64
      field_1 <- requiredWith obj "name" parseJSON
      field_2 <- requiredWith obj "icon_color" parseInt64
      field_3 <- optionalWith obj "icon_custom_emoji_id" parseJSON
      field_4 <- optionalTrueFlag obj "is_name_implicit"
      pure
        MkForumTopic
          { message_thread_id = field_0
          , name = field_1
          , icon_color = field_2
          , icon_custom_emoji_id = field_3
          , is_name_implicit = field_4
          }

instance ToJSON ForumTopic where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "message_thread_id" x.message_thread_id
          , jsonField "name" x.name
          , jsonField "icon_color" x.icon_color
          , jsonOptional "icon_custom_emoji_id" x.icon_custom_emoji_id
          , jsonFlag "is_name_implicit" x.is_name_implicit
          ]
      )
  toEncoding = toEncoding . toJSON
