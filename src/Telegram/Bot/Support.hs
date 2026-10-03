{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeFamilies #-}

-- |
-- Module: Telegram.Bot.Support
--
-- The handwritten runtime the generated modules are built on.
--
-- Everything here is pure. Planning a request allocates attachment part names,
-- checks file capabilities, and produces a JSON payload or a set of multipart
-- form fields together with the upload sources a transport must read; it never
-- opens a file, resolves a URL, or performs any other effect. Reading an
-- @UploadPath@ and framing a multipart body belong to the HTTP backend.
--
-- The module depends only on @base@, @aeson@, @bytestring@, @text@,
-- @containers@, @scientific@, and @vector@, and it declares every language
-- extension it uses, so it compiles the same way wherever it is built.
module Telegram.Bot.Support
  ( -- * File inputs
    InputFile (..)
  , UploadSource (..)
  , FileCapability (..)
  , FilePolicy (..)
  , filePolicy
  , allCapabilities
  , attachmentPrefix
  , partNamePrefix

    -- * The literal true value
  , TrueValue (..)

    -- * Errors
  , PathPiece (..)
  , renderPath
  , EncodeError (..)
  , DecodeError (..)
  , codeExtraCollision
  , codeFileCapability
  , codeAttachmentReference
  , codeRequestConstraint
  , requestConstraintError

    -- * Requests
  , FormField (..)
  , PlannedUpload (..)
  , Body (..)
  , Request (..)
  , Method (..)

    -- * Request planning
  , PlanState (..)
  , PlanEnv (..)
  , initialPlanState
  , initialPlanEnv
  , FieldPlanner
  , planRequestBody
  , planRecord
  , planList
  , planMember
  , planFileValue
  , restrictTo
  , restrictWhen
  , isPresent
  , plainValue
  , encodeJson
  , planned
  , plannedMaybe
  , plannedFlag
  , plannedLiteral

    -- * Local request validation
  , withValidation
  , validateArrayCount
  , validateHomogeneousMembers

    -- * Pure encoding
  , jsonObject
  , jsonField
  , jsonOptional
  , jsonFlag
  , jsonLiteral
  , compactJson
  , formFieldBytes

    -- * Extra parameters
  , checkExtraCollisions

    -- * Decoding
  , requiredField
  , optionalField
  , optionalTrueFlag
  , requiredValue
  , requiredWith
  , optionalWith
  , parseList
  , parseInt64
  , int64Field
  , parseScientificValue
  , scientificField
  , parseTextValue
  , tagField
  , checkStringConstant
  , checkIntegerConstant
  , checkBooleanConstant
  , describeValue

    -- * Decoding boundaries
  , runParserAt
  , parseAtField
  , parseAtRoot

    -- * The update boundary
  , UpdatePart (..)
  , DecodedUpdate (..)
  , InvalidUpdateEnvelope (..)
  , UpdateFieldDecoder
  , decodeUpdateWith
  , decodeUpdateBatchWith
  ) where

import Data.Aeson (Encoding, FromJSON (..), Object, ToJSON (..), Value (..))
import Data.Aeson.Encoding qualified as Encoding
import Data.Aeson.Key (Key)
import Data.Aeson.Key qualified as Key
import Data.Aeson.KeyMap qualified as KeyMap
import Data.Aeson.Types (IResult (..), JSONPathElement (..), Parser, (<?>))
import Data.Aeson.Types qualified as Aeson
import Data.ByteString (ByteString)
import Data.ByteString.Lazy qualified as Lazy
import Data.Int (Int64)
import Data.List qualified as List
import Data.Scientific (Scientific)
import Data.Scientific qualified as Scientific
import Data.Set (Set)
import Data.Set qualified as Set
import Data.Text (Text)
import Data.Text qualified as Text
import Data.Text.Encoding qualified as Text.Encoding
import Data.Vector qualified as Vector

--------------------------------------------------------------------------------
-- File inputs
--------------------------------------------------------------------------------

-- | A value a request may supply where the Bot API accepts a file.
--
-- The three constructors correspond to the three capabilities a field can
-- accept. Construction is deliberately unconstrained; the checked planner
-- validates the chosen constructor against the capabilities the occurrence
-- actually permits, so the same value can be built once and rejected only
-- where it is not allowed.
data InputFile
  = -- | An opaque file identifier already known to Telegram. The reserved
    -- @attach:\/\/@ prefix is refused here.
    ExistingFile Text
  | -- | An HTTP or HTTPS URL for Telegram to fetch. The scheme is checked; the
    -- URL is never resolved.
    HttpUrl Text
  | -- | A local upload, carried to the transport as a planned multipart part.
    Upload UploadSource
  deriving stock (Eq, Show)

-- | Where the bytes of an upload come from.
--
-- @UploadPath@ is a path for the eventual HTTP backend to read. Nothing in
-- this module opens it.
data UploadSource
  = UploadPath FilePath
  | UploadBytes
      { filename :: Text
      , contentType :: Maybe Text
      , bytes :: ByteString
      }
  deriving stock (Eq, Show)

-- | The three sources a file-bearing field can accept.
data FileCapability
  = ExistingFileCapability
  | HttpUrlCapability
  | UploadCapability
  deriving stock (Eq, Ord, Show, Enum, Bounded)

-- | The capabilities accepted at one file leaf.
newtype FilePolicy = FilePolicy
  { allowed :: Set FileCapability
  }
  deriving stock (Eq, Ord, Show)

-- | Build a leaf policy from the capability list a generated planner supplies.
filePolicy :: [FileCapability] -> FilePolicy
filePolicy = FilePolicy . Set.fromList

-- | Every capability. The environment starts here and enclosing occurrence
-- restrictions only ever narrow it.
allCapabilities :: Set FileCapability
allCapabilities = Set.fromList [minBound .. maxBound]

-- | The reserved reference prefix an upload produces in the JSON payload.
attachmentPrefix :: Text
attachmentPrefix = "attach://"

-- | The reserved prefix of every allocated multipart part name.
partNamePrefix :: Text
partNamePrefix = "telegrammar_file_"

--------------------------------------------------------------------------------
-- The literal true value
--------------------------------------------------------------------------------

-- | A field or result whose only valid wire value is the JSON literal @true@.
data TrueValue = TrueValue
  deriving stock (Eq, Ord, Show)

instance FromJSON TrueValue where
  parseJSON = \case
    Bool True -> pure TrueValue
    other -> fail ("expected the JSON literal true, got " <> describeValue other)

instance ToJSON TrueValue where
  toJSON _ = Bool True
  toEncoding _ = Encoding.bool True

--------------------------------------------------------------------------------
-- Errors
--------------------------------------------------------------------------------

-- | One step of a payload location.
data PathPiece
  = FieldPath Text
  | IndexPath Int
  deriving stock (Eq, Ord, Show)

-- | Render a path for a human, outermost piece first.
renderPath :: [PathPiece] -> Text
renderPath pieces = "$" <> foldMap piece pieces
  where
    piece = \case
      FieldPath name -> "." <> name
      IndexPath index -> "[" <> Text.pack (show index) <> "]"

-- | A request that cannot be planned.
data EncodeError = EncodeError
  { path :: [PathPiece]
  , code :: Text
  , message :: Text
  }
  deriving stock (Eq, Show)

-- | A payload that cannot be decoded.
data DecodeError = DecodeError
  { path :: [PathPiece]
  , message :: Text
  }
  deriving stock (Eq, Show)

-- | An extra parameter collides with a key the request already reserves.
codeExtraCollision :: Text
codeExtraCollision = "E_EXTRA_COLLISION"

-- | The supplied file source is not permitted at this occurrence.
codeFileCapability :: Text
codeFileCapability = "E_FILE_CAPABILITY"

-- | A typed file input contains the reserved attachment reference prefix.
codeAttachmentReference :: Text
codeAttachmentReference = "E_ATTACHMENT_REFERENCE"

-- | A locally checkable request constraint fails.
codeRequestConstraint :: Text
codeRequestConstraint = "E_REQUEST_CONSTRAINT"

-- | Build an @E_REQUEST_CONSTRAINT@ failure at a payload location.
requestConstraintError :: [PathPiece] -> Text -> EncodeError
requestConstraintError location text =
  EncodeError {path = location, code = codeRequestConstraint, message = text}

capabilityError :: [PathPiece] -> Text -> EncodeError
capabilityError location text =
  EncodeError {path = location, code = codeFileCapability, message = text}

attachmentError :: [PathPiece] -> Text -> EncodeError
attachmentError location text =
  EncodeError {path = location, code = codeAttachmentReference, message = text}

--------------------------------------------------------------------------------
-- Requests
--------------------------------------------------------------------------------

-- | One top-level multipart form field, already converted to bytes.
data FormField = FormField
  { name :: Text
  , value :: ByteString
  }
  deriving stock (Eq, Show)

-- | One allocated attachment: the part name the payload refers to and the
-- source the transport must read or send.
data PlannedUpload = PlannedUpload
  { partName :: Text
  , source :: UploadSource
  }
  deriving stock (Eq, Show)

-- | The planned body of a request.
data Body
  = JsonBody Object
  | MultipartBody [FormField] [PlannedUpload]
  deriving stock (Eq, Show)

-- | A complete planned request. Tokens, base URLs, multipart boundaries, and
-- retries belong to the transport.
data Request = Request
  { method :: Text
  , body :: Body
  }
  deriving stock (Eq, Show)

-- | The association between a generated request record and its result.
class Method request where
  -- | The decoded success value carried inside the Bot API response envelope.
  type Result request

  -- | The exact method spelling to send.
  methodName :: proxy request -> Text

  -- | The checked planner. Every request uses one, because extra-key
  -- collisions and occurrence restrictions can fail even for a file-free
  -- method.
  planRequest :: request -> Either EncodeError Request

  -- | Parse the success value inside the response envelope. The envelope
  -- itself belongs to the transport.
  parseResult :: proxy request -> Value -> Parser (Result request)

--------------------------------------------------------------------------------
-- Request planning
--------------------------------------------------------------------------------

-- | The planner's mutable half, threaded explicitly.
data PlanState = PlanState
  { nextPart :: Int
  , uploads :: [PlannedUpload]
  }
  deriving stock (Eq, Show)

-- | The planner's inherited half, threaded explicitly.
--
-- @inheritedCapabilities@ is the intersection of every occurrence restriction
-- met on the way down to the current location; @path@ is that location,
-- outermost piece first.
data PlanEnv = PlanEnv
  { inheritedCapabilities :: Set FileCapability
  , path :: [PathPiece]
  }
  deriving stock (Eq, Show)

-- | No parts allocated and no uploads pending.
initialPlanState :: PlanState
initialPlanState = PlanState {nextPart = 0, uploads = []}

-- | The root environment: every capability, at the payload root.
initialPlanEnv :: PlanEnv
initialPlanEnv = PlanEnv {inheritedCapabilities = allCapabilities, path = []}

-- | One checked traversal step: it reads the inherited environment and the
-- current state and produces a JSON-shaped value plus the updated state.
type FieldPlanner = PlanEnv -> PlanState -> Either EncodeError (Value, PlanState)

-- | Descend into a named field or an array element.
descend :: PathPiece -> PlanEnv -> PlanEnv
descend piece env =
  PlanEnv
    { inheritedCapabilities = env.inheritedCapabilities
    , path = env.path <> [piece]
    }

-- | Narrow the inherited capability set for everything below this point.
--
-- An occurrence restriction can only remove capabilities. When the
-- intersection is empty every file value below is refused, which is how a
-- restricted optional leaf is required to be omitted.
restrictTo :: [FileCapability] -> FieldPlanner -> FieldPlanner
restrictTo permitted inner env =
  inner
    PlanEnv
      { inheritedCapabilities =
          Set.intersection env.inheritedCapabilities (Set.fromList permitted)
      , path = env.path
      }

-- | Narrow the inherited capability set only when the occurrence's condition
-- holds.
--
-- The condition is decided from the owning record's sibling value, which the
-- generated planner reads before descending. An inactive restriction leaves
-- the inherited set alone.
restrictWhen :: Bool -> [FileCapability] -> FieldPlanner -> FieldPlanner
restrictWhen active permitted inner
  | active = restrictTo permitted inner
  | otherwise = inner

-- | Whether an optional value is present: the condition a generated planner
-- hands to 'restrictWhen' for a restriction that holds only beside a sibling
-- field that is set.
isPresent :: Maybe a -> Bool
isPresent = \case
  Nothing -> False
  Just _ -> True

-- | Visit the present fields of a record in source order.
planEntries
  :: PlanEnv
  -> PlanState
  -> [(Text, FieldPlanner)]
  -> Either EncodeError ([(Text, Value)], PlanState)
planEntries env = go
  where
    go state [] = Right ([], state)
    go state ((key, planner) : rest) = do
      (planned_, state') <- planner (descend (FieldPath key) env) state
      (others, state'') <- go state' rest
      pure ((key, planned_) : others, state'')

-- | A record: visit every emitted field in source order.
planRecord :: [(Text, FieldPlanner)] -> FieldPlanner
planRecord entries env state = do
  (pairs, state') <- planEntries env state entries
  pure (Object (objectFromPairs pairs), state')

-- | An array: visit every element in index order.
planList :: (a -> FieldPlanner) -> [a] -> FieldPlanner
planList element items env state0 = do
  (values, state) <- go 0 state0 items
  pure (Array (Vector.fromList values), state)
  where
    go _ state [] = Right ([], state)
    go index state (item : rest) = do
      (value, state') <- element item (descend (IndexPath index) env) state
      (others, state'') <- go (index + 1) state' rest
      pure (value : others, state'')

-- | A union: visit the selected member's payload at the same location.
planMember :: FieldPlanner -> FieldPlanner
planMember inner = inner

-- | An already encoded, file-free value.
plainValue :: Value -> FieldPlanner
plainValue value _ state = Right (value, state)

-- | A file-free value with an ordinary pure encoder.
encodeJson :: (ToJSON a) => a -> FieldPlanner
encodeJson x _ state = Right (toJSON x, state)

-- | An always-emitted field.
planned :: Text -> FieldPlanner -> [(Text, FieldPlanner)]
planned key planner = [(key, planner)]

-- | An optional field: absent means omitted.
plannedMaybe :: Text -> Maybe a -> (a -> FieldPlanner) -> [(Text, FieldPlanner)]
plannedMaybe key supplied planner = case supplied of
  Nothing -> []
  Just x -> [(key, planner x)]

-- | An optional true-flag: false means omitted.
plannedFlag :: Text -> Bool -> [(Text, FieldPlanner)]
plannedFlag key flag = [(key, plainValue (Bool True)) | flag]

-- | A literal the encoder supplies and the record has no editable slot for.
plannedLiteral :: Text -> Value -> [(Text, FieldPlanner)]
plannedLiteral key value = [(key, plainValue value)]

-- | A typed file leaf.
--
-- The effective capability set is the leaf policy intersected with every
-- enclosing occurrence restriction. An empty effective set rejects any
-- supplied value. A permitted upload allocates the next part name and produces
-- its @attach:\/\/@ reference; the part is appended to the plan in traversal
-- order, one per occurrence even when two occurrences name the same path.
planFileValue :: FilePolicy -> InputFile -> FieldPlanner
planFileValue policy input env state
  | Set.null effective =
      Left
        ( capabilityError
            env.path
            "no file source is permitted at this location; omit this value"
        )
  | otherwise = case input of
      ExistingFile identifier
        | not (permits ExistingFileCapability) ->
            Left (refused "an existing file identifier")
        | isAttachmentReference identifier ->
            Left (attachmentError env.path reservedPrefixMessage)
        | otherwise -> Right (String identifier, state)
      HttpUrl url
        | not (permits HttpUrlCapability) -> Left (refused "an HTTP URL")
        | isAttachmentReference url ->
            Left (attachmentError env.path reservedPrefixMessage)
        | not (hasHttpScheme url) ->
            Left
              ( requestConstraintError
                  env.path
                  "an HTTP URL must begin with the http:// or https:// scheme"
              )
        | otherwise -> Right (String url, state)
      Upload source
        | not (permits UploadCapability) -> Left (refused "a local upload")
        | otherwise ->
            let part = partNamePrefix <> Text.pack (show state.nextPart)
                state' =
                  PlanState
                    { nextPart = state.nextPart + 1
                    , uploads =
                        state.uploads <> [PlannedUpload {partName = part, source = source}]
                    }
             in Right (String (attachmentPrefix <> part), state')
  where
    effective = Set.intersection policy.allowed env.inheritedCapabilities
    permits capability = Set.member capability effective
    refused what =
      capabilityError
        env.path
        ( "this location does not accept "
            <> what
            <> "; permitted sources are "
            <> renderCapabilities effective
        )
    reservedPrefixMessage =
      "the attach:// prefix is reserved for planned attachments and cannot be supplied directly"

renderCapabilities :: Set FileCapability -> Text
renderCapabilities capabilities
  | Set.null capabilities = "none"
  | otherwise = Text.intercalate ", " (map spelling (Set.toAscList capabilities))
  where
    spelling = \case
      ExistingFileCapability -> "existing_file"
      HttpUrlCapability -> "http_url"
      UploadCapability -> "upload"

isAttachmentReference :: Text -> Bool
isAttachmentReference = Text.isPrefixOf attachmentPrefix

hasHttpScheme :: Text -> Bool
hasHttpScheme url =
  Text.isPrefixOf "http://" lowered || Text.isPrefixOf "https://" lowered
  where
    lowered = Text.toLower url

-- | Plan a complete request.
--
-- The reserved key set is every documented parameter of the method, including
-- the ones this value omits, together with every part name the traversal
-- allocated. Extras are checked against it, then merged in sorted key order
-- after the typed parameters. Zero uploads produce a JSON body; any upload
-- produces multipart form fields plus the planned uploads.
planRequestBody
  :: Text
  -- ^ The exact method spelling.
  -> [Text]
  -- ^ Every documented parameter key, including omitted parameters.
  -> [(Text, FieldPlanner)]
  -- ^ The parameters this value actually emits, in source field order.
  -> Object
  -- ^ Raw extras.
  -> Either EncodeError Request
planRequestBody name parameterKeys entries extras = do
  (pairs, state) <- planEntries initialPlanEnv initialPlanState entries
  let parts = map (\upload -> upload.partName) state.uploads
      declared = Set.fromList parameterKeys
  case filter (`Set.member` declared) parts of
    colliding : _ ->
      Left
        ( requestConstraintError
            [FieldPath colliding]
            "an allocated attachment part name collides with a documented parameter key"
        )
    [] -> Right ()
  extraPairs <- checkExtraCollisions (Set.union declared (Set.fromList parts)) extras
  let payload = pairs <> extraPairs
  pure
    Request
      { method = name
      , body =
          if null state.uploads
            then JsonBody (objectFromPairs payload)
            else MultipartBody (map toFormField payload) state.uploads
      }

toFormField :: (Text, Value) -> FormField
toFormField (key, value) = FormField {name = key, value = formFieldBytes value}

objectFromPairs :: [(Text, Value)] -> Object
objectFromPairs = KeyMap.fromList . map (\(key, value) -> (Key.fromText key, value))

--------------------------------------------------------------------------------
-- Local request validation
--------------------------------------------------------------------------------

-- | Run a documented local validator at this occurrence before planning it.
--
-- The planner performs occurrence checks before delegating element encoding
-- to any shared sum. The check receives the occurrence's own payload location,
-- so a violation is reported there.
withValidation
  :: ([PathPiece] -> Either EncodeError ())
  -> FieldPlanner
  -> FieldPlanner
withValidation check inner env state = case check env.path of
  Left problem -> Left problem
  Right () -> inner env state

-- | A documented array-count constraint at one occurrence.
validateArrayCount
  :: Maybe Int
  -> Maybe Int
  -> [PathPiece]
  -> [a]
  -> Either EncodeError ()
validateArrayCount minimumItems maximumItems location items
  | Just lower <- minimumItems
  , count < lower =
      Left (violation ("at least " <> Text.pack (show lower)))
  | Just upper <- maximumItems
  , count > upper =
      Left (violation ("at most " <> Text.pack (show upper)))
  | otherwise = Right ()
  where
    count = length items
    violation bound =
      requestConstraintError
        location
        ( "this array must contain "
            <> bound
            <> " element(s), got "
            <> Text.pack (show count)
        )

-- | A documented homogeneity constraint: when one of the named members occurs,
-- every element must be that same member.
validateHomogeneousMembers
  :: [Text]
  -- ^ The member names that force homogeneity.
  -> (a -> Text)
  -- ^ The member name of one element.
  -> [PathPiece]
  -> [a]
  -> Either EncodeError ()
validateHomogeneousMembers restricted memberName location items =
  case [member | item <- items, let member = memberName item, member `elem` restricted] of
    [] -> Right ()
    forced : _ ->
      case [ index
           | (index, item) <- zip [0 ..] items
           , memberName item /= forced
           ] of
        [] -> Right ()
        offender : _ ->
          Left
            ( requestConstraintError
                (location <> [IndexPath offender])
                ( "every element must be "
                    <> forced
                    <> " when one is present, got "
                    <> memberName (items !! offender)
                )
            )

--------------------------------------------------------------------------------
-- Pure encoding
--------------------------------------------------------------------------------

-- | Build an object from the pairs a generated encoder emitted.
jsonObject :: [(Text, Value)] -> Value
jsonObject = Object . objectFromPairs

-- | An always-emitted field.
jsonField :: (ToJSON a) => Text -> a -> [(Text, Value)]
jsonField key x = [(key, toJSON x)]

-- | An optional field: 'Nothing' is omitted, @Just False@ is preserved.
jsonOptional :: (ToJSON a) => Text -> Maybe a -> [(Text, Value)]
jsonOptional key = \case
  Nothing -> []
  Just x -> [(key, toJSON x)]

-- | An optional true-flag: false is omitted.
jsonFlag :: Text -> Bool -> [(Text, Value)]
jsonFlag key flag = [(key, Bool True) | flag]

-- | A literal the encoder supplies.
jsonLiteral :: Text -> Value -> [(Text, Value)]
jsonLiteral key value = [(key, value)]

-- | Compact JSON with no insignificant whitespace and object keys in
-- lexicographic order, so the same value always produces the same bytes.
compactJson :: Value -> ByteString
compactJson = Lazy.toStrict . Encoding.encodingToLazyByteString . compactEncoding

compactEncoding :: Value -> Encoding
compactEncoding = \case
  Object members ->
    Encoding.pairs
      ( foldMap
          (\(key, value) -> Encoding.pair key (compactEncoding value))
          (List.sortOn (Key.toText . fst) (KeyMap.toList members))
      )
  Array items -> Encoding.list compactEncoding (Vector.toList items)
  other -> Encoding.value other

-- | The top-level conversion to a multipart form field. Only top-level payload
-- values become form fields; a nested structure stays JSON until this point.
formFieldBytes :: Value -> ByteString
formFieldBytes = \case
  String text -> Text.Encoding.encodeUtf8 text
  Bool True -> "true"
  Bool False -> "false"
  Null -> "null"
  other -> compactJson other

--------------------------------------------------------------------------------
-- Extra parameters
--------------------------------------------------------------------------------

-- | Check raw extras against the reserved key set and return them in sorted
-- key order. The first collision in that order is reported at its own key.
--
-- The allocator prefix is reserved as a whole, so an extra cannot squat a name
-- a future upload would allocate even when this particular value allocates
-- nothing.
checkExtraCollisions :: Set Text -> Object -> Either EncodeError [(Text, Value)]
checkExtraCollisions reserved extras =
  case filter (\(key, _) -> collides key) sorted of
    (key, _) : _ ->
      Left
        EncodeError
          { path = [FieldPath key]
          , code = codeExtraCollision
          , message =
              "the extra parameter \""
                <> key
                <> "\" collides with a key this request already reserves"
          }
    [] -> Right sorted
  where
    collides key = Set.member key reserved || Text.isPrefixOf partNamePrefix key
    sorted =
      List.sortOn
        fst
        [(Key.toText key, value) | (key, value) <- KeyMap.toList extras]

--------------------------------------------------------------------------------
-- Decoding
--------------------------------------------------------------------------------

-- | The raw value at a key, failing when the key is absent.
requiredValue :: Object -> Key -> Parser Value
requiredValue object key = case KeyMap.lookup key object of
  Just value -> pure value
  Nothing -> fail ("the required key " <> show (Key.toString key) <> " is missing")

-- | A required field with an explicit value parser.
--
-- Generated decoders always name the parser, so a nested @Int64@ goes through
-- the checked reader below rather than through a library instance.
requiredWith :: Object -> Key -> (Value -> Parser a) -> Parser a
requiredWith object key parser = do
  value <- requiredValue object key
  parser value <?> Key key

-- | An optional field with an explicit value parser: a missing key and an
-- explicit null both mean absent.
optionalWith :: Object -> Key -> (Value -> Parser a) -> Parser (Maybe a)
optionalWith object key parser = case KeyMap.lookup key object of
  Nothing -> pure Nothing
  Just Null -> pure Nothing
  Just value -> (Just <$> parser value) <?> Key key

-- | An array with an explicit element parser, keeping the element index in the
-- reported path.
parseList :: (Value -> Parser a) -> Value -> Parser [a]
parseList element = \case
  Array items ->
    traverse
      (\(index, item) -> element item <?> Index index)
      (zip [0 ..] (Vector.toList items))
  other -> fail ("expected an array, got " <> describeValue other)

-- | A required field: the key must be present and its value must parse.
requiredField :: (FromJSON a) => Object -> Key -> Parser a
requiredField object key = requiredWith object key parseJSON

-- | An optional field: a missing key and an explicit null both mean absent.
optionalField :: (FromJSON a) => Object -> Key -> Parser (Maybe a)
optionalField object key = optionalWith object key parseJSON

-- | An optional true-flag: missing, null, and false all mean false; true means
-- true; any other JSON kind fails.
optionalTrueFlag :: Object -> Key -> Parser Bool
optionalTrueFlag object key = case KeyMap.lookup key object of
  Nothing -> pure False
  Just Null -> pure False
  Just (Bool flag) -> pure flag
  Just other ->
    fail ("expected a boolean, got " <> describeValue other) <?> Key key

-- | Checked 64-bit integer parsing: a fractional or out-of-range number fails
-- instead of being truncated or wrapped.
parseInt64 :: Value -> Parser Int64
parseInt64 = \case
  Number number -> case Scientific.toBoundedInteger number of
    Just value -> pure value
    Nothing
      | Scientific.isInteger number ->
          fail
            ( "the integer "
                <> show number
                <> " is outside the supported 64-bit range"
            )
      | otherwise -> fail ("expected a whole number, got " <> show number)
  other -> fail ("expected a number, got " <> describeValue other)

-- | 'parseInt64' at a required key.
int64Field :: Object -> Key -> Parser Int64
int64Field object key = requiredWith object key parseInt64

-- | JSON numbers pass through unchanged; no NaN or infinity can arise.
parseScientificValue :: Value -> Parser Scientific
parseScientificValue = \case
  Number number -> pure number
  other -> fail ("expected a number, got " <> describeValue other)

-- | 'parseScientificValue' at a required key.
scientificField :: Object -> Key -> Parser Scientific
scientificField object key = requiredWith object key parseScientificValue

-- | A JSON string, failing on every other kind.
parseTextValue :: Value -> Parser Text
parseTextValue = \case
  String text -> pure text
  other -> fail ("expected a string, got " <> describeValue other)

-- | A union's incoming discriminator: a missing key and
-- a non-string value both fail before any member is selected.
tagField :: Object -> Key -> Parser Text
tagField object key = requiredWith object key parseTextValue

-- | A required string constant.
checkStringConstant :: Object -> Key -> Text -> Parser ()
checkStringConstant object key expected = do
  value <- requiredValue object key
  flip (<?>) (Key key) $ case value of
    String actual
      | actual == expected -> pure ()
      | otherwise ->
          fail
            ( "expected the constant "
                <> show expected
                <> ", got "
                <> show actual
            )
    other -> fail ("expected a string, got " <> describeValue other)

-- | A required integer constant, parsed with the checked integer reader.
checkIntegerConstant :: Object -> Key -> Int64 -> Parser ()
checkIntegerConstant object key expected = do
  value <- requiredValue object key
  flip (<?>) (Key key) $ do
    actual <- parseInt64 value
    if actual == expected
      then pure ()
      else fail ("expected the constant " <> show expected <> ", got " <> show actual)

-- | A required boolean constant. A required true literal rejects false here.
checkBooleanConstant :: Object -> Key -> Bool -> Parser ()
checkBooleanConstant object key expected = do
  value <- requiredValue object key
  flip (<?>) (Key key) $ case value of
    Bool actual
      | actual == expected -> pure ()
      | otherwise ->
          fail ("expected the constant " <> show expected <> ", got " <> show actual)
    other -> fail ("expected a boolean, got " <> describeValue other)

-- | A short human description of a JSON value's kind, used by every generated
-- failure message so an unsupported kind reads the same way everywhere.
describeValue :: Value -> String
describeValue = \case
  Null -> "null"
  Bool flag -> "the boolean " <> show flag
  Number number -> "the number " <> show number
  String text -> "the string " <> show text
  Array _ -> "an array"
  Object _ -> "an object"

--------------------------------------------------------------------------------
-- Decoding boundaries
--------------------------------------------------------------------------------

-- | Run a parser and convert an Aeson failure into a 'DecodeError'.
--
-- The structured path is the supplied outer location followed by whatever
-- Aeson recovered; the message is Aeson's own rendering of the inner failure,
-- so nothing claims a structured path that was not captured.
runParserAt :: [PathPiece] -> (Value -> Parser a) -> Value -> Either DecodeError a
runParserAt outer parser value = case Aeson.iparse parser value of
  ISuccess parsed -> Right parsed
  IError innerPath problem ->
    Left
      DecodeError
        { path = outer <> map pathPieceOfJsonPath innerPath
        , message = Text.pack (Aeson.formatError innerPath problem)
        }

pathPieceOfJsonPath :: JSONPathElement -> PathPiece
pathPieceOfJsonPath = \case
  Key key -> FieldPath (Key.toText key)
  Index index -> IndexPath index

-- | Decode one payload field, keeping that field in the reported path.
parseAtField :: Text -> (Value -> Parser a) -> Value -> Either DecodeError a
parseAtField field = runParserAt [FieldPath field]

-- | Decode a complete value at the payload root.
parseAtRoot :: (Value -> Parser a) -> Value -> Either DecodeError a
parseAtRoot = runParserAt []

--------------------------------------------------------------------------------
-- The update boundary
--------------------------------------------------------------------------------

-- | One part of a decoded update. @payload@ is the generated sum of the known
-- optional payload fields.
data UpdatePart payload
  = KnownUpdatePart payload
  | FailedUpdatePart
      { field :: Text
      , rawPart :: Value
      , decodeError :: DecodeError
      }
  | UnknownUpdatePart
      { field :: Text
      , rawPart :: Value
      }
  deriving stock (Eq, Show)

-- | An update whose identifier decoded, whatever happened to its payloads.
data DecodedUpdate payload = DecodedUpdate
  { updateId :: Int64
  , rawUpdate :: Object
  , parts :: [UpdatePart payload]
  }
  deriving stock (Eq, Show)

-- | An update whose envelope itself could not be decoded. The raw value is
-- retained so the protocol layer can choose an acknowledgment policy.
data InvalidUpdateEnvelope = InvalidUpdateEnvelope
  { rawUpdate :: Value
  , decodeError :: DecodeError
  }
  deriving stock (Eq, Show)

-- | How one known payload field is decoded. Generated code builds these with
-- 'parseAtField' so the outer field name is already attached.
type UpdateFieldDecoder payload = Value -> Either DecodeError payload

-- | The generic half of the resilient update decoder.
--
-- The known payload fields are supplied in source order. Present ones decode
-- independently; a failure keeps the field name, the raw part, and the error.
-- Every other key except @update_id@ is preserved as an unknown part, in
-- sorted key order.
decodeUpdateWith
  :: [(Text, UpdateFieldDecoder payload)]
  -> Value
  -> Either InvalidUpdateEnvelope (DecodedUpdate payload)
decodeUpdateWith known value = case value of
  Object object ->
    case runParserAt
      [FieldPath "update_id"]
      (\_ -> requiredValue object updateIdKey >>= parseInt64)
      value of
      Left problem ->
        Left InvalidUpdateEnvelope {rawUpdate = value, decodeError = problem}
      Right identifier ->
        Right
          DecodedUpdate
            { updateId = identifier
            , rawUpdate = object
            , parts = knownParts object <> unknownParts object
            }
  other ->
    Left
      InvalidUpdateEnvelope
        { rawUpdate = other
        , decodeError =
            DecodeError
              { path = []
              , message = Text.pack ("expected an update object, got " <> describeValue other)
              }
        }
  where
    updateIdKey = Key.fromText "update_id"
    knownNames = Set.fromList ("update_id" : map fst known)
    knownParts object =
      [ case decoder raw of
        Right payload -> KnownUpdatePart payload
        Left problem ->
          FailedUpdatePart {field = field, rawPart = raw, decodeError = problem}
      | (field, decoder) <- known
      , Just raw <- [KeyMap.lookup (Key.fromText field) object]
      , raw /= Null
      ]
    unknownParts object =
      [ UnknownUpdatePart {field = name, rawPart = raw}
      | (name, raw) <-
          List.sortOn
            fst
            [(Key.toText key, raw) | (key, raw) <- KeyMap.toList object]
      , not (Set.member name knownNames)
      ]

-- | The batch helper. It accepts the success array of a @getUpdates@ result
-- and preserves every position, valid or not.
decodeUpdateBatchWith
  :: [(Text, UpdateFieldDecoder payload)]
  -> Value
  -> Either DecodeError [Either InvalidUpdateEnvelope (DecodedUpdate payload)]
decodeUpdateBatchWith known = \case
  Array items -> Right (map (decodeUpdateWith known) (Vector.toList items))
  other ->
    Left
      DecodeError
        { path = []
        , message = Text.pack ("expected an array of updates, got " <> describeValue other)
        }
