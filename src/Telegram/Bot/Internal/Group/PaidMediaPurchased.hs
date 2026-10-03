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
module Telegram.Bot.Internal.Group.PaidMediaPurchased
  ( PaidMediaPurchased (..)
  , mkPaidMediaPurchased
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Support (jsonField, jsonObject, requiredWith)

-- | This object contains information about a paid media purchase.
--
-- Source: <https://core.telegram.org/bots/api#paidmediapurchased>.
-- Codec directions: decoded from responses, encoded into requests.
data PaidMediaPurchased = MkPaidMediaPurchased
  { -- | User who purchased the media
    --
    -- Wire key: @from@.
    from :: User
  , -- | Bot-specified paid media payload
    --
    -- Wire key: @paid_media_payload@.
    paid_media_payload :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'PaidMediaPurchased' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkPaidMediaPurchased :: User -> Text -> PaidMediaPurchased
mkPaidMediaPurchased arg0 arg1 =
  MkPaidMediaPurchased
    { from = arg0
    , paid_media_payload = arg1
    }

instance FromJSON PaidMediaPurchased where
  parseJSON = withObject "PaidMediaPurchased" $ \obj ->
    do
      field_0 <- requiredWith obj "from" parseJSON
      field_1 <- requiredWith obj "paid_media_payload" parseJSON
      pure
        MkPaidMediaPurchased
          { from = field_0
          , paid_media_payload = field_1
          }

instance ToJSON PaidMediaPurchased where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "from" x.from
          , jsonField "paid_media_payload" x.paid_media_payload
          ]
      )
  toEncoding = toEncoding . toJSON
