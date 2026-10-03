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
module Telegram.Bot.Internal.Group.CallbackQuery
  ( CallbackQuery (..)
  , mkCallbackQuery
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.ChecklistTasksAdded (MaybeInaccessibleMessage)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, requiredWith)

-- | This object represents an incoming callback query from a callback button in an inline keyboard. If the button that originated the query was attached to a message sent by the bot, the field message will be present. If the button was attached to a message sent via the bot (in inline mode), the field inline_message_id will be present. Exactly one of the fields data or game_short_name will be present.
--
-- Source: <https://core.telegram.org/bots/api#callbackquery>.
-- Codec directions: decoded from responses, encoded into requests.
data CallbackQuery = MkCallbackQuery
  { -- | Unique identifier for this query
    --
    -- Wire key: @id@.
    id :: Text
  , -- | Sender
    --
    -- Wire key: @from@.
    from :: User
  , -- | Optional. Message sent by the bot with the callback button that originated the query
    --
    -- Wire key: @message@.
    -- Omitted from an encoded request when it is @Nothing@.
    message :: Maybe MaybeInaccessibleMessage
  , -- | Optional. Identifier of the message sent via the bot in inline mode, that originated the query
    --
    -- Wire key: @inline_message_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    inline_message_id :: Maybe Text
  , -- | Global identifier, uniquely corresponding to the chat to which the message with the callback button was sent. Useful for high scores in games.
    --
    -- Wire key: @chat_instance@.
    chat_instance :: Text
  , -- | Optional. Data associated with the callback button. Be aware that the message originated the query can contain no callback buttons with this data.
    --
    -- Wire key: @data@.
    -- Omitted from an encoded request when it is @Nothing@.
    data_ :: Maybe Text
  , -- | Optional. Short name of a Game to be returned, serves as the unique identifier for the game
    --
    -- Wire key: @game_short_name@.
    -- Omitted from an encoded request when it is @Nothing@.
    game_short_name :: Maybe Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'CallbackQuery' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkCallbackQuery :: Text -> User -> Text -> CallbackQuery
mkCallbackQuery arg0 arg1 arg2 =
  MkCallbackQuery
    { id = arg0
    , from = arg1
    , message = Nothing
    , inline_message_id = Nothing
    , chat_instance = arg2
    , data_ = Nothing
    , game_short_name = Nothing
    }

instance FromJSON CallbackQuery where
  parseJSON = withObject "CallbackQuery" $ \obj ->
    do
      field_0 <- requiredWith obj "id" parseJSON
      field_1 <- requiredWith obj "from" parseJSON
      field_2 <- optionalWith obj "message" parseJSON
      field_3 <- optionalWith obj "inline_message_id" parseJSON
      field_4 <- requiredWith obj "chat_instance" parseJSON
      field_5 <- optionalWith obj "data" parseJSON
      field_6 <- optionalWith obj "game_short_name" parseJSON
      pure
        MkCallbackQuery
          { id = field_0
          , from = field_1
          , message = field_2
          , inline_message_id = field_3
          , chat_instance = field_4
          , data_ = field_5
          , game_short_name = field_6
          }

instance ToJSON CallbackQuery where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "id" x.id
          , jsonField "from" x.from
          , jsonOptional "message" x.message
          , jsonOptional "inline_message_id" x.inline_message_id
          , jsonField "chat_instance" x.chat_instance
          , jsonOptional "data" x.data_
          , jsonOptional "game_short_name" x.game_short_name
          ]
      )
  toEncoding = toEncoding . toJSON
