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
module Telegram.Bot.Internal.Group.OwnedGifts
  ( OwnedGifts (..)
  , mkOwnedGifts
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.OwnedGift (OwnedGift)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseInt64, parseList, requiredWith)

-- | Contains the list of gifts received and owned by a user or a chat.
--
-- Source: <https://core.telegram.org/bots/api#ownedgifts>.
-- Codec directions: decoded from responses, encoded into requests.
data OwnedGifts = MkOwnedGifts
  { -- | The total number of gifts owned by the user or the chat
    --
    -- Wire key: @total_count@.
    total_count :: Int64
  , -- | The list of gifts
    --
    -- Wire key: @gifts@.
    gifts :: [OwnedGift]
  , -- | Optional. Offset for the next request. If empty, then there are no more results.
    --
    -- Wire key: @next_offset@.
    -- Omitted from an encoded request when it is @Nothing@.
    next_offset :: Maybe Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'OwnedGifts' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkOwnedGifts :: Int64 -> [OwnedGift] -> OwnedGifts
mkOwnedGifts arg0 arg1 =
  MkOwnedGifts
    { total_count = arg0
    , gifts = arg1
    , next_offset = Nothing
    }

instance FromJSON OwnedGifts where
  parseJSON = withObject "OwnedGifts" $ \obj ->
    do
      field_0 <- requiredWith obj "total_count" parseInt64
      field_1 <- requiredWith obj "gifts" (parseList parseJSON)
      field_2 <- optionalWith obj "next_offset" parseJSON
      pure
        MkOwnedGifts
          { total_count = field_0
          , gifts = field_1
          , next_offset = field_2
          }

instance ToJSON OwnedGifts where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "total_count" x.total_count
          , jsonField "gifts" x.gifts
          , jsonOptional "next_offset" x.next_offset
          ]
      )
  toEncoding = toEncoding . toJSON
