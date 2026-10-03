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
module Telegram.Bot.Methods.GetGameHighScores
  ( GetGameHighScores (..)
  , mkGetGameHighScores
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.GameHighScore (GameHighScore)
import Telegram.Bot.Support (Method (..), encodeJson, parseList, planRequestBody, planned, plannedMaybe)

-- | Use this method to get data for high score tables. Will return the score of the specified user and several of their neighbors in a game. Returns an Array of GameHighScore objects.
--
-- Wire method spelling: @getGameHighScores@.
--
-- Source: <https://core.telegram.org/bots/api#getgamehighscores>.
-- Result: @[GameHighScore]@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data GetGameHighScores = MkGetGameHighScores
  { -- | Target user id
    --
    -- Wire key: @user_id@.
    user_id :: Int64
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

-- | Initialize a 'GetGameHighScores' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkGetGameHighScores :: Int64 -> GetGameHighScores
mkGetGameHighScores arg0 =
  MkGetGameHighScores
    { user_id = arg0
    , chat_id = Nothing
    , message_id = Nothing
    , inline_message_id = Nothing
    , extra = mempty
    }

instance Method GetGameHighScores where
  type Result GetGameHighScores = [GameHighScore]
  methodName _ = "getGameHighScores"
  planRequest x =
    planRequestBody
      "getGameHighScores"
      [ "user_id"
      , "chat_id"
      , "message_id"
      , "inline_message_id"
      ]
      ( concat
          [ planned "user_id" (encodeJson x.user_id)
          , plannedMaybe "chat_id" x.chat_id encodeJson
          , plannedMaybe "message_id" x.message_id encodeJson
          , plannedMaybe "inline_message_id" x.inline_message_id encodeJson
          ]
      )
      x.extra
  parseResult _ = (parseList parseJSON)
