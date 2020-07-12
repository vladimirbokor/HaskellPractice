-- https://jproyo.github.io/posts/2019-03-17-tagless-final-haskell.html
{-# LANGUAGE GeneralisedNewtypeDeriving #-}
{-# LANGUAGE TypeApplications #-}

module Jun3.TypeClasses.TaglessFinal.Example where

type UserName = String

data DataResult =
  DataResult String
  deriving (Eq, Show)

class Monad m =>
      Cache m
  where
  getFromCache :: String -> m (Maybe [DataResult])
  storeCache :: [DataResult] -> m ()

class Monad m =>
      DataSource m
  where
  getFromSource :: String -> m [DataResult]

-- instance Cache IO where
--   getFromCache _ = return Nothing
--   storeCache _ = return ()
-- instance DataSource IO where
--   getFromSource user = return $ [DataResult $ "source: " <> user]
newtype NotInCache a = NotInCache
  { unNoCache :: IO a
  } deriving (Monad, Applicative, Functor)

instance Cache NotInCache where
  getFromCache _ = NotInCache $ return Nothing
  storeCache _ = NotInCache $ return ()

instance DataSource NotInCache where
  getFromSource user = return $ [DataResult $ "source: " <> user]

newtype InCache a = InCache
  { unInCache :: IO a
  } deriving (Monad, Applicative, Functor)

instance Cache InCache where
  getFromCache user = InCache $ return $ Just [DataResult $ "cache: " <> user]
  storeCache _ = InCache $ return ()

instance DataSource InCache where
  getFromSource _ = undefined

class Monad m =>
      Logging m
  where
  logInfo :: String -> m ()

instance Logging InCache where
  logInfo = InCache . putStrLn

instance Logging NotInCache where
  logInfo = NotInCache . putStrLn

requestData :: (Cache m, DataSource m, Logging m) => UserName -> m [DataResult]
requestData userName = do
  cache <- getFromCache userName
  result <-
    case cache of
      Just dataResult -> return dataResult
      Nothing -> do
        res <- getFromSource userName
        storeCache res
        return res
  logInfo $ "Result for " <> userName <> " is: " <> show result
  return result

main :: IO ()
main = do
  unCacheResult <- unNoCache $ requestData @NotInCache "Vladimir"
  putStrLn $ show unCacheResult
  cacheResult <- unInCache $ requestData @InCache "Vladimir"
  putStrLn $ show cacheResult
