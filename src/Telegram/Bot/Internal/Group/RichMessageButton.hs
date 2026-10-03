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
module Telegram.Bot.Internal.Group.RichMessageButton
  ( RichMessageButton (..)
  , RichText (..)
  , RichTextAnchorLink (..)
  , RichTextBankCardNumber (..)
  , RichTextBold (..)
  , RichTextBotCommand (..)
  , RichTextButton (..)
  , RichTextCashtag (..)
  , RichTextCode (..)
  , RichTextDateTime (..)
  , RichTextEmailAddress (..)
  , RichTextHashtag (..)
  , RichTextItalic (..)
  , RichTextMarked (..)
  , RichTextMention (..)
  , RichTextPhoneNumber (..)
  , RichTextReference (..)
  , RichTextReferenceLink (..)
  , RichTextSpoiler (..)
  , RichTextStrikethrough (..)
  , RichTextSubscript (..)
  , RichTextSuperscript (..)
  , RichTextTextMention (..)
  , RichTextUnderline (..)
  , RichTextUrl (..)
  , mkRichMessageButton
  , mkRichTextAnchorLink
  , mkRichTextBankCardNumber
  , mkRichTextBold
  , mkRichTextBotCommand
  , mkRichTextButton
  , mkRichTextCashtag
  , mkRichTextCode
  , mkRichTextDateTime
  , mkRichTextEmailAddress
  , mkRichTextHashtag
  , mkRichTextItalic
  , mkRichTextMarked
  , mkRichTextMention
  , mkRichTextPhoneNumber
  , mkRichTextReference
  , mkRichTextReferenceLink
  , mkRichTextSpoiler
  , mkRichTextStrikethrough
  , mkRichTextSubscript
  , mkRichTextSuperscript
  , mkRichTextTextMention
  , mkRichTextUnderline
  , mkRichTextUrl
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.CopyTextButton (CopyTextButton)
import Telegram.Bot.Internal.Group.DisabledButton (DisabledButton)
import Telegram.Bot.Internal.Group.LoginUrl (LoginUrl)
import Telegram.Bot.Internal.Group.RichTextAnchor (RichTextAnchor)
import Telegram.Bot.Internal.Group.RichTextCustomEmoji (RichTextCustomEmoji)
import Telegram.Bot.Internal.Group.RichTextMathematicalExpression (RichTextMathematicalExpression)
import Telegram.Bot.Internal.Group.SwitchInlineQueryChosenChat (SwitchInlineQueryChosenChat)
import Telegram.Bot.Internal.Group.User (User)
import Telegram.Bot.Internal.Group.WebAppInfo (WebAppInfo)
import Telegram.Bot.Support (checkStringConstant, describeValue, jsonField, jsonLiteral, jsonObject, jsonOptional, optionalWith, parseInt64, parseList, requiredWith, tagField)

-- | This object represents a button in a RichMessage. Exactly one of the fields other than text and style must be used to specify the type of the button.
--
-- Source: <https://core.telegram.org/bots/api#richmessagebutton>.
-- Codec directions: decoded from responses, encoded into requests.
data RichMessageButton = MkRichMessageButton
  { -- | Text of the button. May contain only plain text, RichTextCustomEmoji and RichTextDateTime entities.
    --
    -- Wire key: @text@.
    text :: RichText
  , -- | Optional. Style of the button. Must be one of \"danger\", \"success\", \"primary\", or \"link\" (the button is shown as a regular link without borders). Apps may use theme-specific colors for the button background and text based on the style. The style \"link\" is allowed only for callback buttons.
    --
    -- Wire key: @style@.
    -- Omitted from an encoded request when it is @Nothing@.
    style :: Maybe Text
  , -- | Optional. HTTP or tg:\/\/ URL to be opened when the button is pressed. Links tg:\/\/user?id=\<user_id\> can be used to mention a user by their identifier without using a username, if this is allowed by their privacy settings.
    --
    -- Wire key: @url@.
    -- Omitted from an encoded request when it is @Nothing@.
    url :: Maybe Text
  , -- | Optional. Data to be sent in a callback query to the bot when the button is pressed, 1-64 bytes
    --
    -- Wire key: @callback_data@.
    -- Omitted from an encoded request when it is @Nothing@.
    callback_data :: Maybe Text
  , -- | Optional. Description of the Web App that will be launched when the user presses the button. The Web App will be able to send an arbitrary message on behalf of the user using the method answerWebAppQuery. Available only in private chats between a user and the bot. Not supported for messages sent on behalf of a business account.
    --
    -- Wire key: @web_app@.
    -- Omitted from an encoded request when it is @Nothing@.
    web_app :: Maybe WebAppInfo
  , -- | Optional. An HTTPS URL used to automatically authorize the user. Can be used as a replacement for the Telegram Login Widget. Not supported for ephemeral messages.
    --
    -- Wire key: @login_url@.
    -- Omitted from an encoded request when it is @Nothing@.
    login_url :: Maybe LoginUrl
  , -- | Optional. If set, pressing the button will prompt the user to select one of their chats, open that chat and insert the bot\'s username and the specified inline query in the input field. May be empty, in which case just the bot\'s username will be inserted. Not supported for messages sent in channel direct messages chats and on behalf of a business account.
    --
    -- Wire key: @switch_inline_query@.
    -- Omitted from an encoded request when it is @Nothing@.
    switch_inline_query :: Maybe Text
  , -- | Optional. If set, pressing the button will insert the bot\'s username and the specified inline query in the current chat\'s input field. May be empty, in which case only the bot\'s username will be inserted. Not supported in channels and for messages sent in channel direct messages chats and on behalf of a business account.
    --
    -- Wire key: @switch_inline_query_current_chat@.
    -- Omitted from an encoded request when it is @Nothing@.
    switch_inline_query_current_chat :: Maybe Text
  , -- | Optional. If set, pressing the button will prompt the user to select one of their chats of the specified type, open that chat and insert the bot\'s username and the specified inline query in the input field. Not supported for messages sent in channel direct messages chats and on behalf of a business account.
    --
    -- Wire key: @switch_inline_query_chosen_chat@.
    -- Omitted from an encoded request when it is @Nothing@.
    switch_inline_query_chosen_chat :: Maybe SwitchInlineQueryChosenChat
  , -- | Optional. A button that copies the specified text to the clipboard
    --
    -- Wire key: @copy_text@.
    -- Omitted from an encoded request when it is @Nothing@.
    copy_text :: Maybe CopyTextButton
  , -- | Optional. If set, then the button is disabled and does nothing
    --
    -- Wire key: @disabled@.
    -- Omitted from an encoded request when it is @Nothing@.
    disabled :: Maybe DisabledButton
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichMessageButton' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichMessageButton :: RichText -> RichMessageButton
mkRichMessageButton arg0 =
  MkRichMessageButton
    { text = arg0
    , style = Nothing
    , url = Nothing
    , callback_data = Nothing
    , web_app = Nothing
    , login_url = Nothing
    , switch_inline_query = Nothing
    , switch_inline_query_current_chat = Nothing
    , switch_inline_query_chosen_chat = Nothing
    , copy_text = Nothing
    , disabled = Nothing
    }

instance FromJSON RichMessageButton where
  parseJSON = withObject "RichMessageButton" $ \obj ->
    do
      field_0 <- requiredWith obj "text" parseJSON
      field_1 <- optionalWith obj "style" parseJSON
      field_2 <- optionalWith obj "url" parseJSON
      field_3 <- optionalWith obj "callback_data" parseJSON
      field_4 <- optionalWith obj "web_app" parseJSON
      field_5 <- optionalWith obj "login_url" parseJSON
      field_6 <- optionalWith obj "switch_inline_query" parseJSON
      field_7 <- optionalWith obj "switch_inline_query_current_chat" parseJSON
      field_8 <- optionalWith obj "switch_inline_query_chosen_chat" parseJSON
      field_9 <- optionalWith obj "copy_text" parseJSON
      field_10 <- optionalWith obj "disabled" parseJSON
      pure
        MkRichMessageButton
          { text = field_0
          , style = field_1
          , url = field_2
          , callback_data = field_3
          , web_app = field_4
          , login_url = field_5
          , switch_inline_query = field_6
          , switch_inline_query_current_chat = field_7
          , switch_inline_query_chosen_chat = field_8
          , copy_text = field_9
          , disabled = field_10
          }

instance ToJSON RichMessageButton where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "text" x.text
          , jsonOptional "style" x.style
          , jsonOptional "url" x.url
          , jsonOptional "callback_data" x.callback_data
          , jsonOptional "web_app" x.web_app
          , jsonOptional "login_url" x.login_url
          , jsonOptional "switch_inline_query" x.switch_inline_query
          , jsonOptional "switch_inline_query_current_chat" x.switch_inline_query_current_chat
          , jsonOptional "switch_inline_query_chosen_chat" x.switch_inline_query_chosen_chat
          , jsonOptional "copy_text" x.copy_text
          , jsonOptional "disabled" x.disabled
          ]
      )
  toEncoding = toEncoding . toJSON

