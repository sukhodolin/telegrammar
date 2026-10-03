{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeFamilies #-}

-- | One method's request record, initializer, and result association.
--
-- Import this module qualified to update an optional parameter, which is
-- the supported idiom for a record whose field labels repeat across
-- methods.
--
-- Generated. Do not edit.
module Telegram.Bot.Methods.GetForumTopicIconStickers
  ( GetForumTopicIconStickers (..)
  , mkGetForumTopicIconStickers
  ) where

import Data.Aeson (FromJSON (..), Object)
import Telegram.Bot.Internal.Group.Sticker (Sticker)
import Telegram.Bot.Support (Method (..), parseList, planRequestBody)

-- | Use this method to get custom emoji stickers, which can be used as a forum topic icon by any user. Requires no parameters. Returns an Array of Sticker objects.
--
-- Wire method spelling: @getForumTopicIconStickers@.
--
-- Source: <https://core.telegram.org/bots/api#getforumtopiciconstickers>.
-- Result: @[Sticker]@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data GetForumTopicIconStickers = MkGetForumTopicIconStickers
  { -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'GetForumTopicIconStickers' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkGetForumTopicIconStickers :: GetForumTopicIconStickers
mkGetForumTopicIconStickers =
  MkGetForumTopicIconStickers
    { extra = mempty
    }

instance Method GetForumTopicIconStickers where
  type Result GetForumTopicIconStickers = [Sticker]
  methodName _ = "getForumTopicIconStickers"
  planRequest x =
    planRequestBody
      "getForumTopicIconStickers"
      []
      []
      x.extra
  parseResult _ = (parseList parseJSON)
