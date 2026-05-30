module Text.Megaparsec.JSON.String where

import Text.Megaparsec
import Text.Megaparsec.Char
import Text.Megaparsec.Char.Lexer
import Text.Megaparsec.JSON.Types

jsonString :: JSONParser String
jsonString = do
    str <- char '"' *> manyTill charInString (char '"')
    return str where
        charInString = try (char '\\' *> escapedChar) <|> satisfy (/= '"')
        escapedChar =
            (char 'n' >> return '\n') <|>
            (char 't' >> return '\t') <|>
            (char '"' >> return '"' ) <|>
            (char '\\' >> return '\\') <|>
            (char '/' >> return '/' )

