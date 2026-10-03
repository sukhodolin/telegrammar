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
module Telegram.Bot.Methods.CreateInvoiceLink
  ( CreateInvoiceLink (..)
  , mkCreateInvoiceLink
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.LabeledPrice (LabeledPrice)
import Telegram.Bot.Support (Method (..), encodeJson, planList, planRequestBody, planned, plannedMaybe, validateArrayCount, withValidation)

-- | Use this method to create a link for an invoice. Returns the created invoice link as String on success.
--
-- Wire method spelling: @createInvoiceLink@.
--
-- Source: <https://core.telegram.org/bots/api#createinvoicelink>.
-- Result: @Text@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data CreateInvoiceLink = MkCreateInvoiceLink
  { -- | Unique identifier of the business connection on behalf of which the link will be created. For payments in Telegram Stars only.
    --
    -- Wire key: @business_connection_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    business_connection_id :: Maybe Text
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
  , -- | The number of seconds the subscription will be active for before the next payment. The currency must be set to \"XTR\" (Telegram Stars) if the parameter is used. Currently, it must always be 2592000 (30 days) if specified. Any number of subscriptions can be active for a given bot at the same time, including multiple concurrent subscriptions from the same user. Subscription price must no exceed 10000 Telegram Stars.
    --
    -- Wire key: @subscription_period@.
    -- Omitted from an encoded request when it is @Nothing@.
    subscription_period :: Maybe Int64
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
  , -- | JSON-serialized data about the invoice, which will be shared with the payment provider. A detailed description of required fields should be provided by the payment provider.
    --
    -- Wire key: @provider_data@.
    -- Omitted from an encoded request when it is @Nothing@.
    provider_data :: Maybe Text
  , -- | URL of the product photo for the invoice. Can be a photo of the goods or a marketing image for a service.
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
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'CreateInvoiceLink' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkCreateInvoiceLink :: Text -> Text -> Text -> Text -> [LabeledPrice] -> CreateInvoiceLink
mkCreateInvoiceLink arg0 arg1 arg2 arg3 arg4 =
  MkCreateInvoiceLink
    { business_connection_id = Nothing
    , title = arg0
    , description = arg1
    , payload = arg2
    , provider_token = Nothing
    , currency = arg3
    , prices = arg4
    , subscription_period = Nothing
    , max_tip_amount = Nothing
    , suggested_tip_amounts = Nothing
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
    , extra = mempty
    }

instance Method CreateInvoiceLink where
  type Result CreateInvoiceLink = Text
  methodName _ = "createInvoiceLink"
  planRequest x =
    planRequestBody
      "createInvoiceLink"
      [ "business_connection_id"
      , "title"
      , "description"
      , "payload"
      , "provider_token"
      , "currency"
      , "prices"
      , "subscription_period"
      , "max_tip_amount"
      , "suggested_tip_amounts"
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
      ]
      ( concat
          [ plannedMaybe "business_connection_id" x.business_connection_id encodeJson
          , planned "title" (encodeJson x.title)
          , planned "description" (encodeJson x.description)
          , planned "payload" (encodeJson x.payload)
          , plannedMaybe "provider_token" x.provider_token encodeJson
          , planned "currency" (encodeJson x.currency)
          , planned "prices" ((planList encodeJson) x.prices)
          , plannedMaybe "subscription_period" x.subscription_period encodeJson
          , plannedMaybe "max_tip_amount" x.max_tip_amount encodeJson
          , plannedMaybe "suggested_tip_amounts" x.suggested_tip_amounts (\v_ -> withValidation (\loc_ -> validateArrayCount Nothing (Just 4) loc_ v_) ((planList encodeJson) v_))
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
          ]
      )
      x.extra
  parseResult _ = parseJSON
