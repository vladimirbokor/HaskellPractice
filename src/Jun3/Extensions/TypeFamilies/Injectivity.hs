{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeFamilyDependencies #-}

module Jun3.Extensions.TypeFamilies.Injectivity where

-- type family F a
--
-- With TYPE it won't work because knowing that F t1 = F t2 does not imply that t1 = t2
-- What if there were such instances
-- type instance F Int = Bool
-- type instance F Char = Bool
--
-- create new types and are therefore injective.
data family F a

f :: F a -> F a
f = undefined

g :: F Int -> F Int
g x = f x

----------------------------
---TypeFamilyDependencies---
----------------------------
type family Id a = r | r -> a

type instance Id Int = Int

type instance Id Bool = Bool

id :: Id t -> Id t
id x = x
