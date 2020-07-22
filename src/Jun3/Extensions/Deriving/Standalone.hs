{-# LANGUAGE StandaloneDeriving #-}

-- {-# LANGUAGE FlexibleInstances #-}
module Jun3.Extensions.Deriving.Standalone where

data MyData a
  = FirstData
  | SecondData a

deriving instance Eq a => Eq (MyData a)
-- the instance can be more specific than the data type 
-- Need to uncomment FlexibleInstances
-- deriving instance Eq a => Eq (MyData [a])
