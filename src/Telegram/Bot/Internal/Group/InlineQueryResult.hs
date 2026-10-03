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
module Telegram.Bot.Internal.Group.InlineQueryResult
  ( InlineQueryResult (..)
  , planInlineQueryResult
  ) where

import Data.Aeson (Value)
import Telegram.Bot.Internal.Group.InlineQueryResultArticle (InlineQueryResultArticle, planInlineQueryResultArticle)
import Telegram.Bot.Internal.Group.InlineQueryResultAudio (InlineQueryResultAudio, planInlineQueryResultAudio)
import Telegram.Bot.Internal.Group.InlineQueryResultCachedAudio (InlineQueryResultCachedAudio, planInlineQueryResultCachedAudio)
import Telegram.Bot.Internal.Group.InlineQueryResultCachedDocument (InlineQueryResultCachedDocument, planInlineQueryResultCachedDocument)
import Telegram.Bot.Internal.Group.InlineQueryResultCachedGif (InlineQueryResultCachedGif, planInlineQueryResultCachedGif)
import Telegram.Bot.Internal.Group.InlineQueryResultCachedMpeg4Gif (InlineQueryResultCachedMpeg4Gif, planInlineQueryResultCachedMpeg4Gif)
import Telegram.Bot.Internal.Group.InlineQueryResultCachedPhoto (InlineQueryResultCachedPhoto, planInlineQueryResultCachedPhoto)
import Telegram.Bot.Internal.Group.InlineQueryResultCachedSticker (InlineQueryResultCachedSticker, planInlineQueryResultCachedSticker)
import Telegram.Bot.Internal.Group.InlineQueryResultCachedVideo (InlineQueryResultCachedVideo, planInlineQueryResultCachedVideo)
import Telegram.Bot.Internal.Group.InlineQueryResultCachedVoice (InlineQueryResultCachedVoice, planInlineQueryResultCachedVoice)
import Telegram.Bot.Internal.Group.InlineQueryResultContact (InlineQueryResultContact, planInlineQueryResultContact)
import Telegram.Bot.Internal.Group.InlineQueryResultDocument (InlineQueryResultDocument, planInlineQueryResultDocument)
import Telegram.Bot.Internal.Group.InlineQueryResultGame (InlineQueryResultGame)
import Telegram.Bot.Internal.Group.InlineQueryResultGif (InlineQueryResultGif, planInlineQueryResultGif)
import Telegram.Bot.Internal.Group.InlineQueryResultLocation (InlineQueryResultLocation, planInlineQueryResultLocation)
import Telegram.Bot.Internal.Group.InlineQueryResultMpeg4Gif (InlineQueryResultMpeg4Gif, planInlineQueryResultMpeg4Gif)
import Telegram.Bot.Internal.Group.InlineQueryResultPhoto (InlineQueryResultPhoto, planInlineQueryResultPhoto)
import Telegram.Bot.Internal.Group.InlineQueryResultVenue (InlineQueryResultVenue, planInlineQueryResultVenue)
import Telegram.Bot.Internal.Group.InlineQueryResultVideo (InlineQueryResultVideo, planInlineQueryResultVideo)
import Telegram.Bot.Internal.Group.InlineQueryResultVoice (InlineQueryResultVoice, planInlineQueryResultVoice)
import Telegram.Bot.Support (FieldPlanner, encodeJson, plainValue, planMember)

