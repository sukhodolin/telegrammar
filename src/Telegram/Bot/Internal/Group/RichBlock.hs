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
module Telegram.Bot.Internal.Group.RichBlock
  ( RichBlock (..)
  , RichBlockBlockQuotation (..)
  , RichBlockCollage (..)
  , RichBlockDetails (..)
  , RichBlockList (..)
  , RichBlockListItem (..)
  , RichBlockSlideshow (..)
  , mkRichBlockBlockQuotation
  , mkRichBlockCollage
  , mkRichBlockDetails
  , mkRichBlockList
  , mkRichBlockListItem
  , mkRichBlockSlideshow
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.RichBlockAnchor (RichBlockAnchor)
import Telegram.Bot.Internal.Group.RichBlockAnimation (RichBlockAnimation)
import Telegram.Bot.Internal.Group.RichBlockAudio (RichBlockAudio)
import Telegram.Bot.Internal.Group.RichBlockButtons (RichBlockButtons)
import Telegram.Bot.Internal.Group.RichBlockCaption (RichBlockCaption)
import Telegram.Bot.Internal.Group.RichBlockDivider (RichBlockDivider)
import Telegram.Bot.Internal.Group.RichBlockDocument (RichBlockDocument)
import Telegram.Bot.Internal.Group.RichBlockExpandableBlockQuotation (RichBlockExpandableBlockQuotation)
import Telegram.Bot.Internal.Group.RichBlockFooter (RichBlockFooter)
import Telegram.Bot.Internal.Group.RichBlockMap (RichBlockMap)
import Telegram.Bot.Internal.Group.RichBlockMathematicalExpression (RichBlockMathematicalExpression)
import Telegram.Bot.Internal.Group.RichBlockParagraph (RichBlockParagraph)
import Telegram.Bot.Internal.Group.RichBlockPhoto (RichBlockPhoto)
import Telegram.Bot.Internal.Group.RichBlockPreformatted (RichBlockPreformatted)
import Telegram.Bot.Internal.Group.RichBlockPullQuotation (RichBlockPullQuotation)
import Telegram.Bot.Internal.Group.RichBlockSectionHeading (RichBlockSectionHeading)
import Telegram.Bot.Internal.Group.RichBlockTable (RichBlockTable)
import Telegram.Bot.Internal.Group.RichBlockThinking (RichBlockThinking)
import Telegram.Bot.Internal.Group.RichBlockVideo (RichBlockVideo)
import Telegram.Bot.Internal.Group.RichBlockVoiceNote (RichBlockVoiceNote)
import Telegram.Bot.Internal.Group.RichMessageButton (RichText)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonFlag, jsonLiteral, jsonObject, jsonOptional, optionalTrueFlag, optionalWith, parseInt64, parseList, requiredWith, tagField)

