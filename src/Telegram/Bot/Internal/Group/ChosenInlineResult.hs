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
module Telegram.Bot.Internal.Group.ChosenInlineResult
  ( ChosenInlineResult (..)
  , mkChosenInlineResult
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.Location (Location)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, requiredWith)

-- | Represents a result of an inline query that was chosen by the user and sent to their chat partner.
-- Note: It is necessary to enable inline feedback via \@BotFather in order to receive these objects in updates.
--
-- Source: <https://core.telegram.org/bots/api#choseninlineresult>.
-- Codec directions: decoded from responses, encoded into requests.
data ChosenInlineResult = MkChosenInlineResult
  { -- | The unique identifier for the result that was chosen
    --
    -- Wire key: @result_id@.
    result_id :: Text
  , -- | The user that chose the result
    --
    -- Wire key: @from@.
    from :: User
  , -- | Optional. Sender location, only for bots that require user location
    --
    -- Wire key: @location@.
    -- Omitted from an encoded request when it is @Nothing@.
    location :: Maybe Location
  , -- | Optional. Identifier of the sent inline message. Available only if there is an inline keyboard attached to the message. Will be also received in callback queries and can be used to edit the message.
    --
    -- Wire key: @inline_message_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    inline_message_id :: Maybe Text
  , -- | The query that was used to obtain the result
    --
    -- Wire key: @query@.
    query :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ChosenInlineResult' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkChosenInlineResult :: Text -> User -> Text -> ChosenInlineResult
mkChosenInlineResult arg0 arg1 arg2 =
  MkChosenInlineResult
    { result_id = arg0
    , from = arg1
    , location = Nothing
    , inline_message_id = Nothing
    , query = arg2
    }

instance FromJSON ChosenInlineResult where
  parseJSON = withObject "ChosenInlineResult" $ \obj ->
    do
      field_0 <- requiredWith obj "result_id" parseJSON
      field_1 <- requiredWith obj "from" parseJSON
      field_2 <- optionalWith obj "location" parseJSON
      field_3 <- optionalWith obj "inline_message_id" parseJSON
      field_4 <- requiredWith obj "query" parseJSON
      pure
        MkChosenInlineResult
          { result_id = field_0
          , from = field_1
          , location = field_2
          , inline_message_id = field_3
          , query = field_4
          }

instance ToJSON ChosenInlineResult where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "result_id" x.result_id
          , jsonField "from" x.from
          , jsonOptional "location" x.location
          , jsonOptional "inline_message_id" x.inline_message_id
          , jsonField "query" x.query
          ]
      )
  toEncoding = toEncoding . toJSON
