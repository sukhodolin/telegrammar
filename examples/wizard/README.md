# telegrammar-wizard

A Telegram bot that walks you through what the Bot API can put on a client's screen, one scenario at a time, built on `telegrammar`.

It exists for two reasons. Every Bot API call it makes goes through a generated request record, the checked planner, and a generated result codec, so it is the live consumer that proves telegrammar against the real Bot API. And each scenario shows, in a real chat, what a Telegram client does with one piece of the API: the typing and recording indicators, message drafts, rich messages and their buttons, reply and inline keyboards, the user and chat pickers, and sharing through inline mode.

## Build and run

The example is a package of the repository's `cabal.project`. From the repository root:

```sh
export TELEGRAM_BOT_TOKEN=...
cabal run telegrammar-wizard
```

The token is the only prerequisite: `TELEGRAM_BOT_TOKEN` holds the token of a bot dedicated to this wizard. The wizard long-polls `getUpdates`, and a second consumer on the same token draws 409 Conflict, so it needs a bot of its own, created in BotFather. For the same reason, run one instance at a time.

On startup the terminal names the bot it connected as and the scenarios on the menu, and from then on it echoes each call. A bot cannot speak first, so a fresh run waits until someone opens the wizard in a chat.

## In the chat

The wizard serves whoever asks, and it works in rooms. A room is a chat, or one forum topic inside a chat, that the wizard has been opened in:

- Pressing Start in the bot's private chat, or sending `/start` there, opens that chat as a room.
- Sending `/here` in a group, in a forum topic, or as a post in a channel the bot has been added to opens a room there.

Each room has one control card, a single message with inline buttons, and everything is driven from it. Rooms are independent of each other: every private chat has its own card and its own place in a scenario, while the people in a shared room drive that room's one card together. The wizard handles one update at a time, so while a step that paces itself is running, a press in another room waits for it.

The card starts as the menu, with one button per scenario. A scenario is a short sequence of steps. Picking one turns the card into its first step: the card shows the step's description, and the wizard performs the step at the same moment. Continue performs the next step, Cancel returns to the menu, and the last step offers Return to the menu instead. Leaving a scenario sweeps it: the wizard deletes every message the scenario produced, and the messages you sent during it where the bot is allowed to delete them, so the chat returns to just the card. Close the wizard here, on the menu, deletes the card and forgets the room.

The card is edited in place rather than sent again, because a new bot message instantly clears the typing indicator or the draft a scenario is showing, while an edit does not: the card must not disturb what it is demonstrating.

A call the API refuses does not stop the wizard. The refusal is printed in the terminal and relayed into the room as a ⚠ notice, and the scenario carries on. Some steps provoke a refusal on purpose, to show where a limit lies.

Scenarios that use the picker, contact or location buttons need a private chat, because Telegram offers those buttons only there.

Ctrl-C stops the wizard: it sweeps every room and edits each card to "Wizard stopped.". Starting it again turns those cards back into menus.

## The wire log

The wizard appends every exchange with the Bot API to a JSON-lines file, one object per call, flushed as it is written, so what telegrammar sent and what Telegram answered can be read afterwards. The path is the program's one optional argument, and the default is `telegrammar-wizard-wire.jsonl` in the current directory:

```sh
cabal run telegrammar-wizard -- /tmp/wizard-wire.jsonl
```

One line, wrapped here to fit the page, looks like this:

```json
{"time":"2026-09-09T02:21:41Z","method":"getMe","request":{},
 "response":{"ok":true,"result":{"id":123,"is_bot":true,"username":"..."}}}
```

`request` is the body exactly as sent: the planned JSON object for a plain call, and for a call carrying an upload an object of `fields` and `uploads` that names each part and its source, so no upload bytes are logged. `response` is the whole Bot API envelope when the answer was JSON, and the status with the body that did arrive when it was not. The token appears nowhere in the log, because neither the URL nor the headers are logged. The terminal shows a shortened echo of each call, and the log is the complete machine-readable record beside it.

## The state file

The wizard remembers its open rooms in `$XDG_CACHE_HOME/telegrammar-wizard.json`, falling back to `~/.cache/telegrammar-wizard.json`. The file holds one entry per room: where the room is, how the card names it, and the message id of its card.

```json
{"sessions":[{"card_id":42,"chat":123456789,"label":"my DM","thread":null}]}
```

A bot cannot look up its own earlier messages, so the saved id is what lets a restarted wizard edit the standing card back into a menu instead of sending a second one. The file is read once at startup and rewritten whenever a card message is sent and whenever a room is closed, so closing the last room leaves an empty list.

