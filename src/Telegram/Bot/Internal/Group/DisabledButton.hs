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
module Telegram.Bot.Internal.Group.DisabledButton
  ( DisabledButton (..)
  , mkDisabledButton
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Telegram.Bot.Support (jsonObject)

-- | This object represents a disabled button which does nothing. Currently holds no information.
--
-- Source: <https://core.telegram.org/bots/api#disabledbutton>.
-- Codec directions: decoded from responses, encoded into requests.
data DisabledButton = MkDisabledButton
  deriving stock (Eq, Show)

-- | Initialize a 'DisabledButton' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkDisabledButton :: DisabledButton
mkDisabledButton = MkDisabledButton

instance FromJSON DisabledButton where
  parseJSON = withObject "DisabledButton" $ \_ ->
    pure MkDisabledButton

instance ToJSON DisabledButton where
  toJSON _ =
    jsonObject []
  toEncoding = toEncoding . toJSON
