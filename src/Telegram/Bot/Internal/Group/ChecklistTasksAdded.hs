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
module Telegram.Bot.Internal.Group.ChecklistTasksAdded
  ( ChecklistTasksAdded (..)
  , ChecklistTasksDone (..)
  , GiveawayCompleted (..)
  , MaybeInaccessibleMessage (..)
  , Message (..)
  , PollOptionAdded (..)
  , PollOptionDeleted (..)
  , SuggestedPostApprovalFailed (..)
  , SuggestedPostApproved (..)
  , SuggestedPostDeclined (..)
  , SuggestedPostPaid (..)
  , SuggestedPostRefunded (..)
  , mkChecklistTasksAdded
  , mkChecklistTasksDone
  , mkGiveawayCompleted
  , mkMessage
  , mkPollOptionAdded
  , mkPollOptionDeleted
  , mkSuggestedPostApprovalFailed
  , mkSuggestedPostApproved
  , mkSuggestedPostDeclined
  , mkSuggestedPostPaid
  , mkSuggestedPostRefunded
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.Animation (Animation)
import Telegram.Bot.Internal.Group.Audio (Audio)
import Telegram.Bot.Internal.Group.Chat (Chat)
import Telegram.Bot.Internal.Group.ChatBackground (ChatBackground)
import Telegram.Bot.Internal.Group.ChatBoostAdded (ChatBoostAdded)
import Telegram.Bot.Internal.Group.ChatOwnerChanged (ChatOwnerChanged)
import Telegram.Bot.Internal.Group.ChatOwnerLeft (ChatOwnerLeft)
import Telegram.Bot.Internal.Group.ChatShared (ChatShared)
import Telegram.Bot.Internal.Group.Checklist (Checklist)
import Telegram.Bot.Internal.Group.ChecklistTask (ChecklistTask)
import Telegram.Bot.Internal.Group.CommunityChatAdded (CommunityChatAdded)
import Telegram.Bot.Internal.Group.CommunityChatJoined (CommunityChatJoined)
import Telegram.Bot.Internal.Group.CommunityChatRemoved (CommunityChatRemoved)
import Telegram.Bot.Internal.Group.Contact (Contact)
import Telegram.Bot.Internal.Group.Dice (Dice)
import Telegram.Bot.Internal.Group.DirectMessagePriceChanged (DirectMessagePriceChanged)
import Telegram.Bot.Internal.Group.DirectMessagesTopic (DirectMessagesTopic)
import Telegram.Bot.Internal.Group.Document (Document)
import Telegram.Bot.Internal.Group.ExternalReplyInfo (ExternalReplyInfo)
import Telegram.Bot.Internal.Group.ForumTopicClosed (ForumTopicClosed)
import Telegram.Bot.Internal.Group.ForumTopicCreated (ForumTopicCreated)
import Telegram.Bot.Internal.Group.ForumTopicEdited (ForumTopicEdited)
import Telegram.Bot.Internal.Group.ForumTopicReopened (ForumTopicReopened)
import Telegram.Bot.Internal.Group.Game (Game)
import Telegram.Bot.Internal.Group.GeneralForumTopicHidden (GeneralForumTopicHidden)
import Telegram.Bot.Internal.Group.GeneralForumTopicUnhidden (GeneralForumTopicUnhidden)
import Telegram.Bot.Internal.Group.GiftInfo (GiftInfo)
import Telegram.Bot.Internal.Group.Giveaway (Giveaway)
import Telegram.Bot.Internal.Group.GiveawayCreated (GiveawayCreated)
import Telegram.Bot.Internal.Group.GiveawayWinners (GiveawayWinners)
import Telegram.Bot.Internal.Group.InaccessibleMessage (InaccessibleMessage)
import Telegram.Bot.Internal.Group.InlineKeyboardMarkup (InlineKeyboardMarkup)
import Telegram.Bot.Internal.Group.Invoice (Invoice)
import Telegram.Bot.Internal.Group.LinkPreviewOptions (LinkPreviewOptions)
import Telegram.Bot.Internal.Group.LivePhoto (LivePhoto)
import Telegram.Bot.Internal.Group.Location (Location)
import Telegram.Bot.Internal.Group.ManagedBotCreated (ManagedBotCreated)
import Telegram.Bot.Internal.Group.MessageAutoDeleteTimerChanged (MessageAutoDeleteTimerChanged)
import Telegram.Bot.Internal.Group.MessageEntity (MessageEntity)
import Telegram.Bot.Internal.Group.MessageOrigin (MessageOrigin)
import Telegram.Bot.Internal.Group.PaidMediaInfo (PaidMediaInfo)
import Telegram.Bot.Internal.Group.PaidMessagePriceChanged (PaidMessagePriceChanged)
import Telegram.Bot.Internal.Group.PassportData (PassportData)
import Telegram.Bot.Internal.Group.PhotoSize (PhotoSize)
import Telegram.Bot.Internal.Group.Poll (Poll)
import Telegram.Bot.Internal.Group.ProximityAlertTriggered (ProximityAlertTriggered)
import Telegram.Bot.Internal.Group.RefundedPayment (RefundedPayment)
import Telegram.Bot.Internal.Group.RichMessage (RichMessage)
import Telegram.Bot.Internal.Group.StarAmount (StarAmount)
import Telegram.Bot.Internal.Group.Sticker (Sticker)
import Telegram.Bot.Internal.Group.Story (Story)
import Telegram.Bot.Internal.Group.SuccessfulPayment (SuccessfulPayment)
import Telegram.Bot.Internal.Group.SuggestedPostInfo (SuggestedPostInfo)
import Telegram.Bot.Internal.Group.SuggestedPostPrice (SuggestedPostPrice)
import Telegram.Bot.Internal.Group.TextQuote (TextQuote)
import Telegram.Bot.Internal.Group.UniqueGiftInfo (UniqueGiftInfo)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Internal.Group.UsersShared (UsersShared)
import Telegram.Bot.Internal.Group.Venue (Venue)
import Telegram.Bot.Internal.Group.Video (Video)
import Telegram.Bot.Internal.Group.VideoChatEnded (VideoChatEnded)
import Telegram.Bot.Internal.Group.VideoChatParticipantsInvited (VideoChatParticipantsInvited)
import Telegram.Bot.Internal.Group.VideoChatScheduled (VideoChatScheduled)
import Telegram.Bot.Internal.Group.VideoChatStarted (VideoChatStarted)
import Telegram.Bot.Internal.Group.VideoNote (VideoNote)
import Telegram.Bot.Internal.Group.Voice (Voice)
import Telegram.Bot.Internal.Group.WebAppData (WebAppData)
import Telegram.Bot.Internal.Group.WriteAccessAllowed (WriteAccessAllowed)
import Telegram.Bot.Support (int64Field, jsonField, jsonFlag, jsonObject, jsonOptional, optionalTrueFlag, optionalWith, parseInt64, parseList, requiredWith)

-- | Describes a service message about tasks added to a checklist.
--
-- Source: <https://core.telegram.org/bots/api#checklisttasksadded>.
-- Codec directions: decoded from responses, encoded into requests.
data ChecklistTasksAdded = MkChecklistTasksAdded
  { -- | Optional. Message containing the checklist to which the tasks were added. Note that the Message object in this field will not contain the reply_to_message field even if it itself is a reply.
    --
    -- Wire key: @checklist_message@.
    -- Omitted from an encoded request when it is @Nothing@.
    checklist_message :: Maybe Message
  , -- | List of tasks added to the checklist
    --
    -- Wire key: @tasks@.
    tasks :: [ChecklistTask]
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ChecklistTasksAdded' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkChecklistTasksAdded :: [ChecklistTask] -> ChecklistTasksAdded
mkChecklistTasksAdded arg0 =
  MkChecklistTasksAdded
    { checklist_message = Nothing
    , tasks = arg0
    }

instance FromJSON ChecklistTasksAdded where
  parseJSON = withObject "ChecklistTasksAdded" $ \obj ->
    do
      field_0 <- optionalWith obj "checklist_message" parseJSON
      field_1 <- requiredWith obj "tasks" (parseList parseJSON)
      pure
        MkChecklistTasksAdded
          { checklist_message = field_0
          , tasks = field_1
          }

instance ToJSON ChecklistTasksAdded where
  toJSON x =
    jsonObject
      ( concat
          [ jsonOptional "checklist_message" x.checklist_message
          , jsonField "tasks" x.tasks
          ]
      )
  toEncoding = toEncoding . toJSON

-- | Describes a service message about checklist tasks marked as done or not done.
--
-- Source: <https://core.telegram.org/bots/api#checklisttasksdone>.
-- Codec directions: decoded from responses, encoded into requests.
data ChecklistTasksDone = MkChecklistTasksDone
  { -- | Optional. Message containing the checklist whose tasks were marked as done or not done. Note that the Message object in this field will not contain the reply_to_message field even if it itself is a reply.
    --
    -- Wire key: @checklist_message@.
    -- Omitted from an encoded request when it is @Nothing@.
    checklist_message :: Maybe Message
  , -- | Optional. Identifiers of the tasks that were marked as done
    --
    -- Wire key: @marked_as_done_task_ids@.
    -- Omitted from an encoded request when it is @Nothing@.
    marked_as_done_task_ids :: Maybe [Int64]
  , -- | Optional. Identifiers of the tasks that were marked as not done
    --
    -- Wire key: @marked_as_not_done_task_ids@.
    -- Omitted from an encoded request when it is @Nothing@.
    marked_as_not_done_task_ids :: Maybe [Int64]
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ChecklistTasksDone' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkChecklistTasksDone :: ChecklistTasksDone
mkChecklistTasksDone =
  MkChecklistTasksDone
    { checklist_message = Nothing
    , marked_as_done_task_ids = Nothing
    , marked_as_not_done_task_ids = Nothing
    }

instance FromJSON ChecklistTasksDone where
  parseJSON = withObject "ChecklistTasksDone" $ \obj ->
    do
      field_0 <- optionalWith obj "checklist_message" parseJSON
      field_1 <- optionalWith obj "marked_as_done_task_ids" (parseList parseInt64)
      field_2 <- optionalWith obj "marked_as_not_done_task_ids" (parseList parseInt64)
      pure
        MkChecklistTasksDone
          { checklist_message = field_0
          , marked_as_done_task_ids = field_1
          , marked_as_not_done_task_ids = field_2
          }

instance ToJSON ChecklistTasksDone where
  toJSON x =
    jsonObject
      ( concat
          [ jsonOptional "checklist_message" x.checklist_message
          , jsonOptional "marked_as_done_task_ids" x.marked_as_done_task_ids
          , jsonOptional "marked_as_not_done_task_ids" x.marked_as_not_done_task_ids
          ]
      )
  toEncoding = toEncoding . toJSON

-- | This object represents a service message about the completion of a giveaway without public winners.
--
-- Source: <https://core.telegram.org/bots/api#giveawaycompleted>.
-- Codec directions: decoded from responses, encoded into requests.
data GiveawayCompleted = MkGiveawayCompleted
  { -- | Number of winners in the giveaway
    --
    -- Wire key: @winner_count@.
    winner_count :: Int64
  , -- | Optional. Number of undistributed prizes
    --
    -- Wire key: @unclaimed_prize_count@.
    -- Omitted from an encoded request when it is @Nothing@.
    unclaimed_prize_count :: Maybe Int64
  , -- | Optional. Message with the giveaway that was completed, if it wasn\'t deleted
    --
    -- Wire key: @giveaway_message@.
    -- Omitted from an encoded request when it is @Nothing@.
    giveaway_message :: Maybe Message
  , -- | Optional. True, if the giveaway is a Telegram Star giveaway. Otherwise, currently, the giveaway is a Telegram Premium giveaway.
    --
    -- Wire key: @is_star_giveaway@.
    -- Omitted from an encoded request when it is @False@.
    is_star_giveaway :: Bool
  }
  deriving stock (Eq, Show)

-- | Initialize a 'GiveawayCompleted' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkGiveawayCompleted :: Int64 -> GiveawayCompleted
mkGiveawayCompleted arg0 =
  MkGiveawayCompleted
    { winner_count = arg0
    , unclaimed_prize_count = Nothing
    , giveaway_message = Nothing
    , is_star_giveaway = False
    }

instance FromJSON GiveawayCompleted where
  parseJSON = withObject "GiveawayCompleted" $ \obj ->
    do
      field_0 <- requiredWith obj "winner_count" parseInt64
      field_1 <- optionalWith obj "unclaimed_prize_count" parseInt64
      field_2 <- optionalWith obj "giveaway_message" parseJSON
      field_3 <- optionalTrueFlag obj "is_star_giveaway"
      pure
        MkGiveawayCompleted
          { winner_count = field_0
          , unclaimed_prize_count = field_1
          , giveaway_message = field_2
          , is_star_giveaway = field_3
          }

instance ToJSON GiveawayCompleted where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "winner_count" x.winner_count
          , jsonOptional "unclaimed_prize_count" x.unclaimed_prize_count
          , jsonOptional "giveaway_message" x.giveaway_message
          , jsonFlag "is_star_giveaway" x.is_star_giveaway
          ]
      )
  toEncoding = toEncoding . toJSON

-- | This object describes a message that can be inaccessible to the bot. It can be one of
-- \- Message
-- \- InaccessibleMessage
--
-- Source: <https://core.telegram.org/bots/api#maybeinaccessiblemessage>.
-- Codec directions: decoded from responses, encoded into requests.
data MaybeInaccessibleMessage
  = MaybeInaccessibleMessageViaInaccessibleMessage InaccessibleMessage
  | MaybeInaccessibleMessageViaMessage Message
  | -- | A value this decoder does not recognize, preserved verbatim so
    -- the raw payload survives the boundary.
    MaybeInaccessibleMessageUnknown Value
  deriving stock (Eq, Show)

instance FromJSON MaybeInaccessibleMessage where
  parseJSON = withObject "MaybeInaccessibleMessage" $ \obj -> do
    selector_ <- int64Field obj "date"
    case selector_ of
      0 ->
        MaybeInaccessibleMessageViaInaccessibleMessage <$> parseJSON (Object obj)
      _ ->
        MaybeInaccessibleMessageViaMessage <$> parseJSON (Object obj)

instance ToJSON MaybeInaccessibleMessage where
  toJSON = \case
    MaybeInaccessibleMessageViaInaccessibleMessage member_ -> toJSON member_
    MaybeInaccessibleMessageViaMessage member_ -> toJSON member_
    MaybeInaccessibleMessageUnknown raw_ -> raw_
  toEncoding = toEncoding . toJSON

-- | This object represents a message.
--
-- Source: <https://core.telegram.org/bots/api#message>.
-- Codec directions: decoded from responses, encoded into requests.
data Message = MkMessage
  { -- | Unique message identifier inside this chat; 0 for ephemeral messages. In specific instances (e.g., a message containing a video sent to a big chat), the server might automatically schedule a message instead of sending it immediately. In such cases, this field will be 0 and the relevant message will be unusable until it is actually sent.
    --
    -- Wire key: @message_id@.
    message_id :: Int64
  , -- | Optional. Unique identifier of a message thread or forum topic to which the message belongs; for supergroups and private chats only
    --
    -- Wire key: @message_thread_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    message_thread_id :: Maybe Int64
  , -- | Optional. Information about the direct messages chat topic that contains the message
    --
    -- Wire key: @direct_messages_topic@.
    -- Omitted from an encoded request when it is @Nothing@.
    direct_messages_topic :: Maybe DirectMessagesTopic
  , -- | Optional. Sender of the message; may be empty for messages sent to channels. For backward compatibility, if the message was sent on behalf of a chat, the field contains a fake sender user in non-channel chats.
    --
    -- Wire key: @from@.
    -- Omitted from an encoded request when it is @Nothing@.
    from :: Maybe User
  , -- | Optional. Sender of the message when sent on behalf of a chat. For example, the supergroup itself for messages sent by its anonymous administrators or a linked channel for messages automatically forwarded to the channel\'s discussion group. For backward compatibility, if the message was sent on behalf of a chat, the field from contains a fake sender user in non-channel chats.
    --
    -- Wire key: @sender_chat@.
    -- Omitted from an encoded request when it is @Nothing@.
    sender_chat :: Maybe Chat
  , -- | Optional. If the sender of the message boosted the chat, the number of boosts added by the user
    --
    -- Wire key: @sender_boost_count@.
    -- Omitted from an encoded request when it is @Nothing@.
    sender_boost_count :: Maybe Int64
  , -- | Optional. The bot that actually sent the message on behalf of the business account. Available only for outgoing messages sent on behalf of the connected business account.
    --
    -- Wire key: @sender_business_bot@.
    -- Omitted from an encoded request when it is @Nothing@.
    sender_business_bot :: Maybe User
  , -- | Optional. Tag or custom title of the sender of the message; for supergroups only
    --
    -- Wire key: @sender_tag@.
    -- Omitted from an encoded request when it is @Nothing@.
    sender_tag :: Maybe Text
  , -- | Optional. For ephemeral messages, the user who received the message
    --
    -- Wire key: @receiver_user@.
    -- Omitted from an encoded request when it is @Nothing@.
    receiver_user :: Maybe User
  , -- | Optional. For ephemeral messages, identifier of the ephemeral message inside this chat. The identifier may be reused for another ephemeral message after the message is deleted or expires.
    --
    -- Wire key: @ephemeral_message_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    ephemeral_message_id :: Maybe Int64
  , -- | Date the message was sent in Unix time. It is always a positive number, representing a valid date.
    --
    -- Wire key: @date@.
    date :: Int64
  , -- | Optional. The unique identifier for the guest query. Use this identifier with the method answerGuestQuery to send a response message. If non-empty, the message belongs to the chat where the guest bot was summoned, which may not coincide with other existing bot chats sharing the same identifier.
    --
    -- Wire key: @guest_query_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    guest_query_id :: Maybe Text
  , -- | Optional. Unique identifier of the business connection from which the message was received. If non-empty, the message belongs to a chat of the corresponding business account that is independent from any potential bot chat which might share the same identifier.
    --
    -- Wire key: @business_connection_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    business_connection_id :: Maybe Text
  , -- | Chat the message belongs to
    --
    -- Wire key: @chat@.
    chat :: Chat
  , -- | Optional. Information about the original message for forwarded messages
    --
    -- Wire key: @forward_origin@.
    -- Omitted from an encoded request when it is @Nothing@.
    forward_origin :: Maybe MessageOrigin
  , -- | Optional. True, if the message is sent to a topic in a forum supergroup or a private chat with the bot
    --
    -- Wire key: @is_topic_message@.
    -- Omitted from an encoded request when it is @False@.
    is_topic_message :: Bool
  , -- | Optional. True, if the message is a channel post that was automatically forwarded to the connected discussion group
    --
    -- Wire key: @is_automatic_forward@.
    -- Omitted from an encoded request when it is @False@.
    is_automatic_forward :: Bool
  , -- | Optional. For replies in the same chat and message thread, the original message. Note that the Message object in this field will not contain further reply_to_message fields even if it itself is a reply. If the message is a reply to an ephemeral message, then this field may be omitted.
    --
    -- Wire key: @reply_to_message@.
    -- Omitted from an encoded request when it is @Nothing@.
    reply_to_message :: Maybe Message
  , -- | Optional. Information about the message that is being replied to, which may come from another chat or forum topic
    --
    -- Wire key: @external_reply@.
    -- Omitted from an encoded request when it is @Nothing@.
    external_reply :: Maybe ExternalReplyInfo
  , -- | Optional. For replies that quote part of the original message, the quoted part of the message
    --
    -- Wire key: @quote@.
    -- Omitted from an encoded request when it is @Nothing@.
    quote :: Maybe TextQuote
  , -- | Optional. For replies to a story, the original story
    --
    -- Wire key: @reply_to_story@.
    -- Omitted from an encoded request when it is @Nothing@.
    reply_to_story :: Maybe Story
  , -- | Optional. Identifier of the specific checklist task that is being replied to
    --
    -- Wire key: @reply_to_checklist_task_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    reply_to_checklist_task_id :: Maybe Int64
  , -- | Optional. Persistent identifier of the specific poll option that is being replied to
    --
    -- Wire key: @reply_to_poll_option_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    reply_to_poll_option_id :: Maybe Text
  , -- | Optional. Bot through which the message was sent
    --
    -- Wire key: @via_bot@.
    -- Omitted from an encoded request when it is @Nothing@.
    via_bot :: Maybe User
  , -- | Optional. For a message sent by a guest bot, this is the user whose original message triggered the bot\'s response
    --
    -- Wire key: @guest_bot_caller_user@.
    -- Omitted from an encoded request when it is @Nothing@.
    guest_bot_caller_user :: Maybe User
  , -- | Optional. For a message sent by a guest bot, this is the chat whose original message triggered the bot\'s response
    --
    -- Wire key: @guest_bot_caller_chat@.
    -- Omitted from an encoded request when it is @Nothing@.
    guest_bot_caller_chat :: Maybe Chat
  , -- | Optional. Date the message was last edited in Unix time
    --
    -- Wire key: @edit_date@.
    -- Omitted from an encoded request when it is @Nothing@.
    edit_date :: Maybe Int64
  , -- | Optional. True, if the message can\'t be forwarded
    --
    -- Wire key: @has_protected_content@.
    -- Omitted from an encoded request when it is @False@.
    has_protected_content :: Bool
  , -- | Optional. True, if the message was sent by an implicit action, for example, as an away or a greeting business message, or as a scheduled message
    --
    -- Wire key: @is_from_offline@.
    -- Omitted from an encoded request when it is @False@.
    is_from_offline :: Bool
  , -- | Optional. True, if the message is a paid post. Note that such posts must not be deleted for 24 hours to receive the payment and can\'t be edited.
    --
    -- Wire key: @is_paid_post@.
    -- Omitted from an encoded request when it is @False@.
    is_paid_post :: Bool
  , -- | Optional. The unique identifier inside this chat of a media message group this message belongs to
    --
    -- Wire key: @media_group_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    media_group_id :: Maybe Text
  , -- | Optional. Signature of the post author for messages in channels, or the custom title of an anonymous group administrator
    --
    -- Wire key: @author_signature@.
    -- Omitted from an encoded request when it is @Nothing@.
    author_signature :: Maybe Text
  , -- | Optional. The number of Telegram Stars that were paid by the sender of the message to send it
    --
    -- Wire key: @paid_star_count@.
    -- Omitted from an encoded request when it is @Nothing@.
    paid_star_count :: Maybe Int64
  , -- | Optional. For text messages, the actual UTF-8 text of the message
    --
    -- Wire key: @text@.
    -- Omitted from an encoded request when it is @Nothing@.
    text :: Maybe Text
  , -- | Optional. For text messages, special entities like usernames, URLs, bot commands, etc. that appear in the text
    --
    -- Wire key: @entities@.
    -- Omitted from an encoded request when it is @Nothing@.
    entities :: Maybe [MessageEntity]
  , -- | Optional. Options used for link preview generation for the message, if it is a text message and link preview options were changed
    --
    -- Wire key: @link_preview_options@.
    -- Omitted from an encoded request when it is @Nothing@.
    link_preview_options :: Maybe LinkPreviewOptions
  , -- | Optional. Information about suggested post parameters if the message is a suggested post in a channel direct messages chat. If the message is an approved or declined suggested post, then it can\'t be edited.
    --
    -- Wire key: @suggested_post_info@.
    -- Omitted from an encoded request when it is @Nothing@.
    suggested_post_info :: Maybe SuggestedPostInfo
  , -- | Optional. Unique identifier of the message effect added to the message
    --
    -- Wire key: @effect_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    effect_id :: Maybe Text
  , -- | Optional. Message is a rich formatted message
    --
    -- Wire key: @rich_message@.
    -- Omitted from an encoded request when it is @Nothing@.
    rich_message :: Maybe RichMessage
  , -- | Optional. Message is an animation, information about the animation. For backward compatibility, when this field is set, the document field will also be set.
    --
    -- Wire key: @animation@.
    -- Omitted from an encoded request when it is @Nothing@.
    animation :: Maybe Animation
  , -- | Optional. Message is an audio file, information about the file
    --
    -- Wire key: @audio@.
    -- Omitted from an encoded request when it is @Nothing@.
    audio :: Maybe Audio
  , -- | Optional. Message is a general file, information about the file
    --
    -- Wire key: @document@.
    -- Omitted from an encoded request when it is @Nothing@.
    document :: Maybe Document
  , -- | Optional. Message is a live photo, information about the live photo. For backward compatibility, when this field is set, the photo field will also be set.
    --
    -- Wire key: @live_photo@.
    -- Omitted from an encoded request when it is @Nothing@.
    live_photo :: Maybe LivePhoto
  , -- | Optional. Message contains paid media; information about the paid media
    --
    -- Wire key: @paid_media@.
    -- Omitted from an encoded request when it is @Nothing@.
    paid_media :: Maybe PaidMediaInfo
  , -- | Optional. Message is a photo, available sizes of the photo
    --
    -- Wire key: @photo@.
    -- Omitted from an encoded request when it is @Nothing@.
    photo :: Maybe [PhotoSize]
  , -- | Optional. Message is a sticker, information about the sticker
    --
    -- Wire key: @sticker@.
    -- Omitted from an encoded request when it is @Nothing@.
    sticker :: Maybe Sticker
  , -- | Optional. Message is a forwarded story
    --
    -- Wire key: @story@.
    -- Omitted from an encoded request when it is @Nothing@.
    story :: Maybe Story
  , -- | Optional. Message is a video, information about the video
    --
    -- Wire key: @video@.
    -- Omitted from an encoded request when it is @Nothing@.
    video :: Maybe Video
  , -- | Optional. Message is a video note, information about the video message
    --
    -- Wire key: @video_note@.
    -- Omitted from an encoded request when it is @Nothing@.
    video_note :: Maybe VideoNote
  , -- | Optional. Message is a voice message, information about the file
    --
    -- Wire key: @voice@.
    -- Omitted from an encoded request when it is @Nothing@.
    voice :: Maybe Voice
  , -- | Optional. Caption for the animation, audio, document, paid media, photo, video or voice
    --
    -- Wire key: @caption@.
    -- Omitted from an encoded request when it is @Nothing@.
    caption :: Maybe Text
  , -- | Optional. For messages with a caption, special entities like usernames, URLs, bot commands, etc. that appear in the caption
    --
    -- Wire key: @caption_entities@.
    -- Omitted from an encoded request when it is @Nothing@.
    caption_entities :: Maybe [MessageEntity]
  , -- | Optional. True, if the caption must be shown above the message media
    --
    -- Wire key: @show_caption_above_media@.
    -- Omitted from an encoded request when it is @False@.
    show_caption_above_media :: Bool
  , -- | Optional. True, if the message media is covered by a spoiler animation
    --
    -- Wire key: @has_media_spoiler@.
    -- Omitted from an encoded request when it is @False@.
    has_media_spoiler :: Bool
  , -- | Optional. Message is a checklist
    --
    -- Wire key: @checklist@.
    -- Omitted from an encoded request when it is @Nothing@.
    checklist :: Maybe Checklist
  , -- | Optional. Message is a shared contact, information about the contact
    --
    -- Wire key: @contact@.
    -- Omitted from an encoded request when it is @Nothing@.
    contact :: Maybe Contact
  , -- | Optional. Message is a dice with random value
    --
    -- Wire key: @dice@.
    -- Omitted from an encoded request when it is @Nothing@.
    dice :: Maybe Dice
  , -- | Optional. Message is a game, information about the game. More about games: https:\/\/core.telegram.org\/bots\/api\#games
    --
    -- Wire key: @game@.
    -- Omitted from an encoded request when it is @Nothing@.
    game :: Maybe Game
  , -- | Optional. Message is a native poll, information about the poll
    --
    -- Wire key: @poll@.
    -- Omitted from an encoded request when it is @Nothing@.
    poll :: Maybe Poll
  , -- | Optional. Message is a venue, information about the venue. For backward compatibility, when this field is set, the location field will also be set.
    --
    -- Wire key: @venue@.
    -- Omitted from an encoded request when it is @Nothing@.
    venue :: Maybe Venue
  , -- | Optional. Message is a shared location, information about the location
    --
    -- Wire key: @location@.
    -- Omitted from an encoded request when it is @Nothing@.
    location :: Maybe Location
  , -- | Optional. New members that were added to the group or supergroup and information about them (the bot itself may be one of these members)
    --
    -- Wire key: @new_chat_members@.
    -- Omitted from an encoded request when it is @Nothing@.
    new_chat_members :: Maybe [User]
  , -- | Optional. A member was removed from the group, information about them (this member may be the bot itself)
    --
    -- Wire key: @left_chat_member@.
    -- Omitted from an encoded request when it is @Nothing@.
    left_chat_member :: Maybe User
  , -- | Optional. Service message: chat owner has left
    --
    -- Wire key: @chat_owner_left@.
    -- Omitted from an encoded request when it is @Nothing@.
    chat_owner_left :: Maybe ChatOwnerLeft
  , -- | Optional. Service message: chat owner has changed
    --
    -- Wire key: @chat_owner_changed@.
    -- Omitted from an encoded request when it is @Nothing@.
    chat_owner_changed :: Maybe ChatOwnerChanged
  , -- | Optional. A chat title was changed to this value
    --
    -- Wire key: @new_chat_title@.
    -- Omitted from an encoded request when it is @Nothing@.
    new_chat_title :: Maybe Text
  , -- | Optional. A chat photo was change to this value
    --
    -- Wire key: @new_chat_photo@.
    -- Omitted from an encoded request when it is @Nothing@.
    new_chat_photo :: Maybe [PhotoSize]
  , -- | Optional. Service message: the chat photo was deleted
    --
    -- Wire key: @delete_chat_photo@.
    -- Omitted from an encoded request when it is @False@.
    delete_chat_photo :: Bool
  , -- | Optional. Service message: the group has been created
    --
    -- Wire key: @group_chat_created@.
    -- Omitted from an encoded request when it is @False@.
    group_chat_created :: Bool
  , -- | Optional. Service message: the supergroup has been created. This field can\'t be received in a message coming through updates, because bot can\'t be a member of a supergroup when it is created. It can only be found in reply_to_message if someone replies to a very first message in a directly created supergroup.
    --
    -- Wire key: @supergroup_chat_created@.
    -- Omitted from an encoded request when it is @False@.
    supergroup_chat_created :: Bool
  , -- | Optional. Service message: the channel has been created. This field can\'t be received in a message coming through updates, because bot can\'t be a member of a channel when it is created. It can only be found in reply_to_message if someone replies to a very first message in a channel.
    --
    -- Wire key: @channel_chat_created@.
    -- Omitted from an encoded request when it is @False@.
    channel_chat_created :: Bool
  , -- | Optional. Service message: auto-delete timer settings changed in the chat
    --
    -- Wire key: @message_auto_delete_timer_changed@.
    -- Omitted from an encoded request when it is @Nothing@.
    message_auto_delete_timer_changed :: Maybe MessageAutoDeleteTimerChanged
  , -- | Optional. The group has been migrated to a supergroup with the specified identifier. This number may have more than 32 significant bits and some programming languages may have difficulty\/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this identifier.
    --
    -- Wire key: @migrate_to_chat_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    migrate_to_chat_id :: Maybe Int64
  , -- | Optional. The supergroup has been migrated from a group with the specified identifier. This number may have more than 32 significant bits and some programming languages may have difficulty\/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this identifier.
    --
    -- Wire key: @migrate_from_chat_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    migrate_from_chat_id :: Maybe Int64
  , -- | Optional. Specified message was pinned. Note that the Message object in this field will not contain further reply_to_message fields even if it itself is a reply.
    --
    -- Wire key: @pinned_message@.
    -- Omitted from an encoded request when it is @Nothing@.
    pinned_message :: Maybe MaybeInaccessibleMessage
  , -- | Optional. Message is an invoice for a payment, information about the invoice. More about payments: https:\/\/core.telegram.org\/bots\/api\#payments
    --
    -- Wire key: @invoice@.
    -- Omitted from an encoded request when it is @Nothing@.
    invoice :: Maybe Invoice
  , -- | Optional. Message is a service message about a successful payment, information about the payment. More about payments: https:\/\/core.telegram.org\/bots\/api\#payments
    --
    -- Wire key: @successful_payment@.
    -- Omitted from an encoded request when it is @Nothing@.
    successful_payment :: Maybe SuccessfulPayment
  , -- | Optional. Message is a service message about a refunded payment, information about the payment. More about payments: https:\/\/core.telegram.org\/bots\/api\#payments
    --
    -- Wire key: @refunded_payment@.
    -- Omitted from an encoded request when it is @Nothing@.
    refunded_payment :: Maybe RefundedPayment
  , -- | Optional. Service message: users were shared with the bot
    --
    -- Wire key: @users_shared@.
    -- Omitted from an encoded request when it is @Nothing@.
    users_shared :: Maybe UsersShared
  , -- | Optional. Service message: a chat was shared with the bot
    --
    -- Wire key: @chat_shared@.
    -- Omitted from an encoded request when it is @Nothing@.
    chat_shared :: Maybe ChatShared
  , -- | Optional. Service message: a regular gift was sent or received
    --
    -- Wire key: @gift@.
    -- Omitted from an encoded request when it is @Nothing@.
    gift :: Maybe GiftInfo
  , -- | Optional. Service message: a unique gift was sent or received
    --
    -- Wire key: @unique_gift@.
    -- Omitted from an encoded request when it is @Nothing@.
    unique_gift :: Maybe UniqueGiftInfo
  , -- | Optional. Service message: upgrade of a gift was purchased after the gift was sent
    --
    -- Wire key: @gift_upgrade_sent@.
    -- Omitted from an encoded request when it is @Nothing@.
    gift_upgrade_sent :: Maybe GiftInfo
  , -- | Optional. The domain name of the website on which the user has logged in. More about Telegram Login: https:\/\/core.telegram.org\/widgets\/login
    --
    -- Wire key: @connected_website@.
    -- Omitted from an encoded request when it is @Nothing@.
    connected_website :: Maybe Text
  , -- | Optional. Service message: the user allowed the bot to write messages after adding it to the attachment or side menu, launching a Web App from a link, or accepting an explicit request from a Web App sent by the method requestWriteAccess
    --
    -- Wire key: @write_access_allowed@.
    -- Omitted from an encoded request when it is @Nothing@.
    write_access_allowed :: Maybe WriteAccessAllowed
  , -- | Optional. Telegram Passport data
    --
    -- Wire key: @passport_data@.
    -- Omitted from an encoded request when it is @Nothing@.
    passport_data :: Maybe PassportData
  , -- | Optional. Service message: a user in the chat triggered another user\'s proximity alert while sharing Live Location
    --
    -- Wire key: @proximity_alert_triggered@.
    -- Omitted from an encoded request when it is @Nothing@.
    proximity_alert_triggered :: Maybe ProximityAlertTriggered
  , -- | Optional. Service message: user boosted the chat
    --
    -- Wire key: @boost_added@.
    -- Omitted from an encoded request when it is @Nothing@.
    boost_added :: Maybe ChatBoostAdded
  , -- | Optional. Service message: chat background set
    --
    -- Wire key: @chat_background_set@.
    -- Omitted from an encoded request when it is @Nothing@.
    chat_background_set :: Maybe ChatBackground
  , -- | Optional. Service message: some tasks in a checklist were marked as done or not done
    --
    -- Wire key: @checklist_tasks_done@.
    -- Omitted from an encoded request when it is @Nothing@.
    checklist_tasks_done :: Maybe ChecklistTasksDone
  , -- | Optional. Service message: tasks were added to a checklist
    --
    -- Wire key: @checklist_tasks_added@.
    -- Omitted from an encoded request when it is @Nothing@.
    checklist_tasks_added :: Maybe ChecklistTasksAdded
  , -- | Optional. Service message: chat or bot added to a Community
    --
    -- Wire key: @community_chat_added@.
    -- Omitted from an encoded request when it is @Nothing@.
    community_chat_added :: Maybe CommunityChatAdded
  , -- | Optional. Service message: chat was joined by a user from a Community
    --
    -- Wire key: @community_chat_joined@.
    -- Omitted from an encoded request when it is @Nothing@.
    community_chat_joined :: Maybe CommunityChatJoined
  , -- | Optional. Service message: chat or bot removed from a Community
    --
    -- Wire key: @community_chat_removed@.
    -- Omitted from an encoded request when it is @Nothing@.
    community_chat_removed :: Maybe CommunityChatRemoved
  , -- | Optional. Service message: the price for paid messages in the corresponding direct messages chat of a channel has changed
    --
    -- Wire key: @direct_message_price_changed@.
    -- Omitted from an encoded request when it is @Nothing@.
    direct_message_price_changed :: Maybe DirectMessagePriceChanged
  , -- | Optional. Service message: forum topic created
    --
    -- Wire key: @forum_topic_created@.
    -- Omitted from an encoded request when it is @Nothing@.
    forum_topic_created :: Maybe ForumTopicCreated
  , -- | Optional. Service message: forum topic edited
    --
    -- Wire key: @forum_topic_edited@.
    -- Omitted from an encoded request when it is @Nothing@.
    forum_topic_edited :: Maybe ForumTopicEdited
  , -- | Optional. Service message: forum topic closed
    --
    -- Wire key: @forum_topic_closed@.
    -- Omitted from an encoded request when it is @Nothing@.
    forum_topic_closed :: Maybe ForumTopicClosed
  , -- | Optional. Service message: forum topic reopened
    --
    -- Wire key: @forum_topic_reopened@.
    -- Omitted from an encoded request when it is @Nothing@.
    forum_topic_reopened :: Maybe ForumTopicReopened
  , -- | Optional. Service message: the \'General\' forum topic hidden
    --
    -- Wire key: @general_forum_topic_hidden@.
    -- Omitted from an encoded request when it is @Nothing@.
    general_forum_topic_hidden :: Maybe GeneralForumTopicHidden
  , -- | Optional. Service message: the \'General\' forum topic unhidden
    --
    -- Wire key: @general_forum_topic_unhidden@.
    -- Omitted from an encoded request when it is @Nothing@.
    general_forum_topic_unhidden :: Maybe GeneralForumTopicUnhidden
  , -- | Optional. Service message: a scheduled giveaway was created
    --
    -- Wire key: @giveaway_created@.
    -- Omitted from an encoded request when it is @Nothing@.
    giveaway_created :: Maybe GiveawayCreated
  , -- | Optional. The message is a scheduled giveaway message
    --
    -- Wire key: @giveaway@.
    -- Omitted from an encoded request when it is @Nothing@.
    giveaway :: Maybe Giveaway
  , -- | Optional. A giveaway with public winners was completed
    --
    -- Wire key: @giveaway_winners@.
    -- Omitted from an encoded request when it is @Nothing@.
    giveaway_winners :: Maybe GiveawayWinners
  , -- | Optional. Service message: a giveaway without public winners was completed
    --
    -- Wire key: @giveaway_completed@.
    -- Omitted from an encoded request when it is @Nothing@.
    giveaway_completed :: Maybe GiveawayCompleted
  , -- | Optional. Service message: user created a bot that will be managed by the current bot
    --
    -- Wire key: @managed_bot_created@.
    -- Omitted from an encoded request when it is @Nothing@.
    managed_bot_created :: Maybe ManagedBotCreated
  , -- | Optional. Service message: the price for paid messages has changed in the chat
    --
    -- Wire key: @paid_message_price_changed@.
    -- Omitted from an encoded request when it is @Nothing@.
    paid_message_price_changed :: Maybe PaidMessagePriceChanged
  , -- | Optional. Service message: answer option was added to a poll
    --
    -- Wire key: @poll_option_added@.
    -- Omitted from an encoded request when it is @Nothing@.
    poll_option_added :: Maybe PollOptionAdded
  , -- | Optional. Service message: answer option was deleted from a poll
    --
    -- Wire key: @poll_option_deleted@.
    -- Omitted from an encoded request when it is @Nothing@.
    poll_option_deleted :: Maybe PollOptionDeleted
  , -- | Optional. Service message: a suggested post was approved
    --
    -- Wire key: @suggested_post_approved@.
    -- Omitted from an encoded request when it is @Nothing@.
    suggested_post_approved :: Maybe SuggestedPostApproved
  , -- | Optional. Service message: approval of a suggested post has failed
    --
    -- Wire key: @suggested_post_approval_failed@.
    -- Omitted from an encoded request when it is @Nothing@.
    suggested_post_approval_failed :: Maybe SuggestedPostApprovalFailed
  , -- | Optional. Service message: a suggested post was declined
    --
    -- Wire key: @suggested_post_declined@.
    -- Omitted from an encoded request when it is @Nothing@.
    suggested_post_declined :: Maybe SuggestedPostDeclined
  , -- | Optional. Service message: payment for a suggested post was received
    --
    -- Wire key: @suggested_post_paid@.
    -- Omitted from an encoded request when it is @Nothing@.
    suggested_post_paid :: Maybe SuggestedPostPaid
  , -- | Optional. Service message: payment for a suggested post was refunded
    --
    -- Wire key: @suggested_post_refunded@.
    -- Omitted from an encoded request when it is @Nothing@.
    suggested_post_refunded :: Maybe SuggestedPostRefunded
  , -- | Optional. Service message: video chat scheduled
    --
    -- Wire key: @video_chat_scheduled@.
    -- Omitted from an encoded request when it is @Nothing@.
    video_chat_scheduled :: Maybe VideoChatScheduled
  , -- | Optional. Service message: video chat started
    --
    -- Wire key: @video_chat_started@.
    -- Omitted from an encoded request when it is @Nothing@.
    video_chat_started :: Maybe VideoChatStarted
  , -- | Optional. Service message: video chat ended
    --
    -- Wire key: @video_chat_ended@.
    -- Omitted from an encoded request when it is @Nothing@.
    video_chat_ended :: Maybe VideoChatEnded
  , -- | Optional. Service message: new participants invited to a video chat
    --
    -- Wire key: @video_chat_participants_invited@.
    -- Omitted from an encoded request when it is @Nothing@.
    video_chat_participants_invited :: Maybe VideoChatParticipantsInvited
  , -- | Optional. Service message: data sent by a Web App
    --
    -- Wire key: @web_app_data@.
    -- Omitted from an encoded request when it is @Nothing@.
    web_app_data :: Maybe WebAppData
  , -- | Optional. Inline keyboard attached to the message. login_url buttons are represented as ordinary url buttons.
    --
    -- Wire key: @reply_markup@.
    -- Omitted from an encoded request when it is @Nothing@.
    reply_markup :: Maybe InlineKeyboardMarkup
  }
  deriving stock (Eq, Show)

-- | Initialize a 'Message' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkMessage :: Int64 -> Int64 -> Chat -> Message
mkMessage arg0 arg1 arg2 =
  MkMessage
    { message_id = arg0
    , message_thread_id = Nothing
    , direct_messages_topic = Nothing
    , from = Nothing
    , sender_chat = Nothing
    , sender_boost_count = Nothing
    , sender_business_bot = Nothing
    , sender_tag = Nothing
    , receiver_user = Nothing
    , ephemeral_message_id = Nothing
    , date = arg1
    , guest_query_id = Nothing
    , business_connection_id = Nothing
    , chat = arg2
    , forward_origin = Nothing
    , is_topic_message = False
    , is_automatic_forward = False
    , reply_to_message = Nothing
    , external_reply = Nothing
    , quote = Nothing
    , reply_to_story = Nothing
    , reply_to_checklist_task_id = Nothing
    , reply_to_poll_option_id = Nothing
    , via_bot = Nothing
    , guest_bot_caller_user = Nothing
    , guest_bot_caller_chat = Nothing
    , edit_date = Nothing
    , has_protected_content = False
    , is_from_offline = False
    , is_paid_post = False
    , media_group_id = Nothing
    , author_signature = Nothing
    , paid_star_count = Nothing
    , text = Nothing
    , entities = Nothing
    , link_preview_options = Nothing
    , suggested_post_info = Nothing
    , effect_id = Nothing
    , rich_message = Nothing
    , animation = Nothing
    , audio = Nothing
    , document = Nothing
    , live_photo = Nothing
    , paid_media = Nothing
    , photo = Nothing
    , sticker = Nothing
    , story = Nothing
    , video = Nothing
    , video_note = Nothing
    , voice = Nothing
    , caption = Nothing
    , caption_entities = Nothing
    , show_caption_above_media = False
    , has_media_spoiler = False
    , checklist = Nothing
    , contact = Nothing
    , dice = Nothing
    , game = Nothing
    , poll = Nothing
    , venue = Nothing
    , location = Nothing
    , new_chat_members = Nothing
    , left_chat_member = Nothing
    , chat_owner_left = Nothing
    , chat_owner_changed = Nothing
    , new_chat_title = Nothing
    , new_chat_photo = Nothing
    , delete_chat_photo = False
    , group_chat_created = False
    , supergroup_chat_created = False
    , channel_chat_created = False
    , message_auto_delete_timer_changed = Nothing
    , migrate_to_chat_id = Nothing
    , migrate_from_chat_id = Nothing
    , pinned_message = Nothing
    , invoice = Nothing
    , successful_payment = Nothing
    , refunded_payment = Nothing
    , users_shared = Nothing
    , chat_shared = Nothing
    , gift = Nothing
    , unique_gift = Nothing
    , gift_upgrade_sent = Nothing
    , connected_website = Nothing
    , write_access_allowed = Nothing
    , passport_data = Nothing
    , proximity_alert_triggered = Nothing
    , boost_added = Nothing
    , chat_background_set = Nothing
    , checklist_tasks_done = Nothing
    , checklist_tasks_added = Nothing
    , community_chat_added = Nothing
    , community_chat_joined = Nothing
    , community_chat_removed = Nothing
    , direct_message_price_changed = Nothing
    , forum_topic_created = Nothing
    , forum_topic_edited = Nothing
    , forum_topic_closed = Nothing
    , forum_topic_reopened = Nothing
    , general_forum_topic_hidden = Nothing
    , general_forum_topic_unhidden = Nothing
    , giveaway_created = Nothing
    , giveaway = Nothing
    , giveaway_winners = Nothing
    , giveaway_completed = Nothing
    , managed_bot_created = Nothing
    , paid_message_price_changed = Nothing
    , poll_option_added = Nothing
    , poll_option_deleted = Nothing
    , suggested_post_approved = Nothing
    , suggested_post_approval_failed = Nothing
    , suggested_post_declined = Nothing
    , suggested_post_paid = Nothing
    , suggested_post_refunded = Nothing
    , video_chat_scheduled = Nothing
    , video_chat_started = Nothing
    , video_chat_ended = Nothing
    , video_chat_participants_invited = Nothing
    , web_app_data = Nothing
    , reply_markup = Nothing
    }

instance FromJSON Message where
  parseJSON = withObject "Message" $ \obj ->
    do
      field_0 <- requiredWith obj "message_id" parseInt64
      field_1 <- optionalWith obj "message_thread_id" parseInt64
      field_2 <- optionalWith obj "direct_messages_topic" parseJSON
      field_3 <- optionalWith obj "from" parseJSON
      field_4 <- optionalWith obj "sender_chat" parseJSON
      field_5 <- optionalWith obj "sender_boost_count" parseInt64
      field_6 <- optionalWith obj "sender_business_bot" parseJSON
      field_7 <- optionalWith obj "sender_tag" parseJSON
      field_8 <- optionalWith obj "receiver_user" parseJSON
      field_9 <- optionalWith obj "ephemeral_message_id" parseInt64
      field_10 <- requiredWith obj "date" parseInt64
      field_11 <- optionalWith obj "guest_query_id" parseJSON
      field_12 <- optionalWith obj "business_connection_id" parseJSON
      field_13 <- requiredWith obj "chat" parseJSON
      field_14 <- optionalWith obj "forward_origin" parseJSON
      field_15 <- optionalTrueFlag obj "is_topic_message"
      field_16 <- optionalTrueFlag obj "is_automatic_forward"
      field_17 <- optionalWith obj "reply_to_message" parseJSON
      field_18 <- optionalWith obj "external_reply" parseJSON
      field_19 <- optionalWith obj "quote" parseJSON
      field_20 <- optionalWith obj "reply_to_story" parseJSON
      field_21 <- optionalWith obj "reply_to_checklist_task_id" parseInt64
      field_22 <- optionalWith obj "reply_to_poll_option_id" parseJSON
      field_23 <- optionalWith obj "via_bot" parseJSON
      field_24 <- optionalWith obj "guest_bot_caller_user" parseJSON
      field_25 <- optionalWith obj "guest_bot_caller_chat" parseJSON
      field_26 <- optionalWith obj "edit_date" parseInt64
      field_27 <- optionalTrueFlag obj "has_protected_content"
      field_28 <- optionalTrueFlag obj "is_from_offline"
      field_29 <- optionalTrueFlag obj "is_paid_post"
      field_30 <- optionalWith obj "media_group_id" parseJSON
      field_31 <- optionalWith obj "author_signature" parseJSON
      field_32 <- optionalWith obj "paid_star_count" parseInt64
      field_33 <- optionalWith obj "text" parseJSON
      field_34 <- optionalWith obj "entities" (parseList parseJSON)
      field_35 <- optionalWith obj "link_preview_options" parseJSON
      field_36 <- optionalWith obj "suggested_post_info" parseJSON
      field_37 <- optionalWith obj "effect_id" parseJSON
      field_38 <- optionalWith obj "rich_message" parseJSON
      field_39 <- optionalWith obj "animation" parseJSON
      field_40 <- optionalWith obj "audio" parseJSON
      field_41 <- optionalWith obj "document" parseJSON
      field_42 <- optionalWith obj "live_photo" parseJSON
      field_43 <- optionalWith obj "paid_media" parseJSON
      field_44 <- optionalWith obj "photo" (parseList parseJSON)
      field_45 <- optionalWith obj "sticker" parseJSON
      field_46 <- optionalWith obj "story" parseJSON
      field_47 <- optionalWith obj "video" parseJSON
      field_48 <- optionalWith obj "video_note" parseJSON
      field_49 <- optionalWith obj "voice" parseJSON
      field_50 <- optionalWith obj "caption" parseJSON
      field_51 <- optionalWith obj "caption_entities" (parseList parseJSON)
      field_52 <- optionalTrueFlag obj "show_caption_above_media"
      field_53 <- optionalTrueFlag obj "has_media_spoiler"
      field_54 <- optionalWith obj "checklist" parseJSON
      field_55 <- optionalWith obj "contact" parseJSON
      field_56 <- optionalWith obj "dice" parseJSON
      field_57 <- optionalWith obj "game" parseJSON
      field_58 <- optionalWith obj "poll" parseJSON
      field_59 <- optionalWith obj "venue" parseJSON
      field_60 <- optionalWith obj "location" parseJSON
      field_61 <- optionalWith obj "new_chat_members" (parseList parseJSON)
      field_62 <- optionalWith obj "left_chat_member" parseJSON
      field_63 <- optionalWith obj "chat_owner_left" parseJSON
      field_64 <- optionalWith obj "chat_owner_changed" parseJSON
      field_65 <- optionalWith obj "new_chat_title" parseJSON
      field_66 <- optionalWith obj "new_chat_photo" (parseList parseJSON)
      field_67 <- optionalTrueFlag obj "delete_chat_photo"
      field_68 <- optionalTrueFlag obj "group_chat_created"
      field_69 <- optionalTrueFlag obj "supergroup_chat_created"
      field_70 <- optionalTrueFlag obj "channel_chat_created"
      field_71 <- optionalWith obj "message_auto_delete_timer_changed" parseJSON
      field_72 <- optionalWith obj "migrate_to_chat_id" parseInt64
      field_73 <- optionalWith obj "migrate_from_chat_id" parseInt64
      field_74 <- optionalWith obj "pinned_message" parseJSON
      field_75 <- optionalWith obj "invoice" parseJSON
      field_76 <- optionalWith obj "successful_payment" parseJSON
      field_77 <- optionalWith obj "refunded_payment" parseJSON
      field_78 <- optionalWith obj "users_shared" parseJSON
      field_79 <- optionalWith obj "chat_shared" parseJSON
      field_80 <- optionalWith obj "gift" parseJSON
      field_81 <- optionalWith obj "unique_gift" parseJSON
      field_82 <- optionalWith obj "gift_upgrade_sent" parseJSON
      field_83 <- optionalWith obj "connected_website" parseJSON
      field_84 <- optionalWith obj "write_access_allowed" parseJSON
      field_85 <- optionalWith obj "passport_data" parseJSON
      field_86 <- optionalWith obj "proximity_alert_triggered" parseJSON
      field_87 <- optionalWith obj "boost_added" parseJSON
      field_88 <- optionalWith obj "chat_background_set" parseJSON
      field_89 <- optionalWith obj "checklist_tasks_done" parseJSON
      field_90 <- optionalWith obj "checklist_tasks_added" parseJSON
      field_91 <- optionalWith obj "community_chat_added" parseJSON
      field_92 <- optionalWith obj "community_chat_joined" parseJSON
      field_93 <- optionalWith obj "community_chat_removed" parseJSON
      field_94 <- optionalWith obj "direct_message_price_changed" parseJSON
      field_95 <- optionalWith obj "forum_topic_created" parseJSON
      field_96 <- optionalWith obj "forum_topic_edited" parseJSON
      field_97 <- optionalWith obj "forum_topic_closed" parseJSON
      field_98 <- optionalWith obj "forum_topic_reopened" parseJSON
      field_99 <- optionalWith obj "general_forum_topic_hidden" parseJSON
      field_100 <- optionalWith obj "general_forum_topic_unhidden" parseJSON
      field_101 <- optionalWith obj "giveaway_created" parseJSON
      field_102 <- optionalWith obj "giveaway" parseJSON
      field_103 <- optionalWith obj "giveaway_winners" parseJSON
      field_104 <- optionalWith obj "giveaway_completed" parseJSON
      field_105 <- optionalWith obj "managed_bot_created" parseJSON
      field_106 <- optionalWith obj "paid_message_price_changed" parseJSON
      field_107 <- optionalWith obj "poll_option_added" parseJSON
      field_108 <- optionalWith obj "poll_option_deleted" parseJSON
      field_109 <- optionalWith obj "suggested_post_approved" parseJSON
      field_110 <- optionalWith obj "suggested_post_approval_failed" parseJSON
      field_111 <- optionalWith obj "suggested_post_declined" parseJSON
      field_112 <- optionalWith obj "suggested_post_paid" parseJSON
      field_113 <- optionalWith obj "suggested_post_refunded" parseJSON
      field_114 <- optionalWith obj "video_chat_scheduled" parseJSON
      field_115 <- optionalWith obj "video_chat_started" parseJSON
      field_116 <- optionalWith obj "video_chat_ended" parseJSON
      field_117 <- optionalWith obj "video_chat_participants_invited" parseJSON
      field_118 <- optionalWith obj "web_app_data" parseJSON
      field_119 <- optionalWith obj "reply_markup" parseJSON
      pure
        MkMessage
          { message_id = field_0
          , message_thread_id = field_1
          , direct_messages_topic = field_2
          , from = field_3
          , sender_chat = field_4
          , sender_boost_count = field_5
          , sender_business_bot = field_6
          , sender_tag = field_7
          , receiver_user = field_8
          , ephemeral_message_id = field_9
          , date = field_10
          , guest_query_id = field_11
          , business_connection_id = field_12
          , chat = field_13
          , forward_origin = field_14
          , is_topic_message = field_15
          , is_automatic_forward = field_16
          , reply_to_message = field_17
          , external_reply = field_18
          , quote = field_19
          , reply_to_story = field_20
          , reply_to_checklist_task_id = field_21
          , reply_to_poll_option_id = field_22
          , via_bot = field_23
          , guest_bot_caller_user = field_24
          , guest_bot_caller_chat = field_25
          , edit_date = field_26
          , has_protected_content = field_27
          , is_from_offline = field_28
          , is_paid_post = field_29
          , media_group_id = field_30
          , author_signature = field_31
          , paid_star_count = field_32
          , text = field_33
          , entities = field_34
          , link_preview_options = field_35
          , suggested_post_info = field_36
          , effect_id = field_37
          , rich_message = field_38
          , animation = field_39
          , audio = field_40
          , document = field_41
          , live_photo = field_42
          , paid_media = field_43
          , photo = field_44
          , sticker = field_45
          , story = field_46
          , video = field_47
          , video_note = field_48
          , voice = field_49
          , caption = field_50
          , caption_entities = field_51
          , show_caption_above_media = field_52
          , has_media_spoiler = field_53
          , checklist = field_54
          , contact = field_55
          , dice = field_56
          , game = field_57
          , poll = field_58
          , venue = field_59
          , location = field_60
          , new_chat_members = field_61
          , left_chat_member = field_62
          , chat_owner_left = field_63
          , chat_owner_changed = field_64
          , new_chat_title = field_65
          , new_chat_photo = field_66
          , delete_chat_photo = field_67
          , group_chat_created = field_68
          , supergroup_chat_created = field_69
          , channel_chat_created = field_70
          , message_auto_delete_timer_changed = field_71
          , migrate_to_chat_id = field_72
          , migrate_from_chat_id = field_73
          , pinned_message = field_74
          , invoice = field_75
          , successful_payment = field_76
          , refunded_payment = field_77
          , users_shared = field_78
          , chat_shared = field_79
          , gift = field_80
          , unique_gift = field_81
          , gift_upgrade_sent = field_82
          , connected_website = field_83
          , write_access_allowed = field_84
          , passport_data = field_85
          , proximity_alert_triggered = field_86
          , boost_added = field_87
          , chat_background_set = field_88
          , checklist_tasks_done = field_89
          , checklist_tasks_added = field_90
          , community_chat_added = field_91
          , community_chat_joined = field_92
          , community_chat_removed = field_93
          , direct_message_price_changed = field_94
          , forum_topic_created = field_95
          , forum_topic_edited = field_96
          , forum_topic_closed = field_97
          , forum_topic_reopened = field_98
          , general_forum_topic_hidden = field_99
          , general_forum_topic_unhidden = field_100
          , giveaway_created = field_101
          , giveaway = field_102
          , giveaway_winners = field_103
          , giveaway_completed = field_104
          , managed_bot_created = field_105
          , paid_message_price_changed = field_106
          , poll_option_added = field_107
          , poll_option_deleted = field_108
          , suggested_post_approved = field_109
          , suggested_post_approval_failed = field_110
          , suggested_post_declined = field_111
          , suggested_post_paid = field_112
          , suggested_post_refunded = field_113
          , video_chat_scheduled = field_114
          , video_chat_started = field_115
          , video_chat_ended = field_116
          , video_chat_participants_invited = field_117
          , web_app_data = field_118
          , reply_markup = field_119
          }

instance ToJSON Message where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "message_id" x.message_id
          , jsonOptional "message_thread_id" x.message_thread_id
          , jsonOptional "direct_messages_topic" x.direct_messages_topic
          , jsonOptional "from" x.from
          , jsonOptional "sender_chat" x.sender_chat
          , jsonOptional "sender_boost_count" x.sender_boost_count
          , jsonOptional "sender_business_bot" x.sender_business_bot
          , jsonOptional "sender_tag" x.sender_tag
          , jsonOptional "receiver_user" x.receiver_user
          , jsonOptional "ephemeral_message_id" x.ephemeral_message_id
          , jsonField "date" x.date
          , jsonOptional "guest_query_id" x.guest_query_id
          , jsonOptional "business_connection_id" x.business_connection_id
          , jsonField "chat" x.chat
          , jsonOptional "forward_origin" x.forward_origin
          , jsonFlag "is_topic_message" x.is_topic_message
          , jsonFlag "is_automatic_forward" x.is_automatic_forward
          , jsonOptional "reply_to_message" x.reply_to_message
          , jsonOptional "external_reply" x.external_reply
          , jsonOptional "quote" x.quote
          , jsonOptional "reply_to_story" x.reply_to_story
          , jsonOptional "reply_to_checklist_task_id" x.reply_to_checklist_task_id
          , jsonOptional "reply_to_poll_option_id" x.reply_to_poll_option_id
          , jsonOptional "via_bot" x.via_bot
          , jsonOptional "guest_bot_caller_user" x.guest_bot_caller_user
          , jsonOptional "guest_bot_caller_chat" x.guest_bot_caller_chat
          , jsonOptional "edit_date" x.edit_date
          , jsonFlag "has_protected_content" x.has_protected_content
          , jsonFlag "is_from_offline" x.is_from_offline
          , jsonFlag "is_paid_post" x.is_paid_post
          , jsonOptional "media_group_id" x.media_group_id
          , jsonOptional "author_signature" x.author_signature
          , jsonOptional "paid_star_count" x.paid_star_count
          , jsonOptional "text" x.text
          , jsonOptional "entities" x.entities
          , jsonOptional "link_preview_options" x.link_preview_options
          , jsonOptional "suggested_post_info" x.suggested_post_info
          , jsonOptional "effect_id" x.effect_id
          , jsonOptional "rich_message" x.rich_message
          , jsonOptional "animation" x.animation
          , jsonOptional "audio" x.audio
          , jsonOptional "document" x.document
          , jsonOptional "live_photo" x.live_photo
          , jsonOptional "paid_media" x.paid_media
          , jsonOptional "photo" x.photo
          , jsonOptional "sticker" x.sticker
          , jsonOptional "story" x.story
          , jsonOptional "video" x.video
          , jsonOptional "video_note" x.video_note
          , jsonOptional "voice" x.voice
          , jsonOptional "caption" x.caption
          , jsonOptional "caption_entities" x.caption_entities
          , jsonFlag "show_caption_above_media" x.show_caption_above_media
          , jsonFlag "has_media_spoiler" x.has_media_spoiler
          , jsonOptional "checklist" x.checklist
          , jsonOptional "contact" x.contact
          , jsonOptional "dice" x.dice
          , jsonOptional "game" x.game
          , jsonOptional "poll" x.poll
          , jsonOptional "venue" x.venue
          , jsonOptional "location" x.location
          , jsonOptional "new_chat_members" x.new_chat_members
          , jsonOptional "left_chat_member" x.left_chat_member
          , jsonOptional "chat_owner_left" x.chat_owner_left
          , jsonOptional "chat_owner_changed" x.chat_owner_changed
          , jsonOptional "new_chat_title" x.new_chat_title
          , jsonOptional "new_chat_photo" x.new_chat_photo
          , jsonFlag "delete_chat_photo" x.delete_chat_photo
          , jsonFlag "group_chat_created" x.group_chat_created
          , jsonFlag "supergroup_chat_created" x.supergroup_chat_created
          , jsonFlag "channel_chat_created" x.channel_chat_created
          , jsonOptional "message_auto_delete_timer_changed" x.message_auto_delete_timer_changed
          , jsonOptional "migrate_to_chat_id" x.migrate_to_chat_id
          , jsonOptional "migrate_from_chat_id" x.migrate_from_chat_id
          , jsonOptional "pinned_message" x.pinned_message
          , jsonOptional "invoice" x.invoice
          , jsonOptional "successful_payment" x.successful_payment
          , jsonOptional "refunded_payment" x.refunded_payment
          , jsonOptional "users_shared" x.users_shared
          , jsonOptional "chat_shared" x.chat_shared
          , jsonOptional "gift" x.gift
          , jsonOptional "unique_gift" x.unique_gift
          , jsonOptional "gift_upgrade_sent" x.gift_upgrade_sent
          , jsonOptional "connected_website" x.connected_website
          , jsonOptional "write_access_allowed" x.write_access_allowed
          , jsonOptional "passport_data" x.passport_data
          , jsonOptional "proximity_alert_triggered" x.proximity_alert_triggered
          , jsonOptional "boost_added" x.boost_added
          , jsonOptional "chat_background_set" x.chat_background_set
          , jsonOptional "checklist_tasks_done" x.checklist_tasks_done
          , jsonOptional "checklist_tasks_added" x.checklist_tasks_added
          , jsonOptional "community_chat_added" x.community_chat_added
          , jsonOptional "community_chat_joined" x.community_chat_joined
          , jsonOptional "community_chat_removed" x.community_chat_removed
          , jsonOptional "direct_message_price_changed" x.direct_message_price_changed
          , jsonOptional "forum_topic_created" x.forum_topic_created
          , jsonOptional "forum_topic_edited" x.forum_topic_edited
          , jsonOptional "forum_topic_closed" x.forum_topic_closed
          , jsonOptional "forum_topic_reopened" x.forum_topic_reopened
          , jsonOptional "general_forum_topic_hidden" x.general_forum_topic_hidden
          , jsonOptional "general_forum_topic_unhidden" x.general_forum_topic_unhidden
          , jsonOptional "giveaway_created" x.giveaway_created
          , jsonOptional "giveaway" x.giveaway
          , jsonOptional "giveaway_winners" x.giveaway_winners
          , jsonOptional "giveaway_completed" x.giveaway_completed
          , jsonOptional "managed_bot_created" x.managed_bot_created
          , jsonOptional "paid_message_price_changed" x.paid_message_price_changed
          , jsonOptional "poll_option_added" x.poll_option_added
          , jsonOptional "poll_option_deleted" x.poll_option_deleted
          , jsonOptional "suggested_post_approved" x.suggested_post_approved
          , jsonOptional "suggested_post_approval_failed" x.suggested_post_approval_failed
          , jsonOptional "suggested_post_declined" x.suggested_post_declined
          , jsonOptional "suggested_post_paid" x.suggested_post_paid
          , jsonOptional "suggested_post_refunded" x.suggested_post_refunded
          , jsonOptional "video_chat_scheduled" x.video_chat_scheduled
          , jsonOptional "video_chat_started" x.video_chat_started
          , jsonOptional "video_chat_ended" x.video_chat_ended
          , jsonOptional "video_chat_participants_invited" x.video_chat_participants_invited
          , jsonOptional "web_app_data" x.web_app_data
          , jsonOptional "reply_markup" x.reply_markup
          ]
      )
  toEncoding = toEncoding . toJSON

