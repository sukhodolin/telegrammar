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
module Telegram.Bot.Internal.Group.ExternalReplyInfo
  ( ExternalReplyInfo (..)
  , mkExternalReplyInfo
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.Animation (Animation)
import Telegram.Bot.Internal.Group.Audio (Audio)
import Telegram.Bot.Internal.Group.Chat (Chat)
import Telegram.Bot.Internal.Group.Checklist (Checklist)
import Telegram.Bot.Internal.Group.Contact (Contact)
import Telegram.Bot.Internal.Group.Dice (Dice)
import Telegram.Bot.Internal.Group.Document (Document)
import Telegram.Bot.Internal.Group.Game (Game)
import Telegram.Bot.Internal.Group.Giveaway (Giveaway)
import Telegram.Bot.Internal.Group.GiveawayWinners (GiveawayWinners)
import Telegram.Bot.Internal.Group.Invoice (Invoice)
import Telegram.Bot.Internal.Group.LinkPreviewOptions (LinkPreviewOptions)
import Telegram.Bot.Internal.Group.LivePhoto (LivePhoto)
import Telegram.Bot.Internal.Group.Location (Location)
import Telegram.Bot.Internal.Group.MessageOrigin (MessageOrigin)
import Telegram.Bot.Internal.Group.PaidMediaInfo (PaidMediaInfo)
import Telegram.Bot.Internal.Group.PhotoSize (PhotoSize)
import Telegram.Bot.Internal.Group.Poll (Poll)
import Telegram.Bot.Internal.Group.Sticker (Sticker)
import Telegram.Bot.Internal.Group.Story (Story)
import Telegram.Bot.Internal.Group.Venue (Venue)
import Telegram.Bot.Internal.Group.Video (Video)
import Telegram.Bot.Internal.Group.VideoNote (VideoNote)
import Telegram.Bot.Internal.Group.Voice (Voice)
import Telegram.Bot.Support (jsonField, jsonFlag, jsonObject, jsonOptional, optionalTrueFlag, optionalWith, parseInt64, parseList, requiredWith)

-- | This object contains information about a message that is being replied to, which may come from another chat or forum topic.
--
-- Source: <https://core.telegram.org/bots/api#externalreplyinfo>.
-- Codec directions: decoded from responses, encoded into requests.
data ExternalReplyInfo = MkExternalReplyInfo
  { -- | Origin of the message replied to by the given message
    --
    -- Wire key: @origin@.
    origin :: MessageOrigin
  , -- | Optional. Chat the original message belongs to. Available only if the chat is a supergroup or a channel.
    --
    -- Wire key: @chat@.
    -- Omitted from an encoded request when it is @Nothing@.
    chat :: Maybe Chat
  , -- | Optional. Unique message identifier inside the original chat. Available only if the original chat is a supergroup or a channel.
    --
    -- Wire key: @message_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    message_id :: Maybe Int64
  , -- | Optional. Options used for link preview generation for the original message, if it is a text message
    --
    -- Wire key: @link_preview_options@.
    -- Omitted from an encoded request when it is @Nothing@.
    link_preview_options :: Maybe LinkPreviewOptions
  , -- | Optional. Message is an animation, information about the animation
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
  , -- | Optional. Message is a live photo, information about the live photo
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
  , -- | Optional. Message is a scheduled giveaway, information about the giveaway
    --
    -- Wire key: @giveaway@.
    -- Omitted from an encoded request when it is @Nothing@.
    giveaway :: Maybe Giveaway
  , -- | Optional. A giveaway with public winners was completed
    --
    -- Wire key: @giveaway_winners@.
    -- Omitted from an encoded request when it is @Nothing@.
    giveaway_winners :: Maybe GiveawayWinners
  , -- | Optional. Message is an invoice for a payment, information about the invoice. More about payments: https:\/\/core.telegram.org\/bots\/api\#payments
    --
    -- Wire key: @invoice@.
    -- Omitted from an encoded request when it is @Nothing@.
    invoice :: Maybe Invoice
  , -- | Optional. Message is a shared location, information about the location
    --
    -- Wire key: @location@.
    -- Omitted from an encoded request when it is @Nothing@.
    location :: Maybe Location
  , -- | Optional. Message is a native poll, information about the poll
    --
    -- Wire key: @poll@.
    -- Omitted from an encoded request when it is @Nothing@.
    poll :: Maybe Poll
  , -- | Optional. Message is a venue, information about the venue
    --
    -- Wire key: @venue@.
    -- Omitted from an encoded request when it is @Nothing@.
    venue :: Maybe Venue
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ExternalReplyInfo' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkExternalReplyInfo :: MessageOrigin -> ExternalReplyInfo
mkExternalReplyInfo arg0 =
  MkExternalReplyInfo
    { origin = arg0
    , chat = Nothing
    , message_id = Nothing
    , link_preview_options = Nothing
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
    , has_media_spoiler = False
    , checklist = Nothing
    , contact = Nothing
    , dice = Nothing
    , game = Nothing
    , giveaway = Nothing
    , giveaway_winners = Nothing
    , invoice = Nothing
    , location = Nothing
    , poll = Nothing
    , venue = Nothing
    }

instance FromJSON ExternalReplyInfo where
  parseJSON = withObject "ExternalReplyInfo" $ \obj ->
    do
      field_0 <- requiredWith obj "origin" parseJSON
      field_1 <- optionalWith obj "chat" parseJSON
      field_2 <- optionalWith obj "message_id" parseInt64
      field_3 <- optionalWith obj "link_preview_options" parseJSON
      field_4 <- optionalWith obj "animation" parseJSON
      field_5 <- optionalWith obj "audio" parseJSON
      field_6 <- optionalWith obj "document" parseJSON
      field_7 <- optionalWith obj "live_photo" parseJSON
      field_8 <- optionalWith obj "paid_media" parseJSON
      field_9 <- optionalWith obj "photo" (parseList parseJSON)
      field_10 <- optionalWith obj "sticker" parseJSON
      field_11 <- optionalWith obj "story" parseJSON
      field_12 <- optionalWith obj "video" parseJSON
      field_13 <- optionalWith obj "video_note" parseJSON
      field_14 <- optionalWith obj "voice" parseJSON
      field_15 <- optionalTrueFlag obj "has_media_spoiler"
      field_16 <- optionalWith obj "checklist" parseJSON
      field_17 <- optionalWith obj "contact" parseJSON
      field_18 <- optionalWith obj "dice" parseJSON
      field_19 <- optionalWith obj "game" parseJSON
      field_20 <- optionalWith obj "giveaway" parseJSON
      field_21 <- optionalWith obj "giveaway_winners" parseJSON
      field_22 <- optionalWith obj "invoice" parseJSON
      field_23 <- optionalWith obj "location" parseJSON
      field_24 <- optionalWith obj "poll" parseJSON
      field_25 <- optionalWith obj "venue" parseJSON
      pure
        MkExternalReplyInfo
          { origin = field_0
          , chat = field_1
          , message_id = field_2
          , link_preview_options = field_3
          , animation = field_4
          , audio = field_5
          , document = field_6
          , live_photo = field_7
          , paid_media = field_8
          , photo = field_9
          , sticker = field_10
          , story = field_11
          , video = field_12
          , video_note = field_13
          , voice = field_14
          , has_media_spoiler = field_15
          , checklist = field_16
          , contact = field_17
          , dice = field_18
          , game = field_19
          , giveaway = field_20
          , giveaway_winners = field_21
          , invoice = field_22
          , location = field_23
          , poll = field_24
          , venue = field_25
          }

instance ToJSON ExternalReplyInfo where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "origin" x.origin
          , jsonOptional "chat" x.chat
          , jsonOptional "message_id" x.message_id
          , jsonOptional "link_preview_options" x.link_preview_options
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
          , jsonFlag "has_media_spoiler" x.has_media_spoiler
          , jsonOptional "checklist" x.checklist
          , jsonOptional "contact" x.contact
          , jsonOptional "dice" x.dice
          , jsonOptional "game" x.game
          , jsonOptional "giveaway" x.giveaway
          , jsonOptional "giveaway_winners" x.giveaway_winners
          , jsonOptional "invoice" x.invoice
          , jsonOptional "location" x.location
          , jsonOptional "poll" x.poll
          , jsonOptional "venue" x.venue
          ]
      )
  toEncoding = toEncoding . toJSON
