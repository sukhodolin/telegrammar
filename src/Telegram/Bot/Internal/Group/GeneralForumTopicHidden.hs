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
module Telegram.Bot.Internal.Group.GeneralForumTopicHidden
  ( GeneralForumTopicHidden (..)
  , mkGeneralForumTopicHidden
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Telegram.Bot.Support (jsonObject)

-- | This object represents a service message about General forum topic hidden in the chat. Currently holds no information.
--
-- Source: <https://core.telegram.org/bots/api#generalforumtopichidden>.
-- Codec directions: decoded from responses, encoded into requests.
data GeneralForumTopicHidden = MkGeneralForumTopicHidden
  deriving stock (Eq, Show)

-- | Initialize a 'GeneralForumTopicHidden' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkGeneralForumTopicHidden :: GeneralForumTopicHidden
mkGeneralForumTopicHidden = MkGeneralForumTopicHidden

instance FromJSON GeneralForumTopicHidden where
  parseJSON = withObject "GeneralForumTopicHidden" $ \_ ->
    pure MkGeneralForumTopicHidden

instance ToJSON GeneralForumTopicHidden where
  toJSON _ =
    jsonObject []
  toEncoding = toEncoding . toJSON
