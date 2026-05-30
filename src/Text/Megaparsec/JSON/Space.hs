module Text.Megaparsec.JSON.Space where

import Text.Megaparsec
import Text.Megaparsec.Char
import qualified Text.Megaparsec.Char.Lexer as L
import Text.Megaparsec.JSON.Types

sc :: JSONParser a -> JSONParser a
sc = L.lexeme (L.space space1 empty empty )
