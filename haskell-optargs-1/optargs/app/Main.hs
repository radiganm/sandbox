-- Main.hs

  {-# LANGUAGE DataKinds          #-}
  {-# LANGUAGE DeriveGeneric      #-}
  {-# LANGUAGE FlexibleInstances  #-}
  {-# LANGUAGE OverloadedStrings  #-}
  {-# LANGUAGE StandaloneDeriving #-}
  {-# LANGUAGE TypeOperators      #-}

  module Main where

  import Lib
  import Options.Generic

  data Example w = Example
      { foo :: w ::: Int    <?> "Documentation for the foo flag"
      , bar :: w ::: Double <?> "Documentation for the bar flag"
      , baz :: w ::: String <?> "Documentation for the baz flag"
      , huh :: w ::: Bool   <?> "Documentation for the huh flag"
      } deriving (Generic)

  instance ParseRecord (Example Wrapped)
  deriving instance Show (Example Unwrapped)

  main :: IO ()
  main = do
      x <- unwrapRecord "Test program"
      print (x :: Example Unwrapped)

-- *EOF*
