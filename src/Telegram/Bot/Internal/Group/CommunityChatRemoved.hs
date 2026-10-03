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
module Telegram.Bot.Internal.Group.CommunityChatRemoved
  ( CommunityChatRemoved (..)
  , mkCommunityChatRemoved
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Telegram.Bot.Support (jsonObject)

-- | Describes a service message about a chat or a bot being removed from a community. Currently holds no information.
--
-- Source: <https://core.telegram.org/bots/api#communitychatremoved>.
-- Codec directions: decoded from responses, encoded into requests.
data CommunityChatRemoved = MkCommunityChatRemoved
  deriving stock (Eq, Show)

-- | Initialize a 'CommunityChatRemoved' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkCommunityChatRemoved :: CommunityChatRemoved
mkCommunityChatRemoved = MkCommunityChatRemoved

instance FromJSON CommunityChatRemoved where
  parseJSON = withObject "CommunityChatRemoved" $ \_ ->
    pure MkCommunityChatRemoved

instance ToJSON CommunityChatRemoved where
  toJSON _ =
    jsonObject []
  toEncoding = toEncoding . toJSON
