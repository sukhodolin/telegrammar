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
module Telegram.Bot.Internal.Group.InputMessageContent
  ( InputMessageContent (..)
  , planInputMessageContent
  ) where

import Data.Aeson (Value)
import Telegram.Bot.Internal.Group.InputContactMessageContent (InputContactMessageContent)
import Telegram.Bot.Internal.Group.InputInvoiceMessageContent (InputInvoiceMessageContent, planInputInvoiceMessageContent)
import Telegram.Bot.Internal.Group.InputLocationMessageContent (InputLocationMessageContent)
import Telegram.Bot.Internal.Group.InputRichMessageContent (InputRichMessageContent, planInputRichMessageContent)
import Telegram.Bot.Internal.Group.InputTextMessageContent (InputTextMessageContent)
import Telegram.Bot.Internal.Group.InputVenueMessageContent (InputVenueMessageContent)
import Telegram.Bot.Support (FieldPlanner, encodeJson, plainValue, planMember)

-- | This object represents the content of a message to be sent as a result of an inline query. Telegram clients currently support the following types:
-- \- InputTextMessageContent
-- \- InputRichMessageContent
-- \- InputLocationMessageContent
-- \- InputVenueMessageContent
-- \- InputContactMessageContent
-- \- InputInvoiceMessageContent
--
-- Source: <https://core.telegram.org/bots/api#inputmessagecontent>.
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
data InputMessageContent
  = InputMessageContentViaInputContactMessageContent InputContactMessageContent
  | InputMessageContentViaInputInvoiceMessageContent InputInvoiceMessageContent
  | InputMessageContentViaInputLocationMessageContent InputLocationMessageContent
  | InputMessageContentViaInputRichMessageContent InputRichMessageContent
  | InputMessageContentViaInputTextMessageContent InputTextMessageContent
  | InputMessageContentViaInputVenueMessageContent InputVenueMessageContent
  | -- | A value this decoder does not recognize, preserved verbatim so
    -- the raw payload survives the boundary.
    InputMessageContentUnknown Value
  deriving stock (Eq, Show)

-- | Plan the selected member of a 'InputMessageContent'.
--
-- An unrecognized value is emitted verbatim; it is an explicit raw
-- escape hatch and allocates no attachment.
planInputMessageContent :: InputMessageContent -> FieldPlanner
planInputMessageContent = \case
  InputMessageContentViaInputContactMessageContent member_ -> planMember (encodeJson member_)
  InputMessageContentViaInputInvoiceMessageContent member_ -> planMember (planInputInvoiceMessageContent member_)
  InputMessageContentViaInputLocationMessageContent member_ -> planMember (encodeJson member_)
  InputMessageContentViaInputRichMessageContent member_ -> planMember (planInputRichMessageContent member_)
  InputMessageContentViaInputTextMessageContent member_ -> planMember (encodeJson member_)
  InputMessageContentViaInputVenueMessageContent member_ -> planMember (encodeJson member_)
  InputMessageContentUnknown raw_ -> planMember (plainValue raw_)