## The modules

The scenario modules are listed with the short words the startup banner prints for their scenarios.

| Module | What it holds |
| --- | --- |
| `app/Main.hs` | The token, the wire-log path, the graceful-signal install, the `getMe` handshake, and the handoff to the loop. |
| `Wizard.Types` | The identifiers, the room, the session (one room's state), the slot (a named place for one standing message, replaced rather than stacked), the scenario key, the callback datum a button carries, the whole state, and every pure transition over them. |
| `Wizard.Transport` | The HTTP half telegrammar does not ship: a planned `Request` on the wire, the Bot API envelope off it, four failures as values, token redaction, and the wire log. |
| `Wizard.Bot` | The environment every action reads, the `Bot` monad, the one state cell, the terminal echo, and the pacing. |
| `Wizard.Call` | The one call funnel, the three-constructor reply, the five room-addressed request constructors, the response debrief, the refusal notice, the slots and the sweep. |
| `Wizard.Exhibit` | `Step`, `Scenario`, their two combinators, and the vocabulary the scenario modules are written in: chat actions, drafts, rich sends, keyboards, verdicts, the date-time helpers, shared constants. |
| `Wizard.Card` | The menu, one ordered list of the scenarios, and the control card: its menu face, its scenario face, the edit-in-place rule, `showMenu`, `enterStep`. |
| `Wizard.Rooms` | The room label, the table of open rooms, closing a room, and the JSON state file. |
| `Wizard.Scenarios.Chrome` | What the client draws around the messages, its chrome: `typing`, `voice`, `draft_native`, `draft_thinking`, `clear_test`. |
| `Wizard.Scenarios.Rich` | The rich message showcase and the rich draft to rich final pair: `rich`, `rich_pair`. |
| `Wizard.Scenarios.RichButtons` | Buttons inside a rich message, written in the HTML dialect, with a check of what the API echoed back: `rich_buttons`. |
| `Wizard.Scenarios.Keyboards` | Reply and inline keyboards, the pickers, and the share scenarios: `kb_reply`, `kb_styles`, `kb_request`, `kb_force`, `kb_pick`, `kb_fmt`, `share`, `known_contacts`, `share_link`, `kb_icons`. |
| `Wizard.Answers` | What the wizard answers a user's own messages and inline queries with: `/start`, the picker answers, the contact, location and `chat_shared` echoes, and the inline invite. |
| `Wizard.Loop` | The resilient long poll, the update dispatch, the press and message handlers, startup, and the sweep-and-retire shutdown. |

## Consuming telegrammar

The example compiles under GHC2021 with `-Wall -Werror=ambiguous-fields -Werror=incomplete-patterns`, which is the contract telegrammar is meant to be used under, so the idioms it uses are the supported ones. The third flag is what makes the scenario-word, datum and slot tables total.

Types come from `Telegram.Bot.Types`, the façade that re-exports every record. Import a record with `(..)` when you read its fields with `OverloadedRecordDot`: the `HasField` instance is solved only when the field is in scope.

Methods come one module each from `Telegram.Bot.Methods.<Name>`, imported qualified. `mk<Name>` takes exactly the required parameters, and an optional parameter is set by qualified record update:

```haskell
(SendMessage.mkSendMessage (chatArg room.chat) body) {SendMessage.message_thread_id = threadArg room}
```

For a record update on a *type* from the façade, qualify with an alias that carries just that record, because the façade re-exports many records sharing a field name and a module-wide alias is still ambiguous:

```haskell
import Telegram.Bot.Types qualified as InlineButton (InlineKeyboardButton (..))

tinted name button = button {InlineButton.style = Just name}
```

The address of a request is a typed field: the five room-addressed constructors in `Wizard.Call` set `chat_id` and `message_thread_id` on the generated record, so a scenario step names neither and no planned payload is rewritten. `Wizard.Exhibit` wraps the rest of what the scenarios need often, so a scenario module usually reaches for `demo`, `tinted`, `inline`, or `richMarkdown` rather than for a record update.

Updates come off the long poll through `Telegram.Bot.Updates.decodeUpdateBatch` rather than through the strict `[Update]` codec, which is the difference between a bot that survives an unfamiliar payload and one that does not. An update whose envelope decodes advances the offset and hands over every part that decoded; a part that failed keeps its field name, its raw payload, and its error, and the wizard prints all three. That is where a defect in the generated decoders would announce itself, so `Wizard.Loop` makes it loud instead of swallowing it.
