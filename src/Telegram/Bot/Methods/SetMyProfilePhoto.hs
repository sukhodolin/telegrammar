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
module Telegram.Bot.Methods.SetMyProfilePhoto
  ( SetMyProfilePhoto (..)
  , mkSetMyProfilePhoto
  ) where

import Data.Aeson (FromJSON (..), Object)
import Telegram.Bot.Internal.Group.InputProfilePhoto (InputProfilePhoto, planInputProfilePhoto)
import Telegram.Bot.Support (Method (..), TrueValue, planRequestBody, planned)

-- | Changes the profile photo of the bot. Returns True on success.
--
-- Wire method spelling: @setMyProfilePhoto@.
--
-- Source: <https://core.telegram.org/bots/api#setmyprofilephoto>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SetMyProfilePhoto = MkSetMyProfilePhoto
  { -- | The new profile photo to set
    --
    -- Wire key: @photo@.
    photo :: InputProfilePhoto
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SetMyProfilePhoto' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSetMyProfilePhoto :: InputProfilePhoto -> SetMyProfilePhoto
mkSetMyProfilePhoto arg0 =
  MkSetMyProfilePhoto
    { photo = arg0
    , extra = mempty
    }

instance Method SetMyProfilePhoto where
  type Result SetMyProfilePhoto = TrueValue
  methodName _ = "setMyProfilePhoto"
  planRequest x =
    planRequestBody
      "setMyProfilePhoto"
      [ "photo"
      ]
      ( concat
          [ planned "photo" (planInputProfilePhoto x.photo)
          ]
      )
      x.extra
  parseResult _ = parseJSON