-- | This object represents a rich formatted text. Currently, it can be either a String for plain text, an Array of RichText, or any of the following types:
-- \- RichTextBold
-- \- RichTextItalic
-- \- RichTextUnderline
-- \- RichTextStrikethrough
-- \- RichTextSpoiler
-- \- RichTextDateTime
-- \- RichTextTextMention
-- \- RichTextSubscript
-- \- RichTextSuperscript
-- \- RichTextMarked
-- \- RichTextCode
-- \- RichTextCustomEmoji
-- \- RichTextMathematicalExpression
-- \- RichTextUrl
-- \- RichTextEmailAddress
-- \- RichTextPhoneNumber
-- \- RichTextBankCardNumber
-- \- RichTextMention
-- \- RichTextHashtag
-- \- RichTextCashtag
-- \- RichTextBotCommand
-- \- RichTextButton
-- \- RichTextAnchor
-- \- RichTextAnchorLink
-- \- RichTextReference
-- \- RichTextReferenceLink
--
-- Source: <https://core.telegram.org/bots/api#richtext>.
-- Codec directions: decoded from responses, encoded into requests.
data RichText
  = RichTextViaArray [RichText]
  | RichTextViaString Text
  | RichTextViaRichTextAnchor RichTextAnchor
  | RichTextViaRichTextAnchorLink RichTextAnchorLink
  | RichTextViaRichTextBankCardNumber RichTextBankCardNumber
  | RichTextViaRichTextBold RichTextBold
  | RichTextViaRichTextBotCommand RichTextBotCommand
  | RichTextViaRichTextButton RichTextButton
  | RichTextViaRichTextCashtag RichTextCashtag
  | RichTextViaRichTextCode RichTextCode
  | RichTextViaRichTextCustomEmoji RichTextCustomEmoji
  | RichTextViaRichTextDateTime RichTextDateTime
  | RichTextViaRichTextEmailAddress RichTextEmailAddress
  | RichTextViaRichTextHashtag RichTextHashtag
  | RichTextViaRichTextItalic RichTextItalic
  | RichTextViaRichTextMarked RichTextMarked
  | RichTextViaRichTextMathematicalExpression RichTextMathematicalExpression
  | RichTextViaRichTextMention RichTextMention
  | RichTextViaRichTextPhoneNumber RichTextPhoneNumber
  | RichTextViaRichTextReference RichTextReference
  | RichTextViaRichTextReferenceLink RichTextReferenceLink
  | RichTextViaRichTextSpoiler RichTextSpoiler
  | RichTextViaRichTextStrikethrough RichTextStrikethrough
  | RichTextViaRichTextSubscript RichTextSubscript
  | RichTextViaRichTextSuperscript RichTextSuperscript
  | RichTextViaRichTextTextMention RichTextTextMention
  | RichTextViaRichTextUnderline RichTextUnderline
  | RichTextViaRichTextUrl RichTextUrl
  | -- | A value this decoder does not recognize, preserved verbatim so
    -- the raw payload survives the boundary.
    RichTextUnknown Value
  deriving stock (Eq, Show)

