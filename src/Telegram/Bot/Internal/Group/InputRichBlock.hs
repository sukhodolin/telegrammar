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
module Telegram.Bot.Internal.Group.InputRichBlock
  ( InputRichBlock (..)
  , InputRichBlockBlockQuotation (..)
  , InputRichBlockCollage (..)
  , InputRichBlockDetails (..)
  , InputRichBlockList (..)
  , InputRichBlockListItem (..)
  , InputRichBlockSlideshow (..)
  , mkInputRichBlockBlockQuotation
  , mkInputRichBlockCollage
  , mkInputRichBlockDetails
  , mkInputRichBlockList
  , mkInputRichBlockListItem
  , mkInputRichBlockSlideshow
  , planInputRichBlock
  , planInputRichBlockBlockQuotation
  , planInputRichBlockCollage
  , planInputRichBlockDetails
  , planInputRichBlockList
  , planInputRichBlockListItem
  , planInputRichBlockSlideshow
  ) where

import Data.Aeson (Value (..))
import Data.Int (Int64)
import Data.Text (Text)
import Telegram.Bot.Internal.Group.InputRichBlockAnchor (InputRichBlockAnchor)
import Telegram.Bot.Internal.Group.InputRichBlockAnimation (InputRichBlockAnimation, planInputRichBlockAnimation)
import Telegram.Bot.Internal.Group.InputRichBlockAudio (InputRichBlockAudio, planInputRichBlockAudio)
import Telegram.Bot.Internal.Group.InputRichBlockButtons (InputRichBlockButtons, planInputRichBlockButtons)
import Telegram.Bot.Internal.Group.InputRichBlockDivider (InputRichBlockDivider)
import Telegram.Bot.Internal.Group.InputRichBlockDocument (InputRichBlockDocument, planInputRichBlockDocument)
import Telegram.Bot.Internal.Group.InputRichBlockExpandableBlockQuotation (InputRichBlockExpandableBlockQuotation)
import Telegram.Bot.Internal.Group.InputRichBlockFooter (InputRichBlockFooter)
import Telegram.Bot.Internal.Group.InputRichBlockMap (InputRichBlockMap)
import Telegram.Bot.Internal.Group.InputRichBlockMathematicalExpression (InputRichBlockMathematicalExpression)
import Telegram.Bot.Internal.Group.InputRichBlockParagraph (InputRichBlockParagraph)
import Telegram.Bot.Internal.Group.InputRichBlockPhoto (InputRichBlockPhoto, planInputRichBlockPhoto)
import Telegram.Bot.Internal.Group.InputRichBlockPreformatted (InputRichBlockPreformatted)
import Telegram.Bot.Internal.Group.InputRichBlockPullQuotation (InputRichBlockPullQuotation)
import Telegram.Bot.Internal.Group.InputRichBlockSectionHeading (InputRichBlockSectionHeading)
import Telegram.Bot.Internal.Group.InputRichBlockTable (InputRichBlockTable)
import Telegram.Bot.Internal.Group.InputRichBlockThinking (InputRichBlockThinking)
import Telegram.Bot.Internal.Group.InputRichBlockVideo (InputRichBlockVideo, planInputRichBlockVideo)
import Telegram.Bot.Internal.Group.InputRichBlockVoiceNote (InputRichBlockVoiceNote, planInputRichBlockVoiceNote)
import Telegram.Bot.Internal.Group.RichBlockCaption (RichBlockCaption)
import Telegram.Bot.Internal.Group.RichMessageButton (RichText)
import Telegram.Bot.Support (FieldPlanner, encodeJson, plainValue, planList, planMember, planRecord, planned, plannedFlag, plannedLiteral, plannedMaybe)

