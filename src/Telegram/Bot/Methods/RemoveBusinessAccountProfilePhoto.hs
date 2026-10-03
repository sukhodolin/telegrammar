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
module Telegram.Bot.Methods.RemoveBusinessAccountProfilePhoto
  ( RemoveBusinessAccountProfilePhoto (..)
  , mkRemoveBusinessAccountProfilePhoto
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Text (Text)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned, plannedMaybe)

-- | Removes the current profile photo of a managed business account. Requires the can_edit_profile_photo business bot right. Returns True on success.
--
-- Wire method spelling: @removeBusinessAccountProfilePhoto@.
--
-- Source: <https://core.telegram.org/bots/api#removebusinessaccountprofilephoto>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data RemoveBusinessAccountProfilePhoto = MkRemoveBusinessAccountProfilePhoto
  { -- | Unique identifier of the business connection
    --
    -- Wire key: @business_connection_id@.
    business_connection_id :: Text
  , -- | Pass True to remove the public photo, which is visible even if the main photo is hidden by the business account\'s privacy settings. After the main photo is removed, the previous profile photo (if present) becomes the main photo.
    --
    -- Wire key: @is_public@.
    -- Omitted from an encoded request when it is @Nothing@.
    is_public :: Maybe Bool
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RemoveBusinessAccountProfilePhoto' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRemoveBusinessAccountProfilePhoto :: Text -> RemoveBusinessAccountProfilePhoto
mkRemoveBusinessAccountProfilePhoto arg0 =
  MkRemoveBusinessAccountProfilePhoto
    { business_connection_id = arg0
    , is_public = Nothing
    , extra = mempty
    }

instance Method RemoveBusinessAccountProfilePhoto where
  type Result RemoveBusinessAccountProfilePhoto = TrueValue
  methodName _ = "removeBusinessAccountProfilePhoto"
  planRequest x =
    planRequestBody
      "removeBusinessAccountProfilePhoto"
      [ "business_connection_id"
      , "is_public"
      ]
      ( concat
          [ planned "business_connection_id" (encodeJson x.business_connection_id)
          , plannedMaybe "is_public" x.is_public encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
