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
module Telegram.Bot.Internal.Group.CallbackGame
  ( CallbackGame (..)
  , mkCallbackGame
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Telegram.Bot.Support (jsonObject)

-- | A placeholder, currently holds no information. Use BotFather to set up your game.
--
-- Source: <https://core.telegram.org/bots/api#callbackgame>.
-- Codec directions: decoded from responses, encoded into requests.
data CallbackGame = MkCallbackGame
  deriving stock (Eq, Show)

-- | Initialize a 'CallbackGame' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkCallbackGame :: CallbackGame
mkCallbackGame = MkCallbackGame

instance FromJSON CallbackGame where
  parseJSON = withObject "CallbackGame" $ \_ ->
    pure MkCallbackGame

instance ToJSON CallbackGame where
  toJSON _ =
    jsonObject []
  toEncoding = toEncoding . toJSON
