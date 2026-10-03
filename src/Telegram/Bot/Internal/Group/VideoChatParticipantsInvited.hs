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
module Telegram.Bot.Internal.Group.VideoChatParticipantsInvited
  ( VideoChatParticipantsInvited (..)
  , mkVideoChatParticipantsInvited
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Support (jsonField, jsonObject, parseList, requiredWith)

-- | This object represents a service message about new members invited to a video chat.
--
-- Source: <https://core.telegram.org/bots/api#videochatparticipantsinvited>.
-- Codec directions: decoded from responses, encoded into requests.
data VideoChatParticipantsInvited = MkVideoChatParticipantsInvited
  { -- | New members that were invited to the video chat
    --
    -- Wire key: @users@.
    users :: [User]
  }
  deriving stock (Eq, Show)

-- | Initialize a 'VideoChatParticipantsInvited' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkVideoChatParticipantsInvited :: [User] -> VideoChatParticipantsInvited
mkVideoChatParticipantsInvited arg0 =
  MkVideoChatParticipantsInvited
    { users = arg0
    }

instance FromJSON VideoChatParticipantsInvited where
  parseJSON = withObject "VideoChatParticipantsInvited" $ \obj ->
    do
      field_0 <- requiredWith obj "users" (parseList parseJSON)
      pure
        MkVideoChatParticipantsInvited
          { users = field_0
          }

instance ToJSON VideoChatParticipantsInvited where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "users" x.users
          ]
      )
  toEncoding = toEncoding . toJSON
