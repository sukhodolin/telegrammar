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
module Telegram.Bot.Internal.Group.BusinessIntro
  ( BusinessIntro (..)
  , mkBusinessIntro
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.Sticker (Sticker)
import Telegram.Bot.Support (jsonObject, jsonOptional, optionalWith)

-- | Contains information about the start page settings of a Telegram Business account.
--
-- Source: <https://core.telegram.org/bots/api#businessintro>.
-- Codec directions: decoded from responses, encoded into requests.
data BusinessIntro = MkBusinessIntro
  { -- | Optional. Title text of the business intro
    --
    -- Wire key: @title@.
    -- Omitted from an encoded request when it is @Nothing@.
    title :: Maybe Text
  , -- | Optional. Message text of the business intro
    --
    -- Wire key: @message@.
    -- Omitted from an encoded request when it is @Nothing@.
    message :: Maybe Text
  , -- | Optional. Sticker of the business intro
    --
    -- Wire key: @sticker@.
    -- Omitted from an encoded request when it is @Nothing@.
    sticker :: Maybe Sticker
  }
  deriving stock (Eq, Show)

-- | Initialize a 'BusinessIntro' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkBusinessIntro :: BusinessIntro
mkBusinessIntro =
  MkBusinessIntro
    { title = Nothing
    , message = Nothing
    , sticker = Nothing
    }

instance FromJSON BusinessIntro where
  parseJSON = withObject "BusinessIntro" $ \obj ->
    do
      field_0 <- optionalWith obj "title" parseJSON
      field_1 <- optionalWith obj "message" parseJSON
      field_2 <- optionalWith obj "sticker" parseJSON
      pure
        MkBusinessIntro
          { title = field_0
          , message = field_1
          , sticker = field_2
          }

instance ToJSON BusinessIntro where
  toJSON x =
    jsonObject
      ( concat
          [ jsonOptional "title" x.title
          , jsonOptional "message" x.message
          , jsonOptional "sticker" x.sticker
          ]
      )
  toEncoding = toEncoding . toJSON
