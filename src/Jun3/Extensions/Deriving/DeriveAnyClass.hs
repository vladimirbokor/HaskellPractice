{-# LANGUAGE DefaultSignatures #-}
{-# LANGUAGE DeriveAnyClass #-}

module Jun3.Extensions.Deriving.DeriveAnyClass where

class MyPrettier a where
  prettyShow :: a -> String
  default prettyShow :: Show a =>
    a -> String
  prettyShow x = "MyPrety show " <> show x

data Example a =
  Example Int
          a
          (Maybe a)
  deriving (Show, MyPrettier)
