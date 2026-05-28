module Text.Megaparsec.JSON.Types where

import Data.Void
import Text.Megaparsec

type JSONParser = Parsec Void String
