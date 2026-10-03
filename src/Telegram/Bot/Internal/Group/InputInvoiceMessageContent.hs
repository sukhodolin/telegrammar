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
module Telegram.Bot.Internal.Group.InputInvoiceMessageContent
  ( InputInvoiceMessageContent (..)
  , mkInputInvoiceMessageContent
  , planInputInvoiceMessageContent
  ) where

import Data.Aeson (ToJSON (..))
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.LabeledPrice (LabeledPrice)
import Telegram.Bot.Support (FieldPlanner, encodeJson, jsonField, jsonObject, jsonOptional, planList, planRecord, planned, plannedMaybe, validateArrayCount, withValidation)

-- | Represents the content of an invoice message to be sent as the result of an inline query.
--
-- Source: <https://core.telegram.org/bots/api#inputinvoicemessagecontent>.
-- Codec directions: encoded into requests, planned into checked requests.
data InputInvoiceMessageContent = MkInputInvoiceMessageContent
  { -- | Product name, 1-32 characters
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
  , -- | Optional. Payment provider token, obtained via \@BotFather. Pass an empty string for payments in Telegram Stars.
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
  , -- | Optional. The maximum accepted amount for tips in the smallest units of the currency (integer, not float\/double). For example, for a maximum tip of US$ 1.45 pass max_tip_amount = 145. See the exp parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies). Defaults to 0. Not supported for payments in Telegram Stars.
    --
    -- Wire key: @max_tip_amount@.
    -- Omitted from an encoded request when it is @Nothing@.
    max_tip_amount :: Maybe Int64
  , -- | Optional. A JSON-serialized Array of suggested amounts of tip in the smallest units of the currency (integer, not float\/double). At most 4 suggested tip amounts can be specified. The suggested tip amounts must be positive, passed in a strictly increased order and must not exceed max_tip_amount.
    --
    -- Wire key: @suggested_tip_amounts@.
    -- Omitted from an encoded request when it is @Nothing@.
    -- Checked when planning a request: at most 4 element(s).
    suggested_tip_amounts :: Maybe [Int64]
  , -- | Optional. A JSON-serialized object for data about the invoice, which will be shared with the payment provider. A detailed description of the required fields should be provided by the payment provider.
    --
    -- Wire key: @provider_data@.
    -- Omitted from an encoded request when it is @Nothing@.
    provider_data :: Maybe Text
  , -- | Optional. URL of the product photo for the invoice. Can be a photo of the goods or a marketing image for a service.
    --
    -- Wire key: @photo_url@.
    -- Omitted from an encoded request when it is @Nothing@.
    photo_url :: Maybe Text
  , -- | Optional. Photo size in bytes
    --
    -- Wire key: @photo_size@.
    -- Omitted from an encoded request when it is @Nothing@.
    photo_size :: Maybe Int64
  , -- | Optional. Photo width
    --
    -- Wire key: @photo_width@.
    -- Omitted from an encoded request when it is @Nothing@.
    photo_width :: Maybe Int64
  , -- | Optional. Photo height
    --
    -- Wire key: @photo_height@.
    -- Omitted from an encoded request when it is @Nothing@.
    photo_height :: Maybe Int64
  , -- | Optional. Pass True if you require the user\'s full name to complete the order. Ignored for payments in Telegram Stars.
    --
    -- Wire key: @need_name@.
    -- Omitted from an encoded request when it is @Nothing@.
    need_name :: Maybe Bool
  , -- | Optional. Pass True if you require the user\'s phone number to complete the order. Ignored for payments in Telegram Stars.
    --
    -- Wire key: @need_phone_number@.
    -- Omitted from an encoded request when it is @Nothing@.
    need_phone_number :: Maybe Bool
  , -- | Optional. Pass True if you require the user\'s email address to complete the order. Ignored for payments in Telegram Stars.
    --
    -- Wire key: @need_email@.
    -- Omitted from an encoded request when it is @Nothing@.
    need_email :: Maybe Bool
  , -- | Optional. Pass True if you require the user\'s shipping address to complete the order. Ignored for payments in Telegram Stars.
    --
    -- Wire key: @need_shipping_address@.
    -- Omitted from an encoded request when it is @Nothing@.
    need_shipping_address :: Maybe Bool
  , -- | Optional. Pass True if the user\'s phone number should be sent to the provider. Ignored for payments in Telegram Stars.
    --
    -- Wire key: @send_phone_number_to_provider@.
    -- Omitted from an encoded request when it is @Nothing@.
    send_phone_number_to_provider :: Maybe Bool
  , -- | Optional. Pass True if the user\'s email address should be sent to the provider. Ignored for payments in Telegram Stars.
    --
    -- Wire key: @send_email_to_provider@.
    -- Omitted from an encoded request when it is @Nothing@.
    send_email_to_provider :: Maybe Bool
  , -- | Optional. Pass True if the final price depends on the shipping method. Ignored for payments in Telegram Stars.
    --
    -- Wire key: @is_flexible@.
    -- Omitted from an encoded request when it is @Nothing@.
    is_flexible :: Maybe Bool
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InputInvoiceMessageContent' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputInvoiceMessageContent :: Text -> Text -> Text -> Text -> [LabeledPrice] -> InputInvoiceMessageContent
mkInputInvoiceMessageContent arg0 arg1 arg2 arg3 arg4 =
  MkInputInvoiceMessageContent
    { title = arg0
    , description = arg1
    , payload = arg2
    , provider_token = Nothing
    , currency = arg3
    , prices = arg4
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
    }

instance ToJSON InputInvoiceMessageContent where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "title" x.title
          , jsonField "description" x.description
          , jsonField "payload" x.payload
          , jsonOptional "provider_token" x.provider_token
          , jsonField "currency" x.currency
          , jsonField "prices" x.prices
          , jsonOptional "max_tip_amount" x.max_tip_amount
          , jsonOptional "suggested_tip_amounts" x.suggested_tip_amounts
          , jsonOptional "provider_data" x.provider_data
          , jsonOptional "photo_url" x.photo_url
          , jsonOptional "photo_size" x.photo_size
          , jsonOptional "photo_width" x.photo_width
          , jsonOptional "photo_height" x.photo_height
          , jsonOptional "need_name" x.need_name
          , jsonOptional "need_phone_number" x.need_phone_number
          , jsonOptional "need_email" x.need_email
          , jsonOptional "need_shipping_address" x.need_shipping_address
          , jsonOptional "send_phone_number_to_provider" x.send_phone_number_to_provider
          , jsonOptional "send_email_to_provider" x.send_email_to_provider
          , jsonOptional "is_flexible" x.is_flexible
          ]
      )
  toEncoding = toEncoding . toJSON

-- | Plan a 'InputInvoiceMessageContent' as part of an outgoing request.
--
-- The traversal is checked: it validates every file source against
-- the capabilities its occurrence permits and allocates one
-- attachment part per upload, in source field order.
planInputInvoiceMessageContent :: InputInvoiceMessageContent -> FieldPlanner
planInputInvoiceMessageContent x =
  planRecord
    ( concat
        [ planned "title" (encodeJson x.title)
        , planned "description" (encodeJson x.description)
        , planned "payload" (encodeJson x.payload)
        , plannedMaybe "provider_token" x.provider_token encodeJson
        , planned "currency" (encodeJson x.currency)
        , planned "prices" ((planList encodeJson) x.prices)
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
