{-# LANGUAGE FlexibleInstances #-}

module Jun3.TypeClasses.Overlap.Overlap where

class Borked a where
  bork :: a -> String

instance Borked Int where
  bork = show

-- {-# OVERLAPPING #-} allows to chose more specific instance
-- Also have a look at {-# LANGUAGE OverlappingInstances/IncoherentInstances #-} 
-- The pragma may be one of: {-# OVERLAPPING #-}, {-# OVERLAPPABLE #-}, 
-- {-# OVERLAPS #-}, or {-# INCOHERENT #-}.
instance {-# OVERLAPPING #-} Borked (Int, Int) where
  bork (a, b) = bork a ++ ", " ++ bork b

-- This one will raise error, because Borked (a, b) 
-- is more polymorhic than Borked (Int, Int)
-------------------------------------------------
-- instance Borked (Int, Int) where
--   bork (a, b) = bork a ++ ", " ++ bork b
--------------------------------------------------
instance (Borked a, Borked b) => Borked (a, b) where
  bork (a, b) = ">>" ++ bork a ++ " " ++ bork b ++ "<<"
