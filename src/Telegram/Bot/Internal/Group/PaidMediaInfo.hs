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
module Telegram.Bot.Internal.Group.PaidMediaInfo
  ( PaidMediaInfo (..)
  , mkPaidMediaInfo
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.PaidMedia (PaidMedia)
import Telegram.Bot.Support (jsonField, jsonObject, parseInt64, parseList, requiredWith)

-- | Describes the paid media added to a message.
--
-- Source: <https://core.telegram.org/bots/api#paidmediainfo>.
-- Codec directions: decoded from responses, encoded into requests.
data PaidMediaInfo = MkPaidMediaInfo
  { -- | The number of Telegram Stars that must be paid to buy access to the media
    --
    -- Wire key: @star_count@.
    star_count :: Int64
  , -- | Information about the paid media
    --
    -- Wire key: @paid_media@.
    paid_media :: [PaidMedia]
  }
  deriving stock (Eq, Show)

-- | Initialize a 'PaidMediaInfo' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkPaidMediaInfo :: Int64 -> [PaidMedia] -> PaidMediaInfo
mkPaidMediaInfo arg0 arg1 =
  MkPaidMediaInfo
    { star_count = arg0
    , paid_media = arg1
    }

instance FromJSON PaidMediaInfo where
  parseJSON = withObject "PaidMediaInfo" $ \obj ->
    do
      field_0 <- requiredWith obj "star_count" parseInt64
      field_1 <- requiredWith obj "paid_media" (parseList parseJSON)
      pure
        MkPaidMediaInfo
          { star_count = field_0
          , paid_media = field_1
          }

instance ToJSON PaidMediaInfo where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "star_count" x.star_count
          , jsonField "paid_media" x.paid_media
          ]
      )
  toEncoding = toEncoding . toJSON
