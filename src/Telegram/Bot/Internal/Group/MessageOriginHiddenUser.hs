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
module Telegram.Bot.Internal.Group.MessageOriginHiddenUser
  ( MessageOriginHiddenUser (..)
  , mkMessageOriginHiddenUser
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonLiteral, jsonObject, parseInt64, requiredWith)

-- | The message was originally sent by an unknown user.
--
-- Source: <https://core.telegram.org/bots/api#messageoriginhiddenuser>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"hidden_user"@.
data MessageOriginHiddenUser = MkMessageOriginHiddenUser
  { -- | Date the message was sent originally in Unix time
    --
    -- Wire key: @date@.
    date :: Int64
  , -- | Name of the user that sent the message originally
    --
    -- Wire key: @sender_user_name@.
    sender_user_name :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'MessageOriginHiddenUser' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkMessageOriginHiddenUser :: Int64 -> Text -> MessageOriginHiddenUser
mkMessageOriginHiddenUser arg0 arg1 =
  MkMessageOriginHiddenUser
    { date = arg0
    , sender_user_name = arg1
    }

instance FromJSON MessageOriginHiddenUser where
  parseJSON = withObject "MessageOriginHiddenUser" $ \obj ->
    do
      checkStringConstant obj "type" "hidden_user"
      field_1 <- requiredWith obj "date" parseInt64
      field_2 <- requiredWith obj "sender_user_name" parseJSON
      pure
        MkMessageOriginHiddenUser
          { date = field_1
          , sender_user_name = field_2
          }

instance ToJSON MessageOriginHiddenUser where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "hidden_user")
          , jsonField "date" x.date
          , jsonField "sender_user_name" x.sender_user_name
          ]
      )
  toEncoding = toEncoding . toJSON
