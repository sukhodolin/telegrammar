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
module Telegram.Bot.Internal.Group.RichMessage
  ( RichMessage (..)
  , mkRichMessage
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Telegram.Bot.Internal.Group.RichBlock (RichBlock)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseList, requiredWith)

-- | Rich formatted message.
--
-- Source: <https://core.telegram.org/bots/api#richmessage>.
-- Codec directions: decoded from responses, encoded into requests.
data RichMessage = MkRichMessage
  { -- | Content of the message
    --
    -- Wire key: @blocks@.
    blocks :: [RichBlock]
  , -- | Optional. True, if the rich message must be shown right-to-left
    --
    -- Wire key: @is_rtl@.
    -- Omitted from an encoded request when it is @Nothing@.
    is_rtl :: Maybe Bool
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichMessage' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichMessage :: [RichBlock] -> RichMessage
mkRichMessage arg0 =
  MkRichMessage
    { blocks = arg0
    , is_rtl = Nothing
    }

instance FromJSON RichMessage where
  parseJSON = withObject "RichMessage" $ \obj ->
    do
      field_0 <- requiredWith obj "blocks" (parseList parseJSON)
      field_1 <- optionalWith obj "is_rtl" parseJSON
      pure
        MkRichMessage
          { blocks = field_0
          , is_rtl = field_1
          }

instance ToJSON RichMessage where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "blocks" x.blocks
          , jsonOptional "is_rtl" x.is_rtl
          ]
      )
  toEncoding = toEncoding . toJSON
