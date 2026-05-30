module Text.Megaparsec.JSON.Number where

import Control.Monad
import Text.Megaparsec
import Text.Megaparsec.Char
import Text.Megaparsec.JSON.Types

jsonInt :: JSONParser JSONObj
jsonInt = do
    i <- some (digitChar)
    notFollowedBy (single '.')
    return (JSONInt (read i :: Int))

jsonFloat :: JSONParser JSONObj
jsonFloat = do
    i1 <- some digitChar
    void $ single '.'
    i2 <- some digitChar
    return (JSONFloat (read (i1 ++ ('.' : i2)) :: Double))
