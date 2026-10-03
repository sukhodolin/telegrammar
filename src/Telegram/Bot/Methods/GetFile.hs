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
module Telegram.Bot.Methods.GetFile
  ( GetFile (..)
  , mkGetFile
  ) where

import Data.Aeson (FromJSON (..), Object)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.File (File)
import Telegram.Bot.Support (Method (..), encodeJson, planRequestBody, planned)

-- | Use this method to get basic information about a file and prepare it for downloading. For the moment, bots can download files of up to 20MB in size. On success, a File object is returned. The file can then be downloaded via the link https:\/\/api.telegram.org\/file\/bot\<token\>\/\<file_path\>, where \<file_path\> is taken from the response. It is guaranteed that the link will be valid for at least 1 hour. When the link expires, a new one can be requested by calling getFile again.
-- Note: This function may not preserve the original file name and MIME type. You should save the file\'s MIME type and name (if available) when the File object is received.
--
-- Wire method spelling: @getFile@.
--
-- Source: <https://core.telegram.org/bots/api#getfile>.
-- Result: @File@.
-- Every request is planned through the checked planner, so an extra-key
-- collision, a refused file source, or a documented local validator fails
-- before any transport runs.
data GetFile = MkGetFile
  { -- | File identifier to get information about
    --
    -- Wire key: @file_id@.
    file_id :: Text
  , -- | Raw additional parameters, merged into the request beside the
    -- documented ones. A key colliding with a documented parameter or with
    -- an allocated attachment part is refused by the checked planner.
    extra :: Object
  }
  deriving stock (Eq, Show)

-- | Initialize a 'GetFile' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkGetFile :: Text -> GetFile
mkGetFile arg0 =
  MkGetFile
    { file_id = arg0
    , extra = mempty
    }

instance Method GetFile where
  type Result GetFile = File
  methodName _ = "getFile"
  planRequest x =
    planRequestBody
      "getFile"
      [ "file_id"
      ]
      ( concat
          [ planned "file_id" (encodeJson x.file_id)
          ]
      )
      x.extra
  parseResult _ = parseJSON
