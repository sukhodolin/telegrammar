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
module Telegram.Bot.Internal.Group.BotDescription
  ( BotDescription (..)
  , mkBotDescription
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonObject, requiredWith)

-- | This object represents the bot\'s description.
--
-- Source: <https://core.telegram.org/bots/api#botdescription>.
-- Codec directions: decoded from responses, encoded into requests.
data BotDescription = MkBotDescription
  { -- | The bot\'s description
    --
    -- Wire key: @description@.
    description :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'BotDescription' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkBotDescription :: Text -> BotDescription
mkBotDescription arg0 =
  MkBotDescription
    { description = arg0
    }

instance FromJSON BotDescription where
  parseJSON = withObject "BotDescription" $ \obj ->
    do
      field_0 <- requiredWith obj "description" parseJSON
      pure
        MkBotDescription
          { description = field_0
          }

instance ToJSON BotDescription where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "description" x.description
          ]
      )
  toEncoding = toEncoding . toJSON
