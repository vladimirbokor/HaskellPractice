{-# LANGUAGE FlexibleInstances, OverlappingInstances #-}

module Jun3.TypeClasses.Overlap.ViolentCoherence where

import Jun3.TypeClasses.Overlap.Help

data T =
  MkT

instance MyShow T where
  myshow x = "Used generic instance"

instance MyShow [T] where
  myshow xs = "Used more specific instance"

main :: IO ()
main
  -- Here GHC resolves the MyShow [T] constraint using the overlapping instance declaration
 = do
  print (myshow [MkT, MkT])
  --showHelp sees no overlapping instances, and so uses the MyShow [a]
  print (showHelp [MkT, MkT])