-- | Describes a service message about an option added to a poll.
--
-- Source: <https://core.telegram.org/bots/api#polloptionadded>.
-- Codec directions: decoded from responses, encoded into requests.
data PollOptionAdded = MkPollOptionAdded
  { -- | Optional. Message containing the poll to which the option was added, if known. Note that the Message object in this field will not contain the reply_to_message field even if it itself is a reply.
    --
    -- Wire key: @poll_message@.
    -- Omitted from an encoded request when it is @Nothing@.
    poll_message :: Maybe MaybeInaccessibleMessage
  , -- | Unique identifier of the added option
    --
    -- Wire key: @option_persistent_id@.
    option_persistent_id :: Text
  , -- | Option text
    --
    -- Wire key: @option_text@.
    option_text :: Text
  , -- | Optional. Special entities that appear in the option_text
    --
    -- Wire key: @option_text_entities@.
    -- Omitted from an encoded request when it is @Nothing@.
    option_text_entities :: Maybe [MessageEntity]
  }
  deriving stock (Eq, Show)

-- | Initialize a 'PollOptionAdded' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkPollOptionAdded :: Text -> Text -> PollOptionAdded
mkPollOptionAdded arg0 arg1 =
  MkPollOptionAdded
    { poll_message = Nothing
    , option_persistent_id = arg0
    , option_text = arg1
    , option_text_entities = Nothing
    }

