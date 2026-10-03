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
module Telegram.Bot.Internal.Group.ReactionCount
  ( ReactionCount (..)
  , mkReactionCount
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.ReactionType (ReactionType)
import Telegram.Bot.Support (jsonField, jsonObject, parseInt64, requiredWith)

-- | Represents a reaction added to a message along with the number of times it was added.
--
-- Source: <https://core.telegram.org/bots/api#reactioncount>.
-- Codec directions: decoded from responses, encoded into requests.
data ReactionCount = MkReactionCount
  { -- | Type of the reaction
    --
    -- Wire key: @type@.
    type_ :: ReactionType
  , -- | Number of times the reaction was added
    --
    -- Wire key: @total_count@.
    total_count :: Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ReactionCount' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkReactionCount :: ReactionType -> Int64 -> ReactionCount
mkReactionCount arg0 arg1 =
  MkReactionCount
    { type_ = arg0
    , total_count = arg1
    }

instance FromJSON ReactionCount where
  parseJSON = withObject "ReactionCount" $ \obj ->
    do
      field_0 <- requiredWith obj "type" parseJSON
      field_1 <- requiredWith obj "total_count" parseInt64
      pure
        MkReactionCount
          { type_ = field_0
          , total_count = field_1
          }

instance ToJSON ReactionCount where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "type" x.type_
          , jsonField "total_count" x.total_count
          ]
      )
  toEncoding = toEncoding . toJSON