instance FromJSON RichText where
  parseJSON value_ = case value_ of
    Array _ ->
      RichTextViaArray <$> (parseList parseJSON) value_
    String _ ->
      RichTextViaString <$> parseJSON value_
    Object obj_ -> do
      tag_ <- tagField obj_ "type"
      case tag_ of
        "anchor" ->
          RichTextViaRichTextAnchor <$> parseJSON value_
        "anchor_link" ->
          RichTextViaRichTextAnchorLink <$> parseJSON value_
        "bank_card_number" ->
          RichTextViaRichTextBankCardNumber <$> parseJSON value_
        "bold" ->
          RichTextViaRichTextBold <$> parseJSON value_
        "bot_command" ->
          RichTextViaRichTextBotCommand <$> parseJSON value_
        "button" ->
          RichTextViaRichTextButton <$> parseJSON value_
        "cashtag" ->
          RichTextViaRichTextCashtag <$> parseJSON value_
        "code" ->
          RichTextViaRichTextCode <$> parseJSON value_
        "custom_emoji" ->
          RichTextViaRichTextCustomEmoji <$> parseJSON value_
        "date_time" ->
          RichTextViaRichTextDateTime <$> parseJSON value_
        "email_address" ->
          RichTextViaRichTextEmailAddress <$> parseJSON value_
        "hashtag" ->
          RichTextViaRichTextHashtag <$> parseJSON value_
        "italic" ->
          RichTextViaRichTextItalic <$> parseJSON value_
        "marked" ->
          RichTextViaRichTextMarked <$> parseJSON value_
        "mathematical_expression" ->
          RichTextViaRichTextMathematicalExpression <$> parseJSON value_
        "mention" ->
          RichTextViaRichTextMention <$> parseJSON value_
        "phone_number" ->
          RichTextViaRichTextPhoneNumber <$> parseJSON value_
        "reference" ->
          RichTextViaRichTextReference <$> parseJSON value_
        "reference_link" ->
          RichTextViaRichTextReferenceLink <$> parseJSON value_
        "spoiler" ->
          RichTextViaRichTextSpoiler <$> parseJSON value_
        "strikethrough" ->
          RichTextViaRichTextStrikethrough <$> parseJSON value_
        "subscript" ->
          RichTextViaRichTextSubscript <$> parseJSON value_
        "superscript" ->
          RichTextViaRichTextSuperscript <$> parseJSON value_
        "text_mention" ->
          RichTextViaRichTextTextMention <$> parseJSON value_
        "underline" ->
          RichTextViaRichTextUnderline <$> parseJSON value_
        "url" ->
          RichTextViaRichTextUrl <$> parseJSON value_
        _ -> pure (RichTextUnknown value_)
    other_ ->
      fail ("RichText: unsupported JSON kind, got " <> describeValue other_)