instance FromJSON PollOptionAdded where
  parseJSON = withObject "PollOptionAdded" $ \obj ->
    do
      field_0 <- optionalWith obj "poll_message" parseJSON
      field_1 <- requiredWith obj "option_persistent_id" parseJSON
      field_2 <- requiredWith obj "option_text" parseJSON
      field_3 <- optionalWith obj "option_text_entities" (parseList parseJSON)
      pure
        MkPollOptionAdded
          { poll_message = field_0
          , option_persistent_id = field_1
          , option_text = field_2
          , option_text_entities = field_3
          }

instance ToJSON PollOptionAdded where
  toJSON x =
    jsonObject
      ( concat
          [ jsonOptional "poll_message" x.poll_message
          , jsonField "option_persistent_id" x.option_persistent_id
          , jsonField "option_text" x.option_text
          , jsonOptional "option_text_entities" x.option_text_entities
          ]
      )
  toEncoding = toEncoding . toJSON

-- | Describes a service message about an option deleted from a poll.
--
-- Source: <https://core.telegram.org/bots/api#polloptiondeleted>.
-- Codec directions: decoded from responses, encoded into requests.
data PollOptionDeleted = MkPollOptionDeleted
  { -- | Optional. Message containing the poll from which the option was deleted, if known. Note that the Message object in this field will not contain the reply_to_message field even if it itself is a reply.
    --
    -- Wire key: @poll_message@.
    -- Omitted from an encoded request when it is @Nothing@.
    poll_message :: Maybe MaybeInaccessibleMessage
  , -- | Unique identifier of the deleted option
    --
    -- Wire key: @option_persistent_id@.
    option_persistent_id :: Text
  , -- | Option text
    --
    -- Wire key: @option_text@.
    option_text :: Text
  , -- | Optional. Special entities that appear in the option_text
    --
    -- Wire key: @option_text_entities@.
    -- Omitted from an encoded request when it is @Nothing@.
    option_text_entities :: Maybe [MessageEntity]
  }
  deriving stock (Eq, Show)

