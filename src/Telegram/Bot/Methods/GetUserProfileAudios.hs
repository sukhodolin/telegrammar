{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeFamilies #-}

-- | One method's request record, initializer, and result association.
--
-- Import this module qualified to update an optional parameter, which is
-- the supported idiom for a record whose field labels repeat across
-- methods.
--
-- Generated. Do not edit.
module Telegram.Bot.Methods.GetUserProfileAudios
  ( GetUserProfileAudios (..)
  , mkGetUserProfileAudios
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.UserProfileAudios (UserProfileAudios)
import Telegram.Bot.Support (Method (..), encodeJson, planRequestBody, planned, plannedMaybe)

-- | Use this method to get a list of profile audios for a user. Returns a UserProfileAudios object.
--
-- Wire method spelling: @getUserProfileAudios@.
--
-- Source: <https://core.telegram.org/bots/api#getuserprofileaudios>.
-- Result: @UserProfileAudios@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data GetUserProfileAudios = MkGetUserProfileAudios
  { -- | Unique identifier of the target user
    --
    -- Wire key: @user_id@.
    user_id :: Int64
  , -- | Sequential number of the first audio to be returned. By default, all audios are returned.
    --
    -- Wire key: @offset@.
    -- Omitted from an encoded request when it is @Nothing@.
    offset :: Maybe Int64
  , -- | Limits the number of audios to be retrieved. Values between 1-100 are accepted. Defaults to 100.
    --
    -- Wire key: @limit@.
    -- Omitted from an encoded request when it is @Nothing@.
    limit :: Maybe Int64
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'GetUserProfileAudios' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkGetUserProfileAudios :: Int64 -> GetUserProfileAudios
mkGetUserProfileAudios arg0 =
  MkGetUserProfileAudios
    { user_id = arg0
    , offset = Nothing
    , limit = Nothing
    , extra = mempty
    }

instance Method GetUserProfileAudios where
  type Result GetUserProfileAudios = UserProfileAudios
  methodName _ = "getUserProfileAudios"
  planRequest x =
    planRequestBody
      "getUserProfileAudios"
      [ "user_id"
      , "offset"
      , "limit"
      ]
      ( concat
          [ planned "user_id" (encodeJson x.user_id)
          , plannedMaybe "offset" x.offset encodeJson
          , plannedMaybe "limit" x.limit encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
