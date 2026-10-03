{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE OverloadedStrings #-}

-- | What the wizard says back to what a user does: the message guard chain, the two
-- @users_shared@ answers, and the inline share answer. Every answer posts into the room the message
-- arrived in.
module Wizard.Answers (answer, answerInline) where

import Control.Monad (forM_, unless, void)
import Control.Monad.Trans.Reader (asks)
import Data.Maybe (fromMaybe, listToMaybe, mapMaybe)
import Data.Text (Text)
import Data.Text qualified as Text
import Data.Text.Encoding qualified as Text.Encoding
import Network.HTTP.Types.URI (urlEncode)
import Telegram.Bot.Methods.AnswerInlineQuery qualified as AnswerInlineQuery
import Telegram.Bot.Methods.DeleteMessage qualified as DeleteMessage
import Telegram.Bot.Methods.GetChat qualified as GetChat
import Telegram.Bot.Methods.SendMessage qualified as SendMessage
import Telegram.Bot.Methods.SendRichMessage qualified as SendRichMessage
import Telegram.Bot.Types (ChatShared (..), Contact (..), InlineQuery (..), InlineQueryResult (..),
  InputMessageContent (..), Location (..), Message (..), SharedUser (..), UsersShared (..),
  mkInlineKeyboardMarkup, mkInlineQueryResultArticle, mkInputTextMessageContent)
import Telegram.Bot.Types qualified as Article (InlineQueryResultArticle (..))
import Wizard.Bot (Bot, Env (..), echo, onSession, session, tshow)
import Wizard.Call (accepted, call, compact, field, messageTo, post, rawOf, richTo)
import Wizard.Card (showMenu)
import Wizard.Exhibit (copy, inline, inviteLink, inviteLinkFor, inviteText, knownContactsId, link, removeKb,
  richMarkdown, shareLinkId, tell)
import Wizard.Types (ChatId (..), Room (..), Session (..), carded, chatArg, numberOfMessage)

-- | What the wizard answers one message with, in the room it arrived in.
answer :: Message -> Text -> Bot ()
answer message body
  | "/start" `Text.isPrefixOf` body = onStart message
  | Just card <- message.contact =
      echo ("<- contact: " <> card.first_name <> " " <> card.phone_number <> " user_id=" <> maybe "none" tshow card.user_id)
  | Just place <- message.location =
      echo ("<- location: " <> tshow place.latitude <> ", " <> tshow place.longitude)
  | Just shared <- message.users_shared = onUsersShared shared
  | Just shared <- message.chat_shared = onChatShared shared
  | not (Text.null body) = echo ("<- text: " <> tshow body)
  | otherwise = pure ()

-- | A fresh @\/start@ replaces the room's card: the old one is deleted best-effort, so a START button
-- press plus a typed @\/start@ still nets one menu. Other rooms are untouched.
onStart :: Message -> Bot ()
onStart message = do
  -- The message's own Telegram date tells a client duplicate (same second) from two user actions.
  echo ("<- /start (id " <> tshow message.message_id <> ", telegram date " <> tshow message.date <> ")")
  room <- asks (.here)
  current <- session
  forM_ current.card $ \identifier ->
    void (call (DeleteMessage.mkDeleteMessage (chatArg room.chat) (numberOfMessage identifier)))
  onSession (\held -> (carded Nothing held, ()))
  showMenu

-- | The @chat_shared@ echo: what the picker handed back, on the phone as well as in the terminal.
onChatShared :: ChatShared -> Bot ()
onChatShared shared = do
  let title = fromMaybe "(no title)" shared.title
      at = maybe "" (" @" <>) (nonEmpty shared.username)
      spoken =
        "The bot received chat_shared, request_id=" <> tshow shared.request_id
          <> ": " <> title <> at
          <> " (chat_id " <> tshow shared.chat_id <> ")"
  echo ("<- " <> tshow spoken)
  tell spoken

-- | Which answer a picker's @request_id@ asks for.
onUsersShared :: UsersShared -> Bot ()
onUsersShared shared
  | shared.request_id == knownContactsId = onKnownContacts shared.users
  | shared.request_id == shareLinkId = onShareLink (listToMaybe shared.users)
  | otherwise = do
      let spoken =
            "The bot received users_shared, request_id=" <> tshow shared.request_id <> ":\n"
              <> Text.intercalate "\n" (map describe shared.users)
          describe picked =
            "• " <> pickedName picked "(name not requested)" <> maybe "" (" @" <>) (nonEmpty picked.username)
              <> " (id " <> tshow picked.user_id
              <> (case picked.photo of Just (_ : _) -> ", photo included"; _ -> "")
              <> ")"
      echo ("<- " <> tshow spoken)
      tell spoken

-- | The known-contacts report: one line per picked contact, with a real reachability check, since @getChat@
-- resolves only users the bot has met.
onKnownContacts :: [SharedUser] -> Bot ()
onKnownContacts picked = do
  room <- asks (.here)
  reported <- mapM line' picked
  void
    ( post
        room.chat
        ( richTo
            room
            ( richMarkdown
                ( "Picked contacts (a name is clickable when the platform can resolve it):\n\n"
                    <> Text.intercalate "\n" reported
                )
            )
        )
          {SendRichMessage.reply_markup = Just removeKb}
    )
  where
    line' person = do
      known <- call (GetChat.mkGetChat (chatArg (ChatId person.user_id)))
      let told
            | accepted known = "known to the bot (getChat resolves them)"
            | otherwise = "not met yet (getChat refuses)"
      -- Every name is composed as a mention; the server keeps the ones it can resolve (known users
      -- become clickable by name) and flattens the rest.
      pure
        ( "- [" <> pickedName person "(no name)" <> "](tg://user?id=" <> tshow person.user_id <> ")"
            <> maybe "" (" @" <>) (nonEmpty person.username)
            <> " (id " <> tshow person.user_id <> "): " <> told
        )

-- | The user-link answer: the picked person as a tappable mention in a rich message. @tg:\/\/user?id@
-- resolves on clients that know the user (the client of whoever picked them does); @t.me\/username@ rides
-- alongside when one exists.
onShareLink :: Maybe SharedUser -> Bot ()
onShareLink Nothing = pure ()
onShareLink (Just picked) = do
  room <- asks (.here)
  invite <- inviteLink
  let name = pickedName picked "your contact"
      handle = nonEmpty picked.username
      mention = "[" <> name <> "](tg://user?id=" <> tshow picked.user_id <> ")"
      also = maybe "" (\user -> " (or via https://t.me/" <> user <> ")") handle
  sent <-
    post
      room.chat
      ( richTo
          room
          ( richMarkdown
              ("**To send it yourself:** first tap *Copy invite*, then tap " <> mention <> also <> " to open their chat and paste.")
          )
      )
        { SendRichMessage.reply_markup =
            Just (inline [[copy "Copy invite" ("Hi " <> name <> "! " <> inviteText <> " " <> invite)]])
        }
  -- A tg://user mention of a user the bot has never met is silently dropped server-side (the picker
  -- grants identity, not access), so the echoed rich_message is searched as raw JSON for a surviving
  -- text_mention entity rather than leaving a flat name.
  let survived = maybe False (\raw -> "text_mention" `Text.isInfixOf` compact (field "rich_message" raw)) (rawOf sent)
  unless survived $ do
    let note = case handle of
          Just _ ->
            "The id-mention was dropped (the bot has not met " <> name <> " yet), so the tappable path is the username link above."
          Nothing ->
            "The id-mention was dropped (the bot has not met "
              <> name
              <> " yet) and they have no username, so no clickable link can be made for them. "
              <> "Use the share picker instead:"
        share =
          "https://t.me/share/url?url=" <> urlEncoded invite <> "&text=" <> urlEncoded ("Hi " <> name <> "! " <> inviteText)
        extra = case handle of
          Just _ -> Nothing
          Nothing -> Just (inline [[link "Share the invite" share]])
    void (post room.chat (messageTo room note) {SendMessage.reply_markup = extra})