-- | This object represents a block in a rich formatted message. Currently, it can be any of the following types:
-- \- RichBlockParagraph
-- \- RichBlockSectionHeading
-- \- RichBlockPreformatted
-- \- RichBlockFooter
-- \- RichBlockDivider
-- \- RichBlockMathematicalExpression
-- \- RichBlockAnchor
-- \- RichBlockList
-- \- RichBlockBlockQuotation
-- \- RichBlockExpandableBlockQuotation
-- \- RichBlockPullQuotation
-- \- RichBlockCollage
-- \- RichBlockSlideshow
-- \- RichBlockTable
-- \- RichBlockDetails
-- \- RichBlockMap
-- \- RichBlockButtons
-- \- RichBlockAnimation
-- \- RichBlockAudio
-- \- RichBlockDocument
-- \- RichBlockPhoto
-- \- RichBlockVideo
-- \- RichBlockVoiceNote
-- \- RichBlockThinking
--
-- Source: <https://core.telegram.org/bots/api#richblock>.
-- Codec directions: decoded from responses, encoded into requests.
data RichBlock
  = RichBlockViaRichBlockAnchor RichBlockAnchor
  | RichBlockViaRichBlockAnimation RichBlockAnimation
  | RichBlockViaRichBlockAudio RichBlockAudio
  | RichBlockViaRichBlockBlockQuotation RichBlockBlockQuotation
  | RichBlockViaRichBlockButtons RichBlockButtons
  | RichBlockViaRichBlockCollage RichBlockCollage
  | RichBlockViaRichBlockDetails RichBlockDetails
  | RichBlockViaRichBlockDivider RichBlockDivider
  | RichBlockViaRichBlockDocument RichBlockDocument
  | RichBlockViaRichBlockExpandableBlockQuotation RichBlockExpandableBlockQuotation
  | RichBlockViaRichBlockFooter RichBlockFooter
  | RichBlockViaRichBlockList RichBlockList
  | RichBlockViaRichBlockMap RichBlockMap
  | RichBlockViaRichBlockMathematicalExpression RichBlockMathematicalExpression
  | RichBlockViaRichBlockParagraph RichBlockParagraph
  | RichBlockViaRichBlockPhoto RichBlockPhoto
  | RichBlockViaRichBlockPreformatted RichBlockPreformatted
  | RichBlockViaRichBlockPullQuotation RichBlockPullQuotation
  | RichBlockViaRichBlockSectionHeading RichBlockSectionHeading
  | RichBlockViaRichBlockSlideshow RichBlockSlideshow
  | RichBlockViaRichBlockTable RichBlockTable
  | RichBlockViaRichBlockThinking RichBlockThinking
  | RichBlockViaRichBlockVideo RichBlockVideo
  | RichBlockViaRichBlockVoiceNote RichBlockVoiceNote
  | -- | A value this decoder does not recognize, preserved verbatim so
    -- the raw payload survives the boundary.
    RichBlockUnknown Value
  deriving stock (Eq, Show)

instance FromJSON RichBlock where
  parseJSON = withObject "RichBlock" $ \obj -> do
    tag_ <- tagField obj "type"
    case tag_ of
      "anchor" ->
        RichBlockViaRichBlockAnchor <$> parseJSON (Object obj)
      "animation" ->
        RichBlockViaRichBlockAnimation <$> parseJSON (Object obj)
      "audio" ->
        RichBlockViaRichBlockAudio <$> parseJSON (Object obj)
      "blockquote" ->
        RichBlockViaRichBlockBlockQuotation <$> parseJSON (Object obj)
      "buttons" ->
        RichBlockViaRichBlockButtons <$> parseJSON (Object obj)
      "collage" ->
        RichBlockViaRichBlockCollage <$> parseJSON (Object obj)
      "details" ->
        RichBlockViaRichBlockDetails <$> parseJSON (Object obj)
      "divider" ->
        RichBlockViaRichBlockDivider <$> parseJSON (Object obj)
      "document" ->
        RichBlockViaRichBlockDocument <$> parseJSON (Object obj)
      "expandable_blockquote" ->
        RichBlockViaRichBlockExpandableBlockQuotation <$> parseJSON (Object obj)
      "footer" ->
        RichBlockViaRichBlockFooter <$> parseJSON (Object obj)
      "list" ->
        RichBlockViaRichBlockList <$> parseJSON (Object obj)
      "map" ->
        RichBlockViaRichBlockMap <$> parseJSON (Object obj)
      "mathematical_expression" ->
        RichBlockViaRichBlockMathematicalExpression <$> parseJSON (Object obj)
      "paragraph" ->
        RichBlockViaRichBlockParagraph <$> parseJSON (Object obj)
      "photo" ->
        RichBlockViaRichBlockPhoto <$> parseJSON (Object obj)
      "pre" ->
        RichBlockViaRichBlockPreformatted <$> parseJSON (Object obj)
      "pullquote" ->
        RichBlockViaRichBlockPullQuotation <$> parseJSON (Object obj)
      "heading" ->
        RichBlockViaRichBlockSectionHeading <$> parseJSON (Object obj)
      "slideshow" ->
        RichBlockViaRichBlockSlideshow <$> parseJSON (Object obj)
      "table" ->
        RichBlockViaRichBlockTable <$> parseJSON (Object obj)
      "thinking" ->
        RichBlockViaRichBlockThinking <$> parseJSON (Object obj)
      "video" ->
        RichBlockViaRichBlockVideo <$> parseJSON (Object obj)
      "voice_note" ->
        RichBlockViaRichBlockVoiceNote <$> parseJSON (Object obj)
      _ -> pure (RichBlockUnknown (Object obj))

