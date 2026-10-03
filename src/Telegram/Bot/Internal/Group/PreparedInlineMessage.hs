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
module Telegram.Bot.Internal.Group.PreparedInlineMessage
  ( PreparedInlineMessage (..)
  , mkPreparedInlineMessage
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonObject, parseInt64, requiredWith)

-- | Describes an inline message to be sent by a user of a Mini App.
--
-- Source: <https://core.telegram.org/bots/api#preparedinlinemessage>.
-- Codec directions: decoded from responses, encoded into requests.
data PreparedInlineMessage = MkPreparedInlineMessage
  { -- | Unique identifier of the prepared message
    --
    -- Wire key: @id@.
    id :: Text
  , -- | Expiration date of the prepared message, in Unix time. Expired prepared messages can no longer be used.
    --
    -- Wire key: @expiration_date@.
    expiration_date :: Int64
  }
  deriving stock (Eq, Show)

-- | Initialize a 'PreparedInlineMessage' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkPreparedInlineMessage :: Text -> Int64 -> PreparedInlineMessage
mkPreparedInlineMessage arg0 arg1 =
  MkPreparedInlineMessage
    { id = arg0
    , expiration_date = arg1
    }

instance FromJSON PreparedInlineMessage where
  parseJSON = withObject "PreparedInlineMessage" $ \obj ->
    do
      field_0 <- requiredWith obj "id" parseJSON
      field_1 <- requiredWith obj "expiration_date" parseInt64
      pure
        MkPreparedInlineMessage
          { id = field_0
          , expiration_date = field_1
          }

instance ToJSON PreparedInlineMessage where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "id" x.id
          , jsonField "expiration_date" x.expiration_date
          ]
      )
  toEncoding = toEncoding . toJSON
