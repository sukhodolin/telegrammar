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
module Telegram.Bot.Methods.DeleteStory
  ( DeleteStory (..)
  , mkDeleteStory
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned)

-- | Deletes a story previously posted by the bot on behalf of a managed business account. Requires the can_manage_stories business bot right. Returns True on success.
--
-- Wire method spelling: @deleteStory@.
--
-- Source: <https://core.telegram.org/bots/api#deletestory>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data DeleteStory = MkDeleteStory
  { -- | Unique identifier of the business connection
    --
    -- Wire key: @business_connection_id@.
    business_connection_id :: Text
  , -- | Unique identifier of the story to delete
    --
    -- Wire key: @story_id@.
    story_id :: Int64
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'DeleteStory' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkDeleteStory :: Text -> Int64 -> DeleteStory
mkDeleteStory arg0 arg1 =
  MkDeleteStory
    { business_connection_id = arg0
    , story_id = arg1
    , extra = mempty
    }

instance Method DeleteStory where
  type Result DeleteStory = TrueValue
  methodName _ = "deleteStory"
  planRequest x =
    planRequestBody
      "deleteStory"
      [ "business_connection_id"
      , "story_id"
      ]
      ( concat
          [ planned "business_connection_id" (encodeJson x.business_connection_id)
          , planned "story_id" (encodeJson x.story_id)
          ]
      )
      x.extra
  parseResult _ = parseJSON
