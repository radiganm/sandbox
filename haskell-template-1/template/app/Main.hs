#!/usr/bin/runhaskell

{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import Data.Aeson
import Data.Text
import Text.Megaparsec
import Text.Mustache
import qualified Data.Text.Lazy.IO as TIO

main :: IO ()
main = do
  let res = compileMustacheText "test"
        "[{{group}}]\nvalues:{{#values}}\n - {{.}}{{/values}}\n"
  case res of
    Left err -> putStrLn (parseErrorPretty err)
    Right template -> TIO.putStr $ renderMustache template $ object
      [ "group"   .= ("group1" :: Text)
      , "values" .= ["value1" :: Text, "value2", "value3"]
      ]
