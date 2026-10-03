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
module Telegram.Bot.Internal.Group.PaidMedia
  ( PaidMedia (..)
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Telegram.Bot.Internal.Group.PaidMediaLivePhoto (PaidMediaLivePhoto)
import Telegram.Bot.Internal.Group.PaidMediaPhoto (PaidMediaPhoto)
import Telegram.Bot.Internal.Group.PaidMediaPreview (PaidMediaPreview)
import Telegram.Bot.Internal.Group.PaidMediaVideo (PaidMediaVideo)
import Telegram.Bot.Support (tagField)

-- | This object describes paid media. Currently, it can be one of
-- \- PaidMediaLivePhoto
-- \- PaidMediaPhoto
-- \- PaidMediaPreview
-- \- PaidMediaVideo
--
-- Source: <https://core.telegram.org/bots/api#paidmedia>.
-- Codec directions: decoded from responses, encoded into requests.
data PaidMedia
  = PaidMediaViaPaidMediaLivePhoto PaidMediaLivePhoto
  | PaidMediaViaPaidMediaPhoto PaidMediaPhoto
  | PaidMediaViaPaidMediaPreview PaidMediaPreview
  | PaidMediaViaPaidMediaVideo PaidMediaVideo
  | -- | A value this decoder does not recognize, preserved verbatim so
    -- the raw payload survives the boundary.
    PaidMediaUnknown Value
  deriving stock (Eq, Show)

instance FromJSON PaidMedia where
  parseJSON = withObject "PaidMedia" $ \obj -> do
    tag_ <- tagField obj "type"
    case tag_ of
      "live_photo" ->
        PaidMediaViaPaidMediaLivePhoto <$> parseJSON (Object obj)
      "photo" ->
        PaidMediaViaPaidMediaPhoto <$> parseJSON (Object obj)
      "preview" ->
        PaidMediaViaPaidMediaPreview <$> parseJSON (Object obj)
      "video" ->
        PaidMediaViaPaidMediaVideo <$> parseJSON (Object obj)
      _ -> pure (PaidMediaUnknown (Object obj))

instance ToJSON PaidMedia where
  toJSON = \case
    PaidMediaViaPaidMediaLivePhoto member_ -> toJSON member_
    PaidMediaViaPaidMediaPhoto member_ -> toJSON member_
    PaidMediaViaPaidMediaPreview member_ -> toJSON member_
    PaidMediaViaPaidMediaVideo member_ -> toJSON member_
    PaidMediaUnknown raw_ -> raw_
  toEncoding = toEncoding . toJSON