-- | This object represents a block in a rich formatted message to be sent. Currently, it can be any of the following types:
-- \- InputRichBlockParagraph
-- \- InputRichBlockSectionHeading
-- \- InputRichBlockPreformatted
-- \- InputRichBlockFooter
-- \- InputRichBlockDivider
-- \- InputRichBlockMathematicalExpression
-- \- InputRichBlockAnchor
-- \- InputRichBlockList
-- \- InputRichBlockBlockQuotation
-- \- InputRichBlockExpandableBlockQuotation
-- \- InputRichBlockPullQuotation
-- \- InputRichBlockCollage
-- \- InputRichBlockSlideshow
-- \- InputRichBlockTable
-- \- InputRichBlockDetails
-- \- InputRichBlockMap
-- \- InputRichBlockButtons
-- \- InputRichBlockAnimation
-- \- InputRichBlockAudio
-- \- InputRichBlockDocument
-- \- InputRichBlockPhoto
-- \- InputRichBlockVideo
-- \- InputRichBlockVoiceNote
-- \- InputRichBlockThinking
--
-- Source: <https://core.telegram.org/bots/api#inputrichblock>.
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
data InputRichBlock
  = InputRichBlockViaInputRichBlockAnchor InputRichBlockAnchor
  | InputRichBlockViaInputRichBlockAnimation InputRichBlockAnimation
  | InputRichBlockViaInputRichBlockAudio InputRichBlockAudio
  | InputRichBlockViaInputRichBlockBlockQuotation InputRichBlockBlockQuotation
  | InputRichBlockViaInputRichBlockButtons InputRichBlockButtons
  | InputRichBlockViaInputRichBlockCollage InputRichBlockCollage
  | InputRichBlockViaInputRichBlockDetails InputRichBlockDetails
  | InputRichBlockViaInputRichBlockDivider InputRichBlockDivider
  | InputRichBlockViaInputRichBlockDocument InputRichBlockDocument
  | InputRichBlockViaInputRichBlockExpandableBlockQuotation InputRichBlockExpandableBlockQuotation
  | InputRichBlockViaInputRichBlockFooter InputRichBlockFooter
  | InputRichBlockViaInputRichBlockList InputRichBlockList
  | InputRichBlockViaInputRichBlockMap InputRichBlockMap
  | InputRichBlockViaInputRichBlockMathematicalExpression InputRichBlockMathematicalExpression
  | InputRichBlockViaInputRichBlockParagraph InputRichBlockParagraph
  | InputRichBlockViaInputRichBlockPhoto InputRichBlockPhoto
  | InputRichBlockViaInputRichBlockPreformatted InputRichBlockPreformatted
  | InputRichBlockViaInputRichBlockPullQuotation InputRichBlockPullQuotation
  | InputRichBlockViaInputRichBlockSectionHeading InputRichBlockSectionHeading
  | InputRichBlockViaInputRichBlockSlideshow InputRichBlockSlideshow
  | InputRichBlockViaInputRichBlockTable InputRichBlockTable
  | InputRichBlockViaInputRichBlockThinking InputRichBlockThinking
  | InputRichBlockViaInputRichBlockVideo InputRichBlockVideo
  | InputRichBlockViaInputRichBlockVoiceNote InputRichBlockVoiceNote
  | -- | A value this decoder does not recognize, preserved verbatim so
    -- the raw payload survives the boundary.
    InputRichBlockUnknown Value
  deriving stock (Eq, Show)

-- | Plan the selected member of a 'InputRichBlock'.
--
-- An unrecognized value is emitted verbatim; it is an explicit raw
-- escape hatch and allocates no attachment.
planInputRichBlock :: InputRichBlock -> FieldPlanner
planInputRichBlock = \case
  InputRichBlockViaInputRichBlockAnchor member_ -> planMember (encodeJson member_)
  InputRichBlockViaInputRichBlockAnimation member_ -> planMember (planInputRichBlockAnimation member_)
  InputRichBlockViaInputRichBlockAudio member_ -> planMember (planInputRichBlockAudio member_)
  InputRichBlockViaInputRichBlockBlockQuotation member_ -> planMember (planInputRichBlockBlockQuotation member_)
  InputRichBlockViaInputRichBlockButtons member_ -> planMember (planInputRichBlockButtons member_)
  InputRichBlockViaInputRichBlockCollage member_ -> planMember (planInputRichBlockCollage member_)
  InputRichBlockViaInputRichBlockDetails member_ -> planMember (planInputRichBlockDetails member_)
  InputRichBlockViaInputRichBlockDivider member_ -> planMember (encodeJson member_)
  InputRichBlockViaInputRichBlockDocument member_ -> planMember (planInputRichBlockDocument member_)
  InputRichBlockViaInputRichBlockExpandableBlockQuotation member_ -> planMember (encodeJson member_)
  InputRichBlockViaInputRichBlockFooter member_ -> planMember (encodeJson member_)
  InputRichBlockViaInputRichBlockList member_ -> planMember (planInputRichBlockList member_)
  InputRichBlockViaInputRichBlockMap member_ -> planMember (encodeJson member_)
  InputRichBlockViaInputRichBlockMathematicalExpression member_ -> planMember (encodeJson member_)
  InputRichBlockViaInputRichBlockParagraph member_ -> planMember (encodeJson member_)
  InputRichBlockViaInputRichBlockPhoto member_ -> planMember (planInputRichBlockPhoto member_)
  InputRichBlockViaInputRichBlockPreformatted member_ -> planMember (encodeJson member_)
  InputRichBlockViaInputRichBlockPullQuotation member_ -> planMember (encodeJson member_)
  InputRichBlockViaInputRichBlockSectionHeading member_ -> planMember (encodeJson member_)
  InputRichBlockViaInputRichBlockSlideshow member_ -> planMember (planInputRichBlockSlideshow member_)
  InputRichBlockViaInputRichBlockTable member_ -> planMember (encodeJson member_)
  InputRichBlockViaInputRichBlockThinking member_ -> planMember (encodeJson member_)
  InputRichBlockViaInputRichBlockVideo member_ -> planMember (planInputRichBlockVideo member_)
  InputRichBlockViaInputRichBlockVoiceNote member_ -> planMember (planInputRichBlockVoiceNote member_)
  InputRichBlockUnknown raw_ -> planMember (plainValue raw_)

