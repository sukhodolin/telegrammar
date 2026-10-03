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
module Telegram.Bot.Internal.Group.DirectMessagesTopic
  ( DirectMessagesTopic (..)
  , mkDirectMessagesTopic
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseInt64, requiredWith)

-- | Describes a topic of a direct messages chat.
--
-- Source: <https://core.telegram.org/bots/api#directmessagestopic>.
-- Codec directions: decoded from responses, encoded into requests.
data DirectMessagesTopic = MkDirectMessagesTopic
  { -- | Unique identifier of the topic. This number may have more than 32 significant bits and some programming languages may have difficulty\/silent defects in interpreting it. But it has at most 52 significant bits, so a 64-bit integer or double-precision float type are safe for storing this identifier.
    --
    -- Wire key: @topic_id@.
    topic_id :: Int64
  , -- | Optional. Information about the user that created the topic. Currently, it is always present.
    --
    -- Wire key: @user@.
    -- Omitted from an encoded request when it is @Nothing@.
    user :: Maybe User
  }
  deriving stock (Eq, Show)

-- | Initialize a 'DirectMessagesTopic' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkDirectMessagesTopic :: Int64 -> DirectMessagesTopic
mkDirectMessagesTopic arg0 =
  MkDirectMessagesTopic
    { topic_id = arg0
    , user = Nothing
    }

instance FromJSON DirectMessagesTopic where
  parseJSON = withObject "DirectMessagesTopic" $ \obj ->
    do
      field_0 <- requiredWith obj "topic_id" parseInt64
      field_1 <- optionalWith obj "user" parseJSON
      pure
        MkDirectMessagesTopic
          { topic_id = field_0
          , user = field_1
          }

instance ToJSON DirectMessagesTopic where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "topic_id" x.topic_id
          , jsonOptional "user" x.user
          ]
      )
  toEncoding = toEncoding . toJSON
