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
module Telegram.Bot.Internal.Group.ForumTopicCreated
  ( ForumTopicCreated (..)
  , mkForumTopicCreated
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonFlag, jsonObject, jsonOptional, optionalTrueFlag, optionalWith, parseInt64, requiredWith)

-- | This object represents a service message about a new forum topic created in the chat.
--
-- Source: <https://core.telegram.org/bots/api#forumtopiccreated>.
-- Codec directions: decoded from responses, encoded into requests.
data ForumTopicCreated = MkForumTopicCreated
  { -- | Name of the topic
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

-- | Initialize a 'ForumTopicCreated' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkForumTopicCreated :: Text -> Int64 -> ForumTopicCreated
mkForumTopicCreated arg0 arg1 =
  MkForumTopicCreated
    { name = arg0
    , icon_color = arg1
    , icon_custom_emoji_id = Nothing
    , is_name_implicit = False
    }

instance FromJSON ForumTopicCreated where
  parseJSON = withObject "ForumTopicCreated" $ \obj ->
    do
      field_0 <- requiredWith obj "name" parseJSON
      field_1 <- requiredWith obj "icon_color" parseInt64
      field_2 <- optionalWith obj "icon_custom_emoji_id" parseJSON
      field_3 <- optionalTrueFlag obj "is_name_implicit"
      pure
        MkForumTopicCreated
          { name = field_0
          , icon_color = field_1
          , icon_custom_emoji_id = field_2
          , is_name_implicit = field_3
          }

instance ToJSON ForumTopicCreated where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "name" x.name
          , jsonField "icon_color" x.icon_color
          , jsonOptional "icon_custom_emoji_id" x.icon_custom_emoji_id
          , jsonFlag "is_name_implicit" x.is_name_implicit
          ]
      )
  toEncoding = toEncoding . toJSON
