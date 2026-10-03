# telegrammar

The whole [Telegram Bot API](https://core.telegram.org/bots/api) as Haskell types: a record for every object, a request record for every method, and the JSON codecs between them. This release covers Bot API 10.3.

```haskell
-- Long-poll for updates forever and greet the sender of every message.
poll :: HTTP.Manager -> String -> Maybe Int64 -> IO a
poll manager token offset = do
  updates <- call manager token (GetUpdates.mkGetUpdates {GetUpdates.offset = offset, GetUpdates.timeout = Just 25})
  forM_ updates $ \update ->
    forM_ update.message $ \message ->
      call manager token (mkSendMessage (IntegerOrStringViaInteger message.chat.id) (greeting message))
  poll manager token (if null updates then offset else Just (maximum [update.update_id | update <- updates] + 1))

-- The sender's first name, or the chat's id for a message that has no sender.
greeting :: Message -> Text
greeting message = "Hello, " <> maybe (Text.pack (show message.chat.id)) (.first_name) message.from <> "!"
```

That is the heart of [`examples/hello/Main.hs`](examples/hello/Main.hs), a complete bot in one file.

## Why telegrammar

| What you get | How |
| --- | --- |
| The complete API | Every type and every method of the covered Bot API version, each documented in its Haddock with a link to the official reference. |
| Requests that are hard to get wrong | `mk<Method>` takes exactly the required parameters. Optional ones are record fields that start absent. |
| Errors before the network | Planning a request is pure. A refused file source, a parameter that collides with a raw extra, or a documented limit the library checks comes back as a `Left`, and nothing is sent. |
| Your HTTP stack | The library plans requests and decodes results. It performs no IO and depends on no HTTP client, so it fits whatever transport, retry policy and logging you already have. |
| Updates that survive surprises | `decodeUpdateBatch` decodes every part of every update on its own. A payload this version cannot read costs that one part, not the batch. |
| Room for what is newer than the library | A union value the decoder does not recognize is kept as raw JSON in an `...Unknown` constructor, and every request has an `extra` object for parameters the library does not know yet. |
| Light dependencies | `base`, `aeson`, `bytestring`, `containers`, `scientific`, `text`, `vector`. |

## Installation

telegrammar is distributed from this repository. Point your `cabal.project` at a release tag:

```cabal
source-repository-package
  type: git
  location: https://github.com/sukhodolin/telegrammar.git
  tag: v0.1.0.0
```

and add `telegrammar` to the `build-depends` of your component.

## Sending a request

A request record becomes a planned `Request` (the method name plus a JSON or multipart body), and a transport you own puts it on the wire. This is a whole transport for JSON bodies, on `http-client`:

```haskell
call :: forall r. (Method r) => HTTP.Manager -> String -> r -> IO (Result r)
call manager token request = do
  planned <- either (fail . show) pure (planRequest request)
  payload <- case planned.body of
    JsonBody object -> pure (compactJson (Object object))
    MultipartBody {} -> fail "a request with an upload needs the multipart transport in examples/wizard"
  target <- HTTP.parseRequest ("https://api.telegram.org/bot" <> token <> "/" <> Text.unpack planned.method)
  response <-
    HTTP.httpLbs
      target
        { HTTP.method = "POST"
        , HTTP.requestHeaders = [("Content-Type", "application/json")]
        , HTTP.requestBody = HTTP.RequestBodyBS payload
        }
      manager
  let body = HTTP.responseBody response
      result = withObject "response" (\envelope -> envelope .: "result" >>= parseResult (Proxy @r))
  either (\why -> fail (why <> " in " <> show body)) pure (eitherDecode body >>= parseEither result)
```

The `Method` class ties each request type to its result type, so `call` returns a `User` for `GetMe`, a `Message` for `SendMessage`, and a `[Update]` for `GetUpdates`.

A body is multipart exactly when the request carries an upload. [`examples/wizard/src/Wizard/Transport.hs`](examples/wizard/src/Wizard/Transport.hs) is a full transport that handles both kinds, reports every failure as a value, and keeps the token out of its logs.

## Building requests

Each method has its own module, `Telegram.Bot.Methods.<Method>`, imported qualified. Set an optional parameter with a record update that names the field through that qualifier:

```haskell
import Telegram.Bot.Methods.SendMessage qualified as SendMessage
import Telegram.Bot.Types (IntegerOrString (..))

message :: SendMessage.SendMessage
message =
  (SendMessage.mkSendMessage (IntegerOrStringViaInteger 123456789) "<b>hi</b>")
    {SendMessage.parse_mode = Just "HTML"}
```

Types come from `Telegram.Bot.Types`. Many records there share field names, so to update a field of one, import that record under an alias of its own:

```haskell
import Telegram.Bot.Types qualified as InlineButton (InlineKeyboardButton (..))

tinted :: Text -> InlineButton.InlineKeyboardButton -> InlineButton.InlineKeyboardButton
tinted name button = button {InlineButton.style = Just name}
```

Fields are read with `OverloadedRecordDot`, as in `message.chat.id`. Import a record with `(..)` to read its fields: GHC resolves `value.field` only when the field itself is in scope, and reports a missing `HasField` instance when it is not.

The examples compile under `GHC2021` with `-Wall -Werror=ambiguous-fields`, and the two record-update forms above stay clear of that flag.

## Files

A file parameter is an `InputFile`: a file Telegram already has, a URL for Telegram to fetch, or an upload from a path or from bytes.

```haskell
import Telegram.Bot.Methods.SendPhoto qualified as SendPhoto
import Telegram.Bot.Types (InputFile (..), IntegerOrString (..), UploadSource (..))

photo :: SendPhoto.SendPhoto
photo =
  (SendPhoto.mkSendPhoto (IntegerOrStringViaInteger 123456789) (Upload (UploadPath "cat.jpg")))
    {SendPhoto.caption = Just "A cat"}
```

Planning never opens the file. It names a multipart part for each upload, points the payload at it, and hands the transport the list of sources to read.

## Receiving updates

`GetUpdates` returns `[Update]` through the strict codec, which is all or nothing: fine for a first bot, and what the hello example uses. A bot that has to keep running through payloads newer than this release decodes the raw result with `Telegram.Bot.Updates` instead:

```haskell
import Telegram.Bot.Types (Message (..))
import Telegram.Bot.Updates (DecodedUpdate (..), UpdatePart (..), UpdatePayload (..), decodeUpdateBatch)

texts :: Value -> [Text]
texts batch =
  [ text
  | Right entries <- [decodeUpdateBatch batch]
  , Right update <- entries
  , KnownUpdatePart (UpdatePayloadMessage incoming) <- update.parts
  , Just text <- [incoming.text]
  ]
```

Every update keeps its identifier even when a part of it fails, so the long-poll offset still advances. A part that failed carries its field name, its raw JSON and the decode error; a part under a key this release does not know carries its field name and raw JSON.

## Modules

| Module | What it holds |
| --- | --- |
| `Telegram.Bot.Types` | Every type, with its constructors and its `mk` initializer. |
| `Telegram.Bot.Methods.<Method>` | One method's request record, its initializer, and its `Method` instance. |
| `Telegram.Bot.Updates` | The update decoder that keeps the readable parts of a partly unreadable update. |
| `Telegram.Bot.Support` | The runtime the rest is built on: `Method`, `Request`, `Body`, `InputFile`, the error types, and the planner. |

## Examples

Both examples are packages of this repository's `cabal.project` and run from its root.

[`examples/hello`](examples/hello) greets whoever writes to the bot:

```sh
export TELEGRAM_BOT_TOKEN=...
cabal run telegrammar-hello
```

[`examples/wizard`](examples/wizard) is a larger bot that walks a menu of Telegram surface experiments from inline buttons, with a full transport, a wire log of every exchange, and the resilient update loop. Its [README](examples/wizard/README.md) explains how to run it.

## Documentation text

The descriptions of types, methods, fields and parameters in the Haddocks are the text of the official [Telegram Bot API reference](https://core.telegram.org/bots/api), and each declaration links to its entry there.

## Contributing

This repository is generated by in-house bespoke tooling, and every release replaces its whole tree, so external pull requests are not accepted.

Issues of every kind are appreciated: bugs, wrong or missing types, documentation gaps, questions, requests. They are handled on a best-effort basis, with no guarantees.

## License

[MIT](LICENSE)
