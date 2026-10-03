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
module Telegram.Bot.Methods.DeleteBusinessMessages
  ( DeleteBusinessMessages (..)
  , mkDeleteBusinessMessages
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planList, planRequestBody, planned, validateArrayCount, withValidation)

-- | Delete messages on behalf of a business account. Requires the can_delete_sent_messages business bot right to delete messages sent by the bot itself, or the can_delete_all_messages business bot right to delete any message. Returns True on success.
--
-- Wire method spelling: @deleteBusinessMessages@.
--
-- Source: <https://core.telegram.org/bots/api#deletebusinessmessages>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data DeleteBusinessMessages = MkDeleteBusinessMessages
  { -- | Unique identifier of the business connection on behalf of which to delete the messages
    --
    -- Wire key: @business_connection_id@.
    business_connection_id :: Text
  , -- | A JSON-serialized list of 1-100 identifiers of messages to delete. All messages must be from the same chat. See deleteMessage for limitations on which messages can be deleted.
    --
    -- Wire key: @message_ids@.
    -- Checked when planning a request: 1 to 100 elements.
    message_ids :: [Int64]
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'DeleteBusinessMessages' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkDeleteBusinessMessages :: Text -> [Int64] -> DeleteBusinessMessages
mkDeleteBusinessMessages arg0 arg1 =
  MkDeleteBusinessMessages
    { business_connection_id = arg0
    , message_ids = arg1
    , extra = mempty
    }

instance Method DeleteBusinessMessages where
  type Result DeleteBusinessMessages = TrueValue
  methodName _ = "deleteBusinessMessages"
  planRequest x =
    planRequestBody
      "deleteBusinessMessages"
      [ "business_connection_id"
      , "message_ids"
      ]
      ( concat
          [ planned "business_connection_id" (encodeJson x.business_connection_id)
          , planned "message_ids" (withValidation (\loc_ -> validateArrayCount (Just 1) (Just 100) loc_ x.message_ids) ((planList encodeJson) x.message_ids))
          ]
      )
      x.extra
  parseResult _ = parseJSON
