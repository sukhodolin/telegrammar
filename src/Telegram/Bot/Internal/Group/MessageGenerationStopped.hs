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
module Telegram.Bot.Internal.Group.MessageGenerationStopped
  ( MessageGenerationStopped (..)
  , mkMessageGenerationStopped
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.Chat (Chat)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseInt64, requiredWith)

-- | This object describes an update about a user stopping message generation.
--
-- Source: <https://core.telegram.org/bots/api#messagegenerationstopped>.
-- Codec directions: decoded from responses, encoded into requests.
data MessageGenerationStopped = MkMessageGenerationStopped
  { -- | Chat in which the message is generated
    --
    -- Wire key: @chat@.
    chat :: Chat
  , -- | Optional. Unique identifier of the message thread in which the message is generated
    --
    -- Wire key: @message_thread_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    message_thread_id :: Maybe Int64
  , -- | Unique identifier of the message draft which was stopped
    --
    -- Wire key: @draft_id@.
    draft_id :: Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'MessageGenerationStopped' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkMessageGenerationStopped :: Chat -> Int64 -> MessageGenerationStopped
mkMessageGenerationStopped arg0 arg1 =
  MkMessageGenerationStopped
    { chat = arg0
    , message_thread_id = Nothing
    , draft_id = arg1
    }

instance FromJSON MessageGenerationStopped where
  parseJSON = withObject "MessageGenerationStopped" $ \obj ->
    do
      field_0 <- requiredWith obj "chat" parseJSON
      field_1 <- optionalWith obj "message_thread_id" parseInt64
      field_2 <- requiredWith obj "draft_id" parseInt64
      pure
        MkMessageGenerationStopped
          { chat = field_0
          , message_thread_id = field_1
          , draft_id = field_2
          }

instance ToJSON MessageGenerationStopped where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "chat" x.chat
          , jsonOptional "message_thread_id" x.message_thread_id
          , jsonField "draft_id" x.draft_id
          ]
      )
  toEncoding = toEncoding . toJSON
