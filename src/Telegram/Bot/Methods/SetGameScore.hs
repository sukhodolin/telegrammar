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
module Telegram.Bot.Methods.SetGameScore
  ( SetGameScore (..)
  , mkSetGameScore
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.MessageOrTrue (MessageOrTrue)
import Telegram.Bot.Support (Method (..), encodeJson, planRequestBody, planned, plannedMaybe)

-- | Use this method to set the score of the specified user in a game message. On success, if the message is not an inline message, the Message is returned, otherwise True is returned. Returns an error, if the new score is not greater than the user\'s current score in the chat and force is False.
--
-- Wire method spelling: @setGameScore@.
--
-- Source: <https://core.telegram.org/bots/api#setgamescore>.
-- Result: @MessageOrTrue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SetGameScore = MkSetGameScore
  { -- | User identifier
    --
    -- Wire key: @user_id@.
    user_id :: Int64
  , -- | New score, must be non-negative
    --
    -- Wire key: @score@.
    score :: Int64
  , -- | Pass True if the high score is allowed to decrease. This can be useful when fixing mistakes or banning cheaters.
    --
    -- Wire key: @force@.
    -- Omitted from an encoded request when it is @Nothing@.
    force :: Maybe Bool
  , -- | Pass True if the game message should not be automatically edited to include the current scoreboard
    --
    -- Wire key: @disable_edit_message@.
    -- Omitted from an encoded request when it is @Nothing@.
    disable_edit_message :: Maybe Bool
  , -- | Required if inline_message_id is not specified. Unique identifier for the target chat.
    --
    -- Wire key: @chat_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    chat_id :: Maybe Int64
  , -- | Required if inline_message_id is not specified. Identifier of the sent message.
    --
    -- Wire key: @message_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    message_id :: Maybe Int64
  , -- | Required if chat_id and message_id are not specified. Identifier of the inline message.
    --
    -- Wire key: @inline_message_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    inline_message_id :: Maybe Text
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SetGameScore' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSetGameScore :: Int64 -> Int64 -> SetGameScore
mkSetGameScore arg0 arg1 =
  MkSetGameScore
    { user_id = arg0
    , score = arg1
    , force = Nothing
    , disable_edit_message = Nothing
    , chat_id = Nothing
    , message_id = Nothing
    , inline_message_id = Nothing
    , extra = mempty
    }

instance Method SetGameScore where
  type Result SetGameScore = MessageOrTrue
  methodName _ = "setGameScore"
  planRequest x =
    planRequestBody
      "setGameScore"
      [ "user_id"
      , "score"
      , "force"
      , "disable_edit_message"
      , "chat_id"
      , "message_id"
      , "inline_message_id"
      ]
      ( concat
          [ planned "user_id" (encodeJson x.user_id)
          , planned "score" (encodeJson x.score)
          , plannedMaybe "force" x.force encodeJson
          , plannedMaybe "disable_edit_message" x.disable_edit_message encodeJson
          , plannedMaybe "chat_id" x.chat_id encodeJson
          , plannedMaybe "message_id" x.message_id encodeJson
          , plannedMaybe "inline_message_id" x.inline_message_id encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
