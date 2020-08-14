{-# LANGUAGE TypeFamilies #-}

module Jun3.Extensions.TypeFamilies.UnassociatedTypeFamilies where

import Data.Char

----------------------------
------------Open------------
----------------------------
type family Rep a

type instance Rep Int = Char

type instance Rep Char = Int

class Convertible a where
  convert :: a -> Rep a

instance Convertible Int where
  convert = chr

instance Convertible Char where
  convert = ord

----------------------------
-----------Closed-----------
----------------------------
type family RepClosed a where
  RepClosed Char = Int
  RepClosed a = Char

class ConvertibleClosed a where
  convertClosed :: a -> RepClosed a

instance ConvertibleClosed Int where
  convertClosed = chr

instance ConvertibleClosed Char where
  convertClosed = ord