instance ToJSON RichText where
  toJSON = \case
    RichTextViaArray member_ -> toJSON member_
    RichTextViaString member_ -> toJSON member_
    RichTextViaRichTextAnchor member_ -> toJSON member_
    RichTextViaRichTextAnchorLink member_ -> toJSON member_
    RichTextViaRichTextBankCardNumber member_ -> toJSON member_
    RichTextViaRichTextBold member_ -> toJSON member_
    RichTextViaRichTextBotCommand member_ -> toJSON member_
    RichTextViaRichTextButton member_ -> toJSON member_
    RichTextViaRichTextCashtag member_ -> toJSON member_
    RichTextViaRichTextCode member_ -> toJSON member_
    RichTextViaRichTextCustomEmoji member_ -> toJSON member_
    RichTextViaRichTextDateTime member_ -> toJSON member_
    RichTextViaRichTextEmailAddress member_ -> toJSON member_
    RichTextViaRichTextHashtag member_ -> toJSON member_
    RichTextViaRichTextItalic member_ -> toJSON member_
    RichTextViaRichTextMarked member_ -> toJSON member_
    RichTextViaRichTextMathematicalExpression member_ -> toJSON member_
    RichTextViaRichTextMention member_ -> toJSON member_
    RichTextViaRichTextPhoneNumber member_ -> toJSON member_
    RichTextViaRichTextReference member_ -> toJSON member_
    RichTextViaRichTextReferenceLink member_ -> toJSON member_
    RichTextViaRichTextSpoiler member_ -> toJSON member_
    RichTextViaRichTextStrikethrough member_ -> toJSON member_
    RichTextViaRichTextSubscript member_ -> toJSON member_
    RichTextViaRichTextSuperscript member_ -> toJSON member_
    RichTextViaRichTextTextMention member_ -> toJSON member_
    RichTextViaRichTextUnderline member_ -> toJSON member_
    RichTextViaRichTextUrl member_ -> toJSON member_
    RichTextUnknown raw_ -> raw_
  toEncoding = toEncoding . toJSON

-- | A link to an anchor.
--
-- Source: <https://core.telegram.org/bots/api#richtextanchorlink>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"anchor_link"@.
data RichTextAnchorLink = MkRichTextAnchorLink
  { -- | The link text
    --
    -- Wire key: @text@.
    text :: RichText
  , -- | The name of the anchor. If the name is empty, then the link brings back to the top of the message.
    --
    -- Wire key: @anchor_name@.
    anchor_name :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichTextAnchorLink' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichTextAnchorLink :: RichText -> Text -> RichTextAnchorLink
mkRichTextAnchorLink arg0 arg1 =
  MkRichTextAnchorLink
    { text = arg0
    , anchor_name = arg1
    }

instance FromJSON RichTextAnchorLink where
  parseJSON = withObject "RichTextAnchorLink" $ \obj ->
    do
      checkStringConstant obj "type" "anchor_link"
      field_1 <- requiredWith obj "text" parseJSON
      field_2 <- requiredWith obj "anchor_name" parseJSON
      pure
        MkRichTextAnchorLink
          { text = field_1
          , anchor_name = field_2
          }

instance ToJSON RichTextAnchorLink where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "anchor_link")
          , jsonField "text" x.text
          , jsonField "anchor_name" x.anchor_name
          ]
      )
  toEncoding = toEncoding . toJSON

-- | A text with a bank card number.
--
-- Source: <https://core.telegram.org/bots/api#richtextbankcardnumber>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"bank_card_number"@.
data RichTextBankCardNumber = MkRichTextBankCardNumber
  { -- | The text
    --
    -- Wire key: @text@.
    text :: RichText
  , -- | The bank card number
    --
    -- Wire key: @bank_card_number@.
    bank_card_number :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichTextBankCardNumber' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichTextBankCardNumber :: RichText -> Text -> RichTextBankCardNumber
mkRichTextBankCardNumber arg0 arg1 =
  MkRichTextBankCardNumber
    { text = arg0
    , bank_card_number = arg1
    }

instance FromJSON RichTextBankCardNumber where
  parseJSON = withObject "RichTextBankCardNumber" $ \obj ->
    do
      checkStringConstant obj "type" "bank_card_number"
      field_1 <- requiredWith obj "text" parseJSON
      field_2 <- requiredWith obj "bank_card_number" parseJSON
      pure
        MkRichTextBankCardNumber
          { text = field_1
          , bank_card_number = field_2
          }

instance ToJSON RichTextBankCardNumber where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "bank_card_number")
          , jsonField "text" x.text
          , jsonField "bank_card_number" x.bank_card_number
          ]
      )
  toEncoding = toEncoding . toJSON

-- | A bold text.
--
-- Source: <https://core.telegram.org/bots/api#richtextbold>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"bold"@.
data RichTextBold = MkRichTextBold
  { -- | The text
    --
    -- Wire key: @text@.
    text :: RichText
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichTextBold' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichTextBold :: RichText -> RichTextBold
mkRichTextBold arg0 =
  MkRichTextBold
    { text = arg0
    }

instance FromJSON RichTextBold where
  parseJSON = withObject "RichTextBold" $ \obj ->
    do
      checkStringConstant obj "type" "bold"
      field_1 <- requiredWith obj "text" parseJSON
      pure
        MkRichTextBold
          { text = field_1
          }

instance ToJSON RichTextBold where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "bold")
          , jsonField "text" x.text
          ]
      )
  toEncoding = toEncoding . toJSON

