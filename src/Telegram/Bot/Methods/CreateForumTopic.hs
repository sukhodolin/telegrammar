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
module Telegram.Bot.Methods.CreateForumTopic
  ( CreateForumTopic (..)
  , mkCreateForumTopic
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.ForumTopic (ForumTopic)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (Method (..), encodeJson, planRequestBody, planned, plannedMaybe)

-- | Use this method to create a topic in a forum supergroup chat or a private chat with a user. In the case of a supergroup chat the bot must be an administrator in the chat for this to work and must have the can_manage_topics administrator right. Returns information about the created topic as a ForumTopic object.
--
-- Wire method spelling: @createForumTopic@.
--
-- Source: <https://core.telegram.org/bots/api#createforumtopic>.
-- Result: @ForumTopic@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data CreateForumTopic = MkCreateForumTopic
  { -- | Unique identifier for the target chat or username of the target supergroup in the format \@username
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | Topic name, 1-128 characters
    --
    -- Wire key: @name@.
    name :: Text
  , -- | Color of the topic icon in RGB format. Currently, must be one of 7322096 (0x6FB9F0), 16766590 (0xFFD67E), 13338331 (0xCB86DB), 9367192 (0x8EEE98), 16749490 (0xFF93B2), or 16478047 (0xFB6F5F).
    --
    -- Wire key: @icon_color@.
    -- Omitted from an encoded request when it is @Nothing@.
    icon_color :: Maybe Int64
  , -- | Unique identifier of the custom emoji shown as the topic icon. Use getForumTopicIconStickers to get all allowed custom emoji identifiers.
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

-- | Initialize a 'CreateForumTopic' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkCreateForumTopic :: IntegerOrString -> Text -> CreateForumTopic
mkCreateForumTopic arg0 arg1 =
  MkCreateForumTopic
    { chat_id = arg0
    , name = arg1
    , icon_color = Nothing
    , icon_custom_emoji_id = Nothing
    , extra = mempty
    }

instance Method CreateForumTopic where
  type Result CreateForumTopic = ForumTopic
  methodName _ = "createForumTopic"
  planRequest x =
    planRequestBody
      "createForumTopic"
      [ "chat_id"
      , "name"
      , "icon_color"
      , "icon_custom_emoji_id"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          , planned "name" (encodeJson x.name)
          , plannedMaybe "icon_color" x.icon_color encodeJson
          , plannedMaybe "icon_custom_emoji_id" x.icon_custom_emoji_id encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
