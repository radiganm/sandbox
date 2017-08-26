#!/usr/bin/env stack
-- stack --resolver lts-6.15 script
{-# LANGUAGE OverloadedStrings #-}

> import Text.Printf
> import System.Environment
 
> main :: IO ()
> main = getArgs >>= mapM_ (uncurry $ printf "argv[%d] -> %s\n") . zip ([0..] :: [Int])
