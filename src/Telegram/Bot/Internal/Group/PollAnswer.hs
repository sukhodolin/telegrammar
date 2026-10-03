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
module Telegram.Bot.Internal.Group.PollAnswer
  ( PollAnswer (..)
  , mkPollAnswer
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.Chat (Chat)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseInt64, parseList, requiredWith)

-- | This object represents an answer of a user in a non-anonymous poll.
--
-- Source: <https://core.telegram.org/bots/api#pollanswer>.
-- Codec directions: decoded from responses, encoded into requests.
data PollAnswer = MkPollAnswer
  { -- | Unique poll identifier
    --
    -- Wire key: @poll_id@.
    poll_id :: Text
  , -- | Optional. The chat that changed the answer to the poll, if the voter is anonymous
    --
    -- Wire key: @voter_chat@.
    -- Omitted from an encoded request when it is @Nothing@.
    voter_chat :: Maybe Chat
  , -- | Optional. The user that changed the answer to the poll, if the voter isn\'t anonymous
    --
    -- Wire key: @user@.
    -- Omitted from an encoded request when it is @Nothing@.
    user :: Maybe User
  , -- | 0-based identifiers of chosen answer options. May be empty if the vote was retracted.
    --
    -- Wire key: @option_ids@.
    option_ids :: [Int64]
  , -- | Persistent identifiers of the chosen answer options. May be empty if the vote was retracted.
    --
    -- Wire key: @option_persistent_ids@.
    option_persistent_ids :: [Text]
  }
  deriving stock (Eq, Show)

-- | Initialize a 'PollAnswer' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkPollAnswer :: Text -> [Int64] -> [Text] -> PollAnswer
mkPollAnswer arg0 arg1 arg2 =
  MkPollAnswer
    { poll_id = arg0
    , voter_chat = Nothing
    , user = Nothing
    , option_ids = arg1
    , option_persistent_ids = arg2
    }

instance FromJSON PollAnswer where
  parseJSON = withObject "PollAnswer" $ \obj ->
    do
      field_0 <- requiredWith obj "poll_id" parseJSON
      field_1 <- optionalWith obj "voter_chat" parseJSON
      field_2 <- optionalWith obj "user" parseJSON
      field_3 <- requiredWith obj "option_ids" (parseList parseInt64)
      field_4 <- requiredWith obj "option_persistent_ids" (parseList parseJSON)
      pure
        MkPollAnswer
          { poll_id = field_0
          , voter_chat = field_1
          , user = field_2
          , option_ids = field_3
          , option_persistent_ids = field_4
          }

instance ToJSON PollAnswer where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "poll_id" x.poll_id
          , jsonOptional "voter_chat" x.voter_chat
          , jsonOptional "user" x.user
          , jsonField "option_ids" x.option_ids
          , jsonField "option_persistent_ids" x.option_persistent_ids
          ]
      )
  toEncoding = toEncoding . toJSON
