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
module Telegram.Bot.Internal.Group.BackgroundType
  ( BackgroundType (..)
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Telegram.Bot.Internal.Group.BackgroundTypeChatTheme (BackgroundTypeChatTheme)
import Telegram.Bot.Internal.Group.BackgroundTypeFill (BackgroundTypeFill)
import Telegram.Bot.Internal.Group.BackgroundTypePattern (BackgroundTypePattern)
import Telegram.Bot.Internal.Group.BackgroundTypeWallpaper (BackgroundTypeWallpaper)
import Telegram.Bot.Support (tagField)

-- | This object describes the type of a background. Currently, it can be one of
-- \- BackgroundTypeFill
-- \- BackgroundTypeWallpaper
-- \- BackgroundTypePattern
-- \- BackgroundTypeChatTheme
--
-- Source: <https://core.telegram.org/bots/api#backgroundtype>.
-- Codec directions: decoded from responses, encoded into requests.
data BackgroundType
  = BackgroundTypeViaBackgroundTypeChatTheme BackgroundTypeChatTheme
  | BackgroundTypeViaBackgroundTypeFill BackgroundTypeFill
  | BackgroundTypeViaBackgroundTypePattern BackgroundTypePattern
  | BackgroundTypeViaBackgroundTypeWallpaper BackgroundTypeWallpaper
  | -- | A value this decoder does not recognize, preserved verbatim so
    -- the raw payload survives the boundary.
    BackgroundTypeUnknown Value
  deriving stock (Eq, Show)

instance FromJSON BackgroundType where
  parseJSON = withObject "BackgroundType" $ \obj -> do
    tag_ <- tagField obj "type"
    case tag_ of
      "chat_theme" ->
        BackgroundTypeViaBackgroundTypeChatTheme <$> parseJSON (Object obj)
      "fill" ->
        BackgroundTypeViaBackgroundTypeFill <$> parseJSON (Object obj)
      "pattern" ->
        BackgroundTypeViaBackgroundTypePattern <$> parseJSON (Object obj)
      "wallpaper" ->
        BackgroundTypeViaBackgroundTypeWallpaper <$> parseJSON (Object obj)
      _ -> pure (BackgroundTypeUnknown (Object obj))

instance ToJSON BackgroundType where
  toJSON = \case
    BackgroundTypeViaBackgroundTypeChatTheme member_ -> toJSON member_
    BackgroundTypeViaBackgroundTypeFill member_ -> toJSON member_
    BackgroundTypeViaBackgroundTypePattern member_ -> toJSON member_
    BackgroundTypeViaBackgroundTypeWallpaper member_ -> toJSON member_
    BackgroundTypeUnknown raw_ -> raw_
  toEncoding = toEncoding . toJSON
