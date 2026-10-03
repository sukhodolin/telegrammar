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
module Telegram.Bot.Internal.Group.PollOption
  ( PollOption (..)
  , mkPollOption
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.Chat (Chat)
import Telegram.Bot.Internal.Group.MessageEntity (MessageEntity)
import Telegram.Bot.Internal.Group.PollMedia (PollMedia)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseInt64, parseList, requiredWith)

-- | This object contains information about one answer option in a poll.
--
-- Source: <https://core.telegram.org/bots/api#polloption>.
-- Codec directions: decoded from responses, encoded into requests.
data PollOption = MkPollOption
  { -- | Unique identifier of the option, persistent on option addition and deletion
    --
    -- Wire key: @persistent_id@.
    persistent_id :: Text
  , -- | Option text, 1-100 characters
    --
    -- Wire key: @text@.
    text :: Text
  , -- | Optional. Special entities that appear in the option text. Currently, only custom emoji entities are allowed in poll option texts
    --
    -- Wire key: @text_entities@.
    -- Omitted from an encoded request when it is @Nothing@.
    text_entities :: Maybe [MessageEntity]
  , -- | Optional. Media added to the poll option
    --
    -- Wire key: @media@.
    -- Omitted from an encoded request when it is @Nothing@.
    media :: Maybe PollMedia
  , -- | Number of users who voted for this option; may be 0 if unknown
    --
    -- Wire key: @voter_count@.
    voter_count :: Int64
  , -- | Optional. User who added the option; omitted if the option wasn\'t added by a user after poll creation
    --
    -- Wire key: @added_by_user@.
    -- Omitted from an encoded request when it is @Nothing@.
    added_by_user :: Maybe User
  , -- | Optional. Chat that added the option; omitted if the option wasn\'t added by a chat after poll creation
    --
    -- Wire key: @added_by_chat@.
    -- Omitted from an encoded request when it is @Nothing@.
    added_by_chat :: Maybe Chat
  , -- | Optional. Point in time (Unix timestamp) when the option was added; omitted if the option existed in the original poll
    --
    -- Wire key: @addition_date@.
    -- Omitted from an encoded request when it is @Nothing@.
    addition_date :: Maybe Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'PollOption' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkPollOption :: Text -> Text -> Int64 -> PollOption
mkPollOption arg0 arg1 arg2 =
  MkPollOption
    { persistent_id = arg0
    , text = arg1
    , text_entities = Nothing
    , media = Nothing
    , voter_count = arg2
    , added_by_user = Nothing
    , added_by_chat = Nothing
    , addition_date = Nothing
    }

instance FromJSON PollOption where
  parseJSON = withObject "PollOption" $ \obj ->
    do
      field_0 <- requiredWith obj "persistent_id" parseJSON
      field_1 <- requiredWith obj "text" parseJSON
      field_2 <- optionalWith obj "text_entities" (parseList parseJSON)
      field_3 <- optionalWith obj "media" parseJSON
      field_4 <- requiredWith obj "voter_count" parseInt64
      field_5 <- optionalWith obj "added_by_user" parseJSON
      field_6 <- optionalWith obj "added_by_chat" parseJSON
      field_7 <- optionalWith obj "addition_date" parseInt64
      pure
        MkPollOption
          { persistent_id = field_0
          , text = field_1
          , text_entities = field_2
          , media = field_3
          , voter_count = field_4
          , added_by_user = field_5
          , added_by_chat = field_6
          , addition_date = field_7
          }

instance ToJSON PollOption where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "persistent_id" x.persistent_id
          , jsonField "text" x.text
          , jsonOptional "text_entities" x.text_entities
          , jsonOptional "media" x.media
          , jsonField "voter_count" x.voter_count
          , jsonOptional "added_by_user" x.added_by_user
          , jsonOptional "added_by_chat" x.added_by_chat
          , jsonOptional "addition_date" x.addition_date
          ]
      )
  toEncoding = toEncoding . toJSON
