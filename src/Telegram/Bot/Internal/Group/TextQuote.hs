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
module Telegram.Bot.Internal.Group.TextQuote
  ( TextQuote (..)
  , mkTextQuote
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.MessageEntity (MessageEntity)
import Telegram.Bot.Support (jsonField, jsonFlag, jsonObject, jsonOptional, optionalTrueFlag, optionalWith, parseInt64, parseList, requiredWith)

-- | This object contains information about the quoted part of a message that is replied to by the given message.
--
-- Source: <https://core.telegram.org/bots/api#textquote>.
-- Codec directions: decoded from responses, encoded into requests.
data TextQuote = MkTextQuote
  { -- | Text of the quoted part of a message that is replied to by the given message
    --
    -- Wire key: @text@.
    text :: Text
  , -- | Optional. Special entities that appear in the quote. Currently, only bold, italic, underline, strikethrough, spoiler, custom_emoji, and date_time entities are kept in quotes.
    --
    -- Wire key: @entities@.
    -- Omitted from an encoded request when it is @Nothing@.
    entities :: Maybe [MessageEntity]
  , -- | Approximate quote position in the original message in UTF-16 code units as specified by the sender
    --
    -- Wire key: @position@.
    position :: Int64
  , -- | Optional. True, if the quote was chosen manually by the message sender. Otherwise, the quote was added automatically by the server.
    --
    -- Wire key: @is_manual@.
    -- Omitted from an encoded request when it is @False@.
    is_manual :: Bool
  }
  deriving stock (Eq, Show)

-- | Initialize a 'TextQuote' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkTextQuote :: Text -> Int64 -> TextQuote
mkTextQuote arg0 arg1 =
  MkTextQuote
    { text = arg0
    , entities = Nothing
    , position = arg1
    , is_manual = False
    }

instance FromJSON TextQuote where
  parseJSON = withObject "TextQuote" $ \obj ->
    do
      field_0 <- requiredWith obj "text" parseJSON
      field_1 <- optionalWith obj "entities" (parseList parseJSON)
      field_2 <- requiredWith obj "position" parseInt64
      field_3 <- optionalTrueFlag obj "is_manual"
      pure
        MkTextQuote
          { text = field_0
          , entities = field_1
          , position = field_2
          , is_manual = field_3
          }

instance ToJSON TextQuote where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "text" x.text
          , jsonOptional "entities" x.entities
          , jsonField "position" x.position
          , jsonFlag "is_manual" x.is_manual
          ]
      )
  toEncoding = toEncoding . toJSON
