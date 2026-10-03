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
module Telegram.Bot.Methods.EditChatInviteLink
  ( EditChatInviteLink (..)
  , mkEditChatInviteLink
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.ChatInviteLink (ChatInviteLink)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (Method (..), encodeJson, planRequestBody, planned, plannedMaybe)

-- | Use this method to edit a non-primary invite link created by the bot. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns the edited invite link as a ChatInviteLink object.
--
-- Wire method spelling: @editChatInviteLink@.
--
-- Source: <https://core.telegram.org/bots/api#editchatinvitelink>.
-- Result: @ChatInviteLink@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data EditChatInviteLink = MkEditChatInviteLink
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
  , -- | Point in time (Unix timestamp) when the link will expire
    --
    -- Wire key: @expire_date@.
    -- Omitted from an encoded request when it is @Nothing@.
    expire_date :: Maybe Int64
  , -- | The maximum number of users that can be members of the chat simultaneously after joining the chat via this invite link; 1-99999
    --
    -- Wire key: @member_limit@.
    -- Omitted from an encoded request when it is @Nothing@.
    member_limit :: Maybe Int64
  , -- | True, if users joining the chat via the link need to be approved by chat administrators. If True, member_limit can\'t be specified.
    --
    -- Wire key: @creates_join_request@.
    -- Omitted from an encoded request when it is @Nothing@.
    creates_join_request :: Maybe Bool
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'EditChatInviteLink' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkEditChatInviteLink :: IntegerOrString -> Text -> EditChatInviteLink
mkEditChatInviteLink arg0 arg1 =
  MkEditChatInviteLink
    { chat_id = arg0
    , invite_link = arg1
    , name = Nothing
    , expire_date = Nothing
    , member_limit = Nothing
    , creates_join_request = Nothing
    , extra = mempty
    }

instance Method EditChatInviteLink where
  type Result EditChatInviteLink = ChatInviteLink
  methodName _ = "editChatInviteLink"
  planRequest x =
    planRequestBody
      "editChatInviteLink"
      [ "chat_id"
      , "invite_link"
      , "name"
      , "expire_date"
      , "member_limit"
      , "creates_join_request"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          , planned "invite_link" (encodeJson x.invite_link)
          , plannedMaybe "name" x.name encodeJson
          , plannedMaybe "expire_date" x.expire_date encodeJson
          , plannedMaybe "member_limit" x.member_limit encodeJson
          , plannedMaybe "creates_join_request" x.creates_join_request encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
