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
module Telegram.Bot.Methods.SendGift
  ( SendGift (..)
  , mkSendGift
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Internal.Group.MessageEntity (MessageEntity)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planList, planRequestBody, planned, plannedMaybe)

-- | Sends a gift to the given user or channel chat. The gift can\'t be converted to Telegram Stars by the receiver. Returns True on success.
--
-- Wire method spelling: @sendGift@.
--
-- Source: <https://core.telegram.org/bots/api#sendgift>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SendGift = MkSendGift
  { -- | Required if chat_id is not specified. Unique identifier of the target user who will receive the gift.
    --
    -- Wire key: @user_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    user_id :: Maybe Int64
  , -- | Required if user_id is not specified. Unique identifier for the chat or username of the channel (in the format \@username) that will receive the gift.
    --
    -- Wire key: @chat_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    chat_id :: Maybe IntegerOrString
  , -- | Identifier of the gift; limited gifts can\'t be sent to channel chats
    --
    -- Wire key: @gift_id@.
    gift_id :: Text
  , -- | Pass True to pay for the gift upgrade from the bot\'s balance, thereby making the upgrade free for the receiver
    --
    -- Wire key: @pay_for_upgrade@.
    -- Omitted from an encoded request when it is @Nothing@.
    pay_for_upgrade :: Maybe Bool
  , -- | Text that will be shown along with the gift; 0-128 characters
    --
    -- Wire key: @text@.
    -- Omitted from an encoded request when it is @Nothing@.
    text :: Maybe Text
  , -- | Mode for parsing entities in the text. See formatting options for more details. Entities other than \"bold\", \"italic\", \"underline\", \"strikethrough\", \"spoiler\", \"custom_emoji\", and \"date_time\" are ignored.
    --
    -- Wire key: @text_parse_mode@.
    -- Omitted from an encoded request when it is @Nothing@.
    text_parse_mode :: Maybe Text
  , -- | A JSON-serialized list of special entities that appear in the gift text. It can be specified instead of text_parse_mode. Entities other than \"bold\", \"italic\", \"underline\", \"strikethrough\", \"spoiler\", \"custom_emoji\", and \"date_time\" are ignored.
    --
    -- Wire key: @text_entities@.
    -- Omitted from an encoded request when it is @Nothing@.
    text_entities :: Maybe [MessageEntity]
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SendGift' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSendGift :: Text -> SendGift
mkSendGift arg0 =
  MkSendGift
    { user_id = Nothing
    , chat_id = Nothing
    , gift_id = arg0
    , pay_for_upgrade = Nothing
    , text = Nothing
    , text_parse_mode = Nothing
    , text_entities = Nothing
    , extra = mempty
    }

instance Method SendGift where
  type Result SendGift = TrueValue
  methodName _ = "sendGift"
  planRequest x =
    planRequestBody
      "sendGift"
      [ "user_id"
      , "chat_id"
      , "gift_id"
      , "pay_for_upgrade"
      , "text"
      , "text_parse_mode"
      , "text_entities"
      ]
      ( concat
          [ plannedMaybe "user_id" x.user_id encodeJson
          , plannedMaybe "chat_id" x.chat_id encodeJson
          , planned "gift_id" (encodeJson x.gift_id)
          , plannedMaybe "pay_for_upgrade" x.pay_for_upgrade encodeJson
          , plannedMaybe "text" x.text encodeJson
          , plannedMaybe "text_parse_mode" x.text_parse_mode encodeJson
          , plannedMaybe "text_entities" x.text_entities (planList encodeJson)
          ]
      )
      x.extra
  parseResult _ = parseJSON
