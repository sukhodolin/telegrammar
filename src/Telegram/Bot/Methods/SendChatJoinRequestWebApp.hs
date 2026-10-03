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
module Telegram.Bot.Methods.SendChatJoinRequestWebApp
  ( SendChatJoinRequestWebApp (..)
  , mkSendChatJoinRequestWebApp
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Text (Text)
import Telegram.Bot.Support (Method (..), TrueValue, encodeJson, planRequestBody, planned)

-- | Use this method to process a received chat join request query by showing a Mini App to the user before deciding the outcome. Call answerChatJoinRequestQuery to resolve the join request query based on the user interaction with the Mini App. Returns True on success.
--
-- Wire method spelling: @sendChatJoinRequestWebApp@.
--
-- Source: <https://core.telegram.org/bots/api#sendchatjoinrequestwebapp>.
-- Result: @TrueValue@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data SendChatJoinRequestWebApp = MkSendChatJoinRequestWebApp
  { -- | Unique identifier of the join request query
    --
    -- Wire key: @chat_join_request_query_id@.
    chat_join_request_query_id :: Text
  , -- | An HTTPS URL of a Web App to be opened with additional data as specified in Initializing Web Apps
    --
    -- Wire key: @web_app_url@.
    web_app_url :: Text
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'SendChatJoinRequestWebApp' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkSendChatJoinRequestWebApp :: Text -> Text -> SendChatJoinRequestWebApp
mkSendChatJoinRequestWebApp arg0 arg1 =
  MkSendChatJoinRequestWebApp
    { chat_join_request_query_id = arg0
    , web_app_url = arg1
    , extra = mempty
    }

instance Method SendChatJoinRequestWebApp where
  type Result SendChatJoinRequestWebApp = TrueValue
  methodName _ = "sendChatJoinRequestWebApp"
  planRequest x =
    planRequestBody
      "sendChatJoinRequestWebApp"
      [ "chat_join_request_query_id"
      , "web_app_url"
      ]
      ( concat
          [ planned "chat_join_request_query_id" (encodeJson x.chat_join_request_query_id)
          , planned "web_app_url" (encodeJson x.web_app_url)
          ]
      )
      x.extra
  parseResult _ = parseJSON
