{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE OverloadedStrings #-}

-- | Everything a client draws beside a message rather than inside one: the two chat actions, the two draft
-- bubbles, and the harness that settles when a draft stops being displayed. The control card edits itself in
-- place here, since a fresh bot message would wipe the indicator and the draft under observation off screen.
module Wizard.Scenarios.Chrome (typing, voice, draftNative, draftThinking, clearTest) where

import Control.Monad (void)
import Control.Monad.Trans.Reader (asks)
import Data.Text (Text)
import Telegram.Bot.Methods.GetStickerSet qualified as GetStickerSet
import Wizard.Bot (Bot, Env (..), pause)
import Wizard.Call (Reply (..), call, retire, richDraftTo, setback)
import Wizard.Exhibit (Scenario, scenario, step, demo, draftPlain, draftRich, draftRichId, iconedEmoji, inline, keyboardIn, recordVoice,
                       richHtml, richMarkdown, richOut, tell, tellInto, tinted, typingKeepalive, typingOnce)
import Wizard.Types (ScenarioKey (..), Slot (..))

-- | The @typing@ menu entry.
typing :: Scenario
typing =
  scenario
    Typing
    "Typing…"
    [ step
        "One sendChatAction typing just fired. Watch the chat header: 'typing…' holds ~5 seconds, then fades."
        typingOnce
    , step
        "Keepalive: three paints 4 s apart. The indicator should hold continuously for ~13 seconds."
        typingKeepalive
    ]

-- | The @voice@ menu entry.
voice :: Scenario
voice =
  scenario
    Voice
    "Recording voice…"
    [ step
        "One sendChatAction record_voice: the header should read 'recording voice message…'."
        recordVoice
    ]

-- | The @draft_native@ menu entry.
draftNative :: Scenario
draftNative =
  scenario
    DraftNative
    "Draft: native Thinking…"
    [ step
        "An empty sendMessageDraft just fired. The docs promise a NATIVE client-localized 'Thinking…' placeholder."
        (draftPlain "")
    , step
        "The same draft_id now carries text: the placeholder should animate into it."
        (draftPlain "Checking your calendar for Thursday.")
    , step
        "A plain sendMessage: the draft should be gone the moment the real message arrives."
        (tell "Final reply: the draft should be gone.")
    ]

-- | The @draft_thinking@ menu entry.
draftThinking :: Scenario
draftThinking =
  scenario
    DraftThinking
    "Draft: tg-thinking"
    [ step
        "A rich draft with <tg-thinking>Thinking...</tg-thinking> just fired: the client should draw it as a shimmering Thinking... bubble."
        (draftRich "<tg-thinking>Thinking...</tg-thinking>")
    , step
        "Same draft_id: AIActions emoji #4 (tg-emoji) now sits in front of Thinking... inside the shimmering bubble."
        draftThinkingIcon
    , step
        "Same draft_id, live narration inside tg-thinking: the text should animate over."
        (draftRich "<tg-thinking>Let me check your calendar for Thursday.</tg-thinking>")
    , step
        "A plain sendMessage after the rich draft (clearing verified: any final clears any draft)."
        (tell "Plain final after the rich draft.")
    ]

-- | The @clear_test@ menu entry.
clearTest :: Scenario
clearTest =
  scenario
    ClearTest
    "Draft clearing test"
    [ step
        "Shimmer draft → PLAIN final → 8 s later a question with buttons. Just answer with what you see when the question lands."
        (clearing "plain")
    , step
        "The same, but the final is RICH (the documented pair). Answer with a button again."
        (clearing "rich")
    ]

-- | The fourth AIActions emoji, sent as a tg-emoji ahead of the word Thinking... inside a shimmering
-- tg-thinking bubble, which is the pairing the block's own documentation recommends.
draftThinkingIcon :: Bot ()
draftThinkingIcon = do
  fetched <- call (GetStickerSet.mkGetStickerSet "AIActions")
  case drop 3 (iconedEmoji fetched) of
    [] -> tell "Could not fetch emoji #4 from AIActions."
    (identifier, face) : _ -> do
      let html =
            "<tg-thinking><tg-emoji emoji-id=\"" <> identifier <> "\">" <> face <> "</tg-emoji> Thinking...</tg-thinking>"
      room <- asks (.here)
      sent <- call (richDraftTo room draftRichId (richHtml html))
      case sent of
        Answered _ _ -> pure ()
        _ -> tell ("API rejected tg-emoji inside tg-thinking: " <> setback sent)

-- | The harness that settles when a client stops displaying a draft: a rich draft, a final of the requested
-- kind, then 8 s after it, still well inside the ~30 s fade, a two-button question, so whatever the screen
-- holds as the question arrives is the result and nothing has to be timed by eye.
clearing :: Text -> Bot ()
clearing kind = do
  retire ClearFinal
  retire ClearQuestion
  draftRich "<tg-thinking>Shimmer marker for the clearing test</tg-thinking>"
  pause 1.5
  if kind == "plain"
    then tellInto ClearFinal "Final (plain sendMessage)."
    else void (richOut ClearFinal (richMarkdown "Final (**sendRichMessage**)."))
  pause 8
  void $
    keyboardIn
      ClearQuestion
      questionText
      ( inline
          [ [ tinted "danger" (demo "Still visible" (kind <> ": still visible"))
            , tinted "success" (demo "Already gone" (kind <> ": already gone"))
            ]
          ]
      )
  where
    questionText =
      "8 seconds after the " <> kind <> " final. Is the shimmering bubble still visible right now?"
