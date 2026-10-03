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
module Telegram.Bot.Methods.SetChatPhoto
  ( SetChatPhoto (..)
  , mkSetChatPhoto
  ) where

import Data.Aeson (FromJSON (..), Object)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString)
import Telegram.Bot.Support (FileCapability (..), InputFile, Method (..), TrueValue, encodeJson, filePolicy, planFileValue, planRequestBody, planned)

-- | Use this method to set a new profile photo for the chat. Photos can\'t be changed for private chats. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns True on success.
--
-- Wire method spelling: @setChatPhoto@.
--
-- Source: <https://core.telegram.org/bots/api#setchatphoto>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SetChatPhoto = MkSetChatPhoto
  { -- | Unique identifier for the target chat or username of the target channel in the format \@username
    --
    -- Wire key: @chat_id@.
    chat_id :: IntegerOrString
  , -- | New chat photo, uploaded using multipart\/form-data
    --
    -- Wire key: @photo@.
    -- File sources accepted here: @upload@.
    photo :: InputFile
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SetChatPhoto' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSetChatPhoto :: IntegerOrString -> InputFile -> SetChatPhoto
mkSetChatPhoto arg0 arg1 =
  MkSetChatPhoto
    { chat_id = arg0
    , photo = arg1
    , extra = mempty
    }

instance Method SetChatPhoto where
  type Result SetChatPhoto = TrueValue
  methodName _ = "setChatPhoto"
  planRequest x =
    planRequestBody
      "setChatPhoto"
      [ "chat_id"
      , "photo"
      ]
      ( concat
          [ planned "chat_id" (encodeJson x.chat_id)
          , planned "photo" ((planFileValue (filePolicy [UploadCapability])) x.photo)
          ]
      )
      x.extra
  parseResult _ = parseJSON
