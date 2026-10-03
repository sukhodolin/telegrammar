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
module Telegram.Bot.Methods.EditMessageLiveLocation
  ( EditMessageLiveLocation (..)
  , mkEditMessageLiveLocation
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Scientific (Scientific)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.InlineKeyboardMarkup (InlineKeyboardMarkup)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Internal.Group.MessageOrTrue (MessageOrTrue)
import Telegram.Bot.Support (Method (..), encodeJson, planRequestBody, planned, plannedMaybe)

-- | Use this method to edit live location messages. A location can be edited until its live_period expires or editing is explicitly disabled by a call to stopMessageLiveLocation. On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned.
--
-- Wire method spelling: @editMessageLiveLocation@.
--
-- Source: <https://core.telegram.org/bots/api#editmessagelivelocation>.
-- Result: @MessageOrTrue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data EditMessageLiveLocation = MkEditMessageLiveLocation
  { -- | Unique identifier of the business connection on behalf of which the message to be edited was sent
    --
    -- Wire key: @business_connection_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    business_connection_id :: Maybe Text
  , -- | Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target bot, supergroup or channel in the format \@username.
    --
    -- Wire key: @chat_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    chat_id :: Maybe IntegerOrString
  , -- | Required if inline_message_id is not specified. Identifier of the message to edit.
    --
    -- Wire key: @message_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    message_id :: Maybe Int64
  , -- | Required if chat_id and message_id are not specified. Identifier of the inline message.
    --
    -- Wire key: @inline_message_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    inline_message_id :: Maybe Text
  , -- | Latitude of new location
    --
    -- Wire key: @latitude@.
    latitude :: Scientific
  , -- | Longitude of new location
    --
    -- Wire key: @longitude@.
    longitude :: Scientific
  , -- | New period in seconds during which the location can be updated, starting from the message send date. If 0x7FFFFFFF is specified, then the location can be updated forever. Otherwise, the new value must not exceed the current live_period by more than a day, and the live location expiration date must remain within the next 90 days. If not specified, then live_period remains unchanged.
    --
    -- Wire key: @live_period@.
    -- Omitted from an encoded request when it is @Nothing@.
    live_period :: Maybe Int64
  , -- | The radius of uncertainty for the location, measured in meters; 0-1500
    --
    -- Wire key: @horizontal_accuracy@.
    -- Omitted from an encoded request when it is @Nothing@.
    horizontal_accuracy :: Maybe Scientific
  , -- | Direction in which the user is moving, in degrees. Must be between 1 and 360 if specified.
    --
    -- Wire key: @heading@.
    -- Omitted from an encoded request when it is @Nothing@.
    heading :: Maybe Int64
  , -- | The maximum distance for proximity alerts about approaching another chat member, in meters. Must be between 1 and 100000 if specified.
    --
    -- Wire key: @proximity_alert_radius@.
    -- Omitted from an encoded request when it is @Nothing@.
    proximity_alert_radius :: Maybe Int64
  , -- | A JSON-serialized object for a new inline keyboard
    --
    -- Wire key: @reply_markup@.
    -- Omitted from an encoded request when it is @Nothing@.
    reply_markup :: Maybe InlineKeyboardMarkup
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'EditMessageLiveLocation' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkEditMessageLiveLocation :: Scientific -> Scientific -> EditMessageLiveLocation
mkEditMessageLiveLocation arg0 arg1 =
  MkEditMessageLiveLocation
    { business_connection_id = Nothing
    , chat_id = Nothing
    , message_id = Nothing
    , inline_message_id = Nothing
    , latitude = arg0
    , longitude = arg1
    , live_period = Nothing
    , horizontal_accuracy = Nothing
    , heading = Nothing
    , proximity_alert_radius = Nothing
    , reply_markup = Nothing
    , extra = mempty
    }

instance Method EditMessageLiveLocation where
  type Result EditMessageLiveLocation = MessageOrTrue
  methodName _ = "editMessageLiveLocation"
  planRequest x =
    planRequestBody
      "editMessageLiveLocation"
      [ "business_connection_id"
      , "chat_id"
      , "message_id"
      , "inline_message_id"
      , "latitude"
      , "longitude"
      , "live_period"
      , "horizontal_accuracy"
      , "heading"
      , "proximity_alert_radius"
      , "reply_markup"
      ]
      ( concat
          [ plannedMaybe "business_connection_id" x.business_connection_id encodeJson
          , plannedMaybe "chat_id" x.chat_id encodeJson
          , plannedMaybe "message_id" x.message_id encodeJson
          , plannedMaybe "inline_message_id" x.inline_message_id encodeJson
          , planned "latitude" (encodeJson x.latitude)
          , planned "longitude" (encodeJson x.longitude)
          , plannedMaybe "live_period" x.live_period encodeJson
          , plannedMaybe "horizontal_accuracy" x.horizontal_accuracy encodeJson
          , plannedMaybe "heading" x.heading encodeJson
          , plannedMaybe "proximity_alert_radius" x.proximity_alert_radius encodeJson
          , plannedMaybe "reply_markup" x.reply_markup encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
