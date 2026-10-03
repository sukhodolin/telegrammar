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
module Telegram.Bot.Methods.SendPoll
  ( SendPoll (..)
  , mkSendPoll
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.ChecklistTasksAdded (Message)
import Telegram.Bot.Internal.Group.InputPollMedia (InputPollMedia, planInputPollMedia)
import Telegram.Bot.Internal.Group.InputPollOption (InputPollOption, planInputPollOption)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Internal.Group.MessageEntity (MessageEntity)
import Telegram.Bot.Internal.Group.ReplyMarkup (ReplyMarkup)
import Telegram.Bot.Internal.Group.ReplyParameters (ReplyParameters)
import Telegram.Bot.Support (Method (..), encodeJson, planList, planRequestBody, planned, plannedMaybe, validateArrayCount, withValidation)

-- | Use this method to send a native poll. On success, the sent Message is returned.
--
-- Wire method spelling: @sendPoll@.
--
-- Source: <https://core.telegram.org/bots/api#sendpoll>.
-- Result: @Message@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SendPoll = MkSendPoll
  { -- | Unique identifier of the business connection on behalf of which the message will be sent
    --
    -- Wire key: @business_connection_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    business_connection_id :: Maybe Text
  , -- | Unique identifier for the target chat or username of the target bot, supergroup or channel in the format \@username. Polls can\'t be sent to channel direct messages chats.
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | Unique identifier for the target message thread (topic) of a forum; for forum supergroups and private chats of bots with forum topic mode enabled only
    --
    -- Wire key: @message_thread_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    message_thread_id :: Maybe Int64
  , -- | Poll question, 1-300 characters
    --
    -- Wire key: @question@.
    question :: Text
  , -- | Mode for parsing entities in the question. See formatting options for more details. Currently, only custom emoji entities are allowed.
    --
    -- Wire key: @question_parse_mode@.
    -- Omitted from an encoded request when it is @Nothing@.
    question_parse_mode :: Maybe Text
  , -- | A JSON-serialized list of special entities that appear in the poll question. It can be specified instead of question_parse_mode.
    --
    -- Wire key: @question_entities@.
    -- Omitted from an encoded request when it is @Nothing@.
    question_entities :: Maybe [MessageEntity]
  , -- | A JSON-serialized list of 1-12 answer options
    --
    -- Wire key: @options@.
    -- Checked when planning a request: 1 to 12 elements.
    options :: [InputPollOption]
  , -- | True, if the poll needs to be anonymous, defaults to True
    --
    -- Wire key: @is_anonymous@.
    -- Omitted from an encoded request when it is @Nothing@.
    is_anonymous :: Maybe Bool
  , -- | Poll type, \"quiz\" or \"regular\", defaults to \"regular\"
    --
    -- Wire key: @type@.
    -- Omitted from an encoded request when it is @Nothing@.
    type_ :: Maybe Text
  , -- | Pass True if the poll allows multiple answers, defaults to False
    --
    -- Wire key: @allows_multiple_answers@.
    -- Omitted from an encoded request when it is @Nothing@.
    allows_multiple_answers :: Maybe Bool
  , -- | Pass True if the poll allows to change chosen answer options, defaults to False for quizzes and to True for regular polls
    --
    -- Wire key: @allows_revoting@.
    -- Omitted from an encoded request when it is @Nothing@.
    allows_revoting :: Maybe Bool
  , -- | Pass True if the poll options must be shown in random order
    --
    -- Wire key: @shuffle_options@.
    -- Omitted from an encoded request when it is @Nothing@.
    shuffle_options :: Maybe Bool
  , -- | Pass True if answer options can be added to the poll after creation; not supported for anonymous polls and quizzes
    --
    -- Wire key: @allow_adding_options@.
    -- Omitted from an encoded request when it is @Nothing@.
    allow_adding_options :: Maybe Bool
  , -- | Pass True if poll results must be shown only after the poll closes
    --
    -- Wire key: @hide_results_until_closes@.
    -- Omitted from an encoded request when it is @Nothing@.
    hide_results_until_closes :: Maybe Bool
  , -- | Pass True if voting is limited to users who have been members of the chat where the poll is being sent for more than 24 hours; for channel chats only
    --
    -- Wire key: @members_only@.
    -- Omitted from an encoded request when it is @Nothing@.
    members_only :: Maybe Bool
  , -- | A JSON-serialized list of 0-12 two-letter ISO 3166-1 alpha-2 country codes indicating the countries from which users can vote in the poll; for channel chats only. Use \"FT\" as a country code to allow users with anonymous numbers to vote. If omitted or empty, then users from any country can participate in the poll.
    --
    -- Wire key: @country_codes@.
    -- Omitted from an encoded request when it is @Nothing@.
    -- Checked when planning a request: at most 12 element(s).
    country_codes :: Maybe [Text]
  , -- | A JSON-serialized list of monotonically increasing 0-based identifiers of the correct answer options, required for polls in quiz mode
    --
    -- Wire key: @correct_option_ids@.
    -- Omitted from an encoded request when it is @Nothing@.
    correct_option_ids :: Maybe [Int64]
  , -- | Text that is shown when a user chooses an incorrect answer or taps on the lamp icon in a quiz-style poll, 0-200 characters with at most 2 line feeds after entities parsing
    --
    -- Wire key: @explanation@.
    -- Omitted from an encoded request when it is @Nothing@.
    explanation :: Maybe Text
  , -- | Mode for parsing entities in the explanation. See formatting options for more details.
    --
    -- Wire key: @explanation_parse_mode@.
    -- Omitted from an encoded request when it is @Nothing@.
    explanation_parse_mode :: Maybe Text
  , -- | A JSON-serialized list of special entities that appear in the poll explanation. It can be specified instead of explanation_parse_mode.
    --
    -- Wire key: @explanation_entities@.
    -- Omitted from an encoded request when it is @Nothing@.
    explanation_entities :: Maybe [MessageEntity]
  , -- | Media added to the quiz explanation
    --
    -- Wire key: @explanation_media@.
    -- Omitted from an encoded request when it is @Nothing@.
    explanation_media :: Maybe InputPollMedia
  , -- | Amount of time in seconds the poll will be active after creation, 5-2628000. Can\'t be used together with close_date.
    --
    -- Wire key: @open_period@.
    -- Omitted from an encoded request when it is @Nothing@.
    open_period :: Maybe Int64
  , -- | Point in time (Unix timestamp) when the poll will be automatically closed. Must be at least 5 and no more than 2628000 seconds in the future. Can\'t be used together with open_period.
    --
    -- Wire key: @close_date@.
    -- Omitted from an encoded request when it is @Nothing@.
    close_date :: Maybe Int64
  , -- | Pass True if the poll needs to be immediately closed. This can be useful for poll preview.
    --
    -- Wire key: @is_closed@.
    -- Omitted from an encoded request when it is @Nothing@.
    is_closed :: Maybe Bool
  , -- | Description of the poll to be sent, 0-1024 characters after entities parsing
    --
    -- Wire key: @description@.
    -- Omitted from an encoded request when it is @Nothing@.
    description :: Maybe Text
  , -- | Mode for parsing entities in the poll description. See formatting options for more details.
    --
    -- Wire key: @description_parse_mode@.
    -- Omitted from an encoded request when it is @Nothing@.
    description_parse_mode :: Maybe Text
  , -- | A JSON-serialized list of special entities that appear in the poll description, which can be specified instead of description_parse_mode
    --
    -- Wire key: @description_entities@.
    -- Omitted from an encoded request when it is @Nothing@.
    description_entities :: Maybe [MessageEntity]
  , -- | Media added to the poll description
    --
    -- Wire key: @media@.
    -- Omitted from an encoded request when it is @Nothing@.
    media :: Maybe InputPollMedia
  , -- | Sends the message silently. Users will receive a notification with no sound.
    --
    -- Wire key: @disable_notification@.
    -- Omitted from an encoded request when it is @Nothing@.
    disable_notification :: Maybe Bool
  , -- | Protects the contents of the sent message from forwarding and saving
    --
    -- Wire key: @protect_content@.
    -- Omitted from an encoded request when it is @Nothing@.
    protect_content :: Maybe Bool
  , -- | Pass True to allow up to 1000 messages per second, ignoring broadcasting limits for a fee of 0.1 Telegram Stars per message. The relevant Stars will be withdrawn from the bot\'s balance.
    --
    -- Wire key: @allow_paid_broadcast@.
    -- Omitted from an encoded request when it is @Nothing@.
    allow_paid_broadcast :: Maybe Bool
  , -- | Unique identifier of the message effect to be added to the message; for private chats only
    --
    -- Wire key: @message_effect_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    message_effect_id :: Maybe Text
  , -- | Description of the message to reply to
    --
    -- Wire key: @reply_parameters@.
    -- Omitted from an encoded request when it is @Nothing@.
    reply_parameters :: Maybe ReplyParameters
  , -- | Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove a reply keyboard or to force a reply from the user.
    --
    -- Wire key: @reply_markup@.
    -- Omitted from an encoded request when it is @Nothing@.
    reply_markup :: Maybe ReplyMarkup
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SendPoll' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSendPoll :: IntegerOrString -> Text -> [InputPollOption] -> SendPoll
mkSendPoll arg0 arg1 arg2 =
  MkSendPoll
    { business_connection_id = Nothing
    , chat_id = arg0
    , message_thread_id = Nothing
    , question = arg1
    , question_parse_mode = Nothing
    , question_entities = Nothing
    , options = arg2
    , is_anonymous = Nothing
    , type_ = Nothing
    , allows_multiple_answers = Nothing
    , allows_revoting = Nothing
    , shuffle_options = Nothing
    , allow_adding_options = Nothing
    , hide_results_until_closes = Nothing
    , members_only = Nothing
    , country_codes = Nothing
    , correct_option_ids = Nothing
    , explanation = Nothing
    , explanation_parse_mode = Nothing
    , explanation_entities = Nothing
    , explanation_media = Nothing
    , open_period = Nothing
    , close_date = Nothing
    , is_closed = Nothing
    , description = Nothing
    , description_parse_mode = Nothing
    , description_entities = Nothing
    , media = Nothing
    , disable_notification = Nothing
    , protect_content = Nothing
    , allow_paid_broadcast = Nothing
    , message_effect_id = Nothing
    , reply_parameters = Nothing
    , reply_markup = Nothing
    , extra = mempty
    }

instance Method SendPoll where
  type Result SendPoll = Message
  methodName _ = "sendPoll"
  planRequest x =
    planRequestBody
      "sendPoll"
      [ "business_connection_id"
      , "chat_id"
      , "message_thread_id"
      , "question"
      , "question_parse_mode"
      , "question_entities"
      , "options"
      , "is_anonymous"
      , "type"
      , "allows_multiple_answers"
      , "allows_revoting"
      , "shuffle_options"
      , "allow_adding_options"
      , "hide_results_until_closes"
      , "members_only"
      , "country_codes"
      , "correct_option_ids"
      , "explanation"
      , "explanation_parse_mode"
      , "explanation_entities"
      , "explanation_media"
      , "open_period"
      , "close_date"
      , "is_closed"
      , "description"
      , "description_parse_mode"
      , "description_entities"
      , "media"
      , "disable_notification"
      , "protect_content"
      , "allow_paid_broadcast"
      , "message_effect_id"
      , "reply_parameters"
      , "reply_markup"
      ]
      ( concat
          [ plannedMaybe "business_connection_id" x.business_connection_id encodeJson
          , planned "chat_id" (encodeJson x.chat_id)
          , plannedMaybe "message_thread_id" x.message_thread_id encodeJson
          , planned "question" (encodeJson x.question)
          , plannedMaybe "question_parse_mode" x.question_parse_mode encodeJson
          , plannedMaybe "question_entities" x.question_entities (planList encodeJson)
          , planned "options" (withValidation (\loc_ -> validateArrayCount (Just 1) (Just 12) loc_ x.options) ((planList planInputPollOption) x.options))
          , plannedMaybe "is_anonymous" x.is_anonymous encodeJson
          , plannedMaybe "type" x.type_ encodeJson
          , plannedMaybe "allows_multiple_answers" x.allows_multiple_answers encodeJson
          , plannedMaybe "allows_revoting" x.allows_revoting encodeJson
          , plannedMaybe "shuffle_options" x.shuffle_options encodeJson
          , plannedMaybe "allow_adding_options" x.allow_adding_options encodeJson
          , plannedMaybe "hide_results_until_closes" x.hide_results_until_closes encodeJson
          , plannedMaybe "members_only" x.members_only encodeJson
          , plannedMaybe "country_codes" x.country_codes (\v_ -> withValidation (\loc_ -> validateArrayCount Nothing (Just 12) loc_ v_) ((planList encodeJson) v_))
          , plannedMaybe "correct_option_ids" x.correct_option_ids (planList encodeJson)
          , plannedMaybe "explanation" x.explanation encodeJson
          , plannedMaybe "explanation_parse_mode" x.explanation_parse_mode encodeJson
          , plannedMaybe "explanation_entities" x.explanation_entities (planList encodeJson)
          , plannedMaybe "explanation_media" x.explanation_media planInputPollMedia
          , plannedMaybe "open_period" x.open_period encodeJson
          , plannedMaybe "close_date" x.close_date encodeJson
          , plannedMaybe "is_closed" x.is_closed encodeJson
          , plannedMaybe "description" x.description encodeJson
          , plannedMaybe "description_parse_mode" x.description_parse_mode encodeJson
          , plannedMaybe "description_entities" x.description_entities (planList encodeJson)
          , plannedMaybe "media" x.media planInputPollMedia
          , plannedMaybe "disable_notification" x.disable_notification encodeJson
          , plannedMaybe "protect_content" x.protect_content encodeJson
          , plannedMaybe "allow_paid_broadcast" x.allow_paid_broadcast encodeJson
          , plannedMaybe "message_effect_id" x.message_effect_id encodeJson
          , plannedMaybe "reply_parameters" x.reply_parameters encodeJson
          , plannedMaybe "reply_markup" x.reply_markup encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