instance ToJSON RichBlock where
  toJSON = \case
    RichBlockViaRichBlockAnchor member_ -> toJSON member_
    RichBlockViaRichBlockAnimation member_ -> toJSON member_
    RichBlockViaRichBlockAudio member_ -> toJSON member_
    RichBlockViaRichBlockBlockQuotation member_ -> toJSON member_
    RichBlockViaRichBlockButtons member_ -> toJSON member_
    RichBlockViaRichBlockCollage member_ -> toJSON member_
    RichBlockViaRichBlockDetails member_ -> toJSON member_
    RichBlockViaRichBlockDivider member_ -> toJSON member_
    RichBlockViaRichBlockDocument member_ -> toJSON member_
    RichBlockViaRichBlockExpandableBlockQuotation member_ -> toJSON member_
    RichBlockViaRichBlockFooter member_ -> toJSON member_
    RichBlockViaRichBlockList member_ -> toJSON member_
    RichBlockViaRichBlockMap member_ -> toJSON member_
    RichBlockViaRichBlockMathematicalExpression member_ -> toJSON member_
    RichBlockViaRichBlockParagraph member_ -> toJSON member_
    RichBlockViaRichBlockPhoto member_ -> toJSON member_
    RichBlockViaRichBlockPreformatted member_ -> toJSON member_
    RichBlockViaRichBlockPullQuotation member_ -> toJSON member_
    RichBlockViaRichBlockSectionHeading member_ -> toJSON member_
    RichBlockViaRichBlockSlideshow member_ -> toJSON member_
    RichBlockViaRichBlockTable member_ -> toJSON member_
    RichBlockViaRichBlockThinking member_ -> toJSON member_
    RichBlockViaRichBlockVideo member_ -> toJSON member_
    RichBlockViaRichBlockVoiceNote member_ -> toJSON member_
    RichBlockUnknown raw_ -> raw_
  toEncoding = toEncoding . toJSON

-- | A block quotation, corresponding to the HTML tag \<blockquote\>.
--
-- Source: <https://core.telegram.org/bots/api#richblockblockquotation>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"blockquote"@.
data RichBlockBlockQuotation = MkRichBlockBlockQuotation
  { -- | Content of the block
    --
    -- Wire key: @blocks@.
    blocks :: [RichBlock]
  , -- | Optional. Credit of the block
    --
    -- Wire key: @credit@.
    -- Omitted from an encoded request when it is @Nothing@.
    credit :: Maybe RichText
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichBlockBlockQuotation' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichBlockBlockQuotation :: [RichBlock] -> RichBlockBlockQuotation
mkRichBlockBlockQuotation arg0 =
  MkRichBlockBlockQuotation
    { blocks = arg0
    , credit = Nothing
    }

instance FromJSON RichBlockBlockQuotation where
  parseJSON = withObject "RichBlockBlockQuotation" $ \obj ->
    do
      checkStringConstant obj "type" "blockquote"
      field_1 <- requiredWith obj "blocks" (parseList parseJSON)
      field_2 <- optionalWith obj "credit" parseJSON
      pure
        MkRichBlockBlockQuotation
          { blocks = field_1
          , credit = field_2
          }

instance ToJSON RichBlockBlockQuotation where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "blockquote")
          , jsonField "blocks" x.blocks
          , jsonOptional "credit" x.credit
          ]
      )
  toEncoding = toEncoding . toJSON

