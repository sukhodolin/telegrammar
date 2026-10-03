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
module Telegram.Bot.Internal.Group.BackgroundFill
  ( BackgroundFill (..)
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Telegram.Bot.Internal.Group.BackgroundFillFreeformGradient (BackgroundFillFreeformGradient)
import Telegram.Bot.Internal.Group.BackgroundFillGradient (BackgroundFillGradient)
import Telegram.Bot.Internal.Group.BackgroundFillSolid (BackgroundFillSolid)
import Telegram.Bot.Support (tagField)

-- | This object describes the way a background is filled based on the selected colors. Currently, it can be one of
-- \- BackgroundFillSolid
-- \- BackgroundFillGradient
-- \- BackgroundFillFreeformGradient
--
-- Source: <https://core.telegram.org/bots/api#backgroundfill>.
-- Codec directions: decoded from responses, encoded into requests.
data BackgroundFill
  = BackgroundFillViaBackgroundFillFreeformGradient BackgroundFillFreeformGradient
  | BackgroundFillViaBackgroundFillGradient BackgroundFillGradient
  | BackgroundFillViaBackgroundFillSolid BackgroundFillSolid
  | -- | A value this decoder does not recognize, preserved verbatim so
    -- the raw payload survives the boundary.
    BackgroundFillUnknown Value
  deriving stock (Eq, Show)

instance FromJSON BackgroundFill where
  parseJSON = withObject "BackgroundFill" $ \obj -> do
    tag_ <- tagField obj "type"
    case tag_ of
      "freeform_gradient" ->
        BackgroundFillViaBackgroundFillFreeformGradient <$> parseJSON (Object obj)
      "gradient" ->
        BackgroundFillViaBackgroundFillGradient <$> parseJSON (Object obj)
      "solid" ->
        BackgroundFillViaBackgroundFillSolid <$> parseJSON (Object obj)
      _ -> pure (BackgroundFillUnknown (Object obj))

instance ToJSON BackgroundFill where
  toJSON = \case
    BackgroundFillViaBackgroundFillFreeformGradient member_ -> toJSON member_
    BackgroundFillViaBackgroundFillGradient member_ -> toJSON member_
    BackgroundFillViaBackgroundFillSolid member_ -> toJSON member_
    BackgroundFillUnknown raw_ -> raw_
  toEncoding = toEncoding . toJSON