-- | This object represents one result of an inline query. Telegram clients currently support results of the following 20 types:
-- \- InlineQueryResultCachedAudio
-- \- InlineQueryResultCachedDocument
-- \- InlineQueryResultCachedGif
-- \- InlineQueryResultCachedMpeg4Gif
-- \- InlineQueryResultCachedPhoto
-- \- InlineQueryResultCachedSticker
-- \- InlineQueryResultCachedVideo
-- \- InlineQueryResultCachedVoice
-- \- InlineQueryResultArticle
-- \- InlineQueryResultAudio
-- \- InlineQueryResultContact
-- \- InlineQueryResultGame
-- \- InlineQueryResultDocument
-- \- InlineQueryResultGif
-- \- InlineQueryResultLocation
-- \- InlineQueryResultMpeg4Gif
-- \- InlineQueryResultPhoto
-- \- InlineQueryResultVenue
-- \- InlineQueryResultVideo
-- \- InlineQueryResultVoice
-- Note: All URLs passed in inline query results will be available to end users and therefore must be assumed to be public.
--
-- Source: <https://core.telegram.org/bots/api#inlinequeryresult>.
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
data InlineQueryResult
  = InlineQueryResultViaInlineQueryResultArticle InlineQueryResultArticle
  | InlineQueryResultViaInlineQueryResultAudio InlineQueryResultAudio
  | InlineQueryResultViaInlineQueryResultCachedAudio InlineQueryResultCachedAudio
  | InlineQueryResultViaInlineQueryResultCachedDocument InlineQueryResultCachedDocument
  | InlineQueryResultViaInlineQueryResultCachedGif InlineQueryResultCachedGif
  | InlineQueryResultViaInlineQueryResultCachedMpeg4Gif InlineQueryResultCachedMpeg4Gif
  | InlineQueryResultViaInlineQueryResultCachedPhoto InlineQueryResultCachedPhoto
  | InlineQueryResultViaInlineQueryResultCachedSticker InlineQueryResultCachedSticker
  | InlineQueryResultViaInlineQueryResultCachedVideo InlineQueryResultCachedVideo
  | InlineQueryResultViaInlineQueryResultCachedVoice InlineQueryResultCachedVoice
  | InlineQueryResultViaInlineQueryResultContact InlineQueryResultContact
  | InlineQueryResultViaInlineQueryResultDocument InlineQueryResultDocument
  | InlineQueryResultViaInlineQueryResultGame InlineQueryResultGame
  | InlineQueryResultViaInlineQueryResultGif InlineQueryResultGif
  | InlineQueryResultViaInlineQueryResultLocation InlineQueryResultLocation
  | InlineQueryResultViaInlineQueryResultMpeg4Gif InlineQueryResultMpeg4Gif
  | InlineQueryResultViaInlineQueryResultPhoto InlineQueryResultPhoto
  | InlineQueryResultViaInlineQueryResultVenue InlineQueryResultVenue
  | InlineQueryResultViaInlineQueryResultVideo InlineQueryResultVideo
  | InlineQueryResultViaInlineQueryResultVoice InlineQueryResultVoice
  | -- | A value this decoder does not recognize, preserved verbatim so
    -- the raw payload survives the boundary.
    InlineQueryResultUnknown Value
  deriving stock (Eq, Show)

-- | Plan the selected member of a 'InlineQueryResult'.
--
-- An unrecognized value is emitted verbatim; it is an explicit raw
-- escape hatch and allocates no attachment.
planInlineQueryResult :: InlineQueryResult -> FieldPlanner
planInlineQueryResult = \case
  InlineQueryResultViaInlineQueryResultArticle member_ -> planMember (planInlineQueryResultArticle member_)
  InlineQueryResultViaInlineQueryResultAudio member_ -> planMember (planInlineQueryResultAudio member_)
  InlineQueryResultViaInlineQueryResultCachedAudio member_ -> planMember (planInlineQueryResultCachedAudio member_)
  InlineQueryResultViaInlineQueryResultCachedDocument member_ -> planMember (planInlineQueryResultCachedDocument member_)
  InlineQueryResultViaInlineQueryResultCachedGif member_ -> planMember (planInlineQueryResultCachedGif member_)
  InlineQueryResultViaInlineQueryResultCachedMpeg4Gif member_ -> planMember (planInlineQueryResultCachedMpeg4Gif member_)
  InlineQueryResultViaInlineQueryResultCachedPhoto member_ -> planMember (planInlineQueryResultCachedPhoto member_)
  InlineQueryResultViaInlineQueryResultCachedSticker member_ -> planMember (planInlineQueryResultCachedSticker member_)
  InlineQueryResultViaInlineQueryResultCachedVideo member_ -> planMember (planInlineQueryResultCachedVideo member_)
  InlineQueryResultViaInlineQueryResultCachedVoice member_ -> planMember (planInlineQueryResultCachedVoice member_)
  InlineQueryResultViaInlineQueryResultContact member_ -> planMember (planInlineQueryResultContact member_)
  InlineQueryResultViaInlineQueryResultDocument member_ -> planMember (planInlineQueryResultDocument member_)
  InlineQueryResultViaInlineQueryResultGame member_ -> planMember (encodeJson member_)
  InlineQueryResultViaInlineQueryResultGif member_ -> planMember (planInlineQueryResultGif member_)
  InlineQueryResultViaInlineQueryResultLocation member_ -> planMember (planInlineQueryResultLocation member_)
  InlineQueryResultViaInlineQueryResultMpeg4Gif member_ -> planMember (planInlineQueryResultMpeg4Gif member_)
  InlineQueryResultViaInlineQueryResultPhoto member_ -> planMember (planInlineQueryResultPhoto member_)
  InlineQueryResultViaInlineQueryResultVenue member_ -> planMember (planInlineQueryResultVenue member_)
  InlineQueryResultViaInlineQueryResultVideo member_ -> planMember (planInlineQueryResultVideo member_)
  InlineQueryResultViaInlineQueryResultVoice member_ -> planMember (planInlineQueryResultVoice member_)
  InlineQueryResultUnknown raw_ -> planMember (plainValue raw_)