-- | A collage, corresponding to the custom HTML tag \<tg-collage\>.
--
-- Source: <https://core.telegram.org/bots/api#richblockcollage>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"collage"@.
data RichBlockCollage = MkRichBlockCollage
  { -- | Elements of the collage
    --
    -- Wire key: @blocks@.
    blocks :: [RichBlock]
  , -- | Optional. Caption of the block
    --
    -- Wire key: @caption@.
    -- Omitted from an encoded request when it is @Nothing@.
    caption :: Maybe RichBlockCaption
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichBlockCollage' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichBlockCollage :: [RichBlock] -> RichBlockCollage
mkRichBlockCollage arg0 =
  MkRichBlockCollage
    { blocks = arg0
    , caption = Nothing
    }

instance FromJSON RichBlockCollage where
  parseJSON = withObject "RichBlockCollage" $ \obj ->
    do
      checkStringConstant obj "type" "collage"
      field_1 <- requiredWith obj "blocks" (parseList parseJSON)
      field_2 <- optionalWith obj "caption" parseJSON
      pure
        MkRichBlockCollage
          { blocks = field_1
          , caption = field_2
          }

instance ToJSON RichBlockCollage where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "collage")
          , jsonField "blocks" x.blocks
          , jsonOptional "caption" x.caption
          ]
      )
  toEncoding = toEncoding . toJSON

-- | An expandable block for details disclosure, corresponding to the HTML tag \<details\>.
--
-- Source: <https://core.telegram.org/bots/api#richblockdetails>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"details"@.
data RichBlockDetails = MkRichBlockDetails
  { -- | Always shown summary of the block
    --
    -- Wire key: @summary@.
    summary :: RichText
  , -- | Content of the block
    --
    -- Wire key: @blocks@.
    blocks :: [RichBlock]
  , -- | Optional. True, if the content of the block is visible by default
    --
    -- Wire key: @is_open@.
    -- Omitted from an encoded request when it is @False@.
    is_open :: Bool
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichBlockDetails' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichBlockDetails :: RichText -> [RichBlock] -> RichBlockDetails
mkRichBlockDetails arg0 arg1 =
  MkRichBlockDetails
    { summary = arg0
    , blocks = arg1
    , is_open = False
    }

instance FromJSON RichBlockDetails where
  parseJSON = withObject "RichBlockDetails" $ \obj ->
    do
      checkStringConstant obj "type" "details"
      field_1 <- requiredWith obj "summary" parseJSON
      field_2 <- requiredWith obj "blocks" (parseList parseJSON)
      field_3 <- optionalTrueFlag obj "is_open"
      pure
        MkRichBlockDetails
          { summary = field_1
          , blocks = field_2
          , is_open = field_3
          }

instance ToJSON RichBlockDetails where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "details")
          , jsonField "summary" x.summary
          , jsonField "blocks" x.blocks
          , jsonFlag "is_open" x.is_open
          ]
      )
  toEncoding = toEncoding . toJSON

-- | A list of blocks, corresponding to the HTML tag \<ul\> or \<ol\> with multiple nested tags \<li\>.
--
-- Source: <https://core.telegram.org/bots/api#richblocklist>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"list"@.
data RichBlockList = MkRichBlockList
  { -- | Items of the list
    --
    -- Wire key: @items@.
    items :: [RichBlockListItem]
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichBlockList' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichBlockList :: [RichBlockListItem] -> RichBlockList
mkRichBlockList arg0 =
  MkRichBlockList
    { items = arg0
    }

instance FromJSON RichBlockList where
  parseJSON = withObject "RichBlockList" $ \obj ->
    do
      checkStringConstant obj "type" "list"
      field_1 <- requiredWith obj "items" (parseList parseJSON)
      pure
        MkRichBlockList
          { items = field_1
          }

instance ToJSON RichBlockList where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "list")
          , jsonField "items" x.items
          ]
      )
  toEncoding = toEncoding . toJSON

