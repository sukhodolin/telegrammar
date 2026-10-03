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
module Telegram.Bot.Internal.Group.UserProfileAudios
  ( UserProfileAudios (..)
  , mkUserProfileAudios
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.Audio (Audio)
import Telegram.Bot.Support (jsonField, jsonObject, parseInt64, parseList, requiredWith)

-- | This object represents the audios displayed on a user\'s profile.
--
-- Source: <https://core.telegram.org/bots/api#userprofileaudios>.
-- Codec directions: decoded from responses, encoded into requests.
data UserProfileAudios = MkUserProfileAudios
  { -- | Total number of profile audios for the target user
    --
    -- Wire key: @total_count@.
    total_count :: Int64
  , -- | Requested profile audios
    --
    -- Wire key: @audios@.
    audios :: [Audio]
  }
  deriving stock (Eq, Show)

-- | Initialize a 'UserProfileAudios' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkUserProfileAudios :: Int64 -> [Audio] -> UserProfileAudios
mkUserProfileAudios arg0 arg1 =
  MkUserProfileAudios
    { total_count = arg0
    , audios = arg1
    }

instance FromJSON UserProfileAudios where
  parseJSON = withObject "UserProfileAudios" $ \obj ->
    do
      field_0 <- requiredWith obj "total_count" parseInt64
      field_1 <- requiredWith obj "audios" (parseList parseJSON)
      pure
        MkUserProfileAudios
          { total_count = field_0
          , audios = field_1
          }

instance ToJSON UserProfileAudios where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "total_count" x.total_count
          , jsonField "audios" x.audios
          ]
      )
  toEncoding = toEncoding . toJSON
