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
module Telegram.Bot.Methods.SetBusinessAccountProfilePhoto
  ( SetBusinessAccountProfilePhoto (..)
  , mkSetBusinessAccountProfilePhoto
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.InputProfilePhoto (InputProfilePhoto, planInputProfilePhoto)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned, plannedMaybe)

-- | Changes the profile photo of a managed business account. Requires the can_edit_profile_photo business bot right. Returns True on success.
--
-- Wire method spelling: @setBusinessAccountProfilePhoto@.
--
-- Source: <https://core.telegram.org/bots/api#setbusinessaccountprofilephoto>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SetBusinessAccountProfilePhoto = MkSetBusinessAccountProfilePhoto
  { -- | Unique identifier of the business connection
    --
    -- Wire key: @business_connection_id@.
    business_connection_id :: Text
  , -- | The new profile photo to set
    --
    -- Wire key: @photo@.
    photo :: InputProfilePhoto
  , -- | Pass True to set the public photo, which will be visible even if the main photo is hidden by the business account\'s privacy settings. An account can have only one public photo.
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

-- | Initialize a 'SetBusinessAccountProfilePhoto' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSetBusinessAccountProfilePhoto :: Text -> InputProfilePhoto -> SetBusinessAccountProfilePhoto
mkSetBusinessAccountProfilePhoto arg0 arg1 =
  MkSetBusinessAccountProfilePhoto
    { business_connection_id = arg0
    , photo = arg1
    , is_public = Nothing
    , extra = mempty
    }

instance Method SetBusinessAccountProfilePhoto where
  type Result SetBusinessAccountProfilePhoto = TrueValue
  methodName _ = "setBusinessAccountProfilePhoto"
  planRequest x =
    planRequestBody
      "setBusinessAccountProfilePhoto"
      [ "business_connection_id"
      , "photo"
      , "is_public"
      ]
      ( concat
          [ planned "business_connection_id" (encodeJson x.business_connection_id)
          , planned "photo" (planInputProfilePhoto x.photo)
          , plannedMaybe "is_public" x.is_public encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
