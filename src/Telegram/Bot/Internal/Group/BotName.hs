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
module Telegram.Bot.Internal.Group.BotName
  ( BotName (..)
  , mkBotName
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonObject, requiredWith)

-- | This object represents the bot\'s name.
--
-- Source: <https://core.telegram.org/bots/api#botname>.
-- Codec directions: decoded from responses, encoded into requests.
data BotName = MkBotName
  { -- | The bot\'s name
    --
    -- Wire key: @name@.
    name :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'BotName' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkBotName :: Text -> BotName
mkBotName arg0 =
  MkBotName
    { name = arg0
    }

instance FromJSON BotName where
  parseJSON = withObject "BotName" $ \obj ->
    do
      field_0 <- requiredWith obj "name" parseJSON
      pure
        MkBotName
          { name = field_0
          }

instance ToJSON BotName where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "name" x.name
          ]
      )
  toEncoding = toEncoding . toJSON
