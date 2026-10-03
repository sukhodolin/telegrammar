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
module Telegram.Bot.Internal.Group.InlineQuery
  ( InlineQuery (..)
  , mkInlineQuery
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.Location (Location)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, requiredWith)

-- | This object represents an incoming inline query. When the user sends an empty query, your bot could return some default or trending results.
--
-- Source: <https://core.telegram.org/bots/api#inlinequery>.
-- Codec directions: decoded from responses, encoded into requests.
data InlineQuery = MkInlineQuery
  { -- | Unique identifier for this query
    --
    -- Wire key: @id@.
    id :: Text
  , -- | Sender
    --
    -- Wire key: @from@.
    from :: User
  , -- | Text of the query (up to 256 characters)
    --
    -- Wire key: @query@.
    query :: Text
  , -- | Offset of the results to be returned, can be controlled by the bot
    --
    -- Wire key: @offset@.
    offset :: Text
  , -- | Optional. Type of the chat from which the inline query was sent. Can be either \"sender\" for a private chat with the inline query sender, \"private\", \"group\", \"supergroup\", or \"channel\". The chat type should be always known for requests sent from official clients and most third-party clients, unless the request was sent from a secret chat.
    --
    -- Wire key: @chat_type@.
    -- Omitted from an encoded request when it is @Nothing@.
    chat_type :: Maybe Text
  , -- | Optional. Sender location, only for bots that request user location
    --
    -- Wire key: @location@.
    -- Omitted from an encoded request when it is @Nothing@.
    location :: Maybe Location
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InlineQuery' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInlineQuery :: Text -> User -> Text -> Text -> InlineQuery
mkInlineQuery arg0 arg1 arg2 arg3 =
  MkInlineQuery
    { id = arg0
    , from = arg1
    , query = arg2
    , offset = arg3
    , chat_type = Nothing
    , location = Nothing
    }

instance FromJSON InlineQuery where
  parseJSON = withObject "InlineQuery" $ \obj ->
    do
      field_0 <- requiredWith obj "id" parseJSON
      field_1 <- requiredWith obj "from" parseJSON
      field_2 <- requiredWith obj "query" parseJSON
      field_3 <- requiredWith obj "offset" parseJSON
      field_4 <- optionalWith obj "chat_type" parseJSON
      field_5 <- optionalWith obj "location" parseJSON
      pure
        MkInlineQuery
          { id = field_0
          , from = field_1
          , query = field_2
          , offset = field_3
          , chat_type = field_4
          , location = field_5
          }

instance ToJSON InlineQuery where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "id" x.id
          , jsonField "from" x.from
          , jsonField "query" x.query
          , jsonField "offset" x.offset
          , jsonOptional "chat_type" x.chat_type
          , jsonOptional "location" x.location
          ]
      )
  toEncoding = toEncoding . toJSON
