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
module Telegram.Bot.Internal.Group.ForumTopicReopened
  ( ForumTopicReopened (..)
  , mkForumTopicReopened
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Telegram.Bot.Support (jsonObject)

-- | This object represents a service message about a forum topic reopened in the chat. Currently holds no information.
--
-- Source: <https://core.telegram.org/bots/api#forumtopicreopened>.
-- Codec directions: decoded from responses, encoded into requests.
data ForumTopicReopened = MkForumTopicReopened
  deriving stock (Eq, Show)

-- | Initialize a 'ForumTopicReopened' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkForumTopicReopened :: ForumTopicReopened
mkForumTopicReopened = MkForumTopicReopened

instance FromJSON ForumTopicReopened where
  parseJSON = withObject "ForumTopicReopened" $ \_ ->
    pure MkForumTopicReopened

instance ToJSON ForumTopicReopened where
  toJSON _ =
    jsonObject []
  toEncoding = toEncoding . toJSON
