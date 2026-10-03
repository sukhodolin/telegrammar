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
module Telegram.Bot.Internal.Group.UserProfilePhotos
  ( UserProfilePhotos (..)
  , mkUserProfilePhotos
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.PhotoSize (PhotoSize)
import Telegram.Bot.Support (jsonField, jsonObject, parseInt64, parseList, requiredWith)

-- | This object represent a user\'s profile pictures.
--
-- Source: <https://core.telegram.org/bots/api#userprofilephotos>.
-- Codec directions: decoded from responses, encoded into requests.
data UserProfilePhotos = MkUserProfilePhotos
  { -- | Total number of profile pictures the target user has
    --
    -- Wire key: @total_count@.
    total_count :: Int64
  , -- | Requested profile pictures (in up to 4 sizes each)
    --
    -- Wire key: @photos@.
    photos :: [[PhotoSize]]
  }
  deriving stock (Eq, Show)

-- | Initialize a 'UserProfilePhotos' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkUserProfilePhotos :: Int64 -> [[PhotoSize]] -> UserProfilePhotos
mkUserProfilePhotos arg0 arg1 =
  MkUserProfilePhotos
    { total_count = arg0
    , photos = arg1
    }

instance FromJSON UserProfilePhotos where
  parseJSON = withObject "UserProfilePhotos" $ \obj ->
    do
      field_0 <- requiredWith obj "total_count" parseInt64
      field_1 <- requiredWith obj "photos" (parseList (parseList parseJSON))
      pure
        MkUserProfilePhotos
          { total_count = field_0
          , photos = field_1
          }

instance ToJSON UserProfilePhotos where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "total_count" x.total_count
          , jsonField "photos" x.photos
          ]
      )
  toEncoding = toEncoding . toJSON
