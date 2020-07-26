{-# LANGUAGE RecordWildCards #-}

module Jun3.Extensions.RecordWildCard where

data Ex = Ex
  { a :: String
  , b :: Int
  } deriving (Show)

addToScope :: Ex -> (String, Int)
addToScope Ex {..} = (a, b)

buildEx :: String -> Int -> Ex
buildEx a b = Ex {..}
