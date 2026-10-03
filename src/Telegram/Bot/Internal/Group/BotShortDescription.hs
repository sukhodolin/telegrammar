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
module Telegram.Bot.Internal.Group.BotShortDescription
  ( BotShortDescription (..)
  , mkBotShortDescription
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonObject, requiredWith)

-- | This object represents the bot\'s short description.
--
-- Source: <https://core.telegram.org/bots/api#botshortdescription>.
-- Codec directions: decoded from responses, encoded into requests.
data BotShortDescription = MkBotShortDescription
  { -- | The bot\'s short description
    --
    -- Wire key: @short_description@.
    short_description :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'BotShortDescription' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkBotShortDescription :: Text -> BotShortDescription
mkBotShortDescription arg0 =
  MkBotShortDescription
    { short_description = arg0
    }

instance FromJSON BotShortDescription where
  parseJSON = withObject "BotShortDescription" $ \obj ->
    do
      field_0 <- requiredWith obj "short_description" parseJSON
      pure
        MkBotShortDescription
          { short_description = field_0
          }

instance ToJSON BotShortDescription where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "short_description" x.short_description
          ]
      )
  toEncoding = toEncoding . toJSON
