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
module Telegram.Bot.Internal.Group.AcceptedGiftTypes
  ( AcceptedGiftTypes (..)
  , mkAcceptedGiftTypes
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Telegram.Bot.Support (jsonField, jsonObject, requiredWith)

-- | This object describes the types of gifts that can be gifted to a user or a chat.
--
-- Source: <https://core.telegram.org/bots/api#acceptedgifttypes>.
-- Codec directions: decoded from responses, encoded into requests.
data AcceptedGiftTypes = MkAcceptedGiftTypes
  { -- | True, if unlimited regular gifts are accepted
    --
    -- Wire key: @unlimited_gifts@.
    unlimited_gifts :: Bool
  , -- | True, if limited regular gifts are accepted
    --
    -- Wire key: @limited_gifts@.
    limited_gifts :: Bool
  , -- | True, if unique gifts or gifts that can be upgraded to unique for free are accepted
    --
    -- Wire key: @unique_gifts@.
    unique_gifts :: Bool
  , -- | True, if a Telegram Premium subscription is accepted
    --
    -- Wire key: @premium_subscription@.
    premium_subscription :: Bool
  , -- | True, if transfers of unique gifts from channels are accepted
    --
    -- Wire key: @gifts_from_channels@.
    gifts_from_channels :: Bool
  }
  deriving stock (Eq, Show)

-- | Initialize a 'AcceptedGiftTypes' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkAcceptedGiftTypes :: Bool -> Bool -> Bool -> Bool -> Bool -> AcceptedGiftTypes
mkAcceptedGiftTypes arg0 arg1 arg2 arg3 arg4 =
  MkAcceptedGiftTypes
    { unlimited_gifts = arg0
    , limited_gifts = arg1
    , unique_gifts = arg2
    , premium_subscription = arg3
    , gifts_from_channels = arg4
    }

instance FromJSON AcceptedGiftTypes where
  parseJSON = withObject "AcceptedGiftTypes" $ \obj ->
    do
      field_0 <- requiredWith obj "unlimited_gifts" parseJSON
      field_1 <- requiredWith obj "limited_gifts" parseJSON
      field_2 <- requiredWith obj "unique_gifts" parseJSON
      field_3 <- requiredWith obj "premium_subscription" parseJSON
      field_4 <- requiredWith obj "gifts_from_channels" parseJSON
      pure
        MkAcceptedGiftTypes
          { unlimited_gifts = field_0
          , limited_gifts = field_1
          , unique_gifts = field_2
          , premium_subscription = field_3
          , gifts_from_channels = field_4
          }

instance ToJSON AcceptedGiftTypes where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "unlimited_gifts" x.unlimited_gifts
          , jsonField "limited_gifts" x.limited_gifts
          , jsonField "unique_gifts" x.unique_gifts
          , jsonField "premium_subscription" x.premium_subscription
          , jsonField "gifts_from_channels" x.gifts_from_channels
          ]
      )
  toEncoding = toEncoding . toJSON
