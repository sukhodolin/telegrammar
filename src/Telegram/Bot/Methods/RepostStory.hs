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
module Telegram.Bot.Methods.RepostStory
  ( RepostStory (..)
  , mkRepostStory
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.Story (Story)
import Telegram.Bot.Support (Method (..), encodeJson, planRequestBody, planned, plannedMaybe)

-- | Reposts a story on behalf of a business account from another business account. Both business accounts must be managed by the same bot, and the story on the source account must have been posted (or reposted) by the bot. Requires the can_manage_stories business bot right for both business accounts. Returns Story on success.
--
-- Wire method spelling: @repostStory@.
--
-- Source: <https://core.telegram.org/bots/api#repoststory>.
-- Result: @Story@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data RepostStory = MkRepostStory
  { -- | Unique identifier of the business connection
    --
    -- Wire key: @business_connection_id@.
    business_connection_id :: Text
  , -- | Unique identifier of the chat which posted the story that should be reposted
    --
    -- Wire key: @from_chat_id@.
    from_chat_id :: Int64
  , -- | Unique identifier of the story that should be reposted
    --
    -- Wire key: @from_story_id@.
    from_story_id :: Int64
  , -- | Period after which the story is moved to the archive, in seconds; must be one of 6 * 3600, 12 * 3600, 86400, or 2 * 86400
    --
    -- Wire key: @active_period@.
    active_period :: Int64
  , -- | Pass True to keep the story accessible after it expires
    --
    -- Wire key: @post_to_chat_page@.
    -- Omitted from an encoded request when it is @Nothing@.
    post_to_chat_page :: Maybe Bool
  , -- | Pass True if the content of the story must be protected from forwarding and screenshotting
    --
    -- Wire key: @protect_content@.
    -- Omitted from an encoded request when it is @Nothing@.
    protect_content :: Maybe Bool
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RepostStory' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRepostStory :: Text -> Int64 -> Int64 -> Int64 -> RepostStory
mkRepostStory arg0 arg1 arg2 arg3 =
  MkRepostStory
    { business_connection_id = arg0
    , from_chat_id = arg1
    , from_story_id = arg2
    , active_period = arg3
    , post_to_chat_page = Nothing
    , protect_content = Nothing
    , extra = mempty
    }

instance Method RepostStory where
  type Result RepostStory = Story
  methodName _ = "repostStory"
  planRequest x =
    planRequestBody
      "repostStory"
      [ "business_connection_id"
      , "from_chat_id"
      , "from_story_id"
      , "active_period"
      , "post_to_chat_page"
      , "protect_content"
      ]
      ( concat
          [ planned "business_connection_id" (encodeJson x.business_connection_id)
          , planned "from_chat_id" (encodeJson x.from_chat_id)
          , planned "from_story_id" (encodeJson x.from_story_id)
          , planned "active_period" (encodeJson x.active_period)
          , plannedMaybe "post_to_chat_page" x.post_to_chat_page encodeJson
          , plannedMaybe "protect_content" x.protect_content encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
