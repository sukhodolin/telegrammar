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
module Telegram.Bot.Internal.Group.PaidMessagePriceChanged
  ( PaidMessagePriceChanged (..)
  , mkPaidMessagePriceChanged
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Support (jsonField, jsonObject, parseInt64, requiredWith)

-- | Describes a service message about a change in the price of paid messages within a chat.
--
-- Source: <https://core.telegram.org/bots/api#paidmessagepricechanged>.
-- Codec directions: decoded from responses, encoded into requests.
data PaidMessagePriceChanged = MkPaidMessagePriceChanged
  { -- | The new number of Telegram Stars that must be paid by non-administrator users of the supergroup chat for each sent message
    --
    -- Wire key: @paid_message_star_count@.
    paid_message_star_count :: Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'PaidMessagePriceChanged' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkPaidMessagePriceChanged :: Int64 -> PaidMessagePriceChanged
mkPaidMessagePriceChanged arg0 =
  MkPaidMessagePriceChanged
    { paid_message_star_count = arg0
    }

instance FromJSON PaidMessagePriceChanged where
  parseJSON = withObject "PaidMessagePriceChanged" $ \obj ->
    do
      field_0 <- requiredWith obj "paid_message_star_count" parseInt64
      pure
        MkPaidMessagePriceChanged
          { paid_message_star_count = field_0
          }

instance ToJSON PaidMessagePriceChanged where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "paid_message_star_count" x.paid_message_star_count
          ]
      )
  toEncoding = toEncoding . toJSON
