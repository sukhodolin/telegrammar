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
module Telegram.Bot.Methods.RevokeChatInviteLink
  ( RevokeChatInviteLink (..)
  , mkRevokeChatInviteLink
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.ChatInviteLink (ChatInviteLink)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (Method (..), encodeJson, planRequestBody, planned)

-- | Use this method to revoke an invite link created by the bot. If the primary link is revoked, a new link is automatically generated. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns the revoked invite link as ChatInviteLink object.
--
-- Wire method spelling: @revokeChatInviteLink@.
--
-- Source: <https://core.telegram.org/bots/api#revokechatinvitelink>.
-- Result: @ChatInviteLink@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data RevokeChatInviteLink = MkRevokeChatInviteLink
  { -- | Unique identifier of the target chat or username of the target channel in the format \@username
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | The invite link to revoke
    --
    -- Wire key: @invite_link@.
    invite_link :: Text
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RevokeChatInviteLink' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRevokeChatInviteLink :: IntegerOrString -> Text -> RevokeChatInviteLink
mkRevokeChatInviteLink arg0 arg1 =
  MkRevokeChatInviteLink
    { chat_id = arg0
    , invite_link = arg1
    , extra = mempty
    }

instance Method RevokeChatInviteLink where
  type Result RevokeChatInviteLink = ChatInviteLink
  methodName _ = "revokeChatInviteLink"
  planRequest x =
    planRequestBody
      "revokeChatInviteLink"
      [ "chat_id"
      , "invite_link"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          , planned "invite_link" (encodeJson x.invite_link)
          ]
      )
      x.extra
  parseResult _ = parseJSON
