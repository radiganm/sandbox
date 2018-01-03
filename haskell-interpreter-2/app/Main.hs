-- Main.hs
-- Mac Radigan

  {-# LANGUAGE DataKinds          #-}
  {-# LANGUAGE DeriveGeneric      #-}
  {-# LANGUAGE FlexibleInstances  #-}
  {-# LANGUAGE OverloadedStrings  #-}
  {-# LANGUAGE StandaloneDeriving #-}
  {-# LANGUAGE TypeOperators      #-}

  module Main where

  import Example

  import Language.Haskell.Interpreter
  import Data.Typeable

  testHint = do
    setImportsQ [("Prelude", Nothing)]
    let expr = "42"
    a <- eval expr
    say $ show a

  main :: IO ()
  main = do
    r1 <- runInterpreter testHint
    case r1 of
      Left err -> putStrLn $ errorString err
      Right () -> return ()
    --
    content <- do readFile "demo/example.hs"
    putStrLn content
    r2 <- runInterpreter content
    case r2 of
      Left err -> putStrLn $ errorString err
      Right () -> return ()
    --
    putStrLn "done"

-- *EOF*
