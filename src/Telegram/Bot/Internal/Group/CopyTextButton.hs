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
module Telegram.Bot.Internal.Group.CopyTextButton
  ( CopyTextButton (..)
  , mkCopyTextButton
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Support (jsonField, jsonObject, requiredWith)

-- | This object represents an inline keyboard button that copies specified text to the clipboard.
--
-- Source: <https://core.telegram.org/bots/api#copytextbutton>.
-- Codec directions: decoded from responses, encoded into requests.
data CopyTextButton = MkCopyTextButton
  { -- | The text to be copied to the clipboard; 1-256 characters
    --
    -- Wire key: @text@.
    text :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'CopyTextButton' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkCopyTextButton :: Text -> CopyTextButton
mkCopyTextButton arg0 =
  MkCopyTextButton
    { text = arg0
    }

instance FromJSON CopyTextButton where
  parseJSON = withObject "CopyTextButton" $ \obj ->
    do
      field_0 <- requiredWith obj "text" parseJSON
      pure
        MkCopyTextButton
          { text = field_0
          }

instance ToJSON CopyTextButton where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "text" x.text
          ]
      )
  toEncoding = toEncoding . toJSON
