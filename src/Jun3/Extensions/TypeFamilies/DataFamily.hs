{-# LANGUAGE TypeFamilies #-}

module Jun3.Extensions.TypeFamilies.DataFamily where

import Data.Char

data family Array a

data instance  Array Int = ArrayInt [Int]

data instance  Array Char = ArrayChar [Char]

data instance  Array (a, b) = ArrayPair (Array a) (Array b)

class TakeFirstElem a where
  first :: Array a -> Maybe a

instance TakeFirstElem Int where
  first (ArrayInt []) = Nothing
  first (ArrayInt (x:xs)) = Just x

instance TakeFirstElem Char where
  first (ArrayChar []) = Nothing
  first (ArrayChar (x:xs)) = Just x

instance (TakeFirstElem a, TakeFirstElem b) => TakeFirstElem (a, b) where
  first (ArrayPair a b) = do
    x <- first a
    y <- first b
    pure (x, y)