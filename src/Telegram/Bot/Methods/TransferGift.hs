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
module Telegram.Bot.Methods.TransferGift
  ( TransferGift (..)
  , mkTransferGift
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned, plannedMaybe)

-- | Transfers an owned unique gift to another user. Requires the can_transfer_and_upgrade_gifts business bot right. Requires can_transfer_stars business bot right if the transfer is paid. Returns True on success.
--
-- Wire method spelling: @transferGift@.
--
-- Source: <https://core.telegram.org/bots/api#transfergift>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data TransferGift = MkTransferGift
  { -- | Unique identifier of the business connection
    --
    -- Wire key: @business_connection_id@.
    business_connection_id :: Text
  , -- | Unique identifier of the regular gift that should be transferred
    --
    -- Wire key: @owned_gift_id@.
    owned_gift_id :: Text
  , -- | Unique identifier of the chat which will own the gift. The chat must be active in the last 24 hours.
    --
    -- Wire key: @new_owner_chat_id@.
    new_owner_chat_id :: Int64
  , -- | The amount of Telegram Stars that will be paid for the transfer from the business account balance. If positive, then the can_transfer_stars business bot right is required.
    --
    -- Wire key: @star_count@.
    -- Omitted from an encoded request when it is @Nothing@.
    star_count :: Maybe Int64
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'TransferGift' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkTransferGift :: Text -> Text -> Int64 -> TransferGift
mkTransferGift arg0 arg1 arg2 =
  MkTransferGift
    { business_connection_id = arg0
    , owned_gift_id = arg1
    , new_owner_chat_id = arg2
    , star_count = Nothing
    , extra = mempty
    }

instance Method TransferGift where
  type Result TransferGift = TrueValue
  methodName _ = "transferGift"
  planRequest x =
    planRequestBody
      "transferGift"
      [ "business_connection_id"
      , "owned_gift_id"
      , "new_owner_chat_id"
      , "star_count"
      ]
      ( concat
          [ planned "business_connection_id" (encodeJson x.business_connection_id)
          , planned "owned_gift_id" (encodeJson x.owned_gift_id)
          , planned "new_owner_chat_id" (encodeJson x.new_owner_chat_id)
          , plannedMaybe "star_count" x.star_count encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
