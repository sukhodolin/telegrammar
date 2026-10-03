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
module Telegram.Bot.Methods.SetChatPermissions
  ( SetChatPermissions (..)
  , mkSetChatPermissions
  ) where

import Data.Aeson (FromJSON (..), Object)
import Telegram.Bot.Internal.Group.ChatPermissions (ChatPermissions)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned, plannedMaybe)

-- | Use this method to set default chat permissions for all members. The bot must be an administrator in the group or a supergroup for this to work and must have the can_restrict_members administrator rights. Returns True on success.
--
-- Wire method spelling: @setChatPermissions@.
--
-- Source: <https://core.telegram.org/bots/api#setchatpermissions>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SetChatPermissions = MkSetChatPermissions
  { -- | Unique identifier for the target chat or username of the target supergroup in the format \@username
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | A JSON-serialized object for new default chat permissions
    --
    -- Wire key: @permissions@.
    permissions :: ChatPermissions
  , -- | Pass True if chat permissions are set independently. Otherwise, the can_send_other_messages and can_add_web_page_previews permissions will imply the can_send_messages, can_send_audios, can_send_documents, can_send_photos, can_send_videos, can_send_video_notes, and can_send_voice_notes permissions; the can_send_polls permission will imply the can_send_messages permission.
    --
    -- Wire key: @use_independent_chat_permissions@.
    -- Omitted from an encoded request when it is @Nothing@.
    use_independent_chat_permissions :: Maybe Bool
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SetChatPermissions' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSetChatPermissions :: IntegerOrString -> ChatPermissions -> SetChatPermissions
mkSetChatPermissions arg0 arg1 =
  MkSetChatPermissions
    { chat_id = arg0
    , permissions = arg1
    , use_independent_chat_permissions = Nothing
    , extra = mempty
    }

instance Method SetChatPermissions where
  type Result SetChatPermissions = TrueValue
  methodName _ = "setChatPermissions"
  planRequest x =
    planRequestBody
      "setChatPermissions"
      [ "chat_id"
      , "permissions"
      , "use_independent_chat_permissions"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          , planned "permissions" (encodeJson x.permissions)
          , plannedMaybe "use_independent_chat_permissions" x.use_independent_chat_permissions encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
