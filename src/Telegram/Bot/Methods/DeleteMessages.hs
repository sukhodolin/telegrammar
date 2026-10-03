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
module Telegram.Bot.Methods.DeleteMessages
  ( DeleteMessages (..)
  , mkDeleteMessages
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planList, planRequestBody, planned, validateArrayCount, withValidation)

-- | Use this method to delete multiple messages simultaneously. If some of the specified messages can\'t be found, they are skipped. Returns True on success.
--
-- Wire method spelling: @deleteMessages@.
--
-- Source: <https://core.telegram.org/bots/api#deletemessages>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data DeleteMessages = MkDeleteMessages
  { -- | Unique identifier for the target chat or username of the target bot, supergroup or channel in the format \@username
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | A JSON-serialized list of 1-100 identifiers of messages to delete. See deleteMessage for limitations on which messages can be deleted.
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

-- | Initialize a 'DeleteMessages' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkDeleteMessages :: IntegerOrString -> [Int64] -> DeleteMessages
mkDeleteMessages arg0 arg1 =
  MkDeleteMessages
    { chat_id = arg0
    , message_ids = arg1
    , extra = mempty
    }

instance Method DeleteMessages where
  type Result DeleteMessages = TrueValue
  methodName _ = "deleteMessages"
  planRequest x =
    planRequestBody
      "deleteMessages"
      [ "chat_id"
      , "message_ids"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          , planned "message_ids" (withValidation (\loc_ -> validateArrayCount (Just 1) (Just 100) loc_ x.message_ids) ((planList encodeJson) x.message_ids))
          ]
      )
      x.extra
  parseResult _ = parseJSON
