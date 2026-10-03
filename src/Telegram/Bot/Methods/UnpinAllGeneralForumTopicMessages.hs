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
module Telegram.Bot.Methods.UnpinAllGeneralForumTopicMessages
  ( UnpinAllGeneralForumTopicMessages (..)
  , mkUnpinAllGeneralForumTopicMessages
  ) where

import Data.Aeson (FromJSON (..), Object)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned)

-- | Use this method to clear the list of pinned messages in a General forum topic. The bot must be an administrator in the chat for this to work and must have the can_pin_messages administrator right in the supergroup. Returns True on success.
--
-- Wire method spelling: @unpinAllGeneralForumTopicMessages@.
--
-- Source: <https://core.telegram.org/bots/api#unpinallgeneralforumtopicmessages>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data UnpinAllGeneralForumTopicMessages = MkUnpinAllGeneralForumTopicMessages
  { -- | Unique identifier for the target chat or username of the target supergroup in the format \@username
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'UnpinAllGeneralForumTopicMessages' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkUnpinAllGeneralForumTopicMessages :: IntegerOrString -> UnpinAllGeneralForumTopicMessages
mkUnpinAllGeneralForumTopicMessages arg0 =
  MkUnpinAllGeneralForumTopicMessages
    { chat_id = arg0
    , extra = mempty
    }

instance Method UnpinAllGeneralForumTopicMessages where
  type Result UnpinAllGeneralForumTopicMessages = TrueValue
  methodName _ = "unpinAllGeneralForumTopicMessages"
  planRequest x =
    planRequestBody
      "unpinAllGeneralForumTopicMessages"
      [ "chat_id"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          ]
      )
      x.extra
  parseResult _ = parseJSON
