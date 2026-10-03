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
module Telegram.Bot.Internal.Group.VideoChatScheduled
  ( VideoChatScheduled (..)
  , mkVideoChatScheduled
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Support (jsonField, jsonObject, parseInt64, requiredWith)

-- | This object represents a service message about a video chat scheduled in the chat.
--
-- Source: <https://core.telegram.org/bots/api#videochatscheduled>.
-- Codec directions: decoded from responses, encoded into requests.
data VideoChatScheduled = MkVideoChatScheduled
  { -- | Point in time (Unix timestamp) when the video chat is supposed to be started by a chat administrator
    --
    -- Wire key: @start_date@.
    start_date :: Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'VideoChatScheduled' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkVideoChatScheduled :: Int64 -> VideoChatScheduled
mkVideoChatScheduled arg0 =
  MkVideoChatScheduled
    { start_date = arg0
    }

instance FromJSON VideoChatScheduled where
  parseJSON = withObject "VideoChatScheduled" $ \obj ->
    do
      field_0 <- requiredWith obj "start_date" parseInt64
      pure
        MkVideoChatScheduled
          { start_date = field_0
          }

instance ToJSON VideoChatScheduled where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "start_date" x.start_date
          ]
      )
  toEncoding = toEncoding . toJSON
