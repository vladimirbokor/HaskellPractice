{-# LANGUAGE GADTs #-}

module Jun3.Extensions.GADT where

-- First part
-- Try to implement DSL 
-------------
-- data Expr
--   = I Int
--   | Add Expr
--         Expr
--   | Mult Expr
--          Expr
-- eval :: Expr -> Int
-- eval (I a) = a
-- eval (Add e1 e2) = eval e1 + eval e2
-- eval (Mult e1 e2) = eval e1 * eval e2
-------------
-- Second part
-- Try to extend our DSL 
-------------
-- data Expr
--   = I Int
--   | B Bool
--   | Add Expr
--         Expr
--   | Mult Expr
--          Expr
--   | Eq Expr
--        Expr
-- eval :: Expr -> Either Int Bool
-- eval (I a) = Left a
-- eval (B b) = Right b
-- eval (Add e1 e2) = undefined -- Add (I 5) (B True) - is valid
-- -- Need to change type EVAL to Expr -> Maybe (Either Int Bool)
-- -------------
-- -- Third part
-- -- Try to add phantom type our DSL 
-- -------------
-- data Expr a
--   = I Int
--   | B Bool
--   | Add (Expr a)
--         (Expr a)
--   | Mult (Expr a)
--          (Expr a)
--   | Eq (Expr a)
--        (Expr a)
-- -- Smart constructors
-- add :: Expr Int -> Expr Int -> Expr Int
-- add = Add
-- i :: Int -> Expr Int
-- i = I
-- b :: Bool -> Expr Bool
-- b = B
-- eval :: Expr a -> a
-- eval (I n) = n -- Doesn't work because (I 5 :: Expr String) is still valid 
-------------
-- Fourth part
-- Using GADT
-------------
data Expr a where
  I :: Int -> Expr Int
  B :: Bool -> Expr Bool
  Add :: Expr Int -> Expr Int -> Expr Int
  Mult :: Expr Int -> Expr Int -> Expr Int
  Eq :: Eq a => Expr a -> Expr a -> Expr Bool

eval :: Expr a -> a
eval (I n) = n
eval (B b) = b
eval (Add e1 e2) = eval e1 + eval e2
eval (Mult e1 e2) = eval e1 * eval e2
eval (Eq e1 e2) = eval e1 == eval e2

data Example a where
  MyCons :: { val :: Example Int} -> Example Int
  MySecondCons :: { arg :: Example Int} -> Example Bool

data Maybe1 a where
  Nothing1 :: Maybe1 a
  Just1 :: a -> Maybe1 a
  deriving (Eq, Ord)

data T a where
  T1 :: Eq b => b -> b -> T b
  T2 :: Show c => c -> [c] -> T c

f :: T a -> String
f (T1 x y)
  | x == y = "yes"
  | otherwise = "no"
f (T2 a b) = show a