-- | The inline share flow's answer: an invite the user sends into whichever chat they picked.
-- It is sent by them via the bot, so the wizard cannot sweep it there, which is the point: it is a
-- real message in someone else's chat.
answerInline :: InlineQuery -> Bot ()
answerInline query = do
  fallback <- inviteLink
  let asked = Text.strip query.query
      token = maybe "" Text.strip (Text.stripPrefix "invite " asked)
  target <- if Text.null token then pure fallback else inviteLinkFor token
  let article =
        ( mkInlineQueryResultArticle
            (if Text.null token then "invite" else token)
            "Invite to this bot"
            (InputMessageContentViaInputTextMessageContent (mkInputTextMessageContent (inviteText <> " " <> target)))
        )
          { Article.description = Just "Share this bot"
          , Article.reply_markup = Just (mkInlineKeyboardMarkup [[link "Open the bot" target]])
          }
  void
    ( call
        (AnswerInlineQuery.mkAnswerInlineQuery query.id [InlineQueryResultViaInlineQueryResultArticle article])
          { AnswerInlineQuery.cache_time = Just 1
          , AnswerInlineQuery.is_personal = Just True
          }
    )

-- | An optional string with the empty one folded into absence, since a field Telegram omits and a field
-- it sends empty mean the same thing here.
nonEmpty :: Maybe Text -> Maybe Text
nonEmpty = \case
  Just given | not (Text.null given) -> Just given
  _ -> Nothing

-- | A picked contact's name, or the caller's stand-in when the picker was not asked for one.
pickedName :: SharedUser -> Text -> Text
pickedName picked fallback = case mapMaybe nonEmpty [picked.first_name, picked.last_name] of
  [] -> fallback
  parts -> Text.unwords parts

urlEncoded :: Text -> Text
urlEncoded = Text.Encoding.decodeUtf8 . urlEncode True . Text.Encoding.encodeUtf8
