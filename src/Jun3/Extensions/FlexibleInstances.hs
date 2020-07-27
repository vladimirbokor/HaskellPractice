{-# LANGUAGE FlexibleInstances #-}

module Jun3.Extensions.FlexibleInstnces where

class Vector a where
  equal :: a -> a -> Bool

instance Eq a => Vector (a, a) where
  equal (a1, b1) (a2, b2) = a1 == a2 && b1 == b2

class Dist a where
  distToZero :: a -> Double

instance Dist (Double, Double) where
  distToZero (x, y) = sqrt (x ** 2 + y ** 2)
