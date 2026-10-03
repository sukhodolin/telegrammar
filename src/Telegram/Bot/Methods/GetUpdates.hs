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
module Telegram.Bot.Methods.GetUpdates
  ( GetUpdates (..)
  , mkGetUpdates
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.Update (Update)
import Telegram.Bot.Support (Method (..), encodeJson, parseList, planList, planRequestBody, plannedMaybe)

-- | Use this method to receive incoming updates using long polling (wiki). Returns an Array of Update objects.
--
-- Wire method spelling: @getUpdates@.
--
-- Source: <https://core.telegram.org/bots/api#getupdates>.
-- Result: @[Update]@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data GetUpdates = MkGetUpdates
  { -- | Identifier of the first update to be returned. Must be greater by one than the highest among the identifiers of previously received updates. By default, updates starting with the earliest unconfirmed update are returned. An update is considered confirmed as soon as getUpdates is called with an offset higher than its update_id. The negative offset can be specified to retrieve updates starting from -offset update from the end of the updates queue. All previous updates will be forgotten.
    --
    -- Wire key: @offset@.
    -- Omitted from an encoded request when it is @Nothing@.
    offset :: Maybe Int64
  , -- | Limits the number of updates to be retrieved. Values between 1-100 are accepted. Defaults to 100.
    --
    -- Wire key: @limit@.
    -- Omitted from an encoded request when it is @Nothing@.
    limit :: Maybe Int64
  , -- | Timeout in seconds for long polling. Defaults to 0, i.e. usual short polling. Should be positive, short polling should be used for testing purposes only.
    --
    -- Wire key: @timeout@.
    -- Omitted from an encoded request when it is @Nothing@.
    timeout :: Maybe Int64
  , -- | A JSON-serialized list of the update types you want your bot to receive. For example, specify \[\"message\", \"edited_channel_post\", \"callback_query\"\] to only receive updates of these types. See Update for a complete list of available update types. Specify an empty list to receive all update types except chat_member, message_reaction, and message_reaction_count (default). If not specified, the previous setting will be used. Please note that this parameter doesn\'t affect updates created before the call to getUpdates, so unwanted updates may be received for a short period of time.
    --
    -- Wire key: @allowed_updates@.
    -- Omitted from an encoded request when it is @Nothing@.
    allowed_updates :: Maybe [Text]
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'GetUpdates' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkGetUpdates :: GetUpdates
mkGetUpdates =
  MkGetUpdates
    { offset = Nothing
    , limit = Nothing
    , timeout = Nothing
    , allowed_updates = Nothing
    , extra = mempty
    }

instance Method GetUpdates where
  type Result GetUpdates = [Update]
  methodName _ = "getUpdates"
  planRequest x =
    planRequestBody
      "getUpdates"
      [ "offset"
      , "limit"
      , "timeout"
      , "allowed_updates"
      ]
      ( concat
          [ plannedMaybe "offset" x.offset encodeJson
          , plannedMaybe "limit" x.limit encodeJson
          , plannedMaybe "timeout" x.timeout encodeJson
          , plannedMaybe "allowed_updates" x.allowed_updates (planList encodeJson)
          ]
      )
      x.extra
  parseResult _ = (parseList parseJSON)