-- | An item of a list.
--
-- Source: <https://core.telegram.org/bots/api#richblocklistitem>.
-- Codec directions: decoded from responses, encoded into requests.
data RichBlockListItem = MkRichBlockListItem
  { -- | Label of the item
    --
    -- Wire key: @label@.
    label :: Text
  , -- | The content of the item
    --
    -- Wire key: @blocks@.
    blocks :: [RichBlock]
  , -- | Optional. True, if the item has a checkbox
    --
    -- Wire key: @has_checkbox@.
    -- Omitted from an encoded request when it is @False@.
    has_checkbox :: Bool
  , -- | Optional. True, if the item has a checked checkbox
    --
    -- Wire key: @is_checked@.
    -- Omitted from an encoded request when it is @False@.
    is_checked :: Bool
  , -- | Optional. For ordered lists, the numeric value of the item label
    --
    -- Wire key: @value@.
    -- Omitted from an encoded request when it is @Nothing@.
    value :: Maybe Int64
  , -- | Optional. For ordered lists, the type of the item label; must be one of \"a\" for lowercase letters, \"A\" for uppercase letters, \"i\" for lowercase Roman numerals, \"I\" for uppercase Roman numerals, or \"1\" for decimal numbers
    --
    -- Wire key: @type@.
    -- Omitted from an encoded request when it is @Nothing@.
    type_ :: Maybe Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichBlockListItem' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichBlockListItem :: Text -> [RichBlock] -> RichBlockListItem
mkRichBlockListItem arg0 arg1 =
  MkRichBlockListItem
    { label = arg0
    , blocks = arg1
    , has_checkbox = False
    , is_checked = False
    , value = Nothing
    , type_ = Nothing
    }

instance FromJSON RichBlockListItem where
  parseJSON = withObject "RichBlockListItem" $ \obj ->
    do
      field_0 <- requiredWith obj "label" parseJSON
      field_1 <- requiredWith obj "blocks" (parseList parseJSON)
      field_2 <- optionalTrueFlag obj "has_checkbox"
      field_3 <- optionalTrueFlag obj "is_checked"
      field_4 <- optionalWith obj "value" parseInt64
      field_5 <- optionalWith obj "type" parseJSON
      pure
        MkRichBlockListItem
          { label = field_0
          , blocks = field_1
          , has_checkbox = field_2
          , is_checked = field_3
          , value = field_4
          , type_ = field_5
          }

instance ToJSON RichBlockListItem where
  toJSON x =
    jsonObject
      ( concat
          [ jsonField "label" x.label
          , jsonField "blocks" x.blocks
          , jsonFlag "has_checkbox" x.has_checkbox
          , jsonFlag "is_checked" x.is_checked
          , jsonOptional "value" x.value
          , jsonOptional "type" x.type_
          ]
      )
  toEncoding = toEncoding . toJSON

-- | A slideshow, corresponding to the custom HTML tag \<tg-slideshow\>.
--
-- Source: <https://core.telegram.org/bots/api#richblockslideshow>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"slideshow"@.
data RichBlockSlideshow = MkRichBlockSlideshow
  { -- | Elements of the slideshow
    --
    -- Wire key: @blocks@.
    blocks :: [RichBlock]
  , -- | Optional. Caption of the block
    --
    -- Wire key: @caption@.
    -- Omitted from an encoded request when it is @Nothing@.
    caption :: Maybe RichBlockCaption
  }
  deriving stock (Eq, Show)

-- | Initialize a 'RichBlockSlideshow' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkRichBlockSlideshow :: [RichBlock] -> RichBlockSlideshow
mkRichBlockSlideshow arg0 =
  MkRichBlockSlideshow
    { blocks = arg0
    , caption = Nothing
    }

instance FromJSON RichBlockSlideshow where
  parseJSON = withObject "RichBlockSlideshow" $ \obj ->
    do
      checkStringConstant obj "type" "slideshow"
      field_1 <- requiredWith obj "blocks" (parseList parseJSON)
      field_2 <- optionalWith obj "caption" parseJSON
      pure
        MkRichBlockSlideshow
          { blocks = field_1
          , caption = field_2
          }

instance ToJSON RichBlockSlideshow where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "slideshow")
          , jsonField "blocks" x.blocks
          , jsonOptional "caption" x.caption
          ]
      )
  toEncoding = toEncoding . toJSON
