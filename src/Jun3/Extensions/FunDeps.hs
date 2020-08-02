{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE UndecidableInstances #-}

module Jun3.Extensions.FunDeps where

import Data.Char

class Convertible a b | a -> b where
  convert :: a -> b

instance Convertible Int Char where
  convert = chr

-- instance Convertible Int Integer where
--   convert = toInteger
instance Convertible Char Int where
  convert = ord

------------------------------------------------
data Zero

data Succ n

zero :: Zero
zero = undefined

one :: Succ Zero
one = undefined

two :: Succ (Succ Zero)
two = undefined

class Add a b c | a b -> c where
  add :: a -> b -> c

instance Add Zero a a where
  add = undefined

instance Add a b c => Add (Succ a) b (Succ c) where
  add = undefined

f :: Succ (Succ (Succ Zero))
f = add one two

z :: Succ (Succ (Succ (Succ Zero)))
z = add two two