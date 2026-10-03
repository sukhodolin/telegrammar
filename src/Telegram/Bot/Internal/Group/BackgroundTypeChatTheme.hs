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
module Telegram.Bot.Internal.Group.BackgroundTypeChatTheme
  ( BackgroundTypeChatTheme (..)
  , mkBackgroundTypeChatTheme
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonLiteral, jsonObject, requiredWith)

-- | The background is taken directly from a built-in chat theme.
--
-- Source: <https://core.telegram.org/bots/api#backgroundtypechattheme>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"chat_theme"@.
data BackgroundTypeChatTheme = MkBackgroundTypeChatTheme
  { -- | Name of the chat theme, which is usually an emoji
    --
    -- Wire key: @theme_name@.
    theme_name :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'BackgroundTypeChatTheme' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkBackgroundTypeChatTheme :: Text -> BackgroundTypeChatTheme
mkBackgroundTypeChatTheme arg0 =
  MkBackgroundTypeChatTheme
    { theme_name = arg0
    }

instance FromJSON BackgroundTypeChatTheme where
  parseJSON = withObject "BackgroundTypeChatTheme" $ \obj ->
    do
      checkStringConstant obj "type" "chat_theme"
      field_1 <- requiredWith obj "theme_name" parseJSON
      pure
        MkBackgroundTypeChatTheme
          { theme_name = field_1
          }

instance ToJSON BackgroundTypeChatTheme where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "chat_theme")
          , jsonField "theme_name" x.theme_name
          ]
      )
  toEncoding = toEncoding . toJSON