-- | A bot command.
--
-- Source: <https://core.telegram.org/bots/api#richtextbotcommand>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"bot_command"@.
data RichTextBotCommand = MkRichTextBotCommand
  { -- | The text
    --
    -- Wire key: @text@.
    text :: RichText
  , -- | The bot command
    --
    -- Wire key: @bot_command@.
    bot_command :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichTextBotCommand' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichTextBotCommand :: RichText -> Text -> RichTextBotCommand
mkRichTextBotCommand arg0 arg1 =
  MkRichTextBotCommand
    { text = arg0
    , bot_command = arg1
    }

instance FromJSON RichTextBotCommand where
  parseJSON = withObject "RichTextBotCommand" $ \obj ->
    do
      checkStringConstant obj "type" "bot_command"
      field_1 <- requiredWith obj "text" parseJSON
      field_2 <- requiredWith obj "bot_command" parseJSON
      pure
        MkRichTextBotCommand
          { text = field_1
          , bot_command = field_2
          }

instance ToJSON RichTextBotCommand where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "bot_command")
          , jsonField "text" x.text
          , jsonField "bot_command" x.bot_command
          ]
      )
  toEncoding = toEncoding . toJSON

-- | A button.
--
-- Source: <https://core.telegram.org/bots/api#richtextbutton>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"button"@.
data RichTextButton = MkRichTextButton
  { -- | The button
    --
    -- Wire key: @button@.
    button :: RichMessageButton
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichTextButton' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichTextButton :: RichMessageButton -> RichTextButton
mkRichTextButton arg0 =
  MkRichTextButton
    { button = arg0
    }

instance FromJSON RichTextButton where
  parseJSON = withObject "RichTextButton" $ \obj ->
    do
      checkStringConstant obj "type" "button"
      field_1 <- requiredWith obj "button" parseJSON
      pure
        MkRichTextButton
          { button = field_1
          }

instance ToJSON RichTextButton where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "button")
          , jsonField "button" x.button
          ]
      )
  toEncoding = toEncoding . toJSON

-- | A cashtag.
--
-- Source: <https://core.telegram.org/bots/api#richtextcashtag>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"cashtag"@.
data RichTextCashtag = MkRichTextCashtag
  { -- | The text
    --
    -- Wire key: @text@.
    text :: RichText
  , -- | The cashtag
    --
    -- Wire key: @cashtag@.
    cashtag :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichTextCashtag' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichTextCashtag :: RichText -> Text -> RichTextCashtag
mkRichTextCashtag arg0 arg1 =
  MkRichTextCashtag
    { text = arg0
    , cashtag = arg1
    }

instance FromJSON RichTextCashtag where
  parseJSON = withObject "RichTextCashtag" $ \obj ->
    do
      checkStringConstant obj "type" "cashtag"
      field_1 <- requiredWith obj "text" parseJSON
      field_2 <- requiredWith obj "cashtag" parseJSON
      pure
        MkRichTextCashtag
          { text = field_1
          , cashtag = field_2
          }

instance ToJSON RichTextCashtag where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "cashtag")
          , jsonField "text" x.text
          , jsonField "cashtag" x.cashtag
          ]
      )
  toEncoding = toEncoding . toJSON

-- | A monowidth text.
--
-- Source: <https://core.telegram.org/bots/api#richtextcode>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"code"@.
data RichTextCode = MkRichTextCode
  { -- | The text
    --
    -- Wire key: @text@.
    text :: RichText
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichTextCode' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichTextCode :: RichText -> RichTextCode
mkRichTextCode arg0 =
  MkRichTextCode
    { text = arg0
    }

instance FromJSON RichTextCode where
  parseJSON = withObject "RichTextCode" $ \obj ->
    do
      checkStringConstant obj "type" "code"
      field_1 <- requiredWith obj "text" parseJSON
      pure
        MkRichTextCode
          { text = field_1
          }

instance ToJSON RichTextCode where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "code")
          , jsonField "text" x.text
          ]
      )
  toEncoding = toEncoding . toJSON

-- | Formatted date and time.
--
-- Source: <https://core.telegram.org/bots/api#richtextdatetime>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"date_time"@.
data RichTextDateTime = MkRichTextDateTime
  { -- | The text
    --
    -- Wire key: @text@.
    text :: RichText
  , -- | The Unix time associated with the entity
    --
    -- Wire key: @unix_time@.
    unix_time :: Int64
  , -- | The string that defines the formatting of the date and time. See date-time entity formatting for more details.
    --
    -- Wire key: @date_time_format@.
    date_time_format :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichTextDateTime' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichTextDateTime :: RichText -> Int64 -> Text -> RichTextDateTime
mkRichTextDateTime arg0 arg1 arg2 =
  MkRichTextDateTime
    { text = arg0
    , unix_time = arg1
    , date_time_format = arg2
    }

instance FromJSON RichTextDateTime where
  parseJSON = withObject "RichTextDateTime" $ \obj ->
    do
      checkStringConstant obj "type" "date_time"
      field_1 <- requiredWith obj "text" parseJSON
      field_2 <- requiredWith obj "unix_time" parseInt64
      field_3 <- requiredWith obj "date_time_format" parseJSON
      pure
        MkRichTextDateTime
          { text = field_1
          , unix_time = field_2
          , date_time_format = field_3
          }

instance ToJSON RichTextDateTime where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "date_time")
          , jsonField "text" x.text
          , jsonField "unix_time" x.unix_time
          , jsonField "date_time_format" x.date_time_format
          ]
      )
  toEncoding = toEncoding . toJSON

