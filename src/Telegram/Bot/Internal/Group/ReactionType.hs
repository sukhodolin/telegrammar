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
module Telegram.Bot.Internal.Group.ReactionType
  ( ReactionType (..)
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Telegram.Bot.Internal.Group.ReactionTypeCustomEmoji (ReactionTypeCustomEmoji)
import Telegram.Bot.Internal.Group.ReactionTypeEmoji (ReactionTypeEmoji)
import Telegram.Bot.Internal.Group.ReactionTypePaid (ReactionTypePaid)
import Telegram.Bot.Support (tagField)

-- | This object describes the type of a reaction. Currently, it can be one of
-- \- ReactionTypeEmoji
-- \- ReactionTypeCustomEmoji
-- \- ReactionTypePaid
--
-- Source: <https://core.telegram.org/bots/api#reactiontype>.
-- Codec directions: decoded from responses, encoded into requests.
data ReactionType
  = ReactionTypeViaReactionTypeCustomEmoji ReactionTypeCustomEmoji
  | ReactionTypeViaReactionTypeEmoji ReactionTypeEmoji
  | ReactionTypeViaReactionTypePaid ReactionTypePaid
  | -- | A value this decoder does not recognize, preserved verbatim so
    -- the raw payload survives the boundary.
    ReactionTypeUnknown Value
  deriving stock (Eq, Show)

instance FromJSON ReactionType where
  parseJSON = withObject "ReactionType" $ \obj -> do
    tag_ <- tagField obj "type"
    case tag_ of
      "custom_emoji" ->
        ReactionTypeViaReactionTypeCustomEmoji <$> parseJSON (Object obj)
      "emoji" ->
        ReactionTypeViaReactionTypeEmoji <$> parseJSON (Object obj)
      "paid" ->
        ReactionTypeViaReactionTypePaid <$> parseJSON (Object obj)
      _ -> pure (ReactionTypeUnknown (Object obj))

instance ToJSON ReactionType where
  toJSON = \case
    ReactionTypeViaReactionTypeCustomEmoji member_ -> toJSON member_
    ReactionTypeViaReactionTypeEmoji member_ -> toJSON member_
    ReactionTypeViaReactionTypePaid member_ -> toJSON member_
    ReactionTypeUnknown raw_ -> raw_
  toEncoding = toEncoding . toJSON
