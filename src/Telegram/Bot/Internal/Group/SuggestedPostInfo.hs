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
module Telegram.Bot.Internal.Group.SuggestedPostInfo
  ( SuggestedPostInfo (..)
  , mkSuggestedPostInfo
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.SuggestedPostPrice (SuggestedPostPrice)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseInt64, requiredWith)

-- | Contains information about a suggested post.
--
-- Source: <https://core.telegram.org/bots/api#suggestedpostinfo>.
-- Codec directions: decoded from responses, encoded into requests.
data SuggestedPostInfo = MkSuggestedPostInfo
  { -- | State of the suggested post. Currently, it can be one of \"pending\", \"approved\", \"declined\".
    --
    -- Wire key: @state@.
    state :: Text
  , -- | Optional. Proposed price of the post. If the field is omitted, then the post is unpaid.
    --
    -- Wire key: @price@.
    -- Omitted from an encoded request when it is @Nothing@.
    price :: Maybe SuggestedPostPrice
  , -- | Optional. Proposed send date of the post. If the field is omitted, then the post can be published at any time within 30 days at the sole discretion of the user or administrator who approves it.
    --
    -- Wire key: @send_date@.
    -- Omitted from an encoded request when it is @Nothing@.
    send_date :: Maybe Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SuggestedPostInfo' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSuggestedPostInfo :: Text -> SuggestedPostInfo
mkSuggestedPostInfo arg0 =
  MkSuggestedPostInfo
    { state = arg0
    , price = Nothing
    , send_date = Nothing
    }

instance FromJSON SuggestedPostInfo where
  parseJSON = withObject "SuggestedPostInfo" $ \obj ->
    do
      field_0 <- requiredWith obj "state" parseJSON
      field_1 <- optionalWith obj "price" parseJSON
      field_2 <- optionalWith obj "send_date" parseInt64
      pure
        MkSuggestedPostInfo
          { state = field_0
          , price = field_1
          , send_date = field_2
          }

instance ToJSON SuggestedPostInfo where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "state" x.state
          , jsonOptional "price" x.price
          , jsonOptional "send_date" x.send_date
          ]
      )
  toEncoding = toEncoding . toJSON
