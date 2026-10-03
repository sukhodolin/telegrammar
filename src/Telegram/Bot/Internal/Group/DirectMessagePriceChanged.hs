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
module Telegram.Bot.Internal.Group.DirectMessagePriceChanged
  ( DirectMessagePriceChanged (..)
  , mkDirectMessagePriceChanged
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseInt64, requiredWith)

-- | Describes a service message about a change in the price of direct messages sent to a channel chat.
--
-- Source: <https://core.telegram.org/bots/api#directmessagepricechanged>.
-- Codec directions: decoded from responses, encoded into requests.
data DirectMessagePriceChanged = MkDirectMessagePriceChanged
  { -- | True, if direct messages are enabled for the channel chat; False otherwise
    --
    -- Wire key: @are_direct_messages_enabled@.
    are_direct_messages_enabled :: Bool
  , -- | Optional. The new number of Telegram Stars that must be paid by users for each direct message sent to the channel. Does not apply to users who have been exempted by administrators. Defaults to 0.
    --
    -- Wire key: @direct_message_star_count@.
    -- Omitted from an encoded request when it is @Nothing@.
    direct_message_star_count :: Maybe Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'DirectMessagePriceChanged' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkDirectMessagePriceChanged :: Bool -> DirectMessagePriceChanged
mkDirectMessagePriceChanged arg0 =
  MkDirectMessagePriceChanged
    { are_direct_messages_enabled = arg0
    , direct_message_star_count = Nothing
    }

instance FromJSON DirectMessagePriceChanged where
  parseJSON = withObject "DirectMessagePriceChanged" $ \obj ->
    do
      field_0 <- requiredWith obj "are_direct_messages_enabled" parseJSON
      field_1 <- optionalWith obj "direct_message_star_count" parseInt64
      pure
        MkDirectMessagePriceChanged
          { are_direct_messages_enabled = field_0
          , direct_message_star_count = field_1
          }

instance ToJSON DirectMessagePriceChanged where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "are_direct_messages_enabled" x.are_direct_messages_enabled
          , jsonOptional "direct_message_star_count" x.direct_message_star_count
          ]
      )
  toEncoding = toEncoding . toJSON
