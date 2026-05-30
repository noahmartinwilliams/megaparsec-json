module Text.Megaparsec.JSON(
    module Text.Megaparsec.JSON.Types,
    jsonDoc,
    jsonList,
    jsonObj) where

import Text.Megaparsec.JSON.Obj
import Text.Megaparsec.JSON.Types

jsonDoc :: JSONParser JSONObj
jsonDoc = jsonObj
