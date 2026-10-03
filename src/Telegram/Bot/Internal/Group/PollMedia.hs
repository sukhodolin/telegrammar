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
module Telegram.Bot.Internal.Group.PollMedia
  ( PollMedia (..)
  , mkPollMedia
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Telegram.Bot.Internal.Group.Animation (Animation)
import Telegram.Bot.Internal.Group.Audio (Audio)
import Telegram.Bot.Internal.Group.Document (Document)
import Telegram.Bot.Internal.Group.Link (Link)
import Telegram.Bot.Internal.Group.LivePhoto (LivePhoto)
import Telegram.Bot.Internal.Group.Location (Location)
import Telegram.Bot.Internal.Group.PhotoSize (PhotoSize)
import Telegram.Bot.Internal.Group.Sticker (Sticker)
import Telegram.Bot.Internal.Group.Venue (Venue)
import Telegram.Bot.Internal.Group.Video (Video)
import Telegram.Bot.Support (jsonObject, jsonOptional, optionalWith, parseList)

-- | At most one of the optional fields can be present in any given object.
--
-- Source: <https://core.telegram.org/bots/api#pollmedia>.
-- Codec directions: decoded from responses, encoded into requests.
data PollMedia = MkPollMedia
  { -- | Optional. Media is an animation, information about the animation
    --
    -- Wire key: @animation@.
    -- Omitted from an encoded request when it is @Nothing@.
    animation :: Maybe Animation
  , -- | Optional. Media is an audio file, information about the file; currently, can\'t be received in a poll option
    --
    -- Wire key: @audio@.
    -- Omitted from an encoded request when it is @Nothing@.
    audio :: Maybe Audio
  , -- | Optional. Media is a general file, information about the file; currently, can\'t be received in a poll option
    --
    -- Wire key: @document@.
    -- Omitted from an encoded request when it is @Nothing@.
    document :: Maybe Document
  , -- | Optional. The HTTP link attached to the poll option
    --
    -- Wire key: @link@.
    -- Omitted from an encoded request when it is @Nothing@.
    link :: Maybe Link
  , -- | Optional. Media is a live photo, information about the live photo
    --
    -- Wire key: @live_photo@.
    -- Omitted from an encoded request when it is @Nothing@.
    live_photo :: Maybe LivePhoto
  , -- | Optional. Media is a shared location, information about the location
    --
    -- Wire key: @location@.
    -- Omitted from an encoded request when it is @Nothing@.
    location :: Maybe Location
  , -- | Optional. Media is a photo, available sizes of the photo
    --
    -- Wire key: @photo@.
    -- Omitted from an encoded request when it is @Nothing@.
    photo :: Maybe [PhotoSize]
  , -- | Optional. Media is a sticker, information about the sticker; currently, for poll options only
    --
    -- Wire key: @sticker@.
    -- Omitted from an encoded request when it is @Nothing@.
    sticker :: Maybe Sticker
  , -- | Optional. Media is a venue, information about the venue
    --
    -- Wire key: @venue@.
    -- Omitted from an encoded request when it is @Nothing@.
    venue :: Maybe Venue
  , -- | Optional. Media is a video, information about the video
    --
    -- Wire key: @video@.
    -- Omitted from an encoded request when it is @Nothing@.
    video :: Maybe Video
  }
  deriving stock (Eq, Show)

-- | Initialize a 'PollMedia' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkPollMedia :: PollMedia
mkPollMedia =
  MkPollMedia
    { animation = Nothing
    , audio = Nothing
    , document = Nothing
    , link = Nothing
    , live_photo = Nothing
    , location = Nothing
    , photo = Nothing
    , sticker = Nothing
    , venue = Nothing
    , video = Nothing
    }

instance FromJSON PollMedia where
  parseJSON = withObject "PollMedia" $ \obj ->
    do
      field_0 <- optionalWith obj "animation" parseJSON
      field_1 <- optionalWith obj "audio" parseJSON
      field_2 <- optionalWith obj "document" parseJSON
      field_3 <- optionalWith obj "link" parseJSON
      field_4 <- optionalWith obj "live_photo" parseJSON
      field_5 <- optionalWith obj "location" parseJSON
      field_6 <- optionalWith obj "photo" (parseList parseJSON)
      field_7 <- optionalWith obj "sticker" parseJSON
      field_8 <- optionalWith obj "venue" parseJSON
      field_9 <- optionalWith obj "video" parseJSON
      pure
        MkPollMedia
          { animation = field_0
          , audio = field_1
          , document = field_2
          , link = field_3
          , live_photo = field_4
          , location = field_5
          , photo = field_6
          , sticker = field_7
          , venue = field_8
          , video = field_9
          }

instance ToJSON PollMedia where
  toJSON x =
    jsonObject
      ( concat
          [ jsonOptional "animation" x.animation
          , jsonOptional "audio" x.audio
          , jsonOptional "document" x.document
          , jsonOptional "link" x.link
          , jsonOptional "live_photo" x.live_photo
          , jsonOptional "location" x.location
          , jsonOptional "photo" x.photo
          , jsonOptional "sticker" x.sticker
          , jsonOptional "venue" x.venue
          , jsonOptional "video" x.video
          ]
      )
  toEncoding = toEncoding . toJSON
