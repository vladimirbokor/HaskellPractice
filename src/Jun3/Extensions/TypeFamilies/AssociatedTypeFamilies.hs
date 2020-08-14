{-# LANGUAGE TypeFamilies #-}

module Jun3.Extensions.TypeFamilies.AssociatedTypeFamilies where

import Data.Char

class Convertible a where
  type Rep a
  convert :: a -> Rep a

instance Convertible Int where
  type Rep Int = Char
  convert = chr

instance Convertible Char where
  type Rep Char = Int
  convert = ord