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
module Telegram.Bot.Internal.Group.BotCommand
  ( BotCommand (..)
  , mkBotCommand
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, requiredWith)

-- | This object represents a bot command.
--
-- Source: <https://core.telegram.org/bots/api#botcommand>.
-- Codec directions: decoded from responses, encoded into requests.
data BotCommand = MkBotCommand
  { -- | Text of the command; 1-32 characters. Can contain only lowercase English letters, digits and underscores.
    --
    -- Wire key: @command@.
    command :: Text
  , -- | Description of the command; 1-256 characters
    --
    -- Wire key: @description@.
    description :: Text
  , -- | Optional. True, if the command sends an ephemeral message, which can be seen only by the sender of the message and the bot
    --
    -- Wire key: @is_ephemeral@.
    -- Omitted from an encoded request when it is @Nothing@.
    is_ephemeral :: Maybe Bool
  }
  deriving stock (Eq, Show)

-- | Initialize a 'BotCommand' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkBotCommand :: Text -> Text -> BotCommand
mkBotCommand arg0 arg1 =
  MkBotCommand
    { command = arg0
    , description = arg1
    , is_ephemeral = Nothing
    }

instance FromJSON BotCommand where
  parseJSON = withObject "BotCommand" $ \obj ->
    do
      field_0 <- requiredWith obj "command" parseJSON
      field_1 <- requiredWith obj "description" parseJSON
      field_2 <- optionalWith obj "is_ephemeral" parseJSON
      pure
        MkBotCommand
          { command = field_0
          , description = field_1
          , is_ephemeral = field_2
          }

instance ToJSON BotCommand where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "command" x.command
          , jsonField "description" x.description
          , jsonOptional "is_ephemeral" x.is_ephemeral
          ]
      )
  toEncoding = toEncoding . toJSON
