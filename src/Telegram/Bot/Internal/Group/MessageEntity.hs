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
module Telegram.Bot.Internal.Group.MessageEntity
  ( MessageEntity (..)
  , mkMessageEntity
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Support (jsonField, jsonObject, jsonOptional, optionalWith, parseInt64, requiredWith)

-- | This object represents one special entity in a text message. For example, hashtags, usernames, URLs, etc.
--
-- Source: <https://core.telegram.org/bots/api#messageentity>.
-- Codec directions: decoded from responses, encoded into requests.
data MessageEntity = MkMessageEntity
  { -- | Type of the entity. Currently, can be \"mention\" (\@username), \"hashtag\" (\#hashtag or \#hashtag\@chatusername), \"cashtag\" ($USD or $USD\@chatusername), \"bot_command\" (\/start\@jobs_bot), \"url\" (https:\/\/telegram.org), \"email\" (do-not-reply\@telegram.org), \"phone_number\" (+1-212-555-0123), \"bold\" (bold text), \"italic\" (italic text), \"underline\" (underlined text), \"strikethrough\" (strikethrough text), \"spoiler\" (spoiler message), \"blockquote\" (block quotation), \"expandable_blockquote\" (collapsed-by-default block quotation), \"code\" (monowidth string), \"pre\" (monowidth block), \"text_link\" (for clickable text URLs), \"text_mention\" (for users without usernames), \"custom_emoji\" (for inline custom emoji stickers), or \"date_time\" (for formatted date and time).
    --
    -- Wire key: @type@.
    type_ :: Text
  , -- | Offset in UTF-16 code units to the start of the entity
    --
    -- Wire key: @offset@.
    offset :: Int64
  , -- | Length of the entity in UTF-16 code units
    --
    -- Wire key: @length@.
    length :: Int64
  , -- | Optional. For \"text_link\" only, URL that will be opened after user taps on the text
    --
    -- Wire key: @url@.
    -- Omitted from an encoded request when it is @Nothing@.
    url :: Maybe Text
  , -- | Optional. For \"text_mention\" only, the mentioned user
    --
    -- Wire key: @user@.
    -- Omitted from an encoded request when it is @Nothing@.
    user :: Maybe User
  , -- | Optional. For \"pre\" only, the programming language of the entity text
    --
    -- Wire key: @language@.
    -- Omitted from an encoded request when it is @Nothing@.
    language :: Maybe Text
  , -- | Optional. For \"custom_emoji\" only, unique identifier of the custom emoji. Use getCustomEmojiStickers to get full information about the sticker.
    --
    -- Wire key: @custom_emoji_id@.
    -- Omitted from an encoded request when it is @Nothing@.
    custom_emoji_id :: Maybe Text
  , -- | Optional. For \"date_time\" only, the Unix time associated with the entity
    --
    -- Wire key: @unix_time@.
    -- Omitted from an encoded request when it is @Nothing@.
    unix_time :: Maybe Int64
  , -- | Optional. For \"date_time\" only, the string that defines the formatting of the date and time. See date-time entity formatting for more details.
    --
    -- Wire key: @date_time_format@.
    -- Omitted from an encoded request when it is @Nothing@.
    date_time_format :: Maybe Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'MessageEntity' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkMessageEntity :: Text -> Int64 -> Int64 -> MessageEntity
mkMessageEntity arg0 arg1 arg2 =
  MkMessageEntity
    { type_ = arg0
    , offset = arg1
    , length = arg2
    , url = Nothing
    , user = Nothing
    , language = Nothing
    , custom_emoji_id = Nothing
    , unix_time = Nothing
    , date_time_format = Nothing
    }

instance FromJSON MessageEntity where
  parseJSON = withObject "MessageEntity" $ \obj ->
    do
      field_0 <- requiredWith obj "type" parseJSON
      field_1 <- requiredWith obj "offset" parseInt64
      field_2 <- requiredWith obj "length" parseInt64
      field_3 <- optionalWith obj "url" parseJSON
      field_4 <- optionalWith obj "user" parseJSON
      field_5 <- optionalWith obj "language" parseJSON
      field_6 <- optionalWith obj "custom_emoji_id" parseJSON
      field_7 <- optionalWith obj "unix_time" parseInt64
      field_8 <- optionalWith obj "date_time_format" parseJSON
      pure
        MkMessageEntity
          { type_ = field_0
          , offset = field_1
          , length = field_2
          , url = field_3
          , user = field_4
          , language = field_5
          , custom_emoji_id = field_6
          , unix_time = field_7
          , date_time_format = field_8
          }

instance ToJSON MessageEntity where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "type" x.type_
          , jsonField "offset" x.offset
          , jsonField "length" x.length
          , jsonOptional "url" x.url
          , jsonOptional "user" x.user
          , jsonOptional "language" x.language
          , jsonOptional "custom_emoji_id" x.custom_emoji_id
          , jsonOptional "unix_time" x.unix_time
          , jsonOptional "date_time_format" x.date_time_format
          ]
      )
  toEncoding = toEncoding . toJSON
