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
module Telegram.Bot.Internal.Group.ReactionTypeEmoji
  ( ReactionTypeEmoji (..)
  , mkReactionTypeEmoji
  ) where

import Data.Aeson (FromJSON (..), ToJSON (..), Value (..), withObject)
import Data.Text (Text)
import Telegram.Bot.Support (checkStringConstant, jsonField, jsonLiteral, jsonObject, requiredWith)

-- | The reaction is based on an emoji.
--
-- Source: <https://core.telegram.org/bots/api#reactiontypeemoji>.
-- Codec directions: decoded from responses, encoded into requests.
--
-- Supplied constants: @type@ = @"emoji"@.
data ReactionTypeEmoji = MkReactionTypeEmoji
  { -- | Reaction emoji. Currently, it can be one of \"❤\", \"👍\", \"👎\", \"🔥\", \"🥰\", \"👏\", \"😁\", \"🤔\", \"🤯\", \"😱\", \"🤬\", \"😢\", \"🎉\", \"🤩\", \"🤮\", \"💩\", \"🙏\", \"👌\", \"🕊\", \"🤡\", \"🥱\", \"🥴\", \"😍\", \"🐳\", \"❤‍🔥\", \"🌚\", \"🌭\", \"💯\", \"🤣\", \"⚡\", \"🍌\", \"🏆\", \"💔\", \"🤨\", \"😐\", \"🍓\", \"🍾\", \"💋\", \"🖕\", \"😈\", \"😴\", \"😭\", \"🤓\", \"👻\", \"👨‍💻\", \"👀\", \"🎃\", \"🙈\", \"😇\", \"😨\", \"🤝\", \"✍\", \"🤗\", \"🫡\", \"🎅\", \"🎄\", \"☃\", \"💅\", \"🤪\", \"🗿\", \"🆒\", \"💘\", \"🙉\", \"🦄\", \"😘\", \"💊\", \"🙊\", \"😎\", \"👾\", \"🤷‍♂\", \"🤷\", \"🤷‍♀\", \"😡\".
    --
    -- Wire key: @emoji@.
    emoji :: Text
  }
  deriving stock (Eq, Show)

-- | Initialize a 'ReactionTypeEmoji' from its required fields.
--
-- Every optional field starts absent, every optional true-flag starts
-- false, and raw additional parameters start empty.
mkReactionTypeEmoji :: Text -> ReactionTypeEmoji
mkReactionTypeEmoji arg0 =
  MkReactionTypeEmoji
    { emoji = arg0
    }

instance FromJSON ReactionTypeEmoji where
  parseJSON = withObject "ReactionTypeEmoji" $ \obj ->
    do
      checkStringConstant obj "type" "emoji"
      field_1 <- requiredWith obj "emoji" parseJSON
      pure
        MkReactionTypeEmoji
          { emoji = field_1
          }

instance ToJSON ReactionTypeEmoji where
  toJSON x =
    jsonObject
      ( concat
          [ jsonLiteral "type" (String "emoji")
          , jsonField "emoji" x.emoji
          ]
      )
  toEncoding = toEncoding . toJSON
