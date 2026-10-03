{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE OverloadedStrings #-}

-- | Buttons inside a rich message, new in Bot API 10.3: a button ROW block (@\<tg-button-row\>@) and a button
-- in the text flow (@\<tg-button\>@), whose label is itself rich text. Markdown has no spelling of its own,
-- so the HTML tags embed in it; the verdict is the ECHOED tree read from the raw result, never @ok: true@.
module Wizard.Scenarios.RichButtons (richButtons) where

import Control.Monad (void, zipWithM)
import Control.Monad.Trans.Reader (asks)
import Data.Aeson (Object, Value (..))
import Data.Aeson.KeyMap qualified as KeyMap
import Data.Foldable (toList)
import Data.Maybe (fromMaybe, isJust)
import Data.Text (Text)
import Data.Text qualified as Text
import Telegram.Bot.Methods.EditMessageText qualified as EditMessageText
import Telegram.Bot.Methods.SendRichMessage qualified as SendRichMessage
import Telegram.Bot.Types (InputRichBlock (..), Message (..), MessageOrTrue (..), RichText (..),
                               mkCopyTextButton, mkDisabledButton, mkInputRichBlockButtons,
                               mkInputRichBlockParagraph, mkRichMessageButton, mkRichTextButton,
                               mkRichTextDateTime)
import Telegram.Bot.Types qualified as Button (RichMessageButton (..))
import Telegram.Bot.Types qualified as ButtonsBlock (InputRichBlockButtons (..))
import Wizard.Bot (Bot, Env (..), echo, quoted, tshow)
import Wizard.Call (Reply (..), arrayAt, call, compact, emptyObject, field, hasKey, post, remember, retire,
                    richTo, setback, standing, textAt, textOf, wireKeys, withRaw)
import Wizard.Exhibit (Scenario, scenario, step, bySend, demo, inline, richBlocks, richHtml, richMarkdown, richOut, sendRich, tell,
                       tinted, unixNow, utc, verdict)
import Wizard.Types (Posted (..), Room (..), ScenarioKey (..), Slot (..), chatArg, numberOfMessage, slotWord)

-- | The @rich_buttons@ menu entry.
richButtons :: Scenario
richButtons =
  scenario
    RichButtons
    "Rich message buttons (10.3)"
    [ step
        "Buttons INSIDE a rich message, new in Bot API 10.3. Two button ROW blocks under a \
        \sentence (HTML): the three tinted callbacks a card would carry, then a url, a \
        \copy_text, a callback in the borderless 'link' style, and a disabled button. \
        \Presses toast. The verdict message lists what the API echoed back."
        rows
    , step
        "Buttons IN the sentence: two link-styled callbacks as the verbs of a line ('Book it' \
        \or 'let it go'), then a primary callback whose label carries a date-time entity and \
        \a custom emoji. Judge whether a tappable verb inside prose reads as the bot's \
        \sentence or as a control."
        inlineFlow
    , step
        "Rows embedded in MARKDOWN (the HTML tags are the only spelling): one button left, two \
        \center, three right, then eight in one row, the documented cap. Watch how a full row \
        \fits the bubble width."
        alignAndWidth
    , step
        "The BLOCKS form, the typed spelling code would mint: a paragraph with an inline \
        \button, then a centered row with a date-time entity inside a label, a copy button, \
        \and a disabled button as the empty object."
        blocksForm
    , step
        "The step that decides it for a live card: the standing exhibit refilled in place \
        \through editMessageText with rich_message (also 10.3), the Accept row replaced by a \
        \disabled receipt plus one Change button. The buttons must come back on the edited \
        \message, or a rich card cannot live through its states."
        editInPlace
    , step
        "A rich message carrying its own button row AND a reply_markup inline keyboard: where \
        \each lands, and whether the API takes both on one message."
        withReplyMarkup
    , step
        "The edges, each its own send: nine buttons in a row (the cap is eight), the 'link' \
        \style on a url button (callback-only by the docs), a login_url with no domain \
        \registered, a web_app button (private chats only), and a chosen-chat inline query. \
        \One verdict message reports every outcome; refusals also flag as ⚠ notices."
        edges
    ]

-- | Two button ROW blocks: tinted callbacks, then url, copy_text, link-styled and disabled buttons.
rows :: Bot ()
rows = do
  let html =
        "<p>Your Thursday slot is held until tomorrow evening.</p>"
          <> row
            [ callbackTag "Accept" "accept" "success"
            , callbackTag "Decline" "decline" "danger"
            , callbackTag "Later" "later" "primary"
            ]
          <> row
            [ buttonTag "example.com" [("type", Just "url"), ("url", Just "https://example.com")]
            , buttonTag "Copy code" [("type", Just "copy_text"), ("text", Just "CODE-1234")]
            , callbackTag "as a link" "link" "link"
            , buttonTag "Disabled" [("type", Just "disabled")]
            ]
  sent <- richOut Rich (richHtml html)
  void (buttonVerdict "Button rows (HTML)" (Just 7) (bySend sent))

-- | Buttons in the text flow, the last with a date-time entity and a custom emoji inside its label.
inlineFlow :: Bot ()
inlineFlow = do
  unix <- (+ 86400) <$> unixNow
  let label =
        "Hold until <tg-time unix=\"" <> tshow unix <> "\" format=\"wDt\">" <> utc unix
          <> "</tg-time> <tg-emoji emoji-id=\"5368324170671202286\"></tg-emoji>"
      html =
        "<p>Your Thursday slot is held. " <> callbackTag "Book it" "book" "link" <> " or "
          <> callbackTag "let it go" "release" "link" <> ", and a label can carry entities: "
          <> callbackTag label "when" "primary" <> "</p>"
  sent <- richOut Rich (richHtml html)
  void (buttonVerdict "Inline buttons in the flow (HTML)" (Just 3) (bySend sent))

-- | Rows embedded in markdown: one left, two center, three right, then eight in one row, the documented cap.
alignAndWidth :: Bot ()
alignAndWidth = do
  let named align labels = rowAligned align [callbackTag name (Text.toLower name) "" | name <- labels]
      markdown =
        Text.intercalate
          "\n\n"
          [ "**Alignment and width**, rows embedded in markdown:"
          , "One, left:"
          , named "left" ["Left"]
          , "Two, center:"
          , named "center" ["Yes", "No"]
          , "Three, right:"
          , named "right" ["Red", "Green", "Blue"]
          , "Eight in one row, the documented cap, no align:"
          , row [callbackTag (tshow n) ("n" <> tshow n) "" | n <- [1 .. 8 :: Int]]
          ]
  sent <- richOut Rich (richMarkdown markdown)
  void (buttonVerdict "Alignment and width (markdown)" (Just 14) (bySend sent))

-- | The same shapes in the blocks form, the typed spelling code would mint.
blocksForm :: Bot ()
blocksForm = do
  unix <- (+ 86400) <$> unixNow
  let flowButton =
        (mkRichMessageButton (RichTextViaString "link button"))
          {Button.style = Just "link", Button.callback_data = Just "demo:blocks-inline"}
      accept =
        (mkRichMessageButton (RichTextViaString "Accept"))
          {Button.style = Just "success", Button.callback_data = Just "demo:blocks-accept"}
      holdLabel =
        RichTextViaArray
          [ RichTextViaString "Hold until "
          , RichTextViaRichTextDateTime (mkRichTextDateTime (RichTextViaString (utc unix)) unix "wDt")
          ]
      hold =
        (mkRichMessageButton holdLabel)
          {Button.style = Just "primary", Button.callback_data = Just "demo:blocks-hold"}
      copied =
        (mkRichMessageButton (RichTextViaString "Copy"))
          {Button.copy_text = Just (mkCopyTextButton "CODE-1234")}
      disabled =
        (mkRichMessageButton (RichTextViaString "Disabled")) {Button.disabled = Just mkDisabledButton}
      blocks =
        [ InputRichBlockViaInputRichBlockParagraph
            ( mkInputRichBlockParagraph
                ( RichTextViaArray
                    [ RichTextViaString "Blocks form: an inline "
                    , RichTextViaRichTextButton (mkRichTextButton flowButton)
                    , RichTextViaString " in the sentence, then a centered row."
                    ]
                )
            )
        , InputRichBlockViaInputRichBlockButtons
            (mkInputRichBlockButtons [accept, hold, copied, disabled]) {ButtonsBlock.align = Just "center"}
        ]
  sent <- richOut Rich (richBlocks blocks)
  void (buttonVerdict "Blocks form" (Just 5) (bySend sent))

-- | The standing rich exhibit refilled through @editMessageText@'s @rich_message@, with a new button row.
editInPlace :: Bot ()
editInPlace = do
  room <- asks (.here)
  standing Rich >>= \case
    Just posted | posted.chat == room.chat -> do
      let html =
            "<p>Accepted: your Thursday slot is booked. (This bubble was edited in place.)</p>"
              <> row
                [ buttonTag "✓ Accepted" [("type", Just "disabled"), ("style", Just "success")]
                , callbackTag "Change" "change" ""
                ]
      echo ("   edit target: " <> slotWord Rich <> " -> message_id " <> tshow posted.message)
      edited <-
        call
          EditMessageText.mkEditMessageText
            { EditMessageText.chat_id = Just (chatArg room.chat)
            , EditMessageText.message_id = Just (numberOfMessage posted.message)
            , EditMessageText.rich_message = Just (richHtml html)
            }
      void (buttonVerdict "Edited in place (rich_message)" (Just 2) (byEdit edited))
    _ -> do
      let note = "No rich exhibit is standing here, so there is nothing to edit."
      echo ("   VERDICT " <> note)
      tell note

-- | One message carrying both an in-body button row and a @reply_markup@ keyboard, to see where each lands.
withReplyMarkup :: Bot ()
withReplyMarkup = do
  retire Rich
  room <- asks (.here)
  let html =
        "<p>In-body row above the fold, reply_markup keyboard below it, if both survive:</p>"
          <> row
            [callbackTag "In-body Accept" "body-accept" "success", callbackTag "In-body Later" "body-later" ""]
      keyboard =
        inline [[tinted "success" (demo "Keyboard Accept" "kb-accept"), demo "Keyboard Later" "kb-later"]]
  sent <- post room.chat (richTo room (richHtml html)) {SendRichMessage.reply_markup = Just keyboard}
  remember Rich sent
  void (buttonVerdict "In-body row plus reply_markup" (Just 2) (bySend sent))

-- | The edges, each its own send so one refusal hides nothing.
edges :: Bot ()
edges = do
  reports <- zipWithM probe [0 ..] cases
  verdict ("Edges: " <> Text.intercalate "; " reports)
  where
    cases =
      [ ("nine in a row", row [callbackTag (tshow n) ("p" <> tshow n) "" | n <- [1 .. 9 :: Int]])
      ,
        ( "link style on a url"
        , row
            [ buttonTag
                "example.com"
                [("type", Just "url"), ("style", Just "link"), ("url", Just "https://example.com")]
            ]
        )
      ,
        ( "login_url, no domain set"
        , row [buttonTag "Log in" [("type", Just "login_url"), ("url", Just "https://example.com")]]
        )
      ,
        ( "web_app"
        , row [buttonTag "Mini app" [("type", Just "web_app"), ("url", Just "https://example.com")]]
        )
      ,
        ( "chosen-chat inline query"
        , row
            [ buttonTag
                "Invite via Telegram"
                [ ("type", Just "switch_inline_query_chosen_chat")
                , ("query", Just "invite probe")
                , ("allow_user_chats", Nothing)
                ]
            ]
        )
      ]
    probe index (name, buttons) = do
      let slot = Probe index
      retire slot
      sent <- sendRich (richHtml ("<p>Probe: " <> name <> ".</p>" <> buttons))
      case sent of
        Answered raw _ -> do
          remember slot sent
          echoed <- describeButtons (findButtons (field "rich_message" raw))
          pure
            (name <> ": accepted, echoed " <> (if null echoed then "NO button" else Text.intercalate "; " echoed))
        _ -> pure (name <> ": refused, " <> setback sent)

-- | One @\<tg-button\>@: attribute names take hyphens (@allow_user_chats@ becomes @allow-user-chats@), and a
-- 'Nothing' value writes the bare name as a flag.
buttonTag :: Text -> [(Text, Maybe Text)] -> Text
buttonTag label attributes =
  "<tg-button " <> Text.unwords (map render attributes) <> ">" <> label <> "</tg-button>"
  where
    render (name, value) =
      let key = Text.replace "_" "-" name
       in maybe key (\given -> key <> "=\"" <> given <> "\"") value

-- | A callback button under the inert @demo:@ prefix, an empty style meaning no style attribute at all.
callbackTag :: Text -> Text -> Text -> Text
callbackTag label payload style =
  buttonTag
    label
    ( [("type", Just "callback_data"), ("data", Just ("demo:" <> payload))]
        <> [("style", Just style) | not (Text.null style)]
    )

-- | A button row with no alignment attribute.
row :: [Text] -> Text
row = rowAligned ""

-- | A button row carrying the alignment it is given.
rowAligned :: Text -> [Text] -> Text
rowAligned align buttons =
  "<tg-button-row" <> (if Text.null align then "" else " align=\"" <> align <> "\"") <> ">"
    <> Text.concat buttons
    <> "</tg-button-row>"

-- | Every @(placement, button)@ pair inside an echoed rich message: a @buttons@ block is a row, a @button@
-- entity is one button in the flow. Neither descends into a button's own label, where the tree would
-- otherwise fold back on itself; a button with no @text@ is still placed and counted, with an empty label.
findButtons :: Value -> [(Text, Value)]
findButtons = \case
  Array items -> concatMap findButtons (toList items)
  Object node -> case tagOf node of
    "buttons" -> [("row/" <> alignOf node, button) | button <- arrayAt "buttons" node]
    "button" -> [("inline", fromMaybe emptyObject (KeyMap.lookup "button" node))]
    -- Ascending key order rather than the key map's own, so the order a verdict
    -- prints in is fixed by this program and not by aeson's backing store.
    _ -> concatMap (findButtons . snd) (KeyMap.toAscList node)
  _ -> []

-- | Which of the mutually exclusive kind keys the echoed button carries, in the documented order.
kindOf :: Value -> Text
kindOf button = case filter (`hasKey` button) kinds of
  [] -> "(no kind)"
  present -> Text.intercalate "+" present
  where
    kinds =
      [ "url", "callback_data", "web_app", "login_url", "switch_inline_query"
      , "switch_inline_query_current_chat", "switch_inline_query_chosen_chat", "copy_text", "disabled"
      ]

-- | An echoed rich text tree as characters, an entity written @\<kind:its text\>@, so a label whose entity
-- the server flattened reads as bare text and the strip is visible.
flatten :: Value -> Text
flatten = \case
  String plain -> plain
  Array parts -> Text.concat (map flatten (toList parts))
  Object node -> "<" <> tagOf node <> ":" <> inner node <> ">"
  _ -> ""
  where
    inner node = case KeyMap.lookup "text" node of
      Just given -> flatten given
      Nothing -> maybe "" flatten (KeyMap.lookup "alternative_text" node)

-- | One phrase per echoed button, kind and style named, each also printed to the terminal.
describeButtons :: [(Text, Value)] -> Bot [Text]
describeButtons = mapM describe
  where
    describe (place, button) = do
      let style = textAt "style" button
          label = flatten (field "text" button)
      echo
        ( "   BUTTON " <> place <> " kind=" <> kindOf button
            <> " style=" <> maybe "None" quoted style <> " label=" <> quoted label
        )
      pure (label <> " [" <> kindOf button <> styleSuffix style <> ", " <> place <> "]")
    styleSuffix = \case
      Just given | not (Text.null given) -> "/" <> given
      _ -> ""

-- | The verdict for one call: the echoed tree, never @ok:true@, printed per button and summarized in chat.
buttonVerdict :: Text -> Maybe Int -> Reply (Either Text Message) -> Bot [(Text, Value)]
buttonVerdict what expect = \case
  Answered raw (Right echoed) -> case echoed.rich_message of
    Nothing -> do
      verdict
        ( what <> ": the echoed message carries NO rich_message (keys: "
            <> Text.intercalate ", " (wireKeys raw) <> ")"
        )
      pure []
    Just _ -> do
      let found = findButtons (field "rich_message" raw)
      parts <- describeButtons found
      let noun = if length found == 1 then "button" else "buttons"
          summary
            | null found = what <> ": API echoed NO button (silently stripped)"
            | otherwise =
                what <> ": API echoed " <> tshow (length found) <> " " <> noun <> ": "
                  <> Text.intercalate "; " parts
          counted = case expect of
            Just wanted | length found /= wanted -> summary <> "; expected " <> tshow wanted
            _ -> summary
      verdict (counted <> "; reply_markup " <> (if isJust echoed.reply_markup then "attached" else "none"))
      pure found
  Answered raw (Left _) -> do
    verdict (what <> ": no message came back to inspect (result " <> compact raw <> ")")
    pure []
  reply -> do
    verdict (what <> ": API REFUSED the call: " <> setback reply)
    pure []

-- | An edit answers with the message it rewrote, or with a bare answer when there is no message of the
-- bot's own to hand back, which this renders as the whole raw result.
byEdit :: Reply MessageOrTrue -> Reply (Either Text Message)
byEdit = withRaw $ \raw -> \case
  MessageOrTrueViaMessage echoed -> Right echoed
  _ -> Left (compact raw)

-- | The @type@ tag of a raw echoed node, @?@ when it carries none.
tagOf :: Object -> Text
tagOf node = fromMaybe "?" (textOf =<< KeyMap.lookup "type" node)

-- | The alignment of a raw echoed button row, @default@ when it carries none.
alignOf :: Object -> Text
alignOf node = fromMaybe "default" (textOf =<< KeyMap.lookup "align" node)
