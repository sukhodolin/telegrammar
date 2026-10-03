{-# LANGUAGE DuplicateRecordFields #-}

-- | Every public generated type, with its constructors and initializer.
--
-- Import selectively and qualified to update an optional field of a
-- record, for example
--
-- > import qualified Telegram.Bot.Types as Photo (InputMediaPhoto (..), mkInputMediaPhoto)
--
-- Generated. Do not edit.
module Telegram.Bot.Types
  ( AcceptedGiftTypes (..)
  , AffiliateInfo (..)
  , Animation (..)
  , Audio (..)
  , BackgroundFill (..)
  , BackgroundFillFreeformGradient (..)
  , BackgroundFillGradient (..)
  , BackgroundFillSolid (..)
  , BackgroundType (..)
  , BackgroundTypeChatTheme (..)
  , BackgroundTypeFill (..)
  , BackgroundTypePattern (..)
  , BackgroundTypeWallpaper (..)
  , Birthdate (..)
  , BotAccessSettings (..)
  , BotCommand (..)
  , BotCommandScope (..)
  , BotCommandScopeAllChatAdministrators (..)
  , BotCommandScopeAllGroupChats (..)
  , BotCommandScopeAllPrivateChats (..)
  , BotCommandScopeChat (..)
  , BotCommandScopeChatAdministrators (..)
  , BotCommandScopeChatMember (..)
  , BotCommandScopeDefault (..)
  , BotDescription (..)
  , BotName (..)
  , BotShortDescription (..)
  , BotSubscriptionUpdated (..)
  , BusinessBotRights (..)
  , BusinessConnection (..)
  , BusinessIntro (..)
  , BusinessLocation (..)
  , BusinessMessagesDeleted (..)
  , BusinessOpeningHours (..)
  , BusinessOpeningHoursInterval (..)
  , CallbackGame (..)
  , CallbackQuery (..)
  , Chat (..)
  , ChatAdministratorRights (..)
  , ChatBackground (..)
  , ChatBoost (..)
  , ChatBoostAdded (..)
  , ChatBoostRemoved (..)
  , ChatBoostSource (..)
  , ChatBoostSourceGiftCode (..)
  , ChatBoostSourceGiveaway (..)
  , ChatBoostSourcePremium (..)
  , ChatBoostUpdated (..)
  , ChatFullInfo (..)
  , ChatInviteLink (..)
  , ChatJoinRequest (..)
  , ChatLocation (..)
  , ChatMember (..)
  , ChatMemberAdministrator (..)
  , ChatMemberBanned (..)
  , ChatMemberLeft (..)
  , ChatMemberMember (..)
  , ChatMemberOwner (..)
  , ChatMemberRestricted (..)
  , ChatMemberUpdated (..)
  , ChatOwnerChanged (..)
  , ChatOwnerLeft (..)
  , ChatPermissions (..)
  , ChatPhoto (..)
  , ChatShared (..)
  , Checklist (..)
  , ChecklistTask (..)
  , ChecklistTasksAdded (..)
  , ChecklistTasksDone (..)
  , ChosenInlineResult (..)
  , Community (..)
  , CommunityChatAdded (..)
  , CommunityChatJoined (..)
  , CommunityChatRemoved (..)
  , Contact (..)
  , CopyTextButton (..)
  , Dice (..)
  , DirectMessagePriceChanged (..)
  , DirectMessagesTopic (..)
  , DisabledButton (..)
  , Document (..)
  , EncryptedCredentials (..)
  , EncryptedPassportElement (..)
  , EphemeralMessageParameters (..)
  , ExternalReplyInfo (..)
  , File (..)
  , ForceReply (..)
  , ForumTopic (..)
  , ForumTopicClosed (..)
  , ForumTopicCreated (..)
  , ForumTopicEdited (..)
  , ForumTopicReopened (..)
  , Game (..)
  , GameHighScore (..)
  , GeneralForumTopicHidden (..)
  , GeneralForumTopicUnhidden (..)
  , Gift (..)
  , GiftBackground (..)
  , GiftInfo (..)
  , Gifts (..)
  , Giveaway (..)
  , GiveawayCompleted (..)
  , GiveawayCreated (..)
  , GiveawayWinners (..)
  , InaccessibleMessage (..)
  , InlineKeyboardButton (..)
  , InlineKeyboardMarkup (..)
  , InlineQuery (..)
  , InlineQueryResult (..)
  , InlineQueryResultArticle (..)
  , InlineQueryResultAudio (..)
  , InlineQueryResultCachedAudio (..)
  , InlineQueryResultCachedDocument (..)
  , InlineQueryResultCachedGif (..)
  , InlineQueryResultCachedMpeg4Gif (..)
  , InlineQueryResultCachedPhoto (..)
  , InlineQueryResultCachedSticker (..)
  , InlineQueryResultCachedVideo (..)
  , InlineQueryResultCachedVoice (..)
  , InlineQueryResultContact (..)
  , InlineQueryResultDocument (..)
  , InlineQueryResultGame (..)
  , InlineQueryResultGif (..)
  , InlineQueryResultLocation (..)
  , InlineQueryResultMpeg4Gif (..)
  , InlineQueryResultPhoto (..)
  , InlineQueryResultVenue (..)
  , InlineQueryResultVideo (..)
  , InlineQueryResultVoice (..)
  , InlineQueryResultsButton (..)
  , InputChecklist (..)
  , InputChecklistTask (..)
  , InputContactMessageContent (..)
  , InputFile (..)
  , InputInvoiceMessageContent (..)
  , InputLocationMessageContent (..)
  , InputMedia (..)
  , InputMediaAnimation (..)
  , InputMediaAudio (..)
  , InputMediaDocument (..)
  , InputMediaLink (..)
  , InputMediaLivePhoto (..)
  , InputMediaLocation (..)
  , InputMediaPhoto (..)
  , InputMediaSticker (..)
  , InputMediaVenue (..)
  , InputMediaVideo (..)
  , InputMediaVoiceNote (..)
  , InputMessageContent (..)
  , InputPaidMedia (..)
  , InputPaidMediaLivePhoto (..)
  , InputPaidMediaPhoto (..)
  , InputPaidMediaVideo (..)
  , InputPollMedia (..)
  , InputPollOption (..)
  , InputPollOptionMedia (..)
  , InputProfilePhoto (..)
  , InputProfilePhotoAnimated (..)
  , InputProfilePhotoStatic (..)
  , InputRichBlock (..)
  , InputRichBlockAnchor (..)
  , InputRichBlockAnimation (..)
  , InputRichBlockAudio (..)
  , InputRichBlockBlockQuotation (..)
  , InputRichBlockButtons (..)
  , InputRichBlockCollage (..)
  , InputRichBlockDetails (..)
  , InputRichBlockDivider (..)
  , InputRichBlockDocument (..)
  , InputRichBlockExpandableBlockQuotation (..)
  , InputRichBlockFooter (..)
  , InputRichBlockList (..)
  , InputRichBlockListItem (..)
  , InputRichBlockMap (..)
  , InputRichBlockMathematicalExpression (..)
  , InputRichBlockParagraph (..)
  , InputRichBlockPhoto (..)
  , InputRichBlockPreformatted (..)
  , InputRichBlockPullQuotation (..)
  , InputRichBlockSectionHeading (..)
  , InputRichBlockSlideshow (..)
  , InputRichBlockTable (..)
  , InputRichBlockThinking (..)
  , InputRichBlockVideo (..)
  , InputRichBlockVoiceNote (..)
  , InputRichMessage (..)
  , InputRichMessageContent (..)
  , InputRichMessageMedia (..)
  , InputSticker (..)
  , InputStoryContent (..)
  , InputStoryContentPhoto (..)
  , InputStoryContentVideo (..)
  , InputTextMessageContent (..)
  , InputVenueMessageContent (..)
  , IntegerOrString (..)
  , Invoice (..)
  , KeyboardButton (..)
  , KeyboardButtonPollType (..)
  , KeyboardButtonRequestChat (..)
  , KeyboardButtonRequestManagedBot (..)
  , KeyboardButtonRequestUsers (..)
  , LabeledPrice (..)
  , Link (..)
  , LinkPreviewOptions (..)
  , LivePhoto (..)
  , Location (..)
  , LocationAddress (..)
  , LoginUrl (..)
  , ManagedBotCreated (..)
  , ManagedBotUpdated (..)
  , MaskPosition (..)
  , MaybeInaccessibleMessage (..)
  , MediaGroupItem (..)
  , MenuButton (..)
  , MenuButtonCommands (..)
  , MenuButtonDefault (..)
  , MenuButtonWebApp (..)
  , Message (..)
  , MessageAutoDeleteTimerChanged (..)
  , MessageEntity (..)
  , MessageGenerationStopped (..)
  , MessageId (..)
  , MessageOrTrue (..)
  , MessageOrigin (..)
  , MessageOriginChannel (..)
  , MessageOriginChat (..)
  , MessageOriginHiddenUser (..)
  , MessageOriginUser (..)
  , MessageReactionCountUpdated (..)
  , MessageReactionUpdated (..)
  , OrderInfo (..)
  , OwnedGift (..)
  , OwnedGiftRegular (..)
  , OwnedGiftUnique (..)
  , OwnedGifts (..)
  , PaidMedia (..)
  , PaidMediaInfo (..)
  , PaidMediaLivePhoto (..)
  , PaidMediaPhoto (..)
  , PaidMediaPreview (..)
  , PaidMediaPurchased (..)
  , PaidMediaVideo (..)
  , PaidMessagePriceChanged (..)
  , PassportData (..)
  , PassportElementError (..)
  , PassportElementErrorDataField (..)
  , PassportElementErrorFile (..)
  , PassportElementErrorFiles (..)
  , PassportElementErrorFrontSide (..)
  , PassportElementErrorReverseSide (..)
  , PassportElementErrorSelfie (..)
  , PassportElementErrorTranslationFile (..)
  , PassportElementErrorTranslationFiles (..)
  , PassportElementErrorUnspecified (..)
  , PassportFile (..)
  , PhotoSize (..)
  , Poll (..)
  , PollAnswer (..)
  , PollMedia (..)
  , PollOption (..)
  , PollOptionAdded (..)
  , PollOptionDeleted (..)
  , PreCheckoutQuery (..)
  , PreparedInlineMessage (..)
  , PreparedKeyboardButton (..)
  , ProximityAlertTriggered (..)
  , ReactionCount (..)
  , ReactionType (..)
  , ReactionTypeCustomEmoji (..)
  , ReactionTypeEmoji (..)
  , ReactionTypePaid (..)
  , RefundedPayment (..)
  , ReplyKeyboardMarkup (..)
  , ReplyKeyboardRemove (..)
  , ReplyMarkup (..)
  , ReplyParameters (..)
  , ResponseParameters (..)
  , RevenueWithdrawalState (..)
  , RevenueWithdrawalStateFailed (..)
  , RevenueWithdrawalStatePending (..)
  , RevenueWithdrawalStateSucceeded (..)
  , RichBlock (..)
  , RichBlockAnchor (..)
  , RichBlockAnimation (..)
  , RichBlockAudio (..)
  , RichBlockBlockQuotation (..)
  , RichBlockButtons (..)
  , RichBlockCaption (..)
  , RichBlockCollage (..)
  , RichBlockDetails (..)
  , RichBlockDivider (..)
  , RichBlockDocument (..)
  , RichBlockExpandableBlockQuotation (..)
  , RichBlockFooter (..)
  , RichBlockList (..)
  , RichBlockListItem (..)
  , RichBlockMap (..)
  , RichBlockMathematicalExpression (..)
  , RichBlockParagraph (..)
  , RichBlockPhoto (..)
  , RichBlockPreformatted (..)
  , RichBlockPullQuotation (..)
  , RichBlockSectionHeading (..)
  , RichBlockSlideshow (..)
  , RichBlockTable (..)
  , RichBlockTableCell (..)
  , RichBlockThinking (..)
  , RichBlockVideo (..)
  , RichBlockVoiceNote (..)
  , RichMessage (..)
  , RichMessageButton (..)
  , RichMessageMedia (..)
  , RichText (..)
  , RichTextAnchor (..)
  , RichTextAnchorLink (..)
  , RichTextBankCardNumber (..)
  , RichTextBold (..)
  , RichTextBotCommand (..)
  , RichTextButton (..)
  , RichTextCashtag (..)
  , RichTextCode (..)
  , RichTextCustomEmoji (..)
  , RichTextDateTime (..)
  , RichTextEmailAddress (..)
  , RichTextHashtag (..)
  , RichTextItalic (..)
  , RichTextMarked (..)
  , RichTextMathematicalExpression (..)
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
  , SentGuestMessage (..)
  , SentWebAppMessage (..)
  , SharedUser (..)
  , ShippingAddress (..)
  , ShippingOption (..)
  , ShippingQuery (..)
  , StarAmount (..)
  , StarTransaction (..)
  , StarTransactions (..)
  , Sticker (..)
  , StickerSet (..)
  , Story (..)
  , StoryArea (..)
  , StoryAreaPosition (..)
  , StoryAreaType (..)
  , StoryAreaTypeLink (..)
  , StoryAreaTypeLocation (..)
  , StoryAreaTypeSuggestedReaction (..)
  , StoryAreaTypeUniqueGift (..)
  , StoryAreaTypeWeather (..)
  , SuccessfulPayment (..)
  , SuggestedPostApprovalFailed (..)
  , SuggestedPostApproved (..)
  , SuggestedPostDeclined (..)
  , SuggestedPostInfo (..)
  , SuggestedPostPaid (..)
  , SuggestedPostParameters (..)
  , SuggestedPostPrice (..)
  , SuggestedPostRefunded (..)
  , SwitchInlineQueryChosenChat (..)
  , TextQuote (..)
  , TransactionPartner (..)
  , TransactionPartnerAffiliateProgram (..)
  , TransactionPartnerChat (..)
  , TransactionPartnerFragment (..)
  , TransactionPartnerOther (..)
  , TransactionPartnerTelegramAds (..)
  , TransactionPartnerTelegramApi (..)
  , TransactionPartnerUser (..)
  , TrueValue (..)
  , UniqueGift (..)
  , UniqueGiftBackdrop (..)
  , UniqueGiftBackdropColors (..)
  , UniqueGiftColors (..)
  , UniqueGiftInfo (..)
  , UniqueGiftModel (..)
  , UniqueGiftSymbol (..)
  , Update (..)
  , UploadSource (..)
  , User (..)
  , UserChatBoosts (..)
  , UserProfileAudios (..)
  , UserProfilePhotos (..)
  , UserRating (..)
  , UsersShared (..)
  , Venue (..)
  , Video (..)
  , VideoChatEnded (..)
  , VideoChatParticipantsInvited (..)
  , VideoChatScheduled (..)
  , VideoChatStarted (..)
  , VideoNote (..)
  , VideoQuality (..)
  , Voice (..)
  , WebAppData (..)
  , WebAppInfo (..)
  , WebhookInfo (..)
  , WriteAccessAllowed (..)
  , mkAcceptedGiftTypes
  , mkAffiliateInfo
  , mkAnimation
  , mkAudio
  , mkBackgroundFillFreeformGradient
  , mkBackgroundFillGradient
  , mkBackgroundFillSolid
  , mkBackgroundTypeChatTheme
  , mkBackgroundTypeFill
  , mkBackgroundTypePattern
  , mkBackgroundTypeWallpaper
  , mkBirthdate
  , mkBotAccessSettings
  , mkBotCommand
  , mkBotCommandScopeAllChatAdministrators
  , mkBotCommandScopeAllGroupChats
  , mkBotCommandScopeAllPrivateChats
  , mkBotCommandScopeChat
  , mkBotCommandScopeChatAdministrators
  , mkBotCommandScopeChatMember
  , mkBotCommandScopeDefault
  , mkBotDescription
  , mkBotName
  , mkBotShortDescription
  , mkBotSubscriptionUpdated
  , mkBusinessBotRights
  , mkBusinessConnection
  , mkBusinessIntro
  , mkBusinessLocation
  , mkBusinessMessagesDeleted
  , mkBusinessOpeningHours
  , mkBusinessOpeningHoursInterval
  , mkCallbackGame
  , mkCallbackQuery
  , mkChat
  , mkChatAdministratorRights
  , mkChatBackground
  , mkChatBoost
  , mkChatBoostAdded
  , mkChatBoostRemoved
  , mkChatBoostSourceGiftCode
  , mkChatBoostSourceGiveaway
  , mkChatBoostSourcePremium
  , mkChatBoostUpdated
  , mkChatFullInfo
  , mkChatInviteLink
  , mkChatJoinRequest
  , mkChatLocation
  , mkChatMemberAdministrator
  , mkChatMemberBanned
  , mkChatMemberLeft
  , mkChatMemberMember
  , mkChatMemberOwner
  , mkChatMemberRestricted
  , mkChatMemberUpdated
  , mkChatOwnerChanged
  , mkChatOwnerLeft
  , mkChatPermissions
  , mkChatPhoto
  , mkChatShared
  , mkChecklist
  , mkChecklistTask
  , mkChecklistTasksAdded
  , mkChecklistTasksDone
  , mkChosenInlineResult
  , mkCommunity
  , mkCommunityChatAdded
  , mkCommunityChatJoined
  , mkCommunityChatRemoved
  , mkContact
  , mkCopyTextButton
  , mkDice
  , mkDirectMessagePriceChanged
  , mkDirectMessagesTopic
  , mkDisabledButton
  , mkDocument
  , mkEncryptedCredentials
  , mkEncryptedPassportElement
  , mkEphemeralMessageParameters
  , mkExternalReplyInfo
  , mkFile
  , mkForceReply
  , mkForumTopic
  , mkForumTopicClosed
  , mkForumTopicCreated
  , mkForumTopicEdited
  , mkForumTopicReopened
  , mkGame
  , mkGameHighScore
  , mkGeneralForumTopicHidden
  , mkGeneralForumTopicUnhidden
  , mkGift
  , mkGiftBackground
  , mkGiftInfo
  , mkGifts
  , mkGiveaway
  , mkGiveawayCompleted
  , mkGiveawayCreated
  , mkGiveawayWinners
  , mkInaccessibleMessage
  , mkInlineKeyboardButton
  , mkInlineKeyboardMarkup
  , mkInlineQuery
  , mkInlineQueryResultArticle
  , mkInlineQueryResultAudio
  , mkInlineQueryResultCachedAudio
  , mkInlineQueryResultCachedDocument
  , mkInlineQueryResultCachedGif
  , mkInlineQueryResultCachedMpeg4Gif
  , mkInlineQueryResultCachedPhoto
  , mkInlineQueryResultCachedSticker
  , mkInlineQueryResultCachedVideo
  , mkInlineQueryResultCachedVoice
  , mkInlineQueryResultContact
  , mkInlineQueryResultDocument
  , mkInlineQueryResultGame
  , mkInlineQueryResultGif
  , mkInlineQueryResultLocation
  , mkInlineQueryResultMpeg4Gif
  , mkInlineQueryResultPhoto
  , mkInlineQueryResultVenue
  , mkInlineQueryResultVideo
  , mkInlineQueryResultVoice
  , mkInlineQueryResultsButton
  , mkInputChecklist
  , mkInputChecklistTask
  , mkInputContactMessageContent
  , mkInputInvoiceMessageContent
  , mkInputLocationMessageContent
  , mkInputMediaAnimation
  , mkInputMediaAudio
  , mkInputMediaDocument
  , mkInputMediaLink
  , mkInputMediaLivePhoto
  , mkInputMediaLocation
  , mkInputMediaPhoto
  , mkInputMediaSticker
  , mkInputMediaVenue
  , mkInputMediaVideo
  , mkInputMediaVoiceNote
  , mkInputPaidMediaLivePhoto
  , mkInputPaidMediaPhoto
  , mkInputPaidMediaVideo
  , mkInputPollOption
  , mkInputProfilePhotoAnimated
  , mkInputProfilePhotoStatic
  , mkInputRichBlockAnchor
  , mkInputRichBlockAnimation
  , mkInputRichBlockAudio
  , mkInputRichBlockBlockQuotation
  , mkInputRichBlockButtons
  , mkInputRichBlockCollage
  , mkInputRichBlockDetails
  , mkInputRichBlockDivider
  , mkInputRichBlockDocument
  , mkInputRichBlockExpandableBlockQuotation
  , mkInputRichBlockFooter
  , mkInputRichBlockList
  , mkInputRichBlockListItem
  , mkInputRichBlockMap
  , mkInputRichBlockMathematicalExpression
  , mkInputRichBlockParagraph
  , mkInputRichBlockPhoto
  , mkInputRichBlockPreformatted
  , mkInputRichBlockPullQuotation
  , mkInputRichBlockSectionHeading
  , mkInputRichBlockSlideshow
  , mkInputRichBlockTable
  , mkInputRichBlockThinking
  , mkInputRichBlockVideo
  , mkInputRichBlockVoiceNote
  , mkInputRichMessage
  , mkInputRichMessageContent
  , mkInputRichMessageMedia
  , mkInputSticker
  , mkInputStoryContentPhoto
  , mkInputStoryContentVideo
  , mkInputTextMessageContent
  , mkInputVenueMessageContent
  , mkInvoice
  , mkKeyboardButton
  , mkKeyboardButtonPollType
  , mkKeyboardButtonRequestChat
  , mkKeyboardButtonRequestManagedBot
  , mkKeyboardButtonRequestUsers
  , mkLabeledPrice
  , mkLink
  , mkLinkPreviewOptions
  , mkLivePhoto
  , mkLocation
  , mkLocationAddress
  , mkLoginUrl
  , mkManagedBotCreated
  , mkManagedBotUpdated
  , mkMaskPosition
  , mkMenuButtonCommands
  , mkMenuButtonDefault
  , mkMenuButtonWebApp
  , mkMessage
  , mkMessageAutoDeleteTimerChanged
  , mkMessageEntity
  , mkMessageGenerationStopped
  , mkMessageId
  , mkMessageOriginChannel
  , mkMessageOriginChat
  , mkMessageOriginHiddenUser
  , mkMessageOriginUser
  , mkMessageReactionCountUpdated
  , mkMessageReactionUpdated
  , mkOrderInfo
  , mkOwnedGiftRegular
  , mkOwnedGiftUnique
  , mkOwnedGifts
  , mkPaidMediaInfo
  , mkPaidMediaLivePhoto
  , mkPaidMediaPhoto
  , mkPaidMediaPreview
  , mkPaidMediaPurchased
  , mkPaidMediaVideo
  , mkPaidMessagePriceChanged
  , mkPassportData
  , mkPassportElementErrorDataField
  , mkPassportElementErrorFile
  , mkPassportElementErrorFiles
  , mkPassportElementErrorFrontSide
  , mkPassportElementErrorReverseSide
  , mkPassportElementErrorSelfie
  , mkPassportElementErrorTranslationFile
  , mkPassportElementErrorTranslationFiles
  , mkPassportElementErrorUnspecified
  , mkPassportFile
  , mkPhotoSize
  , mkPoll
  , mkPollAnswer
  , mkPollMedia
  , mkPollOption
  , mkPollOptionAdded
  , mkPollOptionDeleted
  , mkPreCheckoutQuery
  , mkPreparedInlineMessage
  , mkPreparedKeyboardButton
  , mkProximityAlertTriggered
  , mkReactionCount
  , mkReactionTypeCustomEmoji
  , mkReactionTypeEmoji
  , mkReactionTypePaid
  , mkRefundedPayment
  , mkReplyKeyboardMarkup
  , mkReplyKeyboardRemove
  , mkReplyParameters
  , mkResponseParameters
  , mkRevenueWithdrawalStateFailed
  , mkRevenueWithdrawalStatePending
  , mkRevenueWithdrawalStateSucceeded
  , mkRichBlockAnchor
  , mkRichBlockAnimation
  , mkRichBlockAudio
  , mkRichBlockBlockQuotation
  , mkRichBlockButtons
  , mkRichBlockCaption
  , mkRichBlockCollage
  , mkRichBlockDetails
  , mkRichBlockDivider
  , mkRichBlockDocument
  , mkRichBlockExpandableBlockQuotation
  , mkRichBlockFooter
  , mkRichBlockList
  , mkRichBlockListItem
  , mkRichBlockMap
  , mkRichBlockMathematicalExpression
  , mkRichBlockParagraph
  , mkRichBlockPhoto
  , mkRichBlockPreformatted
  , mkRichBlockPullQuotation
  , mkRichBlockSectionHeading
  , mkRichBlockSlideshow
  , mkRichBlockTable
  , mkRichBlockTableCell
  , mkRichBlockThinking
  , mkRichBlockVideo
  , mkRichBlockVoiceNote
  , mkRichMessage
  , mkRichMessageButton
  , mkRichTextAnchor
  , mkRichTextAnchorLink
  , mkRichTextBankCardNumber
  , mkRichTextBold
  , mkRichTextBotCommand
  , mkRichTextButton
  , mkRichTextCashtag
  , mkRichTextCode
  , mkRichTextCustomEmoji
  , mkRichTextDateTime
  , mkRichTextEmailAddress
  , mkRichTextHashtag
  , mkRichTextItalic
  , mkRichTextMarked
  , mkRichTextMathematicalExpression
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
  , mkSentGuestMessage
  , mkSentWebAppMessage
  , mkSharedUser
  , mkShippingAddress
  , mkShippingOption
  , mkShippingQuery
  , mkStarAmount
  , mkStarTransaction
  , mkStarTransactions
  , mkSticker
  , mkStickerSet
  , mkStory
  , mkStoryArea
  , mkStoryAreaPosition
  , mkStoryAreaTypeLink
  , mkStoryAreaTypeLocation
  , mkStoryAreaTypeSuggestedReaction
  , mkStoryAreaTypeUniqueGift
  , mkStoryAreaTypeWeather
  , mkSuccessfulPayment
  , mkSuggestedPostApprovalFailed
  , mkSuggestedPostApproved
  , mkSuggestedPostDeclined
  , mkSuggestedPostInfo
  , mkSuggestedPostPaid
  , mkSuggestedPostParameters
  , mkSuggestedPostPrice
  , mkSuggestedPostRefunded
  , mkSwitchInlineQueryChosenChat
  , mkTextQuote
  , mkTransactionPartnerAffiliateProgram
  , mkTransactionPartnerChat
  , mkTransactionPartnerFragment
  , mkTransactionPartnerOther
  , mkTransactionPartnerTelegramAds
  , mkTransactionPartnerTelegramApi
  , mkTransactionPartnerUser
  , mkUniqueGift
  , mkUniqueGiftBackdrop
  , mkUniqueGiftBackdropColors
  , mkUniqueGiftColors
  , mkUniqueGiftInfo
  , mkUniqueGiftModel
  , mkUniqueGiftSymbol
  , mkUpdate
  , mkUser
  , mkUserChatBoosts
  , mkUserProfileAudios
  , mkUserProfilePhotos
  , mkUserRating
  , mkUsersShared
  , mkVenue
  , mkVideo
  , mkVideoChatEnded
  , mkVideoChatParticipantsInvited
  , mkVideoChatScheduled
  , mkVideoChatStarted
  , mkVideoNote
  , mkVideoQuality
  , mkVoice
  , mkWebAppData
  , mkWebAppInfo
  , mkWebhookInfo
  , mkWriteAccessAllowed
  ) where

import Telegram.Bot.Internal.Group.AcceptedGiftTypes (AcceptedGiftTypes (..), mkAcceptedGiftTypes)
import Telegram.Bot.Internal.Group.AffiliateInfo (AffiliateInfo (..), mkAffiliateInfo)
import Telegram.Bot.Internal.Group.Animation (Animation (..), mkAnimation)
import Telegram.Bot.Internal.Group.Audio (Audio (..), mkAudio)
import Telegram.Bot.Internal.Group.BackgroundFill (BackgroundFill (..))
import Telegram.Bot.Internal.Group.BackgroundFillFreeformGradient (BackgroundFillFreeformGradient (..), mkBackgroundFillFreeformGradient)
import Telegram.Bot.Internal.Group.BackgroundFillGradient (BackgroundFillGradient (..), mkBackgroundFillGradient)
import Telegram.Bot.Internal.Group.BackgroundFillSolid (BackgroundFillSolid (..), mkBackgroundFillSolid)
import Telegram.Bot.Internal.Group.BackgroundType (BackgroundType (..))
import Telegram.Bot.Internal.Group.BackgroundTypeChatTheme (BackgroundTypeChatTheme (..), mkBackgroundTypeChatTheme)
import Telegram.Bot.Internal.Group.BackgroundTypeFill (BackgroundTypeFill (..), mkBackgroundTypeFill)
import Telegram.Bot.Internal.Group.BackgroundTypePattern (BackgroundTypePattern (..), mkBackgroundTypePattern)
import Telegram.Bot.Internal.Group.BackgroundTypeWallpaper (BackgroundTypeWallpaper (..), mkBackgroundTypeWallpaper)
import Telegram.Bot.Internal.Group.Birthdate (Birthdate (..), mkBirthdate)
import Telegram.Bot.Internal.Group.BotAccessSettings (BotAccessSettings (..), mkBotAccessSettings)
import Telegram.Bot.Internal.Group.BotCommand (BotCommand (..), mkBotCommand)
import Telegram.Bot.Internal.Group.BotCommandScope (BotCommandScope (..))
import Telegram.Bot.Internal.Group.BotCommandScopeAllChatAdministrators (BotCommandScopeAllChatAdministrators (..), mkBotCommandScopeAllChatAdministrators)
import Telegram.Bot.Internal.Group.BotCommandScopeAllGroupChats (BotCommandScopeAllGroupChats (..), mkBotCommandScopeAllGroupChats)
import Telegram.Bot.Internal.Group.BotCommandScopeAllPrivateChats (BotCommandScopeAllPrivateChats (..), mkBotCommandScopeAllPrivateChats)
import Telegram.Bot.Internal.Group.BotCommandScopeChat (BotCommandScopeChat (..), mkBotCommandScopeChat)
import Telegram.Bot.Internal.Group.BotCommandScopeChatAdministrators (BotCommandScopeChatAdministrators (..), mkBotCommandScopeChatAdministrators)
import Telegram.Bot.Internal.Group.BotCommandScopeChatMember (BotCommandScopeChatMember (..), mkBotCommandScopeChatMember)
import Telegram.Bot.Internal.Group.BotCommandScopeDefault (BotCommandScopeDefault (..), mkBotCommandScopeDefault)
import Telegram.Bot.Internal.Group.BotDescription (BotDescription (..), mkBotDescription)
import Telegram.Bot.Internal.Group.BotName (BotName (..), mkBotName)
import Telegram.Bot.Internal.Group.BotShortDescription (BotShortDescription (..), mkBotShortDescription)
import Telegram.Bot.Internal.Group.BotSubscriptionUpdated (BotSubscriptionUpdated (..), mkBotSubscriptionUpdated)
import Telegram.Bot.Internal.Group.BusinessBotRights (BusinessBotRights (..), mkBusinessBotRights)
import Telegram.Bot.Internal.Group.BusinessConnection (BusinessConnection (..), mkBusinessConnection)
import Telegram.Bot.Internal.Group.BusinessIntro (BusinessIntro (..), mkBusinessIntro)
import Telegram.Bot.Internal.Group.BusinessLocation (BusinessLocation (..), mkBusinessLocation)
import Telegram.Bot.Internal.Group.BusinessMessagesDeleted (BusinessMessagesDeleted (..), mkBusinessMessagesDeleted)
import Telegram.Bot.Internal.Group.BusinessOpeningHours (BusinessOpeningHours (..), mkBusinessOpeningHours)
import Telegram.Bot.Internal.Group.BusinessOpeningHoursInterval (BusinessOpeningHoursInterval (..), mkBusinessOpeningHoursInterval)
import Telegram.Bot.Internal.Group.CallbackGame (CallbackGame (..), mkCallbackGame)
import Telegram.Bot.Internal.Group.CallbackQuery (CallbackQuery (..), mkCallbackQuery)
import Telegram.Bot.Internal.Group.Chat (Chat (..), mkChat)
import Telegram.Bot.Internal.Group.ChatAdministratorRights (ChatAdministratorRights (..), mkChatAdministratorRights)
import Telegram.Bot.Internal.Group.ChatBackground (ChatBackground (..), mkChatBackground)
import Telegram.Bot.Internal.Group.ChatBoost (ChatBoost (..), mkChatBoost)
import Telegram.Bot.Internal.Group.ChatBoostAdded (ChatBoostAdded (..), mkChatBoostAdded)
import Telegram.Bot.Internal.Group.ChatBoostRemoved (ChatBoostRemoved (..), mkChatBoostRemoved)
import Telegram.Bot.Internal.Group.ChatBoostSource (ChatBoostSource (..))
import Telegram.Bot.Internal.Group.ChatBoostSourceGiftCode (ChatBoostSourceGiftCode (..), mkChatBoostSourceGiftCode)
import Telegram.Bot.Internal.Group.ChatBoostSourceGiveaway (ChatBoostSourceGiveaway (..), mkChatBoostSourceGiveaway)
import Telegram.Bot.Internal.Group.ChatBoostSourcePremium (ChatBoostSourcePremium (..), mkChatBoostSourcePremium)
import Telegram.Bot.Internal.Group.ChatBoostUpdated (ChatBoostUpdated (..), mkChatBoostUpdated)
import Telegram.Bot.Internal.Group.ChatFullInfo (ChatFullInfo (..), mkChatFullInfo)
import Telegram.Bot.Internal.Group.ChatInviteLink (ChatInviteLink (..), mkChatInviteLink)
import Telegram.Bot.Internal.Group.ChatJoinRequest (ChatJoinRequest (..), mkChatJoinRequest)
import Telegram.Bot.Internal.Group.ChatLocation (ChatLocation (..), mkChatLocation)
import Telegram.Bot.Internal.Group.ChatMember (ChatMember (..))
import Telegram.Bot.Internal.Group.ChatMemberAdministrator (ChatMemberAdministrator (..), mkChatMemberAdministrator)
import Telegram.Bot.Internal.Group.ChatMemberBanned (ChatMemberBanned (..), mkChatMemberBanned)
import Telegram.Bot.Internal.Group.ChatMemberLeft (ChatMemberLeft (..), mkChatMemberLeft)
import Telegram.Bot.Internal.Group.ChatMemberMember (ChatMemberMember (..), mkChatMemberMember)
import Telegram.Bot.Internal.Group.ChatMemberOwner (ChatMemberOwner (..), mkChatMemberOwner)
import Telegram.Bot.Internal.Group.ChatMemberRestricted (ChatMemberRestricted (..), mkChatMemberRestricted)
import Telegram.Bot.Internal.Group.ChatMemberUpdated (ChatMemberUpdated (..), mkChatMemberUpdated)
import Telegram.Bot.Internal.Group.ChatOwnerChanged (ChatOwnerChanged (..), mkChatOwnerChanged)
import Telegram.Bot.Internal.Group.ChatOwnerLeft (ChatOwnerLeft (..), mkChatOwnerLeft)
import Telegram.Bot.Internal.Group.ChatPermissions (ChatPermissions (..), mkChatPermissions)
import Telegram.Bot.Internal.Group.ChatPhoto (ChatPhoto (..), mkChatPhoto)
import Telegram.Bot.Internal.Group.ChatShared (ChatShared (..), mkChatShared)
import Telegram.Bot.Internal.Group.Checklist (Checklist (..), mkChecklist)
import Telegram.Bot.Internal.Group.ChecklistTask (ChecklistTask (..), mkChecklistTask)
import Telegram.Bot.Internal.Group.ChecklistTasksAdded (ChecklistTasksAdded (..), ChecklistTasksDone (..), GiveawayCompleted (..), MaybeInaccessibleMessage (..), Message (..), PollOptionAdded (..), PollOptionDeleted (..), SuggestedPostApprovalFailed (..), SuggestedPostApproved (..), SuggestedPostDeclined (..), SuggestedPostPaid (..), SuggestedPostRefunded (..), mkChecklistTasksAdded, mkChecklistTasksDone, mkGiveawayCompleted, mkMessage, mkPollOptionAdded, mkPollOptionDeleted, mkSuggestedPostApprovalFailed, mkSuggestedPostApproved, mkSuggestedPostDeclined, mkSuggestedPostPaid, mkSuggestedPostRefunded)
import Telegram.Bot.Internal.Group.ChosenInlineResult (ChosenInlineResult (..), mkChosenInlineResult)
import Telegram.Bot.Internal.Group.Community (Community (..), mkCommunity)
import Telegram.Bot.Internal.Group.CommunityChatAdded (CommunityChatAdded (..), mkCommunityChatAdded)
import Telegram.Bot.Internal.Group.CommunityChatJoined (CommunityChatJoined (..), mkCommunityChatJoined)
import Telegram.Bot.Internal.Group.CommunityChatRemoved (CommunityChatRemoved (..), mkCommunityChatRemoved)
import Telegram.Bot.Internal.Group.Contact (Contact (..), mkContact)
import Telegram.Bot.Internal.Group.CopyTextButton (CopyTextButton (..), mkCopyTextButton)
import Telegram.Bot.Internal.Group.Dice (Dice (..), mkDice)
import Telegram.Bot.Internal.Group.DirectMessagePriceChanged (DirectMessagePriceChanged (..), mkDirectMessagePriceChanged)
import Telegram.Bot.Internal.Group.DirectMessagesTopic (DirectMessagesTopic (..), mkDirectMessagesTopic)
import Telegram.Bot.Internal.Group.DisabledButton (DisabledButton (..), mkDisabledButton)
import Telegram.Bot.Internal.Group.Document (Document (..), mkDocument)
import Telegram.Bot.Internal.Group.EncryptedCredentials (EncryptedCredentials (..), mkEncryptedCredentials)
import Telegram.Bot.Internal.Group.EncryptedPassportElement (EncryptedPassportElement (..), mkEncryptedPassportElement)
import Telegram.Bot.Internal.Group.EphemeralMessageParameters (EphemeralMessageParameters (..), mkEphemeralMessageParameters)
import Telegram.Bot.Internal.Group.ExternalReplyInfo (ExternalReplyInfo (..), mkExternalReplyInfo)
import Telegram.Bot.Internal.Group.File (File (..), mkFile)
import Telegram.Bot.Internal.Group.ForceReply (ForceReply (..), mkForceReply)
import Telegram.Bot.Internal.Group.ForumTopic (ForumTopic (..), mkForumTopic)
import Telegram.Bot.Internal.Group.ForumTopicClosed (ForumTopicClosed (..), mkForumTopicClosed)
import Telegram.Bot.Internal.Group.ForumTopicCreated (ForumTopicCreated (..), mkForumTopicCreated)
import Telegram.Bot.Internal.Group.ForumTopicEdited (ForumTopicEdited (..), mkForumTopicEdited)
import Telegram.Bot.Internal.Group.ForumTopicReopened (ForumTopicReopened (..), mkForumTopicReopened)
import Telegram.Bot.Internal.Group.Game (Game (..), mkGame)
import Telegram.Bot.Internal.Group.GameHighScore (GameHighScore (..), mkGameHighScore)
import Telegram.Bot.Internal.Group.GeneralForumTopicHidden (GeneralForumTopicHidden (..), mkGeneralForumTopicHidden)
import Telegram.Bot.Internal.Group.GeneralForumTopicUnhidden (GeneralForumTopicUnhidden (..), mkGeneralForumTopicUnhidden)
import Telegram.Bot.Internal.Group.Gift (Gift (..), mkGift)
import Telegram.Bot.Internal.Group.GiftBackground (GiftBackground (..), mkGiftBackground)
import Telegram.Bot.Internal.Group.GiftInfo (GiftInfo (..), mkGiftInfo)
import Telegram.Bot.Internal.Group.Gifts (Gifts (..), mkGifts)
import Telegram.Bot.Internal.Group.Giveaway (Giveaway (..), mkGiveaway)
import Telegram.Bot.Internal.Group.GiveawayCreated (GiveawayCreated (..), mkGiveawayCreated)
import Telegram.Bot.Internal.Group.GiveawayWinners (GiveawayWinners (..), mkGiveawayWinners)
import Telegram.Bot.Internal.Group.InaccessibleMessage (InaccessibleMessage (..), mkInaccessibleMessage)
import Telegram.Bot.Internal.Group.InlineKeyboardButton (InlineKeyboardButton (..), mkInlineKeyboardButton)
import Telegram.Bot.Internal.Group.InlineKeyboardMarkup (InlineKeyboardMarkup (..), mkInlineKeyboardMarkup)
import Telegram.Bot.Internal.Group.InlineQuery (InlineQuery (..), mkInlineQuery)
import Telegram.Bot.Internal.Group.InlineQueryResult (InlineQueryResult (..))
import Telegram.Bot.Internal.Group.InlineQueryResultArticle (InlineQueryResultArticle (..), mkInlineQueryResultArticle)
import Telegram.Bot.Internal.Group.InlineQueryResultAudio (InlineQueryResultAudio (..), mkInlineQueryResultAudio)
import Telegram.Bot.Internal.Group.InlineQueryResultCachedAudio (InlineQueryResultCachedAudio (..), mkInlineQueryResultCachedAudio)
import Telegram.Bot.Internal.Group.InlineQueryResultCachedDocument (InlineQueryResultCachedDocument (..), mkInlineQueryResultCachedDocument)
import Telegram.Bot.Internal.Group.InlineQueryResultCachedGif (InlineQueryResultCachedGif (..), mkInlineQueryResultCachedGif)
import Telegram.Bot.Internal.Group.InlineQueryResultCachedMpeg4Gif (InlineQueryResultCachedMpeg4Gif (..), mkInlineQueryResultCachedMpeg4Gif)
import Telegram.Bot.Internal.Group.InlineQueryResultCachedPhoto (InlineQueryResultCachedPhoto (..), mkInlineQueryResultCachedPhoto)
import Telegram.Bot.Internal.Group.InlineQueryResultCachedSticker (InlineQueryResultCachedSticker (..), mkInlineQueryResultCachedSticker)
import Telegram.Bot.Internal.Group.InlineQueryResultCachedVideo (InlineQueryResultCachedVideo (..), mkInlineQueryResultCachedVideo)
import Telegram.Bot.Internal.Group.InlineQueryResultCachedVoice (InlineQueryResultCachedVoice (..), mkInlineQueryResultCachedVoice)
import Telegram.Bot.Internal.Group.InlineQueryResultContact (InlineQueryResultContact (..), mkInlineQueryResultContact)
import Telegram.Bot.Internal.Group.InlineQueryResultDocument (InlineQueryResultDocument (..), mkInlineQueryResultDocument)
import Telegram.Bot.Internal.Group.InlineQueryResultGame (InlineQueryResultGame (..), mkInlineQueryResultGame)
import Telegram.Bot.Internal.Group.InlineQueryResultGif (InlineQueryResultGif (..), mkInlineQueryResultGif)
import Telegram.Bot.Internal.Group.InlineQueryResultLocation (InlineQueryResultLocation (..), mkInlineQueryResultLocation)
import Telegram.Bot.Internal.Group.InlineQueryResultMpeg4Gif (InlineQueryResultMpeg4Gif (..), mkInlineQueryResultMpeg4Gif)
import Telegram.Bot.Internal.Group.InlineQueryResultPhoto (InlineQueryResultPhoto (..), mkInlineQueryResultPhoto)
import Telegram.Bot.Internal.Group.InlineQueryResultVenue (InlineQueryResultVenue (..), mkInlineQueryResultVenue)
import Telegram.Bot.Internal.Group.InlineQueryResultVideo (InlineQueryResultVideo (..), mkInlineQueryResultVideo)
import Telegram.Bot.Internal.Group.InlineQueryResultVoice (InlineQueryResultVoice (..), mkInlineQueryResultVoice)
import Telegram.Bot.Internal.Group.InlineQueryResultsButton (InlineQueryResultsButton (..), mkInlineQueryResultsButton)
import Telegram.Bot.Internal.Group.InputChecklist (InputChecklist (..), mkInputChecklist)
import Telegram.Bot.Internal.Group.InputChecklistTask (InputChecklistTask (..), mkInputChecklistTask)
import Telegram.Bot.Internal.Group.InputContactMessageContent (InputContactMessageContent (..), mkInputContactMessageContent)
import Telegram.Bot.Internal.Group.InputInvoiceMessageContent (InputInvoiceMessageContent (..), mkInputInvoiceMessageContent)
import Telegram.Bot.Internal.Group.InputLocationMessageContent (InputLocationMessageContent (..), mkInputLocationMessageContent)
import Telegram.Bot.Internal.Group.InputMedia (InputMedia (..))
import Telegram.Bot.Internal.Group.InputMediaAnimation (InputMediaAnimation (..), mkInputMediaAnimation)
import Telegram.Bot.Internal.Group.InputMediaAudio (InputMediaAudio (..), mkInputMediaAudio)
import Telegram.Bot.Internal.Group.InputMediaDocument (InputMediaDocument (..), mkInputMediaDocument)
import Telegram.Bot.Internal.Group.InputMediaLink (InputMediaLink (..), mkInputMediaLink)
import Telegram.Bot.Internal.Group.InputMediaLivePhoto (InputMediaLivePhoto (..), mkInputMediaLivePhoto)
import Telegram.Bot.Internal.Group.InputMediaLocation (InputMediaLocation (..), mkInputMediaLocation)
import Telegram.Bot.Internal.Group.InputMediaPhoto (InputMediaPhoto (..), mkInputMediaPhoto)
import Telegram.Bot.Internal.Group.InputMediaSticker (InputMediaSticker (..), mkInputMediaSticker)
import Telegram.Bot.Internal.Group.InputMediaVenue (InputMediaVenue (..), mkInputMediaVenue)
import Telegram.Bot.Internal.Group.InputMediaVideo (InputMediaVideo (..), mkInputMediaVideo)
import Telegram.Bot.Internal.Group.InputMediaVoiceNote (InputMediaVoiceNote (..), mkInputMediaVoiceNote)
import Telegram.Bot.Internal.Group.InputMessageContent (InputMessageContent (..))
import Telegram.Bot.Internal.Group.InputPaidMedia (InputPaidMedia (..))
import Telegram.Bot.Internal.Group.InputPaidMediaLivePhoto (InputPaidMediaLivePhoto (..), mkInputPaidMediaLivePhoto)
import Telegram.Bot.Internal.Group.InputPaidMediaPhoto (InputPaidMediaPhoto (..), mkInputPaidMediaPhoto)
import Telegram.Bot.Internal.Group.InputPaidMediaVideo (InputPaidMediaVideo (..), mkInputPaidMediaVideo)
import Telegram.Bot.Internal.Group.InputPollMedia (InputPollMedia (..))
import Telegram.Bot.Internal.Group.InputPollOption (InputPollOption (..), mkInputPollOption)
import Telegram.Bot.Internal.Group.InputPollOptionMedia (InputPollOptionMedia (..))
import Telegram.Bot.Internal.Group.InputProfilePhoto (InputProfilePhoto (..))
import Telegram.Bot.Internal.Group.InputProfilePhotoAnimated (InputProfilePhotoAnimated (..), mkInputProfilePhotoAnimated)
import Telegram.Bot.Internal.Group.InputProfilePhotoStatic (InputProfilePhotoStatic (..), mkInputProfilePhotoStatic)
import Telegram.Bot.Internal.Group.InputRichBlock (InputRichBlock (..), InputRichBlockBlockQuotation (..), InputRichBlockCollage (..), InputRichBlockDetails (..), InputRichBlockList (..), InputRichBlockListItem (..), InputRichBlockSlideshow (..), mkInputRichBlockBlockQuotation, mkInputRichBlockCollage, mkInputRichBlockDetails, mkInputRichBlockList, mkInputRichBlockListItem, mkInputRichBlockSlideshow)
import Telegram.Bot.Internal.Group.InputRichBlockAnchor (InputRichBlockAnchor (..), mkInputRichBlockAnchor)
import Telegram.Bot.Internal.Group.InputRichBlockAnimation (InputRichBlockAnimation (..), mkInputRichBlockAnimation)
import Telegram.Bot.Internal.Group.InputRichBlockAudio (InputRichBlockAudio (..), mkInputRichBlockAudio)
import Telegram.Bot.Internal.Group.InputRichBlockButtons (InputRichBlockButtons (..), mkInputRichBlockButtons)
import Telegram.Bot.Internal.Group.InputRichBlockDivider (InputRichBlockDivider (..), mkInputRichBlockDivider)
import Telegram.Bot.Internal.Group.InputRichBlockDocument (InputRichBlockDocument (..), mkInputRichBlockDocument)
import Telegram.Bot.Internal.Group.InputRichBlockExpandableBlockQuotation (InputRichBlockExpandableBlockQuotation (..), mkInputRichBlockExpandableBlockQuotation)
import Telegram.Bot.Internal.Group.InputRichBlockFooter (InputRichBlockFooter (..), mkInputRichBlockFooter)
import Telegram.Bot.Internal.Group.InputRichBlockMap (InputRichBlockMap (..), mkInputRichBlockMap)
import Telegram.Bot.Internal.Group.InputRichBlockMathematicalExpression (InputRichBlockMathematicalExpression (..), mkInputRichBlockMathematicalExpression)
import Telegram.Bot.Internal.Group.InputRichBlockParagraph (InputRichBlockParagraph (..), mkInputRichBlockParagraph)
import Telegram.Bot.Internal.Group.InputRichBlockPhoto (InputRichBlockPhoto (..), mkInputRichBlockPhoto)
import Telegram.Bot.Internal.Group.InputRichBlockPreformatted (InputRichBlockPreformatted (..), mkInputRichBlockPreformatted)
import Telegram.Bot.Internal.Group.InputRichBlockPullQuotation (InputRichBlockPullQuotation (..), mkInputRichBlockPullQuotation)
import Telegram.Bot.Internal.Group.InputRichBlockSectionHeading (InputRichBlockSectionHeading (..), mkInputRichBlockSectionHeading)
import Telegram.Bot.Internal.Group.InputRichBlockTable (InputRichBlockTable (..), mkInputRichBlockTable)
import Telegram.Bot.Internal.Group.InputRichBlockThinking (InputRichBlockThinking (..), mkInputRichBlockThinking)
import Telegram.Bot.Internal.Group.InputRichBlockVideo (InputRichBlockVideo (..), mkInputRichBlockVideo)
import Telegram.Bot.Internal.Group.InputRichBlockVoiceNote (InputRichBlockVoiceNote (..), mkInputRichBlockVoiceNote)
import Telegram.Bot.Internal.Group.InputRichMessage (InputRichMessage (..), mkInputRichMessage)
import Telegram.Bot.Internal.Group.InputRichMessageContent (InputRichMessageContent (..), mkInputRichMessageContent)
import Telegram.Bot.Internal.Group.InputRichMessageMedia (InputRichMessageMedia (..), mkInputRichMessageMedia)
import Telegram.Bot.Internal.Group.InputSticker (InputSticker (..), mkInputSticker)
import Telegram.Bot.Internal.Group.InputStoryContent (InputStoryContent (..))
import Telegram.Bot.Internal.Group.InputStoryContentPhoto (InputStoryContentPhoto (..), mkInputStoryContentPhoto)
import Telegram.Bot.Internal.Group.InputStoryContentVideo (InputStoryContentVideo (..), mkInputStoryContentVideo)
import Telegram.Bot.Internal.Group.InputTextMessageContent (InputTextMessageContent (..), mkInputTextMessageContent)
import Telegram.Bot.Internal.Group.InputVenueMessageContent (InputVenueMessageContent (..), mkInputVenueMessageContent)
import Telegram.Bot.Internal.Group.IntegerOrString (IntegerOrString (..))
import Telegram.Bot.Internal.Group.Invoice (Invoice (..), mkInvoice)
import Telegram.Bot.Internal.Group.KeyboardButton (KeyboardButton (..), mkKeyboardButton)
import Telegram.Bot.Internal.Group.KeyboardButtonPollType (KeyboardButtonPollType (..), mkKeyboardButtonPollType)
import Telegram.Bot.Internal.Group.KeyboardButtonRequestChat (KeyboardButtonRequestChat (..), mkKeyboardButtonRequestChat)
import Telegram.Bot.Internal.Group.KeyboardButtonRequestManagedBot (KeyboardButtonRequestManagedBot (..), mkKeyboardButtonRequestManagedBot)
import Telegram.Bot.Internal.Group.KeyboardButtonRequestUsers (KeyboardButtonRequestUsers (..), mkKeyboardButtonRequestUsers)
import Telegram.Bot.Internal.Group.LabeledPrice (LabeledPrice (..), mkLabeledPrice)
import Telegram.Bot.Internal.Group.Link (Link (..), mkLink)
import Telegram.Bot.Internal.Group.LinkPreviewOptions (LinkPreviewOptions (..), mkLinkPreviewOptions)
import Telegram.Bot.Internal.Group.LivePhoto (LivePhoto (..), mkLivePhoto)
import Telegram.Bot.Internal.Group.Location (Location (..), mkLocation)
import Telegram.Bot.Internal.Group.LocationAddress (LocationAddress (..), mkLocationAddress)
import Telegram.Bot.Internal.Group.LoginUrl (LoginUrl (..), mkLoginUrl)
import Telegram.Bot.Internal.Group.ManagedBotCreated (ManagedBotCreated (..), mkManagedBotCreated)
import Telegram.Bot.Internal.Group.ManagedBotUpdated (ManagedBotUpdated (..), mkManagedBotUpdated)
import Telegram.Bot.Internal.Group.MaskPosition (MaskPosition (..), mkMaskPosition)
import Telegram.Bot.Internal.Group.MediaGroupItem (MediaGroupItem (..))
import Telegram.Bot.Internal.Group.MenuButton (MenuButton (..))
import Telegram.Bot.Internal.Group.MenuButtonCommands (MenuButtonCommands (..), mkMenuButtonCommands)
import Telegram.Bot.Internal.Group.MenuButtonDefault (MenuButtonDefault (..), mkMenuButtonDefault)
import Telegram.Bot.Internal.Group.MenuButtonWebApp (MenuButtonWebApp (..), mkMenuButtonWebApp)
import Telegram.Bot.Internal.Group.MessageAutoDeleteTimerChanged (MessageAutoDeleteTimerChanged (..), mkMessageAutoDeleteTimerChanged)
import Telegram.Bot.Internal.Group.MessageEntity (MessageEntity (..), mkMessageEntity)
import Telegram.Bot.Internal.Group.MessageGenerationStopped (MessageGenerationStopped (..), mkMessageGenerationStopped)
import Telegram.Bot.Internal.Group.MessageId (MessageId (..), mkMessageId)
import Telegram.Bot.Internal.Group.MessageOrTrue (MessageOrTrue (..))
import Telegram.Bot.Internal.Group.MessageOrigin (MessageOrigin (..))
import Telegram.Bot.Internal.Group.MessageOriginChannel (MessageOriginChannel (..), mkMessageOriginChannel)
import Telegram.Bot.Internal.Group.MessageOriginChat (MessageOriginChat (..), mkMessageOriginChat)
import Telegram.Bot.Internal.Group.MessageOriginHiddenUser (MessageOriginHiddenUser (..), mkMessageOriginHiddenUser)
import Telegram.Bot.Internal.Group.MessageOriginUser (MessageOriginUser (..), mkMessageOriginUser)
import Telegram.Bot.Internal.Group.MessageReactionCountUpdated (MessageReactionCountUpdated (..), mkMessageReactionCountUpdated)
import Telegram.Bot.Internal.Group.MessageReactionUpdated (MessageReactionUpdated (..), mkMessageReactionUpdated)
import Telegram.Bot.Internal.Group.OrderInfo (OrderInfo (..), mkOrderInfo)
import Telegram.Bot.Internal.Group.OwnedGift (OwnedGift (..))
import Telegram.Bot.Internal.Group.OwnedGiftRegular (OwnedGiftRegular (..), mkOwnedGiftRegular)
import Telegram.Bot.Internal.Group.OwnedGiftUnique (OwnedGiftUnique (..), mkOwnedGiftUnique)
import Telegram.Bot.Internal.Group.OwnedGifts (OwnedGifts (..), mkOwnedGifts)
import Telegram.Bot.Internal.Group.PaidMedia (PaidMedia (..))
import Telegram.Bot.Internal.Group.PaidMediaInfo (PaidMediaInfo (..), mkPaidMediaInfo)
import Telegram.Bot.Internal.Group.PaidMediaLivePhoto (PaidMediaLivePhoto (..), mkPaidMediaLivePhoto)
import Telegram.Bot.Internal.Group.PaidMediaPhoto (PaidMediaPhoto (..), mkPaidMediaPhoto)
import Telegram.Bot.Internal.Group.PaidMediaPreview (PaidMediaPreview (..), mkPaidMediaPreview)
import Telegram.Bot.Internal.Group.PaidMediaPurchased (PaidMediaPurchased (..), mkPaidMediaPurchased)
import Telegram.Bot.Internal.Group.PaidMediaVideo (PaidMediaVideo (..), mkPaidMediaVideo)
import Telegram.Bot.Internal.Group.PaidMessagePriceChanged (PaidMessagePriceChanged (..), mkPaidMessagePriceChanged)
import Telegram.Bot.Internal.Group.PassportData (PassportData (..), mkPassportData)
import Telegram.Bot.Internal.Group.PassportElementError (PassportElementError (..))
import Telegram.Bot.Internal.Group.PassportElementErrorDataField (PassportElementErrorDataField (..), mkPassportElementErrorDataField)
import Telegram.Bot.Internal.Group.PassportElementErrorFile (PassportElementErrorFile (..), mkPassportElementErrorFile)
import Telegram.Bot.Internal.Group.PassportElementErrorFiles (PassportElementErrorFiles (..), mkPassportElementErrorFiles)
import Telegram.Bot.Internal.Group.PassportElementErrorFrontSide (PassportElementErrorFrontSide (..), mkPassportElementErrorFrontSide)
import Telegram.Bot.Internal.Group.PassportElementErrorReverseSide (PassportElementErrorReverseSide (..), mkPassportElementErrorReverseSide)
import Telegram.Bot.Internal.Group.PassportElementErrorSelfie (PassportElementErrorSelfie (..), mkPassportElementErrorSelfie)
import Telegram.Bot.Internal.Group.PassportElementErrorTranslationFile (PassportElementErrorTranslationFile (..), mkPassportElementErrorTranslationFile)
import Telegram.Bot.Internal.Group.PassportElementErrorTranslationFiles (PassportElementErrorTranslationFiles (..), mkPassportElementErrorTranslationFiles)
import Telegram.Bot.Internal.Group.PassportElementErrorUnspecified (PassportElementErrorUnspecified (..), mkPassportElementErrorUnspecified)
import Telegram.Bot.Internal.Group.PassportFile (PassportFile (..), mkPassportFile)
import Telegram.Bot.Internal.Group.PhotoSize (PhotoSize (..), mkPhotoSize)
import Telegram.Bot.Internal.Group.Poll (Poll (..), mkPoll)
import Telegram.Bot.Internal.Group.PollAnswer (PollAnswer (..), mkPollAnswer)
import Telegram.Bot.Internal.Group.PollMedia (PollMedia (..), mkPollMedia)
import Telegram.Bot.Internal.Group.PollOption (PollOption (..), mkPollOption)
import Telegram.Bot.Internal.Group.PreCheckoutQuery (PreCheckoutQuery (..), mkPreCheckoutQuery)
import Telegram.Bot.Internal.Group.PreparedInlineMessage (PreparedInlineMessage (..), mkPreparedInlineMessage)
import Telegram.Bot.Internal.Group.PreparedKeyboardButton (PreparedKeyboardButton (..), mkPreparedKeyboardButton)
import Telegram.Bot.Internal.Group.ProximityAlertTriggered (ProximityAlertTriggered (..), mkProximityAlertTriggered)
import Telegram.Bot.Internal.Group.ReactionCount (ReactionCount (..), mkReactionCount)
import Telegram.Bot.Internal.Group.ReactionType (ReactionType (..))
import Telegram.Bot.Internal.Group.ReactionTypeCustomEmoji (ReactionTypeCustomEmoji (..), mkReactionTypeCustomEmoji)
import Telegram.Bot.Internal.Group.ReactionTypeEmoji (ReactionTypeEmoji (..), mkReactionTypeEmoji)
import Telegram.Bot.Internal.Group.ReactionTypePaid (ReactionTypePaid (..), mkReactionTypePaid)
import Telegram.Bot.Internal.Group.RefundedPayment (RefundedPayment (..), mkRefundedPayment)
import Telegram.Bot.Internal.Group.ReplyKeyboardMarkup (ReplyKeyboardMarkup (..), mkReplyKeyboardMarkup)
import Telegram.Bot.Internal.Group.ReplyKeyboardRemove (ReplyKeyboardRemove (..), mkReplyKeyboardRemove)
import Telegram.Bot.Internal.Group.ReplyMarkup (ReplyMarkup (..))
import Telegram.Bot.Internal.Group.ReplyParameters (ReplyParameters (..), mkReplyParameters)
import Telegram.Bot.Internal.Group.ResponseParameters (ResponseParameters (..), mkResponseParameters)
import Telegram.Bot.Internal.Group.RevenueWithdrawalState (RevenueWithdrawalState (..))
import Telegram.Bot.Internal.Group.RevenueWithdrawalStateFailed (RevenueWithdrawalStateFailed (..), mkRevenueWithdrawalStateFailed)
import Telegram.Bot.Internal.Group.RevenueWithdrawalStatePending (RevenueWithdrawalStatePending (..), mkRevenueWithdrawalStatePending)
import Telegram.Bot.Internal.Group.RevenueWithdrawalStateSucceeded (RevenueWithdrawalStateSucceeded (..), mkRevenueWithdrawalStateSucceeded)
import Telegram.Bot.Internal.Group.RichBlock (RichBlock (..), RichBlockBlockQuotation (..), RichBlockCollage (..), RichBlockDetails (..), RichBlockList (..), RichBlockListItem (..), RichBlockSlideshow (..), mkRichBlockBlockQuotation, mkRichBlockCollage, mkRichBlockDetails, mkRichBlockList, mkRichBlockListItem, mkRichBlockSlideshow)
import Telegram.Bot.Internal.Group.RichBlockAnchor (RichBlockAnchor (..), mkRichBlockAnchor)
import Telegram.Bot.Internal.Group.RichBlockAnimation (RichBlockAnimation (..), mkRichBlockAnimation)
import Telegram.Bot.Internal.Group.RichBlockAudio (RichBlockAudio (..), mkRichBlockAudio)
import Telegram.Bot.Internal.Group.RichBlockButtons (RichBlockButtons (..), mkRichBlockButtons)
import Telegram.Bot.Internal.Group.RichBlockCaption (RichBlockCaption (..), mkRichBlockCaption)
import Telegram.Bot.Internal.Group.RichBlockDivider (RichBlockDivider (..), mkRichBlockDivider)
import Telegram.Bot.Internal.Group.RichBlockDocument (RichBlockDocument (..), mkRichBlockDocument)
import Telegram.Bot.Internal.Group.RichBlockExpandableBlockQuotation (RichBlockExpandableBlockQuotation (..), mkRichBlockExpandableBlockQuotation)
import Telegram.Bot.Internal.Group.RichBlockFooter (RichBlockFooter (..), mkRichBlockFooter)
import Telegram.Bot.Internal.Group.RichBlockMap (RichBlockMap (..), mkRichBlockMap)
import Telegram.Bot.Internal.Group.RichBlockMathematicalExpression (RichBlockMathematicalExpression (..), mkRichBlockMathematicalExpression)
import Telegram.Bot.Internal.Group.RichBlockParagraph (RichBlockParagraph (..), mkRichBlockParagraph)
import Telegram.Bot.Internal.Group.RichBlockPhoto (RichBlockPhoto (..), mkRichBlockPhoto)
import Telegram.Bot.Internal.Group.RichBlockPreformatted (RichBlockPreformatted (..), mkRichBlockPreformatted)
import Telegram.Bot.Internal.Group.RichBlockPullQuotation (RichBlockPullQuotation (..), mkRichBlockPullQuotation)
import Telegram.Bot.Internal.Group.RichBlockSectionHeading (RichBlockSectionHeading (..), mkRichBlockSectionHeading)
import Telegram.Bot.Internal.Group.RichBlockTable (RichBlockTable (..), mkRichBlockTable)
import Telegram.Bot.Internal.Group.RichBlockTableCell (RichBlockTableCell (..), mkRichBlockTableCell)
import Telegram.Bot.Internal.Group.RichBlockThinking (RichBlockThinking (..), mkRichBlockThinking)
import Telegram.Bot.Internal.Group.RichBlockVideo (RichBlockVideo (..), mkRichBlockVideo)
import Telegram.Bot.Internal.Group.RichBlockVoiceNote (RichBlockVoiceNote (..), mkRichBlockVoiceNote)
import Telegram.Bot.Internal.Group.RichMessage (RichMessage (..), mkRichMessage)
import Telegram.Bot.Internal.Group.RichMessageButton (RichMessageButton (..), RichText (..), RichTextAnchorLink (..), RichTextBankCardNumber (..), RichTextBold (..), RichTextBotCommand (..), RichTextButton (..), RichTextCashtag (..), RichTextCode (..), RichTextDateTime (..), RichTextEmailAddress (..), RichTextHashtag (..), RichTextItalic (..), RichTextMarked (..), RichTextMention (..), RichTextPhoneNumber (..), RichTextReference (..), RichTextReferenceLink (..), RichTextSpoiler (..), RichTextStrikethrough (..), RichTextSubscript (..), RichTextSuperscript (..), RichTextTextMention (..), RichTextUnderline (..), RichTextUrl (..), mkRichMessageButton, mkRichTextAnchorLink, mkRichTextBankCardNumber, mkRichTextBold, mkRichTextBotCommand, mkRichTextButton, mkRichTextCashtag, mkRichTextCode, mkRichTextDateTime, mkRichTextEmailAddress, mkRichTextHashtag, mkRichTextItalic, mkRichTextMarked, mkRichTextMention, mkRichTextPhoneNumber, mkRichTextReference, mkRichTextReferenceLink, mkRichTextSpoiler, mkRichTextStrikethrough, mkRichTextSubscript, mkRichTextSuperscript, mkRichTextTextMention, mkRichTextUnderline, mkRichTextUrl)
import Telegram.Bot.Internal.Group.RichMessageMedia (RichMessageMedia (..))
import Telegram.Bot.Internal.Group.RichTextAnchor (RichTextAnchor (..), mkRichTextAnchor)
import Telegram.Bot.Internal.Group.RichTextCustomEmoji (RichTextCustomEmoji (..), mkRichTextCustomEmoji)
import Telegram.Bot.Internal.Group.RichTextMathematicalExpression (RichTextMathematicalExpression (..), mkRichTextMathematicalExpression)
import Telegram.Bot.Internal.Group.SentGuestMessage (SentGuestMessage (..), mkSentGuestMessage)
import Telegram.Bot.Internal.Group.SentWebAppMessage (SentWebAppMessage (..), mkSentWebAppMessage)
import Telegram.Bot.Internal.Group.SharedUser (SharedUser (..), mkSharedUser)
import Telegram.Bot.Internal.Group.ShippingAddress (ShippingAddress (..), mkShippingAddress)
import Telegram.Bot.Internal.Group.ShippingOption (ShippingOption (..), mkShippingOption)
import Telegram.Bot.Internal.Group.ShippingQuery (ShippingQuery (..), mkShippingQuery)
import Telegram.Bot.Internal.Group.StarAmount (StarAmount (..), mkStarAmount)
import Telegram.Bot.Internal.Group.StarTransaction (StarTransaction (..), mkStarTransaction)
import Telegram.Bot.Internal.Group.StarTransactions (StarTransactions (..), mkStarTransactions)
import Telegram.Bot.Internal.Group.Sticker (Sticker (..), mkSticker)
import Telegram.Bot.Internal.Group.StickerSet (StickerSet (..), mkStickerSet)
import Telegram.Bot.Internal.Group.Story (Story (..), mkStory)
import Telegram.Bot.Internal.Group.StoryArea (StoryArea (..), mkStoryArea)
import Telegram.Bot.Internal.Group.StoryAreaPosition (StoryAreaPosition (..), mkStoryAreaPosition)
import Telegram.Bot.Internal.Group.StoryAreaType (StoryAreaType (..))
import Telegram.Bot.Internal.Group.StoryAreaTypeLink (StoryAreaTypeLink (..), mkStoryAreaTypeLink)
import Telegram.Bot.Internal.Group.StoryAreaTypeLocation (StoryAreaTypeLocation (..), mkStoryAreaTypeLocation)
import Telegram.Bot.Internal.Group.StoryAreaTypeSuggestedReaction (StoryAreaTypeSuggestedReaction (..), mkStoryAreaTypeSuggestedReaction)
import Telegram.Bot.Internal.Group.StoryAreaTypeUniqueGift (StoryAreaTypeUniqueGift (..), mkStoryAreaTypeUniqueGift)
import Telegram.Bot.Internal.Group.StoryAreaTypeWeather (StoryAreaTypeWeather (..), mkStoryAreaTypeWeather)
import Telegram.Bot.Internal.Group.SuccessfulPayment (SuccessfulPayment (..), mkSuccessfulPayment)
import Telegram.Bot.Internal.Group.SuggestedPostInfo (SuggestedPostInfo (..), mkSuggestedPostInfo)
import Telegram.Bot.Internal.Group.SuggestedPostParameters (SuggestedPostParameters (..), mkSuggestedPostParameters)
import Telegram.Bot.Internal.Group.SuggestedPostPrice (SuggestedPostPrice (..), mkSuggestedPostPrice)
import Telegram.Bot.Internal.Group.SwitchInlineQueryChosenChat (SwitchInlineQueryChosenChat (..), mkSwitchInlineQueryChosenChat)
import Telegram.Bot.Internal.Group.TextQuote (TextQuote (..), mkTextQuote)
import Telegram.Bot.Internal.Group.TransactionPartner (TransactionPartner (..))
import Telegram.Bot.Internal.Group.TransactionPartnerAffiliateProgram (TransactionPartnerAffiliateProgram (..), mkTransactionPartnerAffiliateProgram)
import Telegram.Bot.Internal.Group.TransactionPartnerChat (TransactionPartnerChat (..), mkTransactionPartnerChat)
import Telegram.Bot.Internal.Group.TransactionPartnerFragment (TransactionPartnerFragment (..), mkTransactionPartnerFragment)
import Telegram.Bot.Internal.Group.TransactionPartnerOther (TransactionPartnerOther (..), mkTransactionPartnerOther)
import Telegram.Bot.Internal.Group.TransactionPartnerTelegramAds (TransactionPartnerTelegramAds (..), mkTransactionPartnerTelegramAds)
import Telegram.Bot.Internal.Group.TransactionPartnerTelegramApi (TransactionPartnerTelegramApi (..), mkTransactionPartnerTelegramApi)
import Telegram.Bot.Internal.Group.TransactionPartnerUser (TransactionPartnerUser (..), mkTransactionPartnerUser)
import Telegram.Bot.Internal.Group.UniqueGift (UniqueGift (..), mkUniqueGift)
import Telegram.Bot.Internal.Group.UniqueGiftBackdrop (UniqueGiftBackdrop (..), mkUniqueGiftBackdrop)
import Telegram.Bot.Internal.Group.UniqueGiftBackdropColors (UniqueGiftBackdropColors (..), mkUniqueGiftBackdropColors)
import Telegram.Bot.Internal.Group.UniqueGiftColors (UniqueGiftColors (..), mkUniqueGiftColors)
import Telegram.Bot.Internal.Group.UniqueGiftInfo (UniqueGiftInfo (..), mkUniqueGiftInfo)
import Telegram.Bot.Internal.Group.UniqueGiftModel (UniqueGiftModel (..), mkUniqueGiftModel)
import Telegram.Bot.Internal.Group.UniqueGiftSymbol (UniqueGiftSymbol (..), mkUniqueGiftSymbol)
import Telegram.Bot.Internal.Group.Update (Update (..), mkUpdate)
import Telegram.Bot.Internal.Group.User (User (..), mkUser)
import Telegram.Bot.Internal.Group.UserChatBoosts (UserChatBoosts (..), mkUserChatBoosts)
import Telegram.Bot.Internal.Group.UserProfileAudios (UserProfileAudios (..), mkUserProfileAudios)
import Telegram.Bot.Internal.Group.UserProfilePhotos (UserProfilePhotos (..), mkUserProfilePhotos)
import Telegram.Bot.Internal.Group.UserRating (UserRating (..), mkUserRating)
import Telegram.Bot.Internal.Group.UsersShared (UsersShared (..), mkUsersShared)
import Telegram.Bot.Internal.Group.Venue (Venue (..), mkVenue)
import Telegram.Bot.Internal.Group.Video (Video (..), mkVideo)
import Telegram.Bot.Internal.Group.VideoChatEnded (VideoChatEnded (..), mkVideoChatEnded)
import Telegram.Bot.Internal.Group.VideoChatParticipantsInvited (VideoChatParticipantsInvited (..), mkVideoChatParticipantsInvited)
import Telegram.Bot.Internal.Group.VideoChatScheduled (VideoChatScheduled (..), mkVideoChatScheduled)
import Telegram.Bot.Internal.Group.VideoChatStarted (VideoChatStarted (..), mkVideoChatStarted)
import Telegram.Bot.Internal.Group.VideoNote (VideoNote (..), mkVideoNote)
import Telegram.Bot.Internal.Group.VideoQuality (VideoQuality (..), mkVideoQuality)
import Telegram.Bot.Internal.Group.Voice (Voice (..), mkVoice)
import Telegram.Bot.Internal.Group.WebAppData (WebAppData (..), mkWebAppData)
import Telegram.Bot.Internal.Group.WebAppInfo (WebAppInfo (..), mkWebAppInfo)
import Telegram.Bot.Internal.Group.WebhookInfo (WebhookInfo (..), mkWebhookInfo)
import Telegram.Bot.Internal.Group.WriteAccessAllowed (WriteAccessAllowed (..), mkWriteAccessAllowed)
import Telegram.Bot.Support (InputFile (..), TrueValue (..), UploadSource (..))

