{-# LANGUAGE DerivingVia #-}

module Jun3.Extensions.Deriving.DerivingVia where

newtype MyType a =
  MyType a

instance (Show a) => Show (MyType a) where
  show (MyType a) = "MyShow: " <> show a

newtype AnotherType =
  Another Int deriving Show via (MyType Int)