-- | A text with an email address.
--
-- Source: <https://core.telegram.org/bots/api#richtextemailaddress>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"email_address"@.
data RichTextEmailAddress = MkRichTextEmailAddress
  { -- | The text
    --
    -- Wire key: @text@.
    text :: RichText
  , -- | The email address
    --
    -- Wire key: @email_address@.
    email_address :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichTextEmailAddress' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichTextEmailAddress :: RichText -> Text -> RichTextEmailAddress
mkRichTextEmailAddress arg0 arg1 =
  MkRichTextEmailAddress
    { text = arg0
    , email_address = arg1
    }

instance FromJSON RichTextEmailAddress where
  parseJSON = withObject "RichTextEmailAddress" $ \obj ->
    do
      checkStringConstant obj "type" "email_address"
      field_1 <- requiredWith obj "text" parseJSON
      field_2 <- requiredWith obj "email_address" parseJSON
      pure
        MkRichTextEmailAddress
          { text = field_1
          , email_address = field_2
          }

instance ToJSON RichTextEmailAddress where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "email_address")
          , jsonField "text" x.text
          , jsonField "email_address" x.email_address
          ]
      )
  toEncoding = toEncoding . toJSON

-- | A hashtag.
--
-- Source: <https://core.telegram.org/bots/api#richtexthashtag>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"hashtag"@.
data RichTextHashtag = MkRichTextHashtag
  { -- | The text
    --
    -- Wire key: @text@.
    text :: RichText
  , -- | The hashtag
    --
    -- Wire key: @hashtag@.
    hashtag :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichTextHashtag' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichTextHashtag :: RichText -> Text -> RichTextHashtag
mkRichTextHashtag arg0 arg1 =
  MkRichTextHashtag
    { text = arg0
    , hashtag = arg1
    }

instance FromJSON RichTextHashtag where
  parseJSON = withObject "RichTextHashtag" $ \obj ->
    do
      checkStringConstant obj "type" "hashtag"
      field_1 <- requiredWith obj "text" parseJSON
      field_2 <- requiredWith obj "hashtag" parseJSON
      pure
        MkRichTextHashtag
          { text = field_1
          , hashtag = field_2
          }

instance ToJSON RichTextHashtag where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "hashtag")
          , jsonField "text" x.text
          , jsonField "hashtag" x.hashtag
          ]
      )
  toEncoding = toEncoding . toJSON

-- | An italicized text.
--
-- Source: <https://core.telegram.org/bots/api#richtextitalic>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"italic"@.
data RichTextItalic = MkRichTextItalic
  { -- | The text
    --
    -- Wire key: @text@.
    text :: RichText
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichTextItalic' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichTextItalic :: RichText -> RichTextItalic
mkRichTextItalic arg0 =
  MkRichTextItalic
    { text = arg0
    }

instance FromJSON RichTextItalic where
  parseJSON = withObject "RichTextItalic" $ \obj ->
    do
      checkStringConstant obj "type" "italic"
      field_1 <- requiredWith obj "text" parseJSON
      pure
        MkRichTextItalic
          { text = field_1
          }

instance ToJSON RichTextItalic where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "italic")
          , jsonField "text" x.text
          ]
      )
  toEncoding = toEncoding . toJSON

-- | A marked text.
--
-- Source: <https://core.telegram.org/bots/api#richtextmarked>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"marked"@.
data RichTextMarked = MkRichTextMarked
  { -- | The text
    --
    -- Wire key: @text@.
    text :: RichText
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichTextMarked' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichTextMarked :: RichText -> RichTextMarked
mkRichTextMarked arg0 =
  MkRichTextMarked
    { text = arg0
    }

instance FromJSON RichTextMarked where
  parseJSON = withObject "RichTextMarked" $ \obj ->
    do
      checkStringConstant obj "type" "marked"
      field_1 <- requiredWith obj "text" parseJSON
      pure
        MkRichTextMarked
          { text = field_1
          }

instance ToJSON RichTextMarked where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "marked")
          , jsonField "text" x.text
          ]
      )
  toEncoding = toEncoding . toJSON

-- | A mention by a username.
--
-- Source: <https://core.telegram.org/bots/api#richtextmention>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"mention"@.
data RichTextMention = MkRichTextMention
  { -- | The text
    --
    -- Wire key: @text@.
    text :: RichText
  , -- | The username
    --
    -- Wire key: @username@.
    username :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichTextMention' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichTextMention :: RichText -> Text -> RichTextMention
mkRichTextMention arg0 arg1 =
  MkRichTextMention
    { text = arg0
    , username = arg1
    }

instance FromJSON RichTextMention where
  parseJSON = withObject "RichTextMention" $ \obj ->
    do
      checkStringConstant obj "type" "mention"
      field_1 <- requiredWith obj "text" parseJSON
      field_2 <- requiredWith obj "username" parseJSON
      pure
        MkRichTextMention
          { text = field_1
          , username = field_2
          }

instance ToJSON RichTextMention where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "mention")
          , jsonField "text" x.text
          , jsonField "username" x.username
          ]
      )
  toEncoding = toEncoding . toJSON

