{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}

module Jun3.Extensions.TypeFamilies.Overlapping where

import Data.Proxy

type family (F a) :: Bool where
  F Char = 'True
  F Bool = 'True
  F a = 'False

class ShowList a where
  showl :: [a] -> String

instance (F a ~ flag, ShowList' flag a) => ShowList a where
  showl = showl' (Proxy :: Proxy flag)

class ShowList' (flag :: Bool) a where
  showl' :: Proxy flag -> [a] -> String

instance ShowList' 'True Char where
  showl' _ x = x

instance ShowList' 'True Bool where
  showl' _ x = map toBinaryDigit x
    where
      toBinaryDigit False = '0'
      toBinaryDigit True = '1'

instance (Show a) => ShowList' 'False a where
  showl' _ x = show x
-- Bellow version with own data, without DataKinds
--
-- data MyTrue
-- data MyFalse
-- type family F a where
--   F Char = MyTrue
--   F a = MyFalse
-- class ShowList a where
--   showl :: [a] -> String
-- instance (F a ~ flag, ShowList' flag a) => ShowList a where
--   showl = showl' (Proxy :: Proxy flag)
-- class ShowList' flag a where
--   showl' :: Proxy flag -> [a] -> String
-- instance ShowList' MyTrue Char where
--   showl' _ x = x
-- instance (Show a) => ShowList' MyFalse a where
--   showl' _ x = show x
