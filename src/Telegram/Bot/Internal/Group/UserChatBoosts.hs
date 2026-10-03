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
module Telegram.Bot.Internal.Group.UserChatBoosts
  ( UserChatBoosts (..)
  , mkUserChatBoosts
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Telegram.Bot.Internal.Group.ChatBoost (ChatBoost)
import Telegram.Bot.Support (jsonField, jsonObject, parseList, requiredWith)

-- | This object represents a list of boosts added to a chat by a user.
--
-- Source: <https://core.telegram.org/bots/api#userchatboosts>.
-- Codec directions: decoded from responses, encoded into requests.
data UserChatBoosts = MkUserChatBoosts
  { -- | The list of boosts added to the chat by the user
    --
    -- Wire key: @boosts@.
    boosts :: [ChatBoost]
  }
  deriving stock (Eq, Show)

-- | Initialize a 'UserChatBoosts' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkUserChatBoosts :: [ChatBoost] -> UserChatBoosts
mkUserChatBoosts arg0 =
  MkUserChatBoosts
    { boosts = arg0
    }

instance FromJSON UserChatBoosts where
  parseJSON = withObject "UserChatBoosts" $ \obj ->
    do
      field_0 <- requiredWith obj "boosts" (parseList parseJSON)
      pure
        MkUserChatBoosts
          { boosts = field_0
          }

instance ToJSON UserChatBoosts where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "boosts" x.boosts
          ]
      )
  toEncoding = toEncoding . toJSON
