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
module Telegram.Bot.Methods.SendInvoice
  ( SendInvoice (..)
  , mkSendInvoice
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.ChecklistTasksAdded (Message)
import Telegram.Bot.Internal.Group.InlineKeyboardMarkup (InlineKeyboardMarkup)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Internal.Group.LabeledPrice (LabeledPrice)
import Telegram.Bot.Internal.Group.ReplyParameters (ReplyParameters)
import Telegram.Bot.Internal.Group.SuggestedPostParameters (SuggestedPostParameters)
import Telegram.Bot.Support (Method (..), encodeJson, planList, planRequestBody, planned, plannedMaybe, validateArrayCount, withValidation)

-- | Use this method to send invoices. On success, the sent Message is returned.
--
-- Wire method spelling: @sendInvoice@.
--
-- Source: <https://core.telegram.org/bots/api#sendinvoice>.
-- Result: @Message@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SendInvoice = MkSendInvoice
  { -- | Unique identifier for the target chat or username of the target bot, supergroup or channel in the format \@username
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | Unique identifier for the target message thread (topic) of a forum; for forum supergroups and private chats of bots with forum topic mode enabled only
    --
    -- Wire key: @message_thread_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    message_thread_id :: Maybe Int64
  , -- | Identifier of the direct messages topic to which the message will be sent; required if the message is sent to a direct messages chat
    --
    -- Wire key: @direct_messages_topic_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    direct_messages_topic_id :: Maybe Int64
  , -- | Product name, 1-32 characters
    --
    -- Wire key: @title@.
    title :: Text
  , -- | Product description, 1-255 characters
    --
    -- Wire key: @description@.
    description :: Text
  , -- | Bot-defined invoice payload, 1-128 bytes. This will not be displayed to the user, use it for your internal processes.
    --
    -- Wire key: @payload@.
    payload :: Text
  , -- | Payment provider token, obtained via \@BotFather. Pass an empty string for payments in Telegram Stars.
    --
    -- Wire key: @provider_token@.
    -- Omitted from an encoded request when it is @Nothing@.
    provider_token :: Maybe Text
  , -- | Three-letter ISO 4217 currency code, see more on currencies. Pass \"XTR\" for payments in Telegram Stars.
    --
    -- Wire key: @currency@.
    currency :: Text
  , -- | Price breakdown, a JSON-serialized list of components (e.g. product price, tax, discount, delivery cost, delivery tax, bonus, etc.). Must contain exactly one item for payments in Telegram Stars.
    --
    -- Wire key: @prices@.
    prices :: [LabeledPrice]
  , -- | The maximum accepted amount for tips in the smallest units of the currency (integer, not float\/double). For example, for a maximum tip of US$ 1.45 pass max_tip_amount = 145. See the exp parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies). Defaults to 0. Not supported for payments in Telegram Stars.
    --
    -- Wire key: @max_tip_amount@.
    -- Omitted from an encoded request when it is @Nothing@.
    max_tip_amount :: Maybe Int64
  , -- | A JSON-serialized Array of suggested amounts of tips in the smallest units of the currency (integer, not float\/double). At most 4 suggested tip amounts can be specified. The suggested tip amounts must be positive, passed in a strictly increased order and must not exceed max_tip_amount.
    --
    -- Wire key: @suggested_tip_amounts@.
    -- Omitted from an encoded request when it is @Nothing@.
    -- Checked when planning a request: at most 4 element(s).
    suggested_tip_amounts :: Maybe [Int64]
  , -- | Unique deep-linking parameter. If left empty, forwarded copies of the sent message will have a Pay button, allowing multiple users to pay directly from the forwarded message, using the same invoice. If non-empty, forwarded copies of the sent message will have a URL button with a deep link to the bot (instead of a Pay button), with the value used as the start parameter.
    --
    -- Wire key: @start_parameter@.
    -- Omitted from an encoded request when it is @Nothing@.
    start_parameter :: Maybe Text
  , -- | JSON-serialized data about the invoice, which will be shared with the payment provider. A detailed description of required fields should be provided by the payment provider.
    --
    -- Wire key: @provider_data@.
    -- Omitted from an encoded request when it is @Nothing@.
    provider_data :: Maybe Text
  , -- | URL of the product photo for the invoice. Can be a photo of the goods or a marketing image for a service. People like it better when they see what they are paying for.
    --
    -- Wire key: @photo_url@.
    -- Omitted from an encoded request when it is @Nothing@.
    photo_url :: Maybe Text
  , -- | Photo size in bytes
    --
    -- Wire key: @photo_size@.
    -- Omitted from an encoded request when it is @Nothing@.
    photo_size :: Maybe Int64
  , -- | Photo width
    --
    -- Wire key: @photo_width@.
    -- Omitted from an encoded request when it is @Nothing@.
    photo_width :: Maybe Int64
  , -- | Photo height
    --
    -- Wire key: @photo_height@.
    -- Omitted from an encoded request when it is @Nothing@.
    photo_height :: Maybe Int64
  , -- | Pass True if you require the user\'s full name to complete the order. Ignored for payments in Telegram Stars.
    --
    -- Wire key: @need_name@.
    -- Omitted from an encoded request when it is @Nothing@.
    need_name :: Maybe Bool
  , -- | Pass True if you require the user\'s phone number to complete the order. Ignored for payments in Telegram Stars.
    --
    -- Wire key: @need_phone_number@.
    -- Omitted from an encoded request when it is @Nothing@.
    need_phone_number :: Maybe Bool
  , -- | Pass True if you require the user\'s email address to complete the order. Ignored for payments in Telegram Stars.
    --
    -- Wire key: @need_email@.
    -- Omitted from an encoded request when it is @Nothing@.
    need_email :: Maybe Bool
  , -- | Pass True if you require the user\'s shipping address to complete the order. Ignored for payments in Telegram Stars.
    --
    -- Wire key: @need_shipping_address@.
    -- Omitted from an encoded request when it is @Nothing@.
    need_shipping_address :: Maybe Bool
  , -- | Pass True if the user\'s phone number should be sent to the provider. Ignored for payments in Telegram Stars.
    --
    -- Wire key: @send_phone_number_to_provider@.
    -- Omitted from an encoded request when it is @Nothing@.
    send_phone_number_to_provider :: Maybe Bool
  , -- | Pass True if the user\'s email address should be sent to the provider. Ignored for payments in Telegram Stars.
    --
    -- Wire key: @send_email_to_provider@.
    -- Omitted from an encoded request when it is @Nothing@.
    send_email_to_provider :: Maybe Bool
  , -- | Pass True if the final price depends on the shipping method. Ignored for payments in Telegram Stars.
    --
    -- Wire key: @is_flexible@.
    -- Omitted from an encoded request when it is @Nothing@.
    is_flexible :: Maybe Bool
  , -- | Sends the message silently. Users will receive a notification with no sound.
    --
    -- Wire key: @disable_notification@.
    -- Omitted from an encoded request when it is @Nothing@.
    disable_notification :: Maybe Bool
  , -- | Protects the contents of the sent message from forwarding and saving
    --
    -- Wire key: @protect_content@.
    -- Omitted from an encoded request when it is @Nothing@.
    protect_content :: Maybe Bool
  , -- | Pass True to allow up to 1000 messages per second, ignoring broadcasting limits for a fee of 0.1 Telegram Stars per message. The relevant Stars will be withdrawn from the bot\'s balance.
    --
    -- Wire key: @allow_paid_broadcast@.
    -- Omitted from an encoded request when it is @Nothing@.
    allow_paid_broadcast :: Maybe Bool
  , -- | Unique identifier of the message effect to be added to the message; for private chats only
    --
    -- Wire key: @message_effect_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    message_effect_id :: Maybe Text
  , -- | A JSON-serialized object containing the parameters of the suggested post to send; for direct messages chats only. If the message is sent as a reply to another suggested post, then that suggested post is automatically declined.
    --
    -- Wire key: @suggested_post_parameters@.
    -- Omitted from an encoded request when it is @Nothing@.
    suggested_post_parameters :: Maybe SuggestedPostParameters
  , -- | Description of the message to reply to
    --
    -- Wire key: @reply_parameters@.
    -- Omitted from an encoded request when it is @Nothing@.
    reply_parameters :: Maybe ReplyParameters
  , -- | A JSON-serialized object for an inline keyboard. If empty, one \'Pay total price\' button will be shown. If not empty, the first button must be a Pay button.
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

-- | Initialize a 'SendInvoice' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSendInvoice :: IntegerOrString -> Text -> Text -> Text -> Text -> [LabeledPrice] -> SendInvoice
mkSendInvoice arg0 arg1 arg2 arg3 arg4 arg5 =
  MkSendInvoice
    { chat_id = arg0
    , message_thread_id = Nothing
    , direct_messages_topic_id = Nothing
    , title = arg1
    , description = arg2
    , payload = arg3
    , provider_token = Nothing
    , currency = arg4
    , prices = arg5
    , max_tip_amount = Nothing
    , suggested_tip_amounts = Nothing
    , start_parameter = Nothing
    , provider_data = Nothing
    , photo_url = Nothing
    , photo_size = Nothing
    , photo_width = Nothing
    , photo_height = Nothing
    , need_name = Nothing
    , need_phone_number = Nothing
    , need_email = Nothing
    , need_shipping_address = Nothing
    , send_phone_number_to_provider = Nothing
    , send_email_to_provider = Nothing
    , is_flexible = Nothing
    , disable_notification = Nothing
    , protect_content = Nothing
    , allow_paid_broadcast = Nothing
    , message_effect_id = Nothing
    , suggested_post_parameters = Nothing
    , reply_parameters = Nothing
    , reply_markup = Nothing
    , extra = mempty
    }

instance Method SendInvoice where
  type Result SendInvoice = Message
  methodName _ = "sendInvoice"
  planRequest x =
    planRequestBody
      "sendInvoice"
      [ "chat_id"
      , "message_thread_id"
      , "direct_messages_topic_id"
      , "title"
      , "description"
      , "payload"
      , "provider_token"
      , "currency"
      , "prices"
      , "max_tip_amount"
      , "suggested_tip_amounts"
      , "start_parameter"
      , "provider_data"
      , "photo_url"
      , "photo_size"
      , "photo_width"
      , "photo_height"
      , "need_name"
      , "need_phone_number"
      , "need_email"
      , "need_shipping_address"
      , "send_phone_number_to_provider"
      , "send_email_to_provider"
      , "is_flexible"
      , "disable_notification"
      , "protect_content"
      , "allow_paid_broadcast"
      , "message_effect_id"
      , "suggested_post_parameters"
      , "reply_parameters"
      , "reply_markup"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          , plannedMaybe "message_thread_id" x.message_thread_id encodeJson
          , plannedMaybe "direct_messages_topic_id" x.direct_messages_topic_id encodeJson
          , planned "title" (encodeJson x.title)
          , planned "description" (encodeJson x.description)
          , planned "payload" (encodeJson x.payload)
          , plannedMaybe "provider_token" x.provider_token encodeJson
          , planned "currency" (encodeJson x.currency)
          , planned "prices" ((planList encodeJson) x.prices)
          , plannedMaybe "max_tip_amount" x.max_tip_amount encodeJson
          , plannedMaybe "suggested_tip_amounts" x.suggested_tip_amounts (\v_ -> withValidation (\loc_ -> validateArrayCount Nothing (Just 4) loc_ v_) ((planList encodeJson) v_))
          , plannedMaybe "start_parameter" x.start_parameter encodeJson
          , plannedMaybe "provider_data" x.provider_data encodeJson
          , plannedMaybe "photo_url" x.photo_url encodeJson
          , plannedMaybe "photo_size" x.photo_size encodeJson
          , plannedMaybe "photo_width" x.photo_width encodeJson
          , plannedMaybe "photo_height" x.photo_height encodeJson
          , plannedMaybe "need_name" x.need_name encodeJson
          , plannedMaybe "need_phone_number" x.need_phone_number encodeJson
          , plannedMaybe "need_email" x.need_email encodeJson
          , plannedMaybe "need_shipping_address" x.need_shipping_address encodeJson
          , plannedMaybe "send_phone_number_to_provider" x.send_phone_number_to_provider encodeJson
          , plannedMaybe "send_email_to_provider" x.send_email_to_provider encodeJson
          , plannedMaybe "is_flexible" x.is_flexible encodeJson
          , plannedMaybe "disable_notification" x.disable_notification encodeJson
          , plannedMaybe "protect_content" x.protect_content encodeJson
          , plannedMaybe "allow_paid_broadcast" x.allow_paid_broadcast encodeJson
          , plannedMaybe "message_effect_id" x.message_effect_id encodeJson
          , plannedMaybe "suggested_post_parameters" x.suggested_post_parameters encodeJson
          , plannedMaybe "reply_parameters" x.reply_parameters encodeJson
          , plannedMaybe "reply_markup" x.reply_markup encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
