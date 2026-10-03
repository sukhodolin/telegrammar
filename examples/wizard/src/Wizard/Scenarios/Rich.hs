{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE OverloadedStrings #-}

-- | The rich message showcase: every element of the rich dialect, and the documented rich draft to rich final
-- pair. Every step swaps the @Rich@ slot, so the newest exhibit is read against the same bubble instead of a
-- stack; the date-time step's blocks twin stands under @RichTwin@, which swapping @Rich@ retires with it.
module Wizard.Scenarios.Rich (showcase, pair) where

import Control.Monad (void)
import Control.Monad.Trans.Reader (asks)
import Data.Int (Int64)
import Data.Map.Strict qualified as Map
import Data.Maybe (mapMaybe)
import Data.Text (Text)
import Data.Text qualified as Text
import Telegram.Bot.Types (InputRichBlock (..), RichText (..), mkInputRichBlockParagraph,
                               mkRichTextDateTime)
import Wizard.Bot (Bot, Env (..), tshow)
import Wizard.Exhibit (Scenario, scenario, step, draftRich, richBlocks, richOut, swapRich, timeEntity, timeFormatParts, timeFormats,
                       unixNow, unrendered, utc)
import Wizard.Types (ScenarioKey (..), Slot (..), UserId, numberOfUser)

-- | The @rich@ menu entry.
showcase :: Scenario
showcase =
  scenario
    RichShowcase
    "Rich message: all elements"
    [ step
        "Inline styles: bold/italic/strike/code/marked/spoiler, underline/sub/sup, all link kinds, inline custom emoji, one tg://time DATE-TIME entity as a sent → shown pair (wDT; the full format grid is the next step), inline math, and the auto-detected entity line."
        inlineStyles
    , step
        "Date-time entity, EVERY format the grammar r|w?[dD]?[tT]? admits, each line a sent → shown pair. Message 1 (markdown): the 17 non-empty fixed formats on one stamp, then `r` relative at five distances. Message 2 (blocks JSON): the empty format, which markdown cannot spell. A line reading 'not rendered by this client' is the fallback text: that client does not paint the entity."
        timeFormatGrid
    , step
        "Block text: headings 1-6, a paragraph, a horizontal rule, and a fenced Haskell code block."
        (swapRich blockText)
    , step
        "Lists: unordered, ordered, and TASK lists with checked/unchecked boxes."
        (swapRich lists)
    , step
        "Quotes and structure: a multi-line blockquote, a collapsible details block (open, with markdown inside), a pull-quote aside with a cite, and an anchor + internal reference."
        (swapRich quotes)
    , step
        "A table (alignments, inline formatting in cells) and FOOTNOTES."
        (swapRich table)
    , step
        "Math block (raw LaTeX) and a MAP block (Dubai, zoom 12)."
        (swapRich mathAndMap)
    , step
        "Media blocks by URL, each with a caption: photo, video, audio, voice note, gif animation. Fetch failures will be echoed."
        (swapRich media)
    , step
        "A COLLAGE and a SLIDESHOW of the same media, with a figcaption + cite."
        (swapRich collage)
    ]

-- | The @rich_pair@ menu entry.
pair :: Scenario
pair =
  scenario
    RichPair
    "Rich draft → rich final"
    [ step
        "A rich draft with narration in tg-thinking just fired."
        (draftRich "<tg-thinking>Looking into evening options.</tg-thinking>")
    , step
        "The sendRichMessage final, the documented pair: the draft must vanish instantly."
        (swapRich "**Paired final:** the rich draft should be gone.")
    ]

-- | Every inline element, including ONE @tg:\/\/time@ date-time entity. Its stamp is minted 24 h ahead so the
-- client has a real future wall date to render, and the mention is the bot's own id.
inlineStyles :: Bot ()
inlineStyles = do
  bot <- asks (.botId)
  unix <- (+ 86400) <$> unixNow
  swapRich (inlineMarkdown bot unix)

-- | The inline showcase around one date-time stamp and one mention of the bot itself.
inlineMarkdown :: UserId -> Int64 -> Text
inlineMarkdown bot unix =
  "# Inline styles\n"
    <> "**bold** _italic_ ~~strikethrough~~ `inline code` ==marked== ||spoiler||\n\n"
    <> "<u>underline</u>, <ins>inserted</ins>, x<sub>subscript</sub>, x<sup>superscript</sup>\n\n"
    <> "[inline URL](https://t.me/), [e-mail](mailto:user@example.com), "
    <> "[phone](tel:+123456789), [user mention](tg://user?id=" <> tshow (numberOfUser bot) <> ")\n\n"
    <> "Inline custom emoji: ![](tg://emoji?id=5368324170671202286)\n\n"
    <> "Date-time entity, format wDT. Sent: " <> utc unix <> ". Shown: " <> timeEntity unix "wDT" <> "\n\n"
    <> "Inline math: $x^2 + y^2$\n\n"
    <> "Auto-detected on one line: #hashtag $USD +12345678901, card: 4242 4242 4242 4242, "
    <> "https://t.me t.me a@t.me /command @example"

-- | The date-time entity under EVERY format, as two messages. The markdown one carries the 17 fixed formats
-- on one stamp, seconds forced to @:45@ so @T@ is distinguishable from @t@, then @r@ at several distances,
-- since relative rendering depends on the offset. The blocks twin carries the empty format.
timeFormatGrid :: Bot ()
timeFormatGrid = do
  base <- (\stamp -> (stamp `div` 60) * 60 + 86400 + 45) <$> unixNow
  now <- unixNow
  swapRich (Text.intercalate "\n" (gridLines base now))
  void (richOut RichTwin (richBlocks (emptyFormatParagraph base)))

-- | One line per fixed format, then one per relative distance, each a sent to shown pair.
gridLines :: Int64 -> Int64 -> [Text]
gridLines base now =
  ["# Date-time entity: every format", "", preamble, ""]
    <> map fixedLine timeFormats
    <> ["", "Relative format `r`, each line its own stamp:", ""]
    <> map relativeLine distances
  where
    preamble =
      "**Sent**, for every fixed-format line below: unix " <> tshow base <> " = " <> utc base
        <> ". **Shown**: whatever your client puts in the entity's place, in your own "
        <> "language and wall clock; \"" <> unrendered <> "\" means it left the fallback text as-is."
    fixedLine format = "- `" <> format <> "` (" <> meaning format <> ") shown: " <> timeEntity base format
    meaning format = Text.intercalate " + " (mapMaybe (`Map.lookup` timeFormatParts) (Text.unpack format))
    relativeLine (label, delta) =
      "- `r` sent " <> label <> " (" <> utc (now + delta) <> ") shown: " <> timeEntity (now + delta) "r"

-- | The offsets the relative format is exercised at, since @r@ renders by distance rather than by stamp.
distances :: [(Text, Int64)]
distances =
  [ ("3 days ago", -3 * 86400)
  , ("2 hours ago", -7200)
  , ("in 5 minutes", 300)
  , ("in 1 day", 86400)
  , ("in 40 days", 40 * 86400)
  ]

-- | The blocks twin: the empty format, reachable only through the typed blocks form.
emptyFormatParagraph :: Int64 -> [InputRichBlock]
emptyFormatParagraph base =
  [ InputRichBlockViaInputRichBlockParagraph
      ( mkInputRichBlockParagraph
          ( RichTextViaArray
              [ RichTextViaString
                  ( "Empty format (blocks JSON only; markdown has no spelling for it). Sent: unix "
                      <> tshow base
                      <> ", with the entity's own text set to the same stamp. Shown, by the docs, "
                      <> "that text as-is (tap it: the client may offer the local time): "
                  )
              , RichTextViaRichTextDateTime (mkRichTextDateTime (RichTextViaString (utc base)) base "")
              ]
          )
      )
  ]

-- | Headings 1-6, a paragraph, a horizontal rule, and a fenced code block.
blockText :: Text
blockText =
  "# Heading 1\n## Heading 2\n### Heading 3\n#### Heading 4\n##### Heading 5\n###### Heading 6\n\n"
    <> "A paragraph between the structure.\n\n---\n\n"
    <> "```haskell\nputStrLn \"a pre-formatted block, language-tagged\"\n```"

-- | Unordered, ordered, and task lists.
lists :: Text
lists =
  "Unordered:\n\n- first\n- second\n\nOrdered:\n\n1. one\n2. two\n\n"
    <> "Tasks:\n\n- [ ] pending item\n- [x] completed item"

-- | A blockquote, a collapsible details block, a pull-quote aside, and an anchor with an internal reference.
quotes :: Text
quotes =
  "<a name=\"top\"></a>\n"
    <> ">A block quotation\n>\n>continued on the next line\n\n"
    <> "<details open><summary>Summary with **bold**</summary>\n\n"
    <> "- item with _italic_\n- item with ||spoiler||\n\n</details>\n\n"
    <> "<aside>The relationships are the product.<cite>BRIEF.md</cite></aside>\n\n"
    <> "[Jump to the anchor](#top)"

-- | A table with per-column alignment and inline formatting in its cells, then two footnotes.
table :: Text
table =
  "| Metric | Value |\n|:-------|------:|\n| Speed | **42** <sup>ms</sup> |\n| Status | ||ready|| |\n\n"
    <> "Text with a reference[^id1] and another one[^id2].\n\n"
    <> "[^id1]: First footnote, with _italic_.\n[^id2]: Second footnote."

-- | A raw LaTeX math block and a map block.
mathAndMap :: Text
mathAndMap = "$$E = mc^2$$\n\n<tg-map lat=\"25.2\" long=\"55.27\" zoom=\"12\"/>"

-- | One captioned media block per kind, each fetched by the platform from its URL. The platform picks a
-- block's kind from the file's MIME type and its URL, so the voice note is the Bot API reference's own
-- example file, an Opus-encoded Ogg served as @audio\/ogg@. A Vorbis-encoded Ogg served as
-- @application\/ogg@ is refused with @RICH_MESSAGE_AUDIO_NO_MEDIA_FOUND@.
media :: Text
media =
  "![](https://upload.wikimedia.org/wikipedia/commons/3/3a/Cat03.jpg \"Photo caption\")\n\n"
    <> "![](https://www.w3schools.com/html/mov_bbb.mp4 \"Video caption\")\n\n"
    <> "![](https://www.w3schools.com/html/horse.mp3 \"Audio caption\")\n\n"
    <> "![](https://telegram.org/example/audio.ogg \"Voice note caption\")\n\n"
    <> "![](https://upload.wikimedia.org/wikipedia/commons/2/2c/Rotating_earth_%28large%29.gif \"Animation caption\")"

-- | The same media as a collage and as a slideshow with a figcaption and cite.
collage :: Text
collage =
  "<tg-collage>\n\n![](https://upload.wikimedia.org/wikipedia/commons/3/3a/Cat03.jpg)\n"
    <> "![](https://www.w3schools.com/html/mov_bbb.mp4)\n\n</tg-collage>\n\n"
    <> "<tg-slideshow><img src=\"https://upload.wikimedia.org/wikipedia/commons/3/3a/Cat03.jpg\"/>"
    <> "<video src=\"https://www.w3schools.com/html/mov_bbb.mp4\"/>"
    <> "<figcaption>Slideshow caption<cite>The Wizard</cite></figcaption></tg-slideshow>"
