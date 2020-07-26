{-# LANGUAGE TypeOperators #-}

module Jun3.Extensions.TypeOperators where

data a ** b =
  Mult a
       b
  deriving (Show)

combine :: Int -> String -> (Int ** String)
combine a b = Mult a b

data Sum a b
  = First a
  | Second b

example1 :: [Sum Int String]
example1 = [First 3, Second "Hello"]

example2 :: [Sum (Sum Int String) (Sum Int String)]
example2 =
  [ First (First 4)
  , Second (First 5)
  , Second (Second "Hello")
  , First (Second "Hello")
  ]

data a + b
  = FirstOp a
  | SecondOp b

example1Op :: [Int + String]
example1Op = [FirstOp 3, SecondOp "Hello"]

example2Op :: [(Int + String) + (Int + String)]
example2Op =
  [ FirstOp (FirstOp 4)
  , SecondOp (FirstOp 5)
  , SecondOp (SecondOp "Hello")
  , FirstOp (SecondOp "Hello")
  ]

