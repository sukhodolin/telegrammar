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
module Telegram.Bot.Internal.Group.WebAppInfo
  ( WebAppInfo (..)
  , mkWebAppInfo
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonObject, requiredWith)

-- | Describes a Web App.
--
-- Source: <https://core.telegram.org/bots/api#webappinfo>.
-- Codec directions: decoded from responses, encoded into requests.
data WebAppInfo = MkWebAppInfo
  { -- | An HTTPS URL of a Web App to be opened with additional data as specified in Initializing Web Apps
    --
    -- Wire key: @url@.
    url :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'WebAppInfo' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkWebAppInfo :: Text -> WebAppInfo
mkWebAppInfo arg0 =
  MkWebAppInfo
    { url = arg0
    }

instance FromJSON WebAppInfo where
  parseJSON = withObject "WebAppInfo" $ \obj ->
    do
      field_0 <- requiredWith obj "url" parseJSON
      pure
        MkWebAppInfo
          { url = field_0
          }

instance ToJSON WebAppInfo where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "url" x.url
          ]
      )
  toEncoding = toEncoding . toJSON
