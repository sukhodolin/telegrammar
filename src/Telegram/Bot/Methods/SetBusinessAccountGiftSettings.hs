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
module Telegram.Bot.Methods.SetBusinessAccountGiftSettings
  ( SetBusinessAccountGiftSettings (..)
  , mkSetBusinessAccountGiftSettings
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.AcceptedGiftTypes (AcceptedGiftTypes)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned)

-- | Changes the privacy settings pertaining to incoming gifts in a managed business account. Requires the can_change_gift_settings business bot right. Returns True on success.
--
-- Wire method spelling: @setBusinessAccountGiftSettings@.
--
-- Source: <https://core.telegram.org/bots/api#setbusinessaccountgiftsettings>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SetBusinessAccountGiftSettings = MkSetBusinessAccountGiftSettings
  { -- | Unique identifier of the business connection
    --
    -- Wire key: @business_connection_id@.
    business_connection_id :: Text
  , -- | Pass True if a button for sending a gift to the user or by the business account must always be shown in the input field
    --
    -- Wire key: @show_gift_button@.
    show_gift_button :: Bool
  , -- | Types of gifts accepted by the business account
    --
    -- Wire key: @accepted_gift_types@.
    accepted_gift_types :: AcceptedGiftTypes
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SetBusinessAccountGiftSettings' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSetBusinessAccountGiftSettings :: Text -> Bool -> AcceptedGiftTypes -> SetBusinessAccountGiftSettings
mkSetBusinessAccountGiftSettings arg0 arg1 arg2 =
  MkSetBusinessAccountGiftSettings
    { business_connection_id = arg0
    , show_gift_button = arg1
    , accepted_gift_types = arg2
    , extra = mempty
    }

instance Method SetBusinessAccountGiftSettings where
  type Result SetBusinessAccountGiftSettings = TrueValue
  methodName _ = "setBusinessAccountGiftSettings"
  planRequest x =
    planRequestBody
      "setBusinessAccountGiftSettings"
      [ "business_connection_id"
      , "show_gift_button"
      , "accepted_gift_types"
      ]
      ( concat
          [ planned "business_connection_id" (encodeJson x.business_connection_id)
          , planned "show_gift_button" (encodeJson x.show_gift_button)
          , planned "accepted_gift_types" (encodeJson x.accepted_gift_types)
          ]
      )
      x.extra
  parseResult _ = parseJSON
