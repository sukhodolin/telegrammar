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
module Telegram.Bot.Internal.Group.CommunityChatAdded
  ( CommunityChatAdded (..)
  , mkCommunityChatAdded
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Telegram.Bot.Internal.Group.Community (Community)
import Telegram.Bot.Support (jsonField, jsonObject, requiredWith)

-- | Describes a service message about a chat or a bot being added to a community.
--
-- Source: <https://core.telegram.org/bots/api#communitychatadded>.
-- Codec directions: decoded from responses, encoded into requests.
data CommunityChatAdded = MkCommunityChatAdded
  { -- | The new community to which the chat or the bot belongs
    --
    -- Wire key: @community@.
    community :: Community
  }
  deriving stock (Eq, Show)

-- | Initialize a 'CommunityChatAdded' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkCommunityChatAdded :: Community -> CommunityChatAdded
mkCommunityChatAdded arg0 =
  MkCommunityChatAdded
    { community = arg0
    }

instance FromJSON CommunityChatAdded where
  parseJSON = withObject "CommunityChatAdded" $ \obj ->
    do
      field_0 <- requiredWith obj "community" parseJSON
      pure
        MkCommunityChatAdded
          { community = field_0
          }

instance ToJSON CommunityChatAdded where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "community" x.community
          ]
      )
  toEncoding = toEncoding . toJSON
