{-# LANGUAGE TypeOperators #-}

module Stepik.Applicatives.Compositions where
    
infixr 9 |.|

newtype (|.|) f g a = Cmps
  { getCmps :: f (g a)
  } deriving (Eq, Show)

type A = ((,) Integer |.| (,) Char) Bool

type B t = ((,,) Bool (t -> t) |.| Either String) Int

type C = (|.|) ((->) Bool) ((->) Integer) Integer
