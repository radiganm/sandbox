-- Main.hs

  module Main where

  import Lib
  import Language.Haskell.Interpreter
  import Control.Monad
  import Data.List

  testHint = do
    setImportsQ [("Prelude", Nothing)]
    let expr = "42"
    a <- eval expr
    say $ show a

  errorString :: InterpreterError -> String
  errorString (WontCompile es) = intercalate "\n" (header : map unbox es)
    where
      header = "ERROR: Won't compile:"
      unbox (GhcError e) = e
  errorString e = show e

  say :: String -> Interpreter ()
  say = liftIO . putStrLn

  emptyLine :: Interpreter ()
  emptyLine = say ""

  main :: IO ()
  main = do 
    r <- runInterpreter testHint
    case r of
      Left err -> putStrLn $ errorString err
      Right () -> return ()

-- *EOF*