-- | Initialize a 'PollOptionDeleted' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkPollOptionDeleted :: Text -> Text -> PollOptionDeleted
mkPollOptionDeleted arg0 arg1 =
  MkPollOptionDeleted
    { poll_message = Nothing
    , option_persistent_id = arg0
    , option_text = arg1
    , option_text_entities = Nothing
    }

instance FromJSON PollOptionDeleted where
  parseJSON = withObject "PollOptionDeleted" $ \obj ->
    do
      field_0 <- optionalWith obj "poll_message" parseJSON
      field_1 <- requiredWith obj "option_persistent_id" parseJSON
      field_2 <- requiredWith obj "option_text" parseJSON
      field_3 <- optionalWith obj "option_text_entities" (parseList parseJSON)
      pure
        MkPollOptionDeleted
          { poll_message = field_0
          , option_persistent_id = field_1
          , option_text = field_2
          , option_text_entities = field_3
          }

instance ToJSON PollOptionDeleted where
  toJSON x =
    jsonObject
      ( concat
          [ jsonOptional "poll_message" x.poll_message
          , jsonField "option_persistent_id" x.option_persistent_id
          , jsonField "option_text" x.option_text
          , jsonOptional "option_text_entities" x.option_text_entities
          ]
      )
  toEncoding = toEncoding . toJSON

