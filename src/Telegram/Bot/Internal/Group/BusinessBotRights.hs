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
module Telegram.Bot.Internal.Group.BusinessBotRights
  ( BusinessBotRights (..)
  , mkBusinessBotRights
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Telegram.Bot.Support (jsonFlag, jsonObject, optionalTrueFlag)

-- | Represents the rights of a business bot.
--
-- Source: <https://core.telegram.org/bots/api#businessbotrights>.
-- Codec directions: decoded from responses, encoded into requests.
data BusinessBotRights = MkBusinessBotRights
  { -- | Optional. True, if the bot can send and edit messages in the private chats that had incoming messages in the last 24 hours
    --
    -- Wire key: @can_reply@.
    -- Omitted from an encoded request when it is @False@.
    can_reply :: Bool
  , -- | Optional. True, if the bot can mark incoming private messages as read
    --
    -- Wire key: @can_read_messages@.
    -- Omitted from an encoded request when it is @False@.
    can_read_messages :: Bool
  , -- | Optional. True, if the bot can delete messages sent by the bot
    --
    -- Wire key: @can_delete_sent_messages@.
    -- Omitted from an encoded request when it is @False@.
    can_delete_sent_messages :: Bool
  , -- | Optional. True, if the bot can delete all private messages in managed chats
    --
    -- Wire key: @can_delete_all_messages@.
    -- Omitted from an encoded request when it is @False@.
    can_delete_all_messages :: Bool
  , -- | Optional. True, if the bot can edit the first and last name of the business account
    --
    -- Wire key: @can_edit_name@.
    -- Omitted from an encoded request when it is @False@.
    can_edit_name :: Bool
  , -- | Optional. True, if the bot can edit the bio of the business account
    --
    -- Wire key: @can_edit_bio@.
    -- Omitted from an encoded request when it is @False@.
    can_edit_bio :: Bool
  , -- | Optional. True, if the bot can edit the profile photo of the business account
    --
    -- Wire key: @can_edit_profile_photo@.
    -- Omitted from an encoded request when it is @False@.
    can_edit_profile_photo :: Bool
  , -- | Optional. True, if the bot can edit the username of the business account
    --
    -- Wire key: @can_edit_username@.
    -- Omitted from an encoded request when it is @False@.
    can_edit_username :: Bool
  , -- | Optional. True, if the bot can change the privacy settings pertaining to gifts for the business account
    --
    -- Wire key: @can_change_gift_settings@.
    -- Omitted from an encoded request when it is @False@.
    can_change_gift_settings :: Bool
  , -- | Optional. True, if the bot can view gifts and the amount of Telegram Stars owned by the business account
    --
    -- Wire key: @can_view_gifts_and_stars@.
    -- Omitted from an encoded request when it is @False@.
    can_view_gifts_and_stars :: Bool
  , -- | Optional. True, if the bot can convert regular gifts owned by the business account to Telegram Stars
    --
    -- Wire key: @can_convert_gifts_to_stars@.
    -- Omitted from an encoded request when it is @False@.
    can_convert_gifts_to_stars :: Bool
  , -- | Optional. True, if the bot can transfer and upgrade gifts owned by the business account
    --
    -- Wire key: @can_transfer_and_upgrade_gifts@.
    -- Omitted from an encoded request when it is @False@.
    can_transfer_and_upgrade_gifts :: Bool
  , -- | Optional. True, if the bot can transfer Telegram Stars received by the business account to its own account, or use them to upgrade and transfer gifts
    --
    -- Wire key: @can_transfer_stars@.
    -- Omitted from an encoded request when it is @False@.
    can_transfer_stars :: Bool
  , -- | Optional. True, if the bot can post, edit and delete stories on behalf of the business account
    --
    -- Wire key: @can_manage_stories@.
    -- Omitted from an encoded request when it is @False@.
    can_manage_stories :: Bool
  }
  deriving stock (Eq, Show)

-- | Initialize a 'BusinessBotRights' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkBusinessBotRights :: BusinessBotRights
mkBusinessBotRights =
  MkBusinessBotRights
    { can_reply = False
    , can_read_messages = False
    , can_delete_sent_messages = False
    , can_delete_all_messages = False
    , can_edit_name = False
    , can_edit_bio = False
    , can_edit_profile_photo = False
    , can_edit_username = False
    , can_change_gift_settings = False
    , can_view_gifts_and_stars = False
    , can_convert_gifts_to_stars = False
    , can_transfer_and_upgrade_gifts = False
    , can_transfer_stars = False
    , can_manage_stories = False
    }

instance FromJSON BusinessBotRights where
  parseJSON = withObject "BusinessBotRights" $ \obj ->
    do
      field_0 <- optionalTrueFlag obj "can_reply"
      field_1 <- optionalTrueFlag obj "can_read_messages"
      field_2 <- optionalTrueFlag obj "can_delete_sent_messages"
      field_3 <- optionalTrueFlag obj "can_delete_all_messages"
      field_4 <- optionalTrueFlag obj "can_edit_name"
      field_5 <- optionalTrueFlag obj "can_edit_bio"
      field_6 <- optionalTrueFlag obj "can_edit_profile_photo"
      field_7 <- optionalTrueFlag obj "can_edit_username"
      field_8 <- optionalTrueFlag obj "can_change_gift_settings"
      field_9 <- optionalTrueFlag obj "can_view_gifts_and_stars"
      field_10 <- optionalTrueFlag obj "can_convert_gifts_to_stars"
      field_11 <- optionalTrueFlag obj "can_transfer_and_upgrade_gifts"
      field_12 <- optionalTrueFlag obj "can_transfer_stars"
      field_13 <- optionalTrueFlag obj "can_manage_stories"
      pure
        MkBusinessBotRights
          { can_reply = field_0
          , can_read_messages = field_1
          , can_delete_sent_messages = field_2
          , can_delete_all_messages = field_3
          , can_edit_name = field_4
          , can_edit_bio = field_5
          , can_edit_profile_photo = field_6
          , can_edit_username = field_7
          , can_change_gift_settings = field_8
          , can_view_gifts_and_stars = field_9
          , can_convert_gifts_to_stars = field_10
          , can_transfer_and_upgrade_gifts = field_11
          , can_transfer_stars = field_12
          , can_manage_stories = field_13
          }

instance ToJSON BusinessBotRights where
  toJSON x =
    jsonObject
      ( concat
          [ jsonFlag "can_reply" x.can_reply
          , jsonFlag "can_read_messages" x.can_read_messages
          , jsonFlag "can_delete_sent_messages" x.can_delete_sent_messages
          , jsonFlag "can_delete_all_messages" x.can_delete_all_messages
          , jsonFlag "can_edit_name" x.can_edit_name
          , jsonFlag "can_edit_bio" x.can_edit_bio
          , jsonFlag "can_edit_profile_photo" x.can_edit_profile_photo
          , jsonFlag "can_edit_username" x.can_edit_username
          , jsonFlag "can_change_gift_settings" x.can_change_gift_settings
          , jsonFlag "can_view_gifts_and_stars" x.can_view_gifts_and_stars
          , jsonFlag "can_convert_gifts_to_stars" x.can_convert_gifts_to_stars
          , jsonFlag "can_transfer_and_upgrade_gifts" x.can_transfer_and_upgrade_gifts
          , jsonFlag "can_transfer_stars" x.can_transfer_stars
          , jsonFlag "can_manage_stories" x.can_manage_stories
          ]
      )
  toEncoding = toEncoding . toJSON
