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
module Telegram.Bot.Methods.SendVideo
  ( SendVideo (..)
  , mkSendVideo
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.ChecklistTasksAdded (Message)
import Telegram.Bot.Internal.Group.EphemeralMessageParameters (EphemeralMessageParameters)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Internal.Group.MessageEntity (MessageEntity)
import Telegram.Bot.Internal.Group.ReplyMarkup (ReplyMarkup)
import Telegram.Bot.Internal.Group.ReplyParameters (ReplyParameters)
import Telegram.Bot.Internal.Group.SuggestedPostParameters (SuggestedPostParameters)
import Telegram.Bot.Support (FileCapability (..), InputFile, Method (..), encodeJson, filePolicy, planFileValue, planList, planRequestBody, planned, plannedMaybe)

-- | Use this method to send video files, Telegram clients support MPEG4 videos (other formats may be sent as Document). On success, the sent Message is returned. Bots can currently send video files of up to 50 MB in size, this limit may be changed in the future.
--
-- Wire method spelling: @sendVideo@.
--
-- Source: <https://core.telegram.org/bots/api#sendvideo>.
-- Result: @Message@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SendVideo = MkSendVideo
  { -- | Unique identifier of the business connection on behalf of which the message will be sent
    --
    -- Wire key: @business_connection_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    business_connection_id :: Maybe Text
  , -- | Unique identifier for the target chat or username of the target bot, supergroup or channel in the format \@username
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | Unique identifier for the target message thread (topic) of a forum; for forum supergroups and private chats of bots with forum topic mode enabled only
    --
    -- Wire key: @message_thread_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    message_thread_id :: Maybe Int64
  , -- | Identifier of the direct messages topic to which the message will be sent; required if the message is sent to a direct messages chat
    --
    -- Wire key: @direct_messages_topic_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    direct_messages_topic_id :: Maybe Int64
  , -- | A JSON-serialized object containing the parameters of the ephemeral message to send
    --
    -- Wire key: @ephemeral_message_parameters@.
    -- Omitted from an encoded request when it is @Nothing@.
    ephemeral_message_parameters :: Maybe EphemeralMessageParameters
  , -- | Video to send. Pass a file_id as String to send a video that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get a video from the Internet, or upload a new video using multipart\/form-data. More information on Sending Files: https:\/\/core.telegram.org\/bots\/api\#sending-files
    --
    -- Wire key: @video@.
    -- File sources accepted here: @existing_file@, @http_url@, @upload@.
    video :: InputFile
  , -- | Duration of sent video in seconds
    --
    -- Wire key: @duration@.
    -- Omitted from an encoded request when it is @Nothing@.
    duration :: Maybe Int64
  , -- | Video width
    --
    -- Wire key: @width@.
    -- Omitted from an encoded request when it is @Nothing@.
    width :: Maybe Int64
  , -- | Video height
    --
    -- Wire key: @height@.
    -- Omitted from an encoded request when it is @Nothing@.
    height :: Maybe Int64
  , -- | Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail\'s width and height should not exceed 320. Ignored if the file is not uploaded using multipart\/form-data. Thumbnails can\'t be reused and can be only uploaded as a new file, so you can pass \"attach:\/\/\<file_attach_name\>\" if the thumbnail was uploaded using multipart\/form-data under \<file_attach_name\>. More information on Sending Files: https:\/\/core.telegram.org\/bots\/api\#sending-files
    --
    -- Wire key: @thumbnail@.
    -- Omitted from an encoded request when it is @Nothing@.
    -- File sources accepted here: @upload@.
    thumbnail :: Maybe InputFile
  , -- | Cover for the video in the message. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass \"attach:\/\/\<file_attach_name\>\" to upload a new one using multipart\/form-data under \<file_attach_name\> name. More information on Sending Files: https:\/\/core.telegram.org\/bots\/api\#sending-files
    --
    -- Wire key: @cover@.
    -- Omitted from an encoded request when it is @Nothing@.
    -- File sources accepted here: @existing_file@, @http_url@, @upload@.
    cover :: Maybe InputFile
  , -- | Start timestamp for the video in the message
    --
    -- Wire key: @start_timestamp@.
    -- Omitted from an encoded request when it is @Nothing@.
    start_timestamp :: Maybe Int64
  , -- | Video caption (may also be used when resending videos by file_id), 0-1024 characters after entities parsing
    --
    -- Wire key: @caption@.
    -- Omitted from an encoded request when it is @Nothing@.
    caption :: Maybe Text
  , -- | Mode for parsing entities in the video caption. See formatting options for more details.
    --
    -- Wire key: @parse_mode@.
    -- Omitted from an encoded request when it is @Nothing@.
    parse_mode :: Maybe Text
  , -- | A JSON-serialized list of special entities that appear in the caption, which can be specified instead of parse_mode
    --
    -- Wire key: @caption_entities@.
    -- Omitted from an encoded request when it is @Nothing@.
    caption_entities :: Maybe [MessageEntity]
  , -- | Pass True if the caption must be shown above the message media
    --
    -- Wire key: @show_caption_above_media@.
    -- Omitted from an encoded request when it is @Nothing@.
    show_caption_above_media :: Maybe Bool
  , -- | Pass True if the video needs to be covered with a spoiler animation
    --
    -- Wire key: @has_spoiler@.
    -- Omitted from an encoded request when it is @Nothing@.
    has_spoiler :: Maybe Bool
  , -- | Pass True if the uploaded video is suitable for streaming
    --
    -- Wire key: @supports_streaming@.
    -- Omitted from an encoded request when it is @Nothing@.
    supports_streaming :: Maybe Bool
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
  , -- | A JSON-serialized object containing the parameters of the suggested post to send; for direct messages chats only. If the message is sent as a reply to another suggested post, then that suggested post is automatically declined.
    --
    -- Wire key: @suggested_post_parameters@.
    -- Omitted from an encoded request when it is @Nothing@.
    suggested_post_parameters :: Maybe SuggestedPostParameters
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

-- | Initialize a 'SendVideo' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSendVideo :: IntegerOrString -> InputFile -> SendVideo
mkSendVideo arg0 arg1 =
  MkSendVideo
    { business_connection_id = Nothing
    , chat_id = arg0
    , message_thread_id = Nothing
    , direct_messages_topic_id = Nothing
    , ephemeral_message_parameters = Nothing
    , video = arg1
    , duration = Nothing
    , width = Nothing
    , height = Nothing
    , thumbnail = Nothing
    , cover = Nothing
    , start_timestamp = Nothing
    , caption = Nothing
    , parse_mode = Nothing
    , caption_entities = Nothing
    , show_caption_above_media = Nothing
    , has_spoiler = Nothing
    , supports_streaming = Nothing
    , disable_notification = Nothing
    , protect_content = Nothing
    , allow_paid_broadcast = Nothing
    , message_effect_id = Nothing
    , suggested_post_parameters = Nothing
    , reply_parameters = Nothing
    , reply_markup = Nothing
    , extra = mempty
    }

instance Method SendVideo where
  type Result SendVideo = Message
  methodName _ = "sendVideo"
  planRequest x =
    planRequestBody
      "sendVideo"
      [ "business_connection_id"
      , "chat_id"
      , "message_thread_id"
      , "direct_messages_topic_id"
      , "ephemeral_message_parameters"
      , "video"
      , "duration"
      , "width"
      , "height"
      , "thumbnail"
      , "cover"
      , "start_timestamp"
      , "caption"
      , "parse_mode"
      , "caption_entities"
      , "show_caption_above_media"
      , "has_spoiler"
      , "supports_streaming"
      , "disable_notification"
      , "protect_content"
      , "allow_paid_broadcast"
      , "message_effect_id"
      , "suggested_post_parameters"
      , "reply_parameters"
      , "reply_markup"
      ]
      ( concat
          [ plannedMaybe "business_connection_id" x.business_connection_id encodeJson
          , planned "chat_id" (encodeJson x.chat_id)
          , plannedMaybe "message_thread_id" x.message_thread_id encodeJson
          , plannedMaybe "direct_messages_topic_id" x.direct_messages_topic_id encodeJson
          , plannedMaybe "ephemeral_message_parameters" x.ephemeral_message_parameters encodeJson
          , planned "video" ((planFileValue (filePolicy [ExistingFileCapability, HttpUrlCapability, UploadCapability])) x.video)
          , plannedMaybe "duration" x.duration encodeJson
          , plannedMaybe "width" x.width encodeJson
          , plannedMaybe "height" x.height encodeJson
          , plannedMaybe "thumbnail" x.thumbnail (planFileValue (filePolicy [UploadCapability]))
          , plannedMaybe "cover" x.cover (planFileValue (filePolicy [ExistingFileCapability, HttpUrlCapability, UploadCapability]))
          , plannedMaybe "start_timestamp" x.start_timestamp encodeJson
          , plannedMaybe "caption" x.caption encodeJson
          , plannedMaybe "parse_mode" x.parse_mode encodeJson
          , plannedMaybe "caption_entities" x.caption_entities (planList encodeJson)
          , plannedMaybe "show_caption_above_media" x.show_caption_above_media encodeJson
          , plannedMaybe "has_spoiler" x.has_spoiler encodeJson
          , plannedMaybe "supports_streaming" x.supports_streaming encodeJson
          , plannedMaybe "disable_notification" x.disable_notification encodeJson
          , plannedMaybe "protect_content" x.protect_content encodeJson
          , plannedMaybe "allow_paid_broadcast" x.allow_paid_broadcast encodeJson
          , plannedMaybe "message_effect_id" x.message_effect_id encodeJson
          , plannedMaybe "suggested_post_parameters" x.suggested_post_parameters encodeJson
          , plannedMaybe "reply_parameters" x.reply_parameters encodeJson
          , plannedMaybe "reply_markup" x.reply_markup encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
