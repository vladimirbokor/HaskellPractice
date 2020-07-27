{-# LANGUAGE DefaultSignatures #-}
{-# LANGUAGE FlexibleContexts #-}

module Jun3.Extensions.FlexibleContexts where

class MyPrettier a where
  prettyShow :: a -> String
  default prettyShow :: Show a =>
    a -> String
  prettyShow x = "MyPrety show " <> show x

instance MyPrettier Int

instance (MyPrettier a, Show a) => MyPrettier (Maybe a)

-- Without flexible contexts, all contexts must be type variable. The
-- following would be legal.
-- instance (MyPrettier a, Show a, Show b) => MyPrettier (Either a b)
-- With flexible contexts, typeclass contexts can be arbitrary nested types. The
-- following would be forbidden without it.
instance (MyPrettier (Maybe a), Show a, Show b) => MyPrettier (Either a b)
