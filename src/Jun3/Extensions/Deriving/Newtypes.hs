{-# LANGUAGE GeneralisedNewtypeDeriving #-}

module Jun3.Extensions.Deriving.Newtypes where

newtype MyType = MyType
  { getInt :: Int
  } deriving (Show, Num)
