{-# LANGUAGE DeriveTraversable #-}

module Jun3.Extensions.Deriving.Traversable where

data Example a =
  Example Int
          a
          (Maybe a)
  deriving (Show, Foldable, Functor)
-- deriving Traversable will generate the following instance:
-- instance Traversable Example where
--   traverse f (Example a b c) =
--     fmap (\b2 b3 -> Example a b2 b3) (f b) <*> traverse f c
