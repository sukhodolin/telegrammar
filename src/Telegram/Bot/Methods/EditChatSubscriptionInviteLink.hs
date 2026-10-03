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
module Telegram.Bot.Methods.EditChatSubscriptionInviteLink
  ( EditChatSubscriptionInviteLink (..)
  , mkEditChatSubscriptionInviteLink
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.ChatInviteLink (ChatInviteLink)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (Method (..), encodeJson, planRequestBody, planned, plannedMaybe)

-- | Use this method to edit a subscription invite link created by the bot. The bot must have the can_invite_users administrator rights. Returns the edited invite link as a ChatInviteLink object.
--
-- Wire method spelling: @editChatSubscriptionInviteLink@.
--
-- Source: <https://core.telegram.org/bots/api#editchatsubscriptioninvitelink>.
-- Result: @ChatInviteLink@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data EditChatSubscriptionInviteLink = MkEditChatSubscriptionInviteLink
  { -- | Unique identifier for the target chat or username of the target channel in the format \@username
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | The invite link to edit
    --
    -- Wire key: @invite_link@.
    invite_link :: Text
  , -- | Invite link name; 0-32 characters
    --
    -- Wire key: @name@.
    -- Omitted from an encoded request when it is @Nothing@.
    name :: Maybe Text
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'EditChatSubscriptionInviteLink' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkEditChatSubscriptionInviteLink :: IntegerOrString -> Text -> EditChatSubscriptionInviteLink
mkEditChatSubscriptionInviteLink arg0 arg1 =
  MkEditChatSubscriptionInviteLink
    { chat_id = arg0
    , invite_link = arg1
    , name = Nothing
    , extra = mempty
    }

instance Method EditChatSubscriptionInviteLink where
  type Result EditChatSubscriptionInviteLink = ChatInviteLink
  methodName _ = "editChatSubscriptionInviteLink"
  planRequest x =
    planRequestBody
      "editChatSubscriptionInviteLink"
      [ "chat_id"
      , "invite_link"
      , "name"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          , planned "invite_link" (encodeJson x.invite_link)
          , plannedMaybe "name" x.name encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
