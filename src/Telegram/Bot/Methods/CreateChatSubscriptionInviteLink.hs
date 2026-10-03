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
module Telegram.Bot.Methods.CreateChatSubscriptionInviteLink
  ( CreateChatSubscriptionInviteLink (..)
  , mkCreateChatSubscriptionInviteLink
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.ChatInviteLink (ChatInviteLink)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (Method (..), encodeJson, planRequestBody, planned, plannedMaybe)

-- | Use this method to create a subscription invite link for a channel chat. The bot must have the can_invite_users administrator rights. The link can be edited using the method editChatSubscriptionInviteLink or revoked using the method revokeChatInviteLink. Returns the new invite link as a ChatInviteLink object.
--
-- Wire method spelling: @createChatSubscriptionInviteLink@.
--
-- Source: <https://core.telegram.org/bots/api#createchatsubscriptioninvitelink>.
-- Result: @ChatInviteLink@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data CreateChatSubscriptionInviteLink = MkCreateChatSubscriptionInviteLink
  { -- | Unique identifier for the target channel chat or username of the target channel in the format \@username
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | Invite link name; 0-32 characters
    --
    -- Wire key: @name@.
    -- Omitted from an encoded request when it is @Nothing@.
    name :: Maybe Text
  , -- | The number of seconds the subscription will be active for before the next payment. Currently, it must always be 2592000 (30 days).
    --
    -- Wire key: @subscription_period@.
    subscription_period :: Int64
  , -- | The amount of Telegram Stars a user must pay initially and after each subsequent subscription period to be a member of the chat; 1-10000
    --
    -- Wire key: @subscription_price@.
    subscription_price :: Int64
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'CreateChatSubscriptionInviteLink' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkCreateChatSubscriptionInviteLink :: IntegerOrString -> Int64 -> Int64 -> CreateChatSubscriptionInviteLink
mkCreateChatSubscriptionInviteLink arg0 arg1 arg2 =
  MkCreateChatSubscriptionInviteLink
    { chat_id = arg0
    , name = Nothing
    , subscription_period = arg1
    , subscription_price = arg2
    , extra = mempty
    }

instance Method CreateChatSubscriptionInviteLink where
  type Result CreateChatSubscriptionInviteLink = ChatInviteLink
  methodName _ = "createChatSubscriptionInviteLink"
  planRequest x =
    planRequestBody
      "createChatSubscriptionInviteLink"
      [ "chat_id"
      , "name"
      , "subscription_period"
      , "subscription_price"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          , plannedMaybe "name" x.name encodeJson
          , planned "subscription_period" (encodeJson x.subscription_period)
          , planned "subscription_price" (encodeJson x.subscription_price)
          ]
      )
      x.extra
  parseResult _ = parseJSON
