module Text.Megaparsec.JSON.Number where

import Control.Monad
import Text.Megaparsec
import Text.Megaparsec.Char
import Text.Megaparsec.JSON.Types

jsonInt :: JSONParser Int
jsonInt = do
    i <- some (digitChar)
    notFollowedBy (single '.')
    return (read i :: Int)

jsonFloat :: JSONParser Double
jsonFloat = do
    i1 <- some digitChar
    void $ single '.'
    i2 <- some digitChar
    return (read (i1 ++ ('.' : i2)) :: Double)