-- | A text with a phone number.
--
-- Source: <https://core.telegram.org/bots/api#richtextphonenumber>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"phone_number"@.
data RichTextPhoneNumber = MkRichTextPhoneNumber
  { -- | The text
    --
    -- Wire key: @text@.
    text :: RichText
  , -- | The phone number
    --
    -- Wire key: @phone_number@.
    phone_number :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichTextPhoneNumber' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichTextPhoneNumber :: RichText -> Text -> RichTextPhoneNumber
mkRichTextPhoneNumber arg0 arg1 =
  MkRichTextPhoneNumber
    { text = arg0
    , phone_number = arg1
    }

instance FromJSON RichTextPhoneNumber where
  parseJSON = withObject "RichTextPhoneNumber" $ \obj ->
    do
      checkStringConstant obj "type" "phone_number"
      field_1 <- requiredWith obj "text" parseJSON
      field_2 <- requiredWith obj "phone_number" parseJSON
      pure
        MkRichTextPhoneNumber
          { text = field_1
          , phone_number = field_2
          }

instance ToJSON RichTextPhoneNumber where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "phone_number")
          , jsonField "text" x.text
          , jsonField "phone_number" x.phone_number
          ]
      )
  toEncoding = toEncoding . toJSON

-- | A reference.
--
-- Source: <https://core.telegram.org/bots/api#richtextreference>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"reference"@.
data RichTextReference = MkRichTextReference
  { -- | Text of the reference
    --
    -- Wire key: @text@.
    text :: RichText
  , -- | The name of the reference
    --
    -- Wire key: @name@.
    name :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichTextReference' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichTextReference :: RichText -> Text -> RichTextReference
mkRichTextReference arg0 arg1 =
  MkRichTextReference
    { text = arg0
    , name = arg1
    }

instance FromJSON RichTextReference where
  parseJSON = withObject "RichTextReference" $ \obj ->
    do
      checkStringConstant obj "type" "reference"
      field_1 <- requiredWith obj "text" parseJSON
      field_2 <- requiredWith obj "name" parseJSON
      pure
        MkRichTextReference
          { text = field_1
          , name = field_2
          }

instance ToJSON RichTextReference where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "reference")
          , jsonField "text" x.text
          , jsonField "name" x.name
          ]
      )
  toEncoding = toEncoding . toJSON

-- | A link to a reference.
--
-- Source: <https://core.telegram.org/bots/api#richtextreferencelink>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"reference_link"@.
data RichTextReferenceLink = MkRichTextReferenceLink
  { -- | The link text
    --
    -- Wire key: @text@.
    text :: RichText
  , -- | The name of the reference
    --
    -- Wire key: @reference_name@.
    reference_name :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichTextReferenceLink' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichTextReferenceLink :: RichText -> Text -> RichTextReferenceLink
mkRichTextReferenceLink arg0 arg1 =
  MkRichTextReferenceLink
    { text = arg0
    , reference_name = arg1
    }

instance FromJSON RichTextReferenceLink where
  parseJSON = withObject "RichTextReferenceLink" $ \obj ->
    do
      checkStringConstant obj "type" "reference_link"
      field_1 <- requiredWith obj "text" parseJSON
      field_2 <- requiredWith obj "reference_name" parseJSON
      pure
        MkRichTextReferenceLink
          { text = field_1
          , reference_name = field_2
          }

instance ToJSON RichTextReferenceLink where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "reference_link")
          , jsonField "text" x.text
          , jsonField "reference_name" x.reference_name
          ]
      )
  toEncoding = toEncoding . toJSON

-- | A text covered by a spoiler.
--
-- Source: <https://core.telegram.org/bots/api#richtextspoiler>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"spoiler"@.
data RichTextSpoiler = MkRichTextSpoiler
  { -- | The text
    --
    -- Wire key: @text@.
    text :: RichText
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichTextSpoiler' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichTextSpoiler :: RichText -> RichTextSpoiler
mkRichTextSpoiler arg0 =
  MkRichTextSpoiler
    { text = arg0
    }

instance FromJSON RichTextSpoiler where
  parseJSON = withObject "RichTextSpoiler" $ \obj ->
    do
      checkStringConstant obj "type" "spoiler"
      field_1 <- requiredWith obj "text" parseJSON
      pure
        MkRichTextSpoiler
          { text = field_1
          }

instance ToJSON RichTextSpoiler where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "spoiler")
          , jsonField "text" x.text
          ]
      )
  toEncoding = toEncoding . toJSON

-- | A strikethrough text.
--
-- Source: <https://core.telegram.org/bots/api#richtextstrikethrough>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"strikethrough"@.
data RichTextStrikethrough = MkRichTextStrikethrough
  { -- | The text
    --
    -- Wire key: @text@.
    text :: RichText
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichTextStrikethrough' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichTextStrikethrough :: RichText -> RichTextStrikethrough
mkRichTextStrikethrough arg0 =
  MkRichTextStrikethrough
    { text = arg0
    }

instance FromJSON RichTextStrikethrough where
  parseJSON = withObject "RichTextStrikethrough" $ \obj ->
    do
      checkStringConstant obj "type" "strikethrough"
      field_1 <- requiredWith obj "text" parseJSON
      pure
        MkRichTextStrikethrough
          { text = field_1
          }

instance ToJSON RichTextStrikethrough where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "strikethrough")
          , jsonField "text" x.text
          ]
      )
  toEncoding = toEncoding . toJSON

