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
module Telegram.Bot.Internal.Group.TransactionPartner
  ( TransactionPartner (..)
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Telegram.Bot.Internal.Group.TransactionPartnerAffiliateProgram (TransactionPartnerAffiliateProgram)
import Telegram.Bot.Internal.Group.TransactionPartnerChat (TransactionPartnerChat)
import Telegram.Bot.Internal.Group.TransactionPartnerFragment (TransactionPartnerFragment)
import Telegram.Bot.Internal.Group.TransactionPartnerOther (TransactionPartnerOther)
import Telegram.Bot.Internal.Group.TransactionPartnerTelegramAds (TransactionPartnerTelegramAds)
import Telegram.Bot.Internal.Group.TransactionPartnerTelegramApi (TransactionPartnerTelegramApi)
import Telegram.Bot.Internal.Group.TransactionPartnerUser (TransactionPartnerUser)
import Telegram.Bot.Support (tagField)

-- | This object describes the source of a transaction, or its recipient for outgoing transactions. Currently, it can be one of
-- \- TransactionPartnerUser
-- \- TransactionPartnerChat
-- \- TransactionPartnerAffiliateProgram
-- \- TransactionPartnerFragment
-- \- TransactionPartnerTelegramAds
-- \- TransactionPartnerTelegramApi
-- \- TransactionPartnerOther
--
-- Source: <https://core.telegram.org/bots/api#transactionpartner>.
-- Codec directions: decoded from responses, encoded into requests.
data TransactionPartner
  = TransactionPartnerViaTransactionPartnerAffiliateProgram TransactionPartnerAffiliateProgram
  | TransactionPartnerViaTransactionPartnerChat TransactionPartnerChat
  | TransactionPartnerViaTransactionPartnerFragment TransactionPartnerFragment
  | TransactionPartnerViaTransactionPartnerOther TransactionPartnerOther
  | TransactionPartnerViaTransactionPartnerTelegramAds TransactionPartnerTelegramAds
  | TransactionPartnerViaTransactionPartnerTelegramApi TransactionPartnerTelegramApi
  | TransactionPartnerViaTransactionPartnerUser TransactionPartnerUser
  | -- | A value this decoder does not recognize, preserved verbatim so
    -- the raw payload survives the boundary.
    TransactionPartnerUnknown Value
  deriving stock (Eq, Show)

instance FromJSON TransactionPartner where
  parseJSON = withObject "TransactionPartner" $ \obj -> do
    tag_ <- tagField obj "type"
    case tag_ of
      "affiliate_program" ->
        TransactionPartnerViaTransactionPartnerAffiliateProgram <$> parseJSON (Object obj)
      "chat" ->
        TransactionPartnerViaTransactionPartnerChat <$> parseJSON (Object obj)
      "fragment" ->
        TransactionPartnerViaTransactionPartnerFragment <$> parseJSON (Object obj)
      "other" ->
        TransactionPartnerViaTransactionPartnerOther <$> parseJSON (Object obj)
      "telegram_ads" ->
        TransactionPartnerViaTransactionPartnerTelegramAds <$> parseJSON (Object obj)
      "telegram_api" ->
        TransactionPartnerViaTransactionPartnerTelegramApi <$> parseJSON (Object obj)
      "user" ->
        TransactionPartnerViaTransactionPartnerUser <$> parseJSON (Object obj)
      _ -> pure (TransactionPartnerUnknown (Object obj))

instance ToJSON TransactionPartner where
  toJSON = \case
    TransactionPartnerViaTransactionPartnerAffiliateProgram member_ -> toJSON member_
    TransactionPartnerViaTransactionPartnerChat member_ -> toJSON member_
    TransactionPartnerViaTransactionPartnerFragment member_ -> toJSON member_
    TransactionPartnerViaTransactionPartnerOther member_ -> toJSON member_
    TransactionPartnerViaTransactionPartnerTelegramAds member_ -> toJSON member_
    TransactionPartnerViaTransactionPartnerTelegramApi member_ -> toJSON member_
    TransactionPartnerViaTransactionPartnerUser member_ -> toJSON member_
    TransactionPartnerUnknown raw_ -> raw_
  toEncoding = toEncoding . toJSON
