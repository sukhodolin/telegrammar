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
module Telegram.Bot.Internal.Group.RichTextCustomEmoji
  ( RichTextCustomEmoji (..)
  , mkRichTextCustomEmoji
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonLiteral, jsonObject, requiredWith)

-- | A custom emoji.
--
-- Source: <https://core.telegram.org/bots/api#richtextcustomemoji>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"custom_emoji"@.
data RichTextCustomEmoji = MkRichTextCustomEmoji
  { -- | Unique identifier of the custom emoji. Use getCustomEmojiStickers to get full information about the sticker.
    --
    -- Wire key: @custom_emoji_id@.
    custom_emoji_id :: Text
  , -- | Alternative emoji for the custom emoji
    --
    -- Wire key: @alternative_text@.
    alternative_text :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichTextCustomEmoji' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichTextCustomEmoji :: Text -> Text -> RichTextCustomEmoji
mkRichTextCustomEmoji arg0 arg1 =
  MkRichTextCustomEmoji
    { custom_emoji_id = arg0
    , alternative_text = arg1
    }

instance FromJSON RichTextCustomEmoji where
  parseJSON = withObject "RichTextCustomEmoji" $ \obj ->
    do
      checkStringConstant obj "type" "custom_emoji"
      field_1 <- requiredWith obj "custom_emoji_id" parseJSON
      field_2 <- requiredWith obj "alternative_text" parseJSON
      pure
        MkRichTextCustomEmoji
          { custom_emoji_id = field_1
          , alternative_text = field_2
          }

instance ToJSON RichTextCustomEmoji where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "custom_emoji")
          , jsonField "custom_emoji_id" x.custom_emoji_id
          , jsonField "alternative_text" x.alternative_text
          ]
      )
  toEncoding = toEncoding . toJSON
