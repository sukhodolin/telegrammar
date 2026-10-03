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
module Telegram.Bot.Methods.SetBusinessAccountBio
  ( SetBusinessAccountBio (..)
  , mkSetBusinessAccountBio
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Text (Text)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned, plannedMaybe)

-- | Changes the bio of a managed business account. Requires the can_change_bio business bot right. Returns True on success.
--
-- Wire method spelling: @setBusinessAccountBio@.
--
-- Source: <https://core.telegram.org/bots/api#setbusinessaccountbio>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SetBusinessAccountBio = MkSetBusinessAccountBio
  { -- | Unique identifier of the business connection
    --
    -- Wire key: @business_connection_id@.
    business_connection_id :: Text
  , -- | The new value of the bio for the business account; 0-140 characters
    --
    -- Wire key: @bio@.
    -- Omitted from an encoded request when it is @Nothing@.
    bio :: Maybe Text
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SetBusinessAccountBio' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSetBusinessAccountBio :: Text -> SetBusinessAccountBio
mkSetBusinessAccountBio arg0 =
  MkSetBusinessAccountBio
    { business_connection_id = arg0
    , bio = Nothing
    , extra = mempty
    }

instance Method SetBusinessAccountBio where
  type Result SetBusinessAccountBio = TrueValue
  methodName _ = "setBusinessAccountBio"
  planRequest x =
    planRequestBody
      "setBusinessAccountBio"
      [ "business_connection_id"
      , "bio"
      ]
      ( concat
          [ planned "business_connection_id" (encodeJson x.business_connection_id)
          , plannedMaybe "bio" x.bio encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