-- | A subscript text.
--
-- Source: <https://core.telegram.org/bots/api#richtextsubscript>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"subscript"@.
data RichTextSubscript = MkRichTextSubscript
  { -- | The text
    --
    -- Wire key: @text@.
    text :: RichText
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichTextSubscript' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichTextSubscript :: RichText -> RichTextSubscript
mkRichTextSubscript arg0 =
  MkRichTextSubscript
    { text = arg0
    }

instance FromJSON RichTextSubscript where
  parseJSON = withObject "RichTextSubscript" $ \obj ->
    do
      checkStringConstant obj "type" "subscript"
      field_1 <- requiredWith obj "text" parseJSON
      pure
        MkRichTextSubscript
          { text = field_1
          }

instance ToJSON RichTextSubscript where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "subscript")
          , jsonField "text" x.text
          ]
      )
  toEncoding = toEncoding . toJSON

-- | A superscript text.
--
-- Source: <https://core.telegram.org/bots/api#richtextsuperscript>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"superscript"@.
data RichTextSuperscript = MkRichTextSuperscript
  { -- | The text
    --
    -- Wire key: @text@.
    text :: RichText
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichTextSuperscript' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichTextSuperscript :: RichText -> RichTextSuperscript
mkRichTextSuperscript arg0 =
  MkRichTextSuperscript
    { text = arg0
    }

instance FromJSON RichTextSuperscript where
  parseJSON = withObject "RichTextSuperscript" $ \obj ->
    do
      checkStringConstant obj "type" "superscript"
      field_1 <- requiredWith obj "text" parseJSON
      pure
        MkRichTextSuperscript
          { text = field_1
          }

instance ToJSON RichTextSuperscript where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "superscript")
          , jsonField "text" x.text
          ]
      )
  toEncoding = toEncoding . toJSON

-- | A mention of a Telegram user by their identifier.
--
-- Source: <https://core.telegram.org/bots/api#richtexttextmention>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"text_mention"@.
data RichTextTextMention = MkRichTextTextMention
  { -- | The text
    --
    -- Wire key: @text@.
    text :: RichText
  , -- | The mentioned user
    --
    -- Wire key: @user@.
    user :: User
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichTextTextMention' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichTextTextMention :: RichText -> User -> RichTextTextMention
mkRichTextTextMention arg0 arg1 =
  MkRichTextTextMention
    { text = arg0
    , user = arg1
    }

instance FromJSON RichTextTextMention where
  parseJSON = withObject "RichTextTextMention" $ \obj ->
    do
      checkStringConstant obj "type" "text_mention"
      field_1 <- requiredWith obj "text" parseJSON
      field_2 <- requiredWith obj "user" parseJSON
      pure
        MkRichTextTextMention
          { text = field_1
          , user = field_2
          }

instance ToJSON RichTextTextMention where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "text_mention")
          , jsonField "text" x.text
          , jsonField "user" x.user
          ]
      )
  toEncoding = toEncoding . toJSON

-- | An underlined text.
--
-- Source: <https://core.telegram.org/bots/api#richtextunderline>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"underline"@.
data RichTextUnderline = MkRichTextUnderline
  { -- | The text
    --
    -- Wire key: @text@.
    text :: RichText
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichTextUnderline' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichTextUnderline :: RichText -> RichTextUnderline
mkRichTextUnderline arg0 =
  MkRichTextUnderline
    { text = arg0
    }

instance FromJSON RichTextUnderline where
  parseJSON = withObject "RichTextUnderline" $ \obj ->
    do
      checkStringConstant obj "type" "underline"
      field_1 <- requiredWith obj "text" parseJSON
      pure
        MkRichTextUnderline
          { text = field_1
          }

instance ToJSON RichTextUnderline where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "underline")
          , jsonField "text" x.text
          ]
      )
  toEncoding = toEncoding . toJSON

-- | A text with a link.
--
-- Source: <https://core.telegram.org/bots/api#richtexturl>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"url"@.
data RichTextUrl = MkRichTextUrl
  { -- | The text
    --
    -- Wire key: @text@.
    text :: RichText
  , -- | URL of the link
    --
    -- Wire key: @url@.
    url :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichTextUrl' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichTextUrl :: RichText -> Text -> RichTextUrl
mkRichTextUrl arg0 arg1 =
  MkRichTextUrl
    { text = arg0
    , url = arg1
    }

instance FromJSON RichTextUrl where
  parseJSON = withObject "RichTextUrl" $ \obj ->
    do
      checkStringConstant obj "type" "url"
      field_1 <- requiredWith obj "text" parseJSON
      field_2 <- requiredWith obj "url" parseJSON
      pure
        MkRichTextUrl
          { text = field_1
          , url = field_2
          }

instance ToJSON RichTextUrl where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "url")
          , jsonField "text" x.text
          , jsonField "url" x.url
          ]
      )
  toEncoding = toEncoding . toJSON
