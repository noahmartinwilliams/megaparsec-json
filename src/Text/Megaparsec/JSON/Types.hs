module Text.Megaparsec.JSON.Types where

import Data.Map
import Data.Void
import Text.Megaparsec

type JSONParser = Parsec Void String

data JSONObj = JSONObj (Map String JSONObj) | JSONInt Int | JSONFloat Double | JSONList [JSONObj] | JSONString String deriving(Show, Eq)
