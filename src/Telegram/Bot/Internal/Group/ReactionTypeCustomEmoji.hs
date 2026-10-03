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
module Telegram.Bot.Internal.Group.ReactionTypeCustomEmoji
  ( ReactionTypeCustomEmoji (..)
  , mkReactionTypeCustomEmoji
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonLiteral, jsonObject, requiredWith)

-- | The reaction is based on a custom emoji.
--
-- Source: <https://core.telegram.org/bots/api#reactiontypecustomemoji>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"custom_emoji"@.
data ReactionTypeCustomEmoji = MkReactionTypeCustomEmoji
  { -- | Custom emoji identifier
    --
    -- Wire key: @custom_emoji_id@.
    custom_emoji_id :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ReactionTypeCustomEmoji' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkReactionTypeCustomEmoji :: Text -> ReactionTypeCustomEmoji
mkReactionTypeCustomEmoji arg0 =
  MkReactionTypeCustomEmoji
    { custom_emoji_id = arg0
    }

instance FromJSON ReactionTypeCustomEmoji where
  parseJSON = withObject "ReactionTypeCustomEmoji" $ \obj ->
    do
      checkStringConstant obj "type" "custom_emoji"
      field_1 <- requiredWith obj "custom_emoji_id" parseJSON
      pure
        MkReactionTypeCustomEmoji
          { custom_emoji_id = field_1
          }

instance ToJSON ReactionTypeCustomEmoji where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "custom_emoji")
          , jsonField "custom_emoji_id" x.custom_emoji_id
          ]
      )
  toEncoding = toEncoding . toJSON
