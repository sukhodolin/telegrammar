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
module Telegram.Bot.Internal.Group.VideoChatEnded
  ( VideoChatEnded (..)
  , mkVideoChatEnded
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Support (jsonField, jsonObject, parseInt64, requiredWith)

-- | This object represents a service message about a video chat ended in the chat.
--
-- Source: <https://core.telegram.org/bots/api#videochatended>.
-- Codec directions: decoded from responses, encoded into requests.
data VideoChatEnded = MkVideoChatEnded
  { -- | Video chat duration in seconds
    --
    -- Wire key: @duration@.
    duration :: Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'VideoChatEnded' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkVideoChatEnded :: Int64 -> VideoChatEnded
mkVideoChatEnded arg0 =
  MkVideoChatEnded
    { duration = arg0
    }

instance FromJSON VideoChatEnded where
  parseJSON = withObject "VideoChatEnded" $ \obj ->
    do
      field_0 <- requiredWith obj "duration" parseInt64
      pure
        MkVideoChatEnded
          { duration = field_0
          }

instance ToJSON VideoChatEnded where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "duration" x.duration
          ]
      )
  toEncoding = toEncoding . toJSON