-- | A block quotation, corresponding to the HTML tag \<blockquote\>.
--
-- Source: <https://core.telegram.org/bots/api#inputrichblockblockquotation>.
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
--
-- Supplied constants: @type@ = @"blockquote"@.
data InputRichBlockBlockQuotation = MkInputRichBlockBlockQuotation
  { -- | Content of the block
    --
    -- Wire key: @blocks@.
    blocks :: [InputRichBlock]
  , -- | Optional. Credit of the block
    --
    -- Wire key: @credit@.
    -- Omitted from an encoded request when it is @Nothing@.
    credit :: Maybe RichText
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InputRichBlockBlockQuotation' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputRichBlockBlockQuotation :: [InputRichBlock] -> InputRichBlockBlockQuotation
mkInputRichBlockBlockQuotation arg0 =
  MkInputRichBlockBlockQuotation
    { blocks = arg0
    , credit = Nothing
    }

-- | Plan a 'InputRichBlockBlockQuotation' as part of an outgoing request.
--
-- The traversal is checked: it validates every file source against
-- the capabilities its occurrence permits and allocates one
-- attachment part per upload, in source field order.
planInputRichBlockBlockQuotation :: InputRichBlockBlockQuotation -> FieldPlanner
planInputRichBlockBlockQuotation x =
  planRecord
    ( concat
        [ plannedLiteral "type" (String "blockquote")
        , planned "blocks" ((planList planInputRichBlock) x.blocks)
        , plannedMaybe "credit" x.credit encodeJson
        ]
    )

-- | A collage, corresponding to the custom HTML tag \<tg-collage\>.
--
-- Source: <https://core.telegram.org/bots/api#inputrichblockcollage>.
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
--
-- Supplied constants: @type@ = @"collage"@.
data InputRichBlockCollage = MkInputRichBlockCollage
  { -- | Elements of the collage
    --
    -- Wire key: @blocks@.
    blocks :: [InputRichBlock]
  , -- | Optional. Caption of the block
    --
    -- Wire key: @caption@.
    -- Omitted from an encoded request when it is @Nothing@.
    caption :: Maybe RichBlockCaption
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InputRichBlockCollage' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputRichBlockCollage :: [InputRichBlock] -> InputRichBlockCollage
mkInputRichBlockCollage arg0 =
  MkInputRichBlockCollage
    { blocks = arg0
    , caption = Nothing
    }

-- | Plan a 'InputRichBlockCollage' as part of an outgoing request.
--
-- The traversal is checked: it validates every file source against
-- the capabilities its occurrence permits and allocates one
-- attachment part per upload, in source field order.
planInputRichBlockCollage :: InputRichBlockCollage -> FieldPlanner
planInputRichBlockCollage x =
  planRecord
    ( concat
        [ plannedLiteral "type" (String "collage")
        , planned "blocks" ((planList planInputRichBlock) x.blocks)
        , plannedMaybe "caption" x.caption encodeJson
        ]
    )

-- | An expandable block for details disclosure, corresponding to the HTML tag \<details\>.
--
-- Source: <https://core.telegram.org/bots/api#inputrichblockdetails>.
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
--
-- Supplied constants: @type@ = @"details"@.
data InputRichBlockDetails = MkInputRichBlockDetails
  { -- | Always shown summary of the block
    --
    -- Wire key: @summary@.
    summary :: RichText
  , -- | Content of the block
    --
    -- Wire key: @blocks@.
    blocks :: [InputRichBlock]
  , -- | Optional. Pass True if the content of the block is visible by default
    --
    -- Wire key: @is_open@.
    -- Omitted from an encoded request when it is @False@.
    is_open :: Bool
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InputRichBlockDetails' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputRichBlockDetails :: RichText -> [InputRichBlock] -> InputRichBlockDetails
mkInputRichBlockDetails arg0 arg1 =
  MkInputRichBlockDetails
    { summary = arg0
    , blocks = arg1
    , is_open = False
    }

-- | Plan a 'InputRichBlockDetails' as part of an outgoing request.
--
-- The traversal is checked: it validates every file source against
-- the capabilities its occurrence permits and allocates one
-- attachment part per upload, in source field order.
planInputRichBlockDetails :: InputRichBlockDetails -> FieldPlanner
planInputRichBlockDetails x =
  planRecord
    ( concat
        [ plannedLiteral "type" (String "details")
        , planned "summary" (encodeJson x.summary)
        , planned "blocks" ((planList planInputRichBlock) x.blocks)
        , plannedFlag "is_open" x.is_open
        ]
    )

-- | A list of blocks, corresponding to the HTML tag \<ul\> or \<ol\> with multiple nested tags \<li\>.
--
-- Source: <https://core.telegram.org/bots/api#inputrichblocklist>.
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
--
-- Supplied constants: @type@ = @"list"@.
data InputRichBlockList = MkInputRichBlockList
  { -- | Items of the list
    --
    -- Wire key: @items@.
    items :: [InputRichBlockListItem]
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InputRichBlockList' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputRichBlockList :: [InputRichBlockListItem] -> InputRichBlockList
mkInputRichBlockList arg0 =
  MkInputRichBlockList
    { items = arg0
    }

-- | Plan a 'InputRichBlockList' as part of an outgoing request.
--
-- The traversal is checked: it validates every file source against
-- the capabilities its occurrence permits and allocates one
-- attachment part per upload, in source field order.
planInputRichBlockList :: InputRichBlockList -> FieldPlanner
planInputRichBlockList x =
  planRecord
    ( concat
        [ plannedLiteral "type" (String "list")
        , planned "items" ((planList planInputRichBlockListItem) x.items)
        ]
    )

-- | An item of a list to be sent.
--
-- Source: <https://core.telegram.org/bots/api#inputrichblocklistitem>.
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
data InputRichBlockListItem = MkInputRichBlockListItem
  { -- | The content of the item
    --
    -- Wire key: @blocks@.
    blocks :: [InputRichBlock]
  , -- | Optional. Pass True if the item has a checkbox
    --
    -- Wire key: @has_checkbox@.
    -- Omitted from an encoded request when it is @False@.
    has_checkbox :: Bool
  , -- | Optional. Pass True if the item has a checked checkbox
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

-- | Initialize a 'InputRichBlockListItem' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputRichBlockListItem :: [InputRichBlock] -> InputRichBlockListItem
mkInputRichBlockListItem arg0 =
  MkInputRichBlockListItem
    { blocks = arg0
    , has_checkbox = False
    , is_checked = False
    , value = Nothing
    , type_ = Nothing
    }

-- | Plan a 'InputRichBlockListItem' as part of an outgoing request.
--
-- The traversal is checked: it validates every file source against
-- the capabilities its occurrence permits and allocates one
-- attachment part per upload, in source field order.
planInputRichBlockListItem :: InputRichBlockListItem -> FieldPlanner
planInputRichBlockListItem x =
  planRecord
    ( concat
        [ planned "blocks" ((planList planInputRichBlock) x.blocks)
        , plannedFlag "has_checkbox" x.has_checkbox
        , plannedFlag "is_checked" x.is_checked
        , plannedMaybe "value" x.value encodeJson
        , plannedMaybe "type" x.type_ encodeJson
        ]
    )

-- | A slideshow, corresponding to the custom HTML tag \<tg-slideshow\>.
--
-- Source: <https://core.telegram.org/bots/api#inputrichblockslideshow>.
-- Codec directions: planned into checked requests.
-- This value can carry a local upload, so no 'Data.Aeson.ToJSON' instance is generated for it; send it through the checked planner.
--
-- Supplied constants: @type@ = @"slideshow"@.
data InputRichBlockSlideshow = MkInputRichBlockSlideshow
  { -- | Elements of the slideshow
    --
    -- Wire key: @blocks@.
    blocks :: [InputRichBlock]
  , -- | Optional. Caption of the block
    --
    -- Wire key: @caption@.
    -- Omitted from an encoded request when it is @Nothing@.
    caption :: Maybe RichBlockCaption
  }
  deriving stock (Eq, Show)

-- | Initialize a 'InputRichBlockSlideshow' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkInputRichBlockSlideshow :: [InputRichBlock] -> InputRichBlockSlideshow
mkInputRichBlockSlideshow arg0 =
  MkInputRichBlockSlideshow
    { blocks = arg0
    , caption = Nothing
    }

-- | Plan a 'InputRichBlockSlideshow' as part of an outgoing request.
--
-- The traversal is checked: it validates every file source against
-- the capabilities its occurrence permits and allocates one
-- attachment part per upload, in source field order.
planInputRichBlockSlideshow :: InputRichBlockSlideshow -> FieldPlanner
planInputRichBlockSlideshow x =
  planRecord
    ( concat
        [ plannedLiteral "type" (String "slideshow")
        , planned "blocks" ((planList planInputRichBlock) x.blocks)
        , plannedMaybe "caption" x.caption encodeJson
        ]
    )
