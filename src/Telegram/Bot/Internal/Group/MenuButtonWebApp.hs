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
module Telegram.Bot.Internal.Group.MenuButtonWebApp
  ( MenuButtonWebApp (..)
  , mkMenuButtonWebApp
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.WebAppInfo (WebAppInfo)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonLiteral, jsonObject, requiredWith)

-- | Represents a menu button, which launches a Web App.
--
-- Source: <https://core.telegram.org/bots/api#menubuttonwebapp>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"web_app"@.
data MenuButtonWebApp = MkMenuButtonWebApp
  { -- | Text on the button
    --
    -- Wire key: @text@.
    text :: Text
  , -- | Description of the Web App that will be launched when the user presses the button. The Web App will be able to send an arbitrary message on behalf of the user using the method answerWebAppQuery. Alternatively, a t.me link to a Web App of the bot can be specified in the object instead of the Web App\'s URL, in which case the Web App will be opened as if the user pressed the link.
    --
    -- Wire key: @web_app@.
    web_app :: WebAppInfo
  }
  deriving stock (Eq, Show)

-- | Initialize a 'MenuButtonWebApp' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkMenuButtonWebApp :: Text -> WebAppInfo -> MenuButtonWebApp
mkMenuButtonWebApp arg0 arg1 =
  MkMenuButtonWebApp
    { text = arg0
    , web_app = arg1
    }

instance FromJSON MenuButtonWebApp where
  parseJSON = withObject "MenuButtonWebApp" $ \obj ->
    do
      checkStringConstant obj "type" "web_app"
      field_1 <- requiredWith obj "text" parseJSON
      field_2 <- requiredWith obj "web_app" parseJSON
      pure
        MkMenuButtonWebApp
          { text = field_1
          , web_app = field_2
          }

instance ToJSON MenuButtonWebApp where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "web_app")
          , jsonField "text" x.text
          , jsonField "web_app" x.web_app
          ]
      )
  toEncoding = toEncoding . toJSON
