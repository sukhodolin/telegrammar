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
module Telegram.Bot.Internal.Group.OwnedGift
  ( OwnedGift (..)
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Telegram.Bot.Internal.Group.OwnedGiftRegular (OwnedGiftRegular)
import Telegram.Bot.Internal.Group.OwnedGiftUnique (OwnedGiftUnique)
import Telegram.Bot.Support (tagField)

-- | This object describes a gift received and owned by a user or a chat. Currently, it can be one of
-- \- OwnedGiftRegular
-- \- OwnedGiftUnique
--
-- Source: <https://core.telegram.org/bots/api#ownedgift>.
-- Codec directions: decoded from responses, encoded into requests.
data OwnedGift
  = OwnedGiftViaOwnedGiftRegular OwnedGiftRegular
  | OwnedGiftViaOwnedGiftUnique OwnedGiftUnique
  | -- | A value this decoder does not recognize, preserved verbatim so
    -- the raw payload survives the boundary.
    OwnedGiftUnknown Value
  deriving stock (Eq, Show)

instance FromJSON OwnedGift where
  parseJSON = withObject "OwnedGift" $ \obj -> do
    tag_ <- tagField obj "type"
    case tag_ of
      "regular" ->
        OwnedGiftViaOwnedGiftRegular <$> parseJSON (Object obj)
      "unique" ->
        OwnedGiftViaOwnedGiftUnique <$> parseJSON (Object obj)
      _ -> pure (OwnedGiftUnknown (Object obj))

instance ToJSON OwnedGift where
  toJSON = \case
    OwnedGiftViaOwnedGiftRegular member_ -> toJSON member_
    OwnedGiftViaOwnedGiftUnique member_ -> toJSON member_
    OwnedGiftUnknown raw_ -> raw_
  toEncoding = toEncoding . toJSON
