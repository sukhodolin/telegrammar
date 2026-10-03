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
module Telegram.Bot.Methods.RestrictChatMember
  ( RestrictChatMember (..)
  , mkRestrictChatMember
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Telegram.Bot.Internal.Group.ChatPermissions (ChatPermissions)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned, plannedMaybe)

-- | Use this method to restrict a user in a supergroup. The bot must be an administrator in the supergroup for this to work and must have the appropriate administrator rights. Pass True for all permissions to lift restrictions from a user. Returns True on success.
--
-- Wire method spelling: @restrictChatMember@.
--
-- Source: <https://core.telegram.org/bots/api#restrictchatmember>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data RestrictChatMember = MkRestrictChatMember
  { -- | Unique identifier for the target chat or username of the target supergroup in the format \@username
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | Unique identifier of the target user
    --
    -- Wire key: @user_id@.
    user_id :: Int64
  , -- | A JSON-serialized object for new user permissions
    --
    -- Wire key: @permissions@.
    permissions :: ChatPermissions
  , -- | Pass True if chat permissions are set independently. Otherwise, the can_send_other_messages and can_add_web_page_previews permissions will imply the can_send_messages, can_send_audios, can_send_documents, can_send_photos, can_send_videos, can_send_video_notes, and can_send_voice_notes permissions; the can_send_polls permission will imply the can_send_messages permission.
    --
    -- Wire key: @use_independent_chat_permissions@.
    -- Omitted from an encoded request when it is @Nothing@.
    use_independent_chat_permissions :: Maybe Bool
  , -- | Date when restrictions will be lifted for the user; Unix time. If user is restricted for more than 366 days or less than 30 seconds from the current time, they are considered to be restricted forever.
    --
    -- Wire key: @until_date@.
    -- Omitted from an encoded request when it is @Nothing@.
    until_date :: Maybe Int64
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RestrictChatMember' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRestrictChatMember :: IntegerOrString -> Int64 -> ChatPermissions -> RestrictChatMember
mkRestrictChatMember arg0 arg1 arg2 =
  MkRestrictChatMember
    { chat_id = arg0
    , user_id = arg1
    , permissions = arg2
    , use_independent_chat_permissions = Nothing
    , until_date = Nothing
    , extra = mempty
    }

instance Method RestrictChatMember where
  type Result RestrictChatMember = TrueValue
  methodName _ = "restrictChatMember"
  planRequest x =
    planRequestBody
      "restrictChatMember"
      [ "chat_id"
      , "user_id"
      , "permissions"
      , "use_independent_chat_permissions"
      , "until_date"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          , planned "user_id" (encodeJson x.user_id)
          , planned "permissions" (encodeJson x.permissions)
          , plannedMaybe "use_independent_chat_permissions" x.use_independent_chat_permissions encodeJson
          , plannedMaybe "until_date" x.until_date encodeJson
          ]
      )
      x.extra
  parseResult _ = parseJSON
