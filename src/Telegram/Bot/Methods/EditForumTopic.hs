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
module Telegram.Bot.Methods.EditForumTopic
  ( EditForumTopic (..)
  , mkEditForumTopic
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned, plannedMaybe)

-- | Use this method to edit name and icon of a topic in a forum supergroup chat or a private chat with a user. In the case of a supergroup chat the bot must be an administrator in the chat for this to work and must have the can_manage_topics administrator rights, unless it is the creator of the topic. Returns True on success.
--
-- Wire method spelling: @editForumTopic@.
--
-- Source: <https://core.telegram.org/bots/api#editforumtopic>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data EditForumTopic = MkEditForumTopic
  { -- | Unique identifier for the target chat or username of the target supergroup in the format \@username
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | Unique identifier for the target message thread of the forum topic
    --
    -- Wire key: @message_thread_id@.
    message_thread_id :: Int64
  , -- | New topic name, 0-128 characters. If not specified or empty, the current name of the topic will be kept.
    --
    -- Wire key: @name@.
    -- Omitted from an encoded request when it is @Nothing@.
    name :: Maybe Text
  , -- | New unique identifier of the custom emoji shown as the topic icon. Use getForumTopicIconStickers to get all allowed custom emoji identifiers. Pass an empty string to remove the icon. If not specified, the current icon will be kept.
    --
    -- Wire key: @icon_custom_emoji_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    icon_custom_emoji_id :: Maybe Text
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'EditForumTopic' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkEditForumTopic :: IntegerOrString -> Int64 -> EditForumTopic
mkEditForumTopic arg0 arg1 =
  MkEditForumTopic
    { chat_id = arg0
    , message_thread_id = arg1
    , name = Nothing
    , icon_custom_emoji_id = Nothing
    , extra = mempty
    }

instance Method EditForumTopic where
  type Result EditForumTopic = TrueValue
  methodName _ = "editForumTopic"
  planRequest x =
    planRequestBody
      "editForumTopic"
      [ "chat_id"
      , "message_thread_id"
      , "name"
      , "icon_custom_emoji_id"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          , planned "message_thread_id" (encodeJson x.message_thread_id)
          , plannedMaybe "name" x.name encodeJson
          , plannedMaybe "icon_custom_emoji_id" x.icon_custom_emoji_id encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
