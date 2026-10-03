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
module Telegram.Bot.Methods.GetBusinessAccountGifts
  ( GetBusinessAccountGifts (..)
  , mkGetBusinessAccountGifts
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.OwnedGifts (OwnedGifts)
import Telegram.Bot.Support (Method (..), encodeJson, planRequestBody, planned, plannedMaybe)

-- | Returns the gifts received and owned by a managed business account. Requires the can_view_gifts_and_stars business bot right. Returns OwnedGifts on success.
--
-- Wire method spelling: @getBusinessAccountGifts@.
--
-- Source: <https://core.telegram.org/bots/api#getbusinessaccountgifts>.
-- Result: @OwnedGifts@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data GetBusinessAccountGifts = MkGetBusinessAccountGifts
  { -- | Unique identifier of the business connection
    --
    -- Wire key: @business_connection_id@.
    business_connection_id :: Text
  , -- | Pass True to exclude gifts that aren\'t saved to the account\'s profile page
    --
    -- Wire key: @exclude_unsaved@.
    -- Omitted from an encoded request when it is @Nothing@.
    exclude_unsaved :: Maybe Bool
  , -- | Pass True to exclude gifts that are saved to the account\'s profile page
    --
    -- Wire key: @exclude_saved@.
    -- Omitted from an encoded request when it is @Nothing@.
    exclude_saved :: Maybe Bool
  , -- | Pass True to exclude gifts that can be purchased an unlimited number of times
    --
    -- Wire key: @exclude_unlimited@.
    -- Omitted from an encoded request when it is @Nothing@.
    exclude_unlimited :: Maybe Bool
  , -- | Pass True to exclude gifts that can be purchased a limited number of times and can be upgraded to unique
    --
    -- Wire key: @exclude_limited_upgradable@.
    -- Omitted from an encoded request when it is @Nothing@.
    exclude_limited_upgradable :: Maybe Bool
  , -- | Pass True to exclude gifts that can be purchased a limited number of times and can\'t be upgraded to unique
    --
    -- Wire key: @exclude_limited_non_upgradable@.
    -- Omitted from an encoded request when it is @Nothing@.
    exclude_limited_non_upgradable :: Maybe Bool
  , -- | Pass True to exclude unique gifts
    --
    -- Wire key: @exclude_unique@.
    -- Omitted from an encoded request when it is @Nothing@.
    exclude_unique :: Maybe Bool
  , -- | Pass True to exclude gifts that were assigned from the TON blockchain and can\'t be resold or transferred in Telegram
    --
    -- Wire key: @exclude_from_blockchain@.
    -- Omitted from an encoded request when it is @Nothing@.
    exclude_from_blockchain :: Maybe Bool
  , -- | Pass True to sort results by gift price instead of send date. Sorting is applied before pagination.
    --
    -- Wire key: @sort_by_price@.
    -- Omitted from an encoded request when it is @Nothing@.
    sort_by_price :: Maybe Bool
  , -- | Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
    --
    -- Wire key: @offset@.
    -- Omitted from an encoded request when it is @Nothing@.
    offset :: Maybe Text
  , -- | The maximum number of gifts to be returned; 1-100. Defaults to 100.
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

-- | Initialize a 'GetBusinessAccountGifts' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkGetBusinessAccountGifts :: Text -> GetBusinessAccountGifts
mkGetBusinessAccountGifts arg0 =
  MkGetBusinessAccountGifts
    { business_connection_id = arg0
    , exclude_unsaved = Nothing
    , exclude_saved = Nothing
    , exclude_unlimited = Nothing
    , exclude_limited_upgradable = Nothing
    , exclude_limited_non_upgradable = Nothing
    , exclude_unique = Nothing
    , exclude_from_blockchain = Nothing
    , sort_by_price = Nothing
    , offset = Nothing
    , limit = Nothing
    , extra = mempty
    }

instance Method GetBusinessAccountGifts where
  type Result GetBusinessAccountGifts = OwnedGifts
  methodName _ = "getBusinessAccountGifts"
  planRequest x =
    planRequestBody
      "getBusinessAccountGifts"
      [ "business_connection_id"
      , "exclude_unsaved"
      , "exclude_saved"
      , "exclude_unlimited"
      , "exclude_limited_upgradable"
      , "exclude_limited_non_upgradable"
      , "exclude_unique"
      , "exclude_from_blockchain"
      , "sort_by_price"
      , "offset"
      , "limit"
      ]
      ( concat
          [ planned "business_connection_id" (encodeJson x.business_connection_id)
          , plannedMaybe "exclude_unsaved" x.exclude_unsaved encodeJson
          , plannedMaybe "exclude_saved" x.exclude_saved encodeJson
          , plannedMaybe "exclude_unlimited" x.exclude_unlimited encodeJson
          , plannedMaybe "exclude_limited_upgradable" x.exclude_limited_upgradable encodeJson
          , plannedMaybe "exclude_limited_non_upgradable" x.exclude_limited_non_upgradable encodeJson
          , plannedMaybe "exclude_unique" x.exclude_unique encodeJson
          , plannedMaybe "exclude_from_blockchain" x.exclude_from_blockchain encodeJson
          , plannedMaybe "sort_by_price" x.sort_by_price encodeJson
          , plannedMaybe "offset" x.offset encodeJson
          , plannedMaybe "limit" x.limit encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
