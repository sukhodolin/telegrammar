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
module Telegram.Bot.Methods.EditStory
  ( EditStory (..)
  , mkEditStory
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.InputStoryContent (InputStoryContent, planInputStoryContent)
import Telegram.Bot.Internal.Group.MessageEntity (MessageEntity)
import Telegram.Bot.Internal.Group.Story (Story)
import Telegram.Bot.Internal.Group.StoryArea (StoryArea)
import Telegram.Bot.Support (Method (..), encodeJson, planList, planRequestBody, planned, plannedMaybe)

-- | Edits a story previously posted by the bot on behalf of a managed business account. Requires the can_manage_stories business bot right. Returns Story on success.
--
-- Wire method spelling: @editStory@.
--
-- Source: <https://core.telegram.org/bots/api#editstory>.
-- Result: @Story@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data EditStory = MkEditStory
  { -- | Unique identifier of the business connection
    --
    -- Wire key: @business_connection_id@.
    business_connection_id :: Text
  , -- | Unique identifier of the story to edit
    --
    -- Wire key: @story_id@.
    story_id :: Int64
  , -- | Content of the story
    --
    -- Wire key: @content@.
    content :: InputStoryContent
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
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'EditStory' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkEditStory :: Text -> Int64 -> InputStoryContent -> EditStory
mkEditStory arg0 arg1 arg2 =
  MkEditStory
    { business_connection_id = arg0
    , story_id = arg1
    , content = arg2
    , caption = Nothing
    , parse_mode = Nothing
    , caption_entities = Nothing
    , areas = Nothing
    , extra = mempty
    }

instance Method EditStory where
  type Result EditStory = Story
  methodName _ = "editStory"
  planRequest x =
    planRequestBody
      "editStory"
      [ "business_connection_id"
      , "story_id"
      , "content"
      , "caption"
      , "parse_mode"
      , "caption_entities"
      , "areas"
      ]
      ( concat
          [ planned "business_connection_id" (encodeJson x.business_connection_id)
          , planned "story_id" (encodeJson x.story_id)
          , planned "content" (planInputStoryContent x.content)
          , plannedMaybe "caption" x.caption encodeJson
          , plannedMaybe "parse_mode" x.parse_mode encodeJson
          , plannedMaybe "caption_entities" x.caption_entities (planList encodeJson)
          , plannedMaybe "areas" x.areas (planList encodeJson)
          ]
      )
      x.extra
  parseResult _ = parseJSON
