{-# LANGUAGE DeriveFunctor #-}

module Jun3.Extensions.Deriving.Functor where

data Example a =
  Example Int
          a
          (Maybe a)
  deriving (Show, Functor)
-- deriving Functor will generate the following instance:
-- instance Functor Example where
--   fmap f (Example a b c) = Example a (f b) (fmap f c)
