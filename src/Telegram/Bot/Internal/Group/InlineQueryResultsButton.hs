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
module Telegram.Bot.Internal.Group.InlineQueryResultsButton
  ( InlineQueryResultsButton (..)
  , mkInlineQueryResultsButton
  ) where

import Data.Aeson (ToJSON (..))
import Data.Text (Text)
import Telegram.Bot.Internal.Group.WebAppInfo (WebAppInfo)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional)

-- | This object represents a button to be shown above inline query results. You must use exactly one of the optional fields.
--
-- Source: <https://core.telegram.org/bots/api#inlinequeryresultsbutton>.
-- Codec directions: encoded into requests.
data InlineQueryResultsButton = MkInlineQueryResultsButton
  { -- | Label text on the button
    --
    -- Wire key: @text@.
    text :: Text
  , -- | Optional. Description of the Web App that will be launched when the user presses the button. The Web App will be able to switch back to the inline mode using the method switchInlineQuery inside the Web App.
    --
    -- Wire key: @web_app@.
    -- Omitted from an encoded request when it is @Nothing@.
    web_app :: Maybe WebAppInfo
  , -- | Optional. Deep-linking parameter for the \/start message sent to the bot when a user presses the button. 1-64 characters, only A-Z, a-z, 0-9, _ and - are allowed. Example: An inline bot that sends YouTube videos can ask the user to connect the bot to their YouTube account to adapt search results accordingly. To do this, it displays a \'Connect your YouTube account\' button above the results, or even before showing any. The user presses the button, switches to a private chat with the bot and, in doing so, passes a start parameter that instructs the bot to return an OAuth link. Once done, the bot can offer a switch_inline button so that the user can easily return to the chat where they wanted to use the bot\'s inline capabilities.
    --
    -- Wire key: @start_parameter@.
    -- Omitted from an encoded request when it is @Nothing@.
    start_parameter :: Maybe Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InlineQueryResultsButton' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInlineQueryResultsButton :: Text -> InlineQueryResultsButton
mkInlineQueryResultsButton arg0 =
  MkInlineQueryResultsButton
    { text = arg0
    , web_app = Nothing
    , start_parameter = Nothing
    }

instance ToJSON InlineQueryResultsButton where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "text" x.text
          , jsonOptional "web_app" x.web_app
          , jsonOptional "start_parameter" x.start_parameter
          ]
      )
  toEncoding = toEncoding . toJSON
