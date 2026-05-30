module Text.Megaparsec.JSON.Obj where

import Control.Monad
import Data.Map
import Text.Megaparsec
import Text.Megaparsec.Char
import Text.Megaparsec.JSON.Number
import Text.Megaparsec.JSON.Space
import Text.Megaparsec.JSON.String
import Text.Megaparsec.JSON.Types

jsonThing :: JSONParser JSONObj
jsonThing = (try (sc jsonFloat) <|> try (sc jsonInt) <|> try (sc jsonList) <|> try (sc jsonObj))

jsonEntry :: JSONParser (String, JSONObj)
jsonEntry = do
    str <- (sc jsonString)
    void $ sc (single ':')
    thing <- sc (jsonThing)
    return (str, thing)

jsonObj :: JSONParser JSONObj
jsonObj = do
    void $ sc (single '{')
    entries <- (sc jsonEntry `sepBy` (sc (single ',')))
    void $ sc (single '}')
    return (JSONObj (Data.Map.fromList entries))

jsonList :: JSONParser JSONObj
jsonList = do
    void $ sc (single '[')
    things <- (sc jsonThing) `sepBy` (sc (single ','))
    void $ sc (single ']')
    return (JSONList things)
