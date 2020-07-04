{-# LANGUAGE OverlappingInstances #-}

module Jun3.TypeClasses.Overlap.Help where

class MyShow a where
  myshow :: a -> String

instance MyShow a => MyShow [a] where
  myshow xs = concatMap myshow xs

showHelp :: MyShow a => [a] -> String
showHelp xs = myshow xs
