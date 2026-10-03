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
module Telegram.Bot.Internal.Group.RichBlockCaption
  ( RichBlockCaption (..)
  , mkRichBlockCaption
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Telegram.Bot.Internal.Group.RichMessageButton (RichText)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, requiredWith)

-- | Caption of a rich formatted block.
--
-- Source: <https://core.telegram.org/bots/api#richblockcaption>.
-- Codec directions: decoded from responses, encoded into requests.
data RichBlockCaption = MkRichBlockCaption
  { -- | Block caption
    --
    -- Wire key: @text@.
    text :: RichText
  , -- | Optional. Block credit which corresponds to the HTML tag \<cite\>
    --
    -- Wire key: @credit@.
    -- Omitted from an encoded request when it is @Nothing@.
    credit :: Maybe RichText
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichBlockCaption' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichBlockCaption :: RichText -> RichBlockCaption
mkRichBlockCaption arg0 =
  MkRichBlockCaption
    { text = arg0
    , credit = Nothing
    }

instance FromJSON RichBlockCaption where
  parseJSON = withObject "RichBlockCaption" $ \obj ->
    do
      field_0 <- requiredWith obj "text" parseJSON
      field_1 <- optionalWith obj "credit" parseJSON
      pure
        MkRichBlockCaption
          { text = field_0
          , credit = field_1
          }

instance ToJSON RichBlockCaption where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "text" x.text
          , jsonOptional "credit" x.credit
          ]
      )
  toEncoding = toEncoding . toJSON