-- | Describes a service message about the failed approval of a suggested post. Currently, only caused by insufficient user funds at the time of approval.
--
-- Source: <https://core.telegram.org/bots/api#suggestedpostapprovalfailed>.
-- Codec directions: decoded from responses, encoded into requests.
data SuggestedPostApprovalFailed = MkSuggestedPostApprovalFailed
  { -- | Optional. Message containing the suggested post whose approval has failed. Note that the Message object in this field will not contain the reply_to_message field even if it itself is a reply.
    --
    -- Wire key: @suggested_post_message@.
    -- Omitted from an encoded request when it is @Nothing@.
    suggested_post_message :: Maybe Message
  , -- | Expected price of the post
    --
    -- Wire key: @price@.
    price :: SuggestedPostPrice
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SuggestedPostApprovalFailed' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSuggestedPostApprovalFailed :: SuggestedPostPrice -> SuggestedPostApprovalFailed
mkSuggestedPostApprovalFailed arg0 =
  MkSuggestedPostApprovalFailed
    { suggested_post_message = Nothing
    , price = arg0
    }

instance FromJSON SuggestedPostApprovalFailed where
  parseJSON = withObject "SuggestedPostApprovalFailed" $ \obj ->
    do
      field_0 <- optionalWith obj "suggested_post_message" parseJSON
      field_1 <- requiredWith obj "price" parseJSON
      pure
        MkSuggestedPostApprovalFailed
          { suggested_post_message = field_0
          , price = field_1
          }

instance ToJSON SuggestedPostApprovalFailed where
  toJSON x =
    jsonObject
      ( concat
          [ jsonOptional "suggested_post_message" x.suggested_post_message
          , jsonField "price" x.price
          ]
      )
  toEncoding = toEncoding . toJSON

-- | Describes a service message about the approval of a suggested post.
--
-- Source: <https://core.telegram.org/bots/api#suggestedpostapproved>.
-- Codec directions: decoded from responses, encoded into requests.
data SuggestedPostApproved = MkSuggestedPostApproved
  { -- | Optional. Message containing the suggested post. Note that the Message object in this field will not contain the reply_to_message field even if it itself is a reply.
    --
    -- Wire key: @suggested_post_message@.
    -- Omitted from an encoded request when it is @Nothing@.
    suggested_post_message :: Maybe Message
  , -- | Optional. Amount paid for the post
    --
    -- Wire key: @price@.
    -- Omitted from an encoded request when it is @Nothing@.
    price :: Maybe SuggestedPostPrice
  , -- | Date when the post will be published
    --
    -- Wire key: @send_date@.
    send_date :: Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SuggestedPostApproved' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSuggestedPostApproved :: Int64 -> SuggestedPostApproved
mkSuggestedPostApproved arg0 =
  MkSuggestedPostApproved
    { suggested_post_message = Nothing
    , price = Nothing
    , send_date = arg0
    }

instance FromJSON SuggestedPostApproved where
  parseJSON = withObject "SuggestedPostApproved" $ \obj ->
    do
      field_0 <- optionalWith obj "suggested_post_message" parseJSON
      field_1 <- optionalWith obj "price" parseJSON
      field_2 <- requiredWith obj "send_date" parseInt64
      pure
        MkSuggestedPostApproved
          { suggested_post_message = field_0
          , price = field_1
          , send_date = field_2
          }

instance ToJSON SuggestedPostApproved where
  toJSON x =
    jsonObject
      ( concat
          [ jsonOptional "suggested_post_message" x.suggested_post_message
          , jsonOptional "price" x.price
          , jsonField "send_date" x.send_date
          ]
      )
  toEncoding = toEncoding . toJSON

-- | Describes a service message about the rejection of a suggested post.
--
-- Source: <https://core.telegram.org/bots/api#suggestedpostdeclined>.
-- Codec directions: decoded from responses, encoded into requests.
data SuggestedPostDeclined = MkSuggestedPostDeclined
  { -- | Optional. Message containing the suggested post. Note that the Message object in this field will not contain the reply_to_message field even if it itself is a reply.
    --
    -- Wire key: @suggested_post_message@.
    -- Omitted from an encoded request when it is @Nothing@.
    suggested_post_message :: Maybe Message
  , -- | Optional. Comment with which the post was declined
    --
    -- Wire key: @comment@.
    -- Omitted from an encoded request when it is @Nothing@.
    comment :: Maybe Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SuggestedPostDeclined' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSuggestedPostDeclined :: SuggestedPostDeclined
mkSuggestedPostDeclined =
  MkSuggestedPostDeclined
    { suggested_post_message = Nothing
    , comment = Nothing
    }

instance FromJSON SuggestedPostDeclined where
  parseJSON = withObject "SuggestedPostDeclined" $ \obj ->
    do
      field_0 <- optionalWith obj "suggested_post_message" parseJSON
      field_1 <- optionalWith obj "comment" parseJSON
      pure
        MkSuggestedPostDeclined
          { suggested_post_message = field_0
          , comment = field_1
          }

instance ToJSON SuggestedPostDeclined where
  toJSON x =
    jsonObject
      ( concat
          [ jsonOptional "suggested_post_message" x.suggested_post_message
          , jsonOptional "comment" x.comment
          ]
      )
  toEncoding = toEncoding . toJSON

-- | Describes a service message about a successful payment for a suggested post.
--
-- Source: <https://core.telegram.org/bots/api#suggestedpostpaid>.
-- Codec directions: decoded from responses, encoded into requests.
data SuggestedPostPaid = MkSuggestedPostPaid
  { -- | Optional. Message containing the suggested post. Note that the Message object in this field will not contain the reply_to_message field even if it itself is a reply.
    --
    -- Wire key: @suggested_post_message@.
    -- Omitted from an encoded request when it is @Nothing@.
    suggested_post_message :: Maybe Message
  , -- | Currency in which the payment was made. Currently, one of \"XTR\" for Telegram Stars or \"TON\" for TON grams.
    --
    -- Wire key: @currency@.
    currency :: Text
  , -- | Optional. The amount of the currency that was received by the channel in nanograms; for payments in TON grams only
    --
    -- Wire key: @amount@.
    -- Omitted from an encoded request when it is @Nothing@.
    amount :: Maybe Int64
  , -- | Optional. The amount of Telegram Stars that was received by the channel; for payments in Telegram Stars only
    --
    -- Wire key: @star_amount@.
    -- Omitted from an encoded request when it is @Nothing@.
    star_amount :: Maybe StarAmount
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SuggestedPostPaid' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSuggestedPostPaid :: Text -> SuggestedPostPaid
mkSuggestedPostPaid arg0 =
  MkSuggestedPostPaid
    { suggested_post_message = Nothing
    , currency = arg0
    , amount = Nothing
    , star_amount = Nothing
    }

instance FromJSON SuggestedPostPaid where
  parseJSON = withObject "SuggestedPostPaid" $ \obj ->
    do
      field_0 <- optionalWith obj "suggested_post_message" parseJSON
      field_1 <- requiredWith obj "currency" parseJSON
      field_2 <- optionalWith obj "amount" parseInt64
      field_3 <- optionalWith obj "star_amount" parseJSON
      pure
        MkSuggestedPostPaid
          { suggested_post_message = field_0
          , currency = field_1
          , amount = field_2
          , star_amount = field_3
          }

instance ToJSON SuggestedPostPaid where
  toJSON x =
    jsonObject
      ( concat
          [ jsonOptional "suggested_post_message" x.suggested_post_message
          , jsonField "currency" x.currency
          , jsonOptional "amount" x.amount
          , jsonOptional "star_amount" x.star_amount
          ]
      )
  toEncoding = toEncoding . toJSON

-- | Describes a service message about a payment refund for a suggested post.
--
-- Source: <https://core.telegram.org/bots/api#suggestedpostrefunded>.
-- Codec directions: decoded from responses, encoded into requests.
data SuggestedPostRefunded = MkSuggestedPostRefunded
  { -- | Optional. Message containing the suggested post. Note that the Message object in this field will not contain the reply_to_message field even if it itself is a reply.
    --
    -- Wire key: @suggested_post_message@.
    -- Omitted from an encoded request when it is @Nothing@.
    suggested_post_message :: Maybe Message
  , -- | Reason for the refund. Currently, one of \"post_deleted\" if the post was deleted within 24 hours of being posted or removed from scheduled messages without being posted, or \"payment_refunded\" if the payer refunded their payment.
    --
    -- Wire key: @reason@.
    reason :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SuggestedPostRefunded' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSuggestedPostRefunded :: Text -> SuggestedPostRefunded
mkSuggestedPostRefunded arg0 =
  MkSuggestedPostRefunded
    { suggested_post_message = Nothing
    , reason = arg0
    }

instance FromJSON SuggestedPostRefunded where
  parseJSON = withObject "SuggestedPostRefunded" $ \obj ->
    do
      field_0 <- optionalWith obj "suggested_post_message" parseJSON
      field_1 <- requiredWith obj "reason" parseJSON
      pure
        MkSuggestedPostRefunded
          { suggested_post_message = field_0
          , reason = field_1
          }

instance ToJSON SuggestedPostRefunded where
  toJSON x =
    jsonObject
      ( concat
          [ jsonOptional "suggested_post_message" x.suggested_post_message
          , jsonField "reason" x.reason
          ]
      )
  toEncoding = toEncoding . toJSON
