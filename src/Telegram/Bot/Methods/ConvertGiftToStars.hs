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
module Telegram.Bot.Methods.ConvertGiftToStars
  ( ConvertGiftToStars (..)
  , mkConvertGiftToStars
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Text (Text)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned)

-- | Converts a given regular gift to Telegram Stars. Requires the can_convert_gifts_to_stars business bot right. Returns True on success.
--
-- Wire method spelling: @convertGiftToStars@.
--
-- Source: <https://core.telegram.org/bots/api#convertgifttostars>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data ConvertGiftToStars = MkConvertGiftToStars
  { -- | Unique identifier of the business connection
    --
    -- Wire key: @business_connection_id@.
    business_connection_id :: Text
  , -- | Unique identifier of the regular gift that should be converted to Telegram Stars
    --
    -- Wire key: @owned_gift_id@.
    owned_gift_id :: Text
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ConvertGiftToStars' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkConvertGiftToStars :: Text -> Text -> ConvertGiftToStars
mkConvertGiftToStars arg0 arg1 =
  MkConvertGiftToStars
    { business_connection_id = arg0
    , owned_gift_id = arg1
    , extra = mempty
    }

instance Method ConvertGiftToStars where
  type Result ConvertGiftToStars = TrueValue
  methodName _ = "convertGiftToStars"
  planRequest x =
    planRequestBody
      "convertGiftToStars"
      [ "business_connection_id"
      , "owned_gift_id"
      ]
      ( concat
          [ planned "business_connection_id" (encodeJson x.business_connection_id)
          , planned "owned_gift_id" (encodeJson x.owned_gift_id)
          ]
      )
      x.extra
  parseResult _ = parseJSON
