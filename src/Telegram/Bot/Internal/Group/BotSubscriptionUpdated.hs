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
module Telegram.Bot.Internal.Group.BotSubscriptionUpdated
  ( BotSubscriptionUpdated (..)
  , mkBotSubscriptionUpdated
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Support (jsonField, jsonObject, requiredWith)

-- | This object contains information about changes to a user payment subscription toward the current bot.
--
-- Source: <https://core.telegram.org/bots/api#botsubscriptionupdated>.
-- Codec directions: decoded from responses, encoded into requests.
data BotSubscriptionUpdated = MkBotSubscriptionUpdated
  { -- | User who subscribed for payments toward the bot
    --
    -- Wire key: @user@.
    user :: User
  , -- | Bot-specified invoice payload
    --
    -- Wire key: @invoice_payload@.
    invoice_payload :: Text
  , -- | The new state of the subscription. Currently, it can be one of \"canceled\" if the user canceled the subscription, \"active\" if the user re-enabled a previously canceled subscription, or \"failed\" if payment for the subscription failed.
    --
    -- Wire key: @state@.
    state :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'BotSubscriptionUpdated' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkBotSubscriptionUpdated :: User -> Text -> Text -> BotSubscriptionUpdated
mkBotSubscriptionUpdated arg0 arg1 arg2 =
  MkBotSubscriptionUpdated
    { user = arg0
    , invoice_payload = arg1
    , state = arg2
    }

instance FromJSON BotSubscriptionUpdated where
  parseJSON = withObject "BotSubscriptionUpdated" $ \obj ->
    do
      field_0 <- requiredWith obj "user" parseJSON
      field_1 <- requiredWith obj "invoice_payload" parseJSON
      field_2 <- requiredWith obj "state" parseJSON
      pure
        MkBotSubscriptionUpdated
          { user = field_0
          , invoice_payload = field_1
          , state = field_2
          }

instance ToJSON BotSubscriptionUpdated where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "user" x.user
          , jsonField "invoice_payload" x.invoice_payload
          , jsonField "state" x.state
          ]
      )
  toEncoding = toEncoding . toJSON
