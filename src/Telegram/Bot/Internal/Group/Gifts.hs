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
module Telegram.Bot.Internal.Group.Gifts
  ( Gifts (..)
  , mkGifts
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Telegram.Bot.Internal.Group.Gift (Gift)
import Telegram.Bot.Support (jsonField, jsonObject, parseList, requiredWith)

-- | This object represent a list of gifts.
--
-- Source: <https://core.telegram.org/bots/api#gifts>.
-- Codec directions: decoded from responses, encoded into requests.
data Gifts = MkGifts
  { -- | The list of gifts
    --
    -- Wire key: @gifts@.
    gifts :: [Gift]
  }
  deriving stock (Eq, Show)

-- | Initialize a 'Gifts' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkGifts :: [Gift] -> Gifts
mkGifts arg0 =
  MkGifts
    { gifts = arg0
    }

instance FromJSON Gifts where
  parseJSON = withObject "Gifts" $ \obj ->
    do
      field_0 <- requiredWith obj "gifts" (parseList parseJSON)
      pure
        MkGifts
          { gifts = field_0
          }

instance ToJSON Gifts where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "gifts" x.gifts
          ]
      )
  toEncoding = toEncoding . toJSON
