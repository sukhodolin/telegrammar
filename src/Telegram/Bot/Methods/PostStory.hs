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
module Telegram.Bot.Methods.PostStory
  ( PostStory (..)
  , mkPostStory
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.InputStoryContent (InputStoryContent, planInputStoryContent)
import Telegram.Bot.Internal.Group.MessageEntity (MessageEntity)
import Telegram.Bot.Internal.Group.Story (Story)
import Telegram.Bot.Internal.Group.StoryArea (StoryArea)
import Telegram.Bot.Support (Method (..), encodeJson, planList, planRequestBody, planned, plannedMaybe)

-- | Posts a story on behalf of a managed business account. Requires the can_manage_stories business bot right. Returns Story on success.
--
-- Wire method spelling: @postStory@.
--
-- Source: <https://core.telegram.org/bots/api#poststory>.
-- Result: @Story@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data PostStory = MkPostStory
  { -- | Unique identifier of the business connection
    --
    -- Wire key: @business_connection_id@.
    business_connection_id :: Text
  , -- | Content of the story
    --
    -- Wire key: @content@.
    content :: InputStoryContent
  , -- | Period after which the story is moved to the archive, in seconds; must be one of 6 * 3600, 12 * 3600, 86400, or 2 * 86400
    --
    -- Wire key: @active_period@.
    active_period :: Int64
  , -- | Caption of the story, 0-2048 characters after entities parsing
    --
    -- Wire key: @caption@.
    -- Omitted from an encoded request when it is @Nothing@.
    caption :: Maybe Text
  , -- | Mode for parsing entities in the story caption. See formatting options for more details.
    --
    -- Wire key: @parse_mode@.
    -- Omitted from an encoded request when it is @Nothing@.
    parse_mode :: Maybe Text
  , -- | A JSON-serialized list of special entities that appear in the caption, which can be specified instead of parse_mode
    --
    -- Wire key: @caption_entities@.
    -- Omitted from an encoded request when it is @Nothing@.
    caption_entities :: Maybe [MessageEntity]
  , -- | A JSON-serialized list of clickable areas to be shown on the story
    --
    -- Wire key: @areas@.
    -- Omitted from an encoded request when it is @Nothing@.
    areas :: Maybe [StoryArea]
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

-- | Initialize a 'PostStory' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkPostStory :: Text -> InputStoryContent -> Int64 -> PostStory
mkPostStory arg0 arg1 arg2 =
  MkPostStory
    { business_connection_id = arg0
    , content = arg1
    , active_period = arg2
    , caption = Nothing
    , parse_mode = Nothing
    , caption_entities = Nothing
    , areas = Nothing
    , post_to_chat_page = Nothing
    , protect_content = Nothing
    , extra = mempty
    }

instance Method PostStory where
  type Result PostStory = Story
  methodName _ = "postStory"
  planRequest x =
    planRequestBody
      "postStory"
      [ "business_connection_id"
      , "content"
      , "active_period"
      , "caption"
      , "parse_mode"
      , "caption_entities"
      , "areas"
      , "post_to_chat_page"
      , "protect_content"
      ]
      ( concat
          [ planned "business_connection_id" (encodeJson x.business_connection_id)
          , planned "content" (planInputStoryContent x.content)
          , planned "active_period" (encodeJson x.active_period)
          , plannedMaybe "caption" x.caption encodeJson
          , plannedMaybe "parse_mode" x.parse_mode encodeJson
          , plannedMaybe "caption_entities" x.caption_entities (planList encodeJson)
          , plannedMaybe "areas" x.areas (planList encodeJson)
          , plannedMaybe "post_to_chat_page" x.post_to_chat_page encodeJson
          , plannedMaybe "protect_content" x.protect_content encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
