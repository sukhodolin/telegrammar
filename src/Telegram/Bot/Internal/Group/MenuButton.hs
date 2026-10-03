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
module Telegram.Bot.Internal.Group.MenuButton
  ( MenuButton (..)
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Telegram.Bot.Internal.Group.MenuButtonCommands (MenuButtonCommands)
import Telegram.Bot.Internal.Group.MenuButtonDefault (MenuButtonDefault)
import Telegram.Bot.Internal.Group.MenuButtonWebApp (MenuButtonWebApp)
import Telegram.Bot.Support (tagField)

-- | This object describes the bot\'s menu button in a private chat. It should be one of
-- \- MenuButtonCommands
-- \- MenuButtonWebApp
-- \- MenuButtonDefault
-- If a menu button other than MenuButtonDefault is set for a private chat, then it is applied in the chat. Otherwise the default menu button is applied. By default, the menu button opens the list of bot commands.
--
-- Source: <https://core.telegram.org/bots/api#menubutton>.
-- Codec directions: decoded from responses, encoded into requests.
data MenuButton
  = MenuButtonViaMenuButtonCommands MenuButtonCommands
  | MenuButtonViaMenuButtonDefault MenuButtonDefault
  | MenuButtonViaMenuButtonWebApp MenuButtonWebApp
  | -- | A value this decoder does not recognize, preserved verbatim so
    -- the raw payload survives the boundary.
    MenuButtonUnknown Value
  deriving stock (Eq, Show)

instance FromJSON MenuButton where
  parseJSON = withObject "MenuButton" $ \obj -> do
    tag_ <- tagField obj "type"
    case tag_ of
      "commands" ->
        MenuButtonViaMenuButtonCommands <$> parseJSON (Object obj)
      "default" ->
        MenuButtonViaMenuButtonDefault <$> parseJSON (Object obj)
      "web_app" ->
        MenuButtonViaMenuButtonWebApp <$> parseJSON (Object obj)
      _ -> pure (MenuButtonUnknown (Object obj))

instance ToJSON MenuButton where
  toJSON = \case
    MenuButtonViaMenuButtonCommands member_ -> toJSON member_
    MenuButtonViaMenuButtonDefault member_ -> toJSON member_
    MenuButtonViaMenuButtonWebApp member_ -> toJSON member_
    MenuButtonUnknown raw_ -> raw_
  toEncoding = toEncoding . toJSON
