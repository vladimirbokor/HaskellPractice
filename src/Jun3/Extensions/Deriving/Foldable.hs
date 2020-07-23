{-# LANGUAGE DeriveFoldable #-}

module Jun3.Extensions.Deriving.Foldable where

data Example a =
  Example Int
          a
          (Maybe a)
  deriving (Show, Foldable)
  
-- deriving Foldable will generate the following instance:
-- instance Foldable Example where
--   foldr f acc (Example a b c) = f b (foldr f acc c)
--   foldMap f (Example a b c) = mappend (f b) (foldMap f c)
