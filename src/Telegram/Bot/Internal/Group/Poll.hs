{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE OverloadedStrings #-}

-- | Internal: one dependency component of the type graph.
--
-- This module is an implementation detail of the generated package. Its
-- declarations are re-exported by the aggregate types façade, which is
-- where consumers import them from. The module name is a deterministic
-- identifier taken from the component's smallest declaration name, not a
-- semantic family name, and it can change when the source graph changes.
--
-- Generated. Do not edit.
module Telegram.Bot.Internal.Group.Poll
  ( Poll (..)
  , mkPoll
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.MessageEntity (MessageEntity)
import Telegram.Bot.Internal.Group.PollMedia (PollMedia)
import Telegram.Bot.Internal.Group.PollOption (PollOption)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseInt64, parseList, requiredWith)

-- | This object contains information about a poll.
--
-- Source: <https://core.telegram.org/bots/api#poll>.
-- Codec directions: decoded from responses, encoded into requests.
data Poll = MkPoll
  { -- | Unique poll identifier
    --
    -- Wire key: @id@.
    id :: Text
  , -- | Poll question, 1-300 characters
    --
    -- Wire key: @question@.
    question :: Text
  , -- | Optional. Special entities that appear in the question. Currently, only custom emoji entities are allowed in poll questions
    --
    -- Wire key: @question_entities@.
    -- Omitted from an encoded request when it is @Nothing@.
    question_entities :: Maybe [MessageEntity]
  , -- | List of poll options
    --
    -- Wire key: @options@.
    options :: [PollOption]
  , -- | Total number of users that voted in the poll
    --
    -- Wire key: @total_voter_count@.
    total_voter_count :: Int64
  , -- | True, if the poll is closed
    --
    -- Wire key: @is_closed@.
    is_closed :: Bool
  , -- | True, if the poll is anonymous
    --
    -- Wire key: @is_anonymous@.
    is_anonymous :: Bool
  , -- | Poll type, currently can be \"regular\" or \"quiz\"
    --
    -- Wire key: @type@.
    type_ :: Text
  , -- | True, if the poll allows multiple answers
    --
    -- Wire key: @allows_multiple_answers@.
    allows_multiple_answers :: Bool
  , -- | True, if the poll allows to change the chosen answer options
    --
    -- Wire key: @allows_revoting@.
    allows_revoting :: Bool
  , -- | True if voting is limited to users who have been members of the chat where the poll was originally sent for more than 24 hours
    --
    -- Wire key: @members_only@.
    members_only :: Bool
  , -- | Optional. A list of two-letter ISO 3166-1 alpha-2 country codes indicating the countries from which users can vote in the poll. The country code \"FT\" is used for users with anonymous numbers. If omitted, then users from any country can participate in the poll.
    --
    -- Wire key: @country_codes@.
    -- Omitted from an encoded request when it is @Nothing@.
    country_codes :: Maybe [Text]
  , -- | Optional. Array of 0-based identifiers of the correct answer options. Available only for polls in quiz mode which are closed or were sent (not forwarded) by the bot or to the private chat with the bot.
    --
    -- Wire key: @correct_option_ids@.
    -- Omitted from an encoded request when it is @Nothing@.
    correct_option_ids :: Maybe [Int64]
  , -- | Optional. Text that is shown when a user chooses an incorrect answer or taps on the lamp icon in a quiz-style poll, 0-200 characters
    --
    -- Wire key: @explanation@.
    -- Omitted from an encoded request when it is @Nothing@.
    explanation :: Maybe Text
  , -- | Optional. Special entities like usernames, URLs, bot commands, etc. that appear in the explanation
    --
    -- Wire key: @explanation_entities@.
    -- Omitted from an encoded request when it is @Nothing@.
    explanation_entities :: Maybe [MessageEntity]
  , -- | Optional. Media added to the quiz explanation
    --
    -- Wire key: @explanation_media@.
    -- Omitted from an encoded request when it is @Nothing@.
    explanation_media :: Maybe PollMedia
  , -- | Optional. Amount of time in seconds the poll will be active after creation
    --
    -- Wire key: @open_period@.
    -- Omitted from an encoded request when it is @Nothing@.
    open_period :: Maybe Int64
  , -- | Optional. Point in time (Unix timestamp) when the poll will be automatically closed
    --
    -- Wire key: @close_date@.
    -- Omitted from an encoded request when it is @Nothing@.
    close_date :: Maybe Int64
  , -- | Optional. Description of the poll; for polls inside the Message object only
    --
    -- Wire key: @description@.
    -- Omitted from an encoded request when it is @Nothing@.
    description :: Maybe Text
  , -- | Optional. Special entities like usernames, URLs, bot commands, etc. that appear in the description
    --
    -- Wire key: @description_entities@.
    -- Omitted from an encoded request when it is @Nothing@.
    description_entities :: Maybe [MessageEntity]
  , -- | Optional. Media added to the poll description; for polls inside the Message object only
    --
    -- Wire key: @media@.
    -- Omitted from an encoded request when it is @Nothing@.
    media :: Maybe PollMedia
  }
  deriving stock (Eq, Show)

-- | Initialize a 'Poll' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkPoll :: Text -> Text -> [PollOption] -> Int64 -> Bool -> Bool -> Text -> Bool -> Bool -> Bool -> Poll
mkPoll arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9 =
  MkPoll
    { id = arg0
    , question = arg1
    , question_entities = Nothing
    , options = arg2
    , total_voter_count = arg3
    , is_closed = arg4
    , is_anonymous = arg5
    , type_ = arg6
    , allows_multiple_answers = arg7
    , allows_revoting = arg8
    , members_only = arg9
    , country_codes = Nothing
    , correct_option_ids = Nothing
    , explanation = Nothing
    , explanation_entities = Nothing
    , explanation_media = Nothing
    , open_period = Nothing
    , close_date = Nothing
    , description = Nothing
    , description_entities = Nothing
    , media = Nothing
    }

instance FromJSON Poll where
  parseJSON = withObject "Poll" $ \obj ->
    do
      field_0 <- requiredWith obj "id" parseJSON
      field_1 <- requiredWith obj "question" parseJSON
      field_2 <- optionalWith obj "question_entities" (parseList parseJSON)
      field_3 <- requiredWith obj "options" (parseList parseJSON)
      field_4 <- requiredWith obj "total_voter_count" parseInt64
      field_5 <- requiredWith obj "is_closed" parseJSON
      field_6 <- requiredWith obj "is_anonymous" parseJSON
      field_7 <- requiredWith obj "type" parseJSON
      field_8 <- requiredWith obj "allows_multiple_answers" parseJSON
      field_9 <- requiredWith obj "allows_revoting" parseJSON
      field_10 <- requiredWith obj "members_only" parseJSON
      field_11 <- optionalWith obj "country_codes" (parseList parseJSON)
      field_12 <- optionalWith obj "correct_option_ids" (parseList parseInt64)
      field_13 <- optionalWith obj "explanation" parseJSON
      field_14 <- optionalWith obj "explanation_entities" (parseList parseJSON)
      field_15 <- optionalWith obj "explanation_media" parseJSON
      field_16 <- optionalWith obj "open_period" parseInt64
      field_17 <- optionalWith obj "close_date" parseInt64
      field_18 <- optionalWith obj "description" parseJSON
      field_19 <- optionalWith obj "description_entities" (parseList parseJSON)
      field_20 <- optionalWith obj "media" parseJSON
      pure
        MkPoll
          { id = field_0
          , question = field_1
          , question_entities = field_2
          , options = field_3
          , total_voter_count = field_4
          , is_closed = field_5
          , is_anonymous = field_6
          , type_ = field_7
          , allows_multiple_answers = field_8
          , allows_revoting = field_9
          , members_only = field_10
          , country_codes = field_11
          , correct_option_ids = field_12
          , explanation = field_13
          , explanation_entities = field_14
          , explanation_media = field_15
          , open_period = field_16
          , close_date = field_17
          , description = field_18
          , description_entities = field_19
          , media = field_20
          }

instance ToJSON Poll where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "id" x.id
          , jsonField "question" x.question
          , jsonOptional "question_entities" x.question_entities
          , jsonField "options" x.options
          , jsonField "total_voter_count" x.total_voter_count
          , jsonField "is_closed" x.is_closed
          , jsonField "is_anonymous" x.is_anonymous
          , jsonField "type" x.type_
          , jsonField "allows_multiple_answers" x.allows_multiple_answers
          , jsonField "allows_revoting" x.allows_revoting
          , jsonField "members_only" x.members_only
          , jsonOptional "country_codes" x.country_codes
          , jsonOptional "correct_option_ids" x.correct_option_ids
          , jsonOptional "explanation" x.explanation
          , jsonOptional "explanation_entities" x.explanation_entities
          , jsonOptional "explanation_media" x.explanation_media
          , jsonOptional "open_period" x.open_period
          , jsonOptional "close_date" x.close_date
          , jsonOptional "description" x.description
          , jsonOptional "description_entities" x.description_entities
          , jsonOptional "media" x.media
          ]
      )
  toEncoding = toEncoding . toJSON
