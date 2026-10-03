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
module Telegram.Bot.Methods.SetMessageReaction
  ( SetMessageReaction (..)
  , mkSetMessageReaction
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Internal.Group.ReactionType (ReactionType)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planList, planRequestBody, planned, plannedMaybe)

-- | Use this method to change the chosen reactions on a message. Service messages of some types can\'t be reacted to. Automatically forwarded messages from a channel to its discussion group have the same available reactions as messages in the channel. Bots can\'t use paid reactions. Returns True on success.
--
-- Wire method spelling: @setMessageReaction@.
--
-- Source: <https://core.telegram.org/bots/api#setmessagereaction>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SetMessageReaction = MkSetMessageReaction
  { -- | Unique identifier for the target chat or username of the target bot, supergroup or channel in the format \@username
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | Identifier of the target message. If the message belongs to a media group, the reaction is set to the first non-deleted message in the group instead.
    --
    -- Wire key: @message_id@.
    message_id :: Int64
  , -- | A JSON-serialized list of reaction types to set on the message. Currently, as non-premium users, bots can set up to one reaction per message. A custom emoji reaction can be used if it is either already present on the message or explicitly allowed by chat administrators. Paid reactions can\'t be used by bots.
    --
    -- Wire key: @reaction@.
    -- Omitted from an encoded request when it is @Nothing@.
    reaction :: Maybe [ReactionType]
  , -- | Pass True to set the reaction with a big animation
    --
    -- Wire key: @is_big@.
    -- Omitted from an encoded request when it is @Nothing@.
    is_big :: Maybe Bool
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SetMessageReaction' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSetMessageReaction :: IntegerOrString -> Int64 -> SetMessageReaction
mkSetMessageReaction arg0 arg1 =
  MkSetMessageReaction
    { chat_id = arg0
    , message_id = arg1
    , reaction = Nothing
    , is_big = Nothing
    , extra = mempty
    }

instance Method SetMessageReaction where
  type Result SetMessageReaction = TrueValue
  methodName _ = "setMessageReaction"
  planRequest x =
    planRequestBody
      "setMessageReaction"
      [ "chat_id"
      , "message_id"
      , "reaction"
      , "is_big"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          , planned "message_id" (encodeJson x.message_id)
          , plannedMaybe "reaction" x.reaction (planList encodeJson)
          , plannedMaybe "is_big" x.is_big encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
