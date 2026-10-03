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
module Telegram.Bot.Internal.Group.PassportElementError
  ( PassportElementError (..)
  ) where

import Data.Aeson (ToJSON (..), Value)
import Telegram.Bot.Internal.Group.PassportElementErrorDataField (PassportElementErrorDataField)
import Telegram.Bot.Internal.Group.PassportElementErrorFile (PassportElementErrorFile)
import Telegram.Bot.Internal.Group.PassportElementErrorFiles (PassportElementErrorFiles)
import Telegram.Bot.Internal.Group.PassportElementErrorFrontSide (PassportElementErrorFrontSide)
import Telegram.Bot.Internal.Group.PassportElementErrorReverseSide (PassportElementErrorReverseSide)
import Telegram.Bot.Internal.Group.PassportElementErrorSelfie (PassportElementErrorSelfie)
import Telegram.Bot.Internal.Group.PassportElementErrorTranslationFile (PassportElementErrorTranslationFile)
import Telegram.Bot.Internal.Group.PassportElementErrorTranslationFiles (PassportElementErrorTranslationFiles)
import Telegram.Bot.Internal.Group.PassportElementErrorUnspecified (PassportElementErrorUnspecified)

-- | This object represents an error in the Telegram Passport element which was submitted that should be resolved by the user. It should be one of:
-- \- PassportElementErrorDataField
-- \- PassportElementErrorFrontSide
-- \- PassportElementErrorReverseSide
-- \- PassportElementErrorSelfie
-- \- PassportElementErrorFile
-- \- PassportElementErrorFiles
-- \- PassportElementErrorTranslationFile
-- \- PassportElementErrorTranslationFiles
-- \- PassportElementErrorUnspecified
--
-- Source: <https://core.telegram.org/bots/api#passportelementerror>.
-- Codec directions: encoded into requests.
data PassportElementError
  = PassportElementErrorViaPassportElementErrorDataField PassportElementErrorDataField
  | PassportElementErrorViaPassportElementErrorFile PassportElementErrorFile
  | PassportElementErrorViaPassportElementErrorFiles PassportElementErrorFiles
  | PassportElementErrorViaPassportElementErrorFrontSide PassportElementErrorFrontSide
  | PassportElementErrorViaPassportElementErrorReverseSide PassportElementErrorReverseSide
  | PassportElementErrorViaPassportElementErrorSelfie PassportElementErrorSelfie
  | PassportElementErrorViaPassportElementErrorTranslationFile PassportElementErrorTranslationFile
  | PassportElementErrorViaPassportElementErrorTranslationFiles PassportElementErrorTranslationFiles
  | PassportElementErrorViaPassportElementErrorUnspecified PassportElementErrorUnspecified
  | -- | A value this decoder does not recognize, preserved verbatim so
    -- the raw payload survives the boundary.
    PassportElementErrorUnknown Value
  deriving stock (Eq, Show)

instance ToJSON PassportElementError where
  toJSON = \case
    PassportElementErrorViaPassportElementErrorDataField member_ -> toJSON member_
    PassportElementErrorViaPassportElementErrorFile member_ -> toJSON member_
    PassportElementErrorViaPassportElementErrorFiles member_ -> toJSON member_
    PassportElementErrorViaPassportElementErrorFrontSide member_ -> toJSON member_
    PassportElementErrorViaPassportElementErrorReverseSide member_ -> toJSON member_
    PassportElementErrorViaPassportElementErrorSelfie member_ -> toJSON member_
    PassportElementErrorViaPassportElementErrorTranslationFile member_ -> toJSON member_
    PassportElementErrorViaPassportElementErrorTranslationFiles member_ -> toJSON member_
    PassportElementErrorViaPassportElementErrorUnspecified member_ -> toJSON member_
    PassportElementErrorUnknown raw_ -> raw_
  toEncoding = toEncoding . toJSON
