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
module Telegram.Bot.Internal.Group.WebAppData
  ( WebAppData (..)
  , mkWebAppData
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonObject, requiredWith)

-- | Describes data sent from a Web App to the bot.
--
-- Source: <https://core.telegram.org/bots/api#webappdata>.
-- Codec directions: decoded from responses, encoded into requests.
data WebAppData = MkWebAppData
  { -- | The data. Be aware that a bad client can send arbitrary data in this field.
    --
    -- Wire key: @data@.
    data_ :: Text
  , -- | Text of the web_app keyboard button from which the Web App was opened. Be aware that a bad client can send arbitrary data in this field.
    --
    -- Wire key: @button_text@.
    button_text :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'WebAppData' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkWebAppData :: Text -> Text -> WebAppData
mkWebAppData arg0 arg1 =
  MkWebAppData
    { data_ = arg0
    , button_text = arg1
    }

instance FromJSON WebAppData where
  parseJSON = withObject "WebAppData" $ \obj ->
    do
      field_0 <- requiredWith obj "data" parseJSON
      field_1 <- requiredWith obj "button_text" parseJSON
      pure
        MkWebAppData
          { data_ = field_0
          , button_text = field_1
          }

instance ToJSON WebAppData where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "data" x.data_
          , jsonField "button_text" x.button_text
          ]
      )
  toEncoding = toEncoding . toJSON
