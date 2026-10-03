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
module Telegram.Bot.Methods.SetPassportDataErrors
  ( SetPassportDataErrors (..)
  , mkSetPassportDataErrors
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.PassportElementError (PassportElementError)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planList, planRequestBody, planned)

-- | Informs a user that some of the Telegram Passport elements they provided contains errors. The user will not be able to re-submit their Passport to you until the errors are fixed (the contents of the field for which you returned the error must change). Returns True on success.
-- Use this if the data submitted by the user doesn\'t satisfy the standards your service requires for any reason. For example, if a birthday date seems invalid, a submitted document is blurry, a scan shows evidence of tampering, etc. Supply some details in the error message to make sure the user knows how to correct the issues.
--
-- Wire method spelling: @setPassportDataErrors@.
--
-- Source: <https://core.telegram.org/bots/api#setpassportdataerrors>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SetPassportDataErrors = MkSetPassportDataErrors
  { -- | User identifier
    --
    -- Wire key: @user_id@.
    user_id :: Int64
  , -- | A JSON-serialized Array describing the errors
    --
    -- Wire key: @errors@.
    errors :: [PassportElementError]
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SetPassportDataErrors' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSetPassportDataErrors :: Int64 -> [PassportElementError] -> SetPassportDataErrors
mkSetPassportDataErrors arg0 arg1 =
  MkSetPassportDataErrors
    { user_id = arg0
    , errors = arg1
    , extra = mempty
    }

instance Method SetPassportDataErrors where
  type Result SetPassportDataErrors = TrueValue
  methodName _ = "setPassportDataErrors"
  planRequest x =
    planRequestBody
      "setPassportDataErrors"
      [ "user_id"
      , "errors"
      ]
      ( concat
          [ planned "user_id" (encodeJson x.user_id)
          , planned "errors" ((planList encodeJson) x.errors)
          ]
      )
      x.extra
  parseResult _ = parseJSON